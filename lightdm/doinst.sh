config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/lightdm/lightdm.conf.new
config etc/lightdm/users.conf.new
config etc/lightdm/keys.conf.new
config etc/lightdm/Xsession.new

if [ -e /etc/lightdm/Xsession ]; then
    chmod +x /etc/lightdm/Xsession
fi
