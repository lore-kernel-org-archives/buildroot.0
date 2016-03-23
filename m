From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Wed, 23 Mar 2016 18:35:48 +0100
Subject: [Buildroot] [INIT SYSTEM] Add init scripts to /etc/init.d
Message-ID: <CALtfCQaBKTA504tLgOvgffv_EPvgRQ1J=T9gvzC7JB54k8KntA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using buildroot with Init System Busybox and I would like to know the
best way to add SXXscripts to /etc/init.d.

Up to know I was executing this script:

#/* Build S18loadmod file */
sudo sh -c "cat << 'EOF' > "${SD_ROOTFS_PATH}/etc/init.d/S18loadmod"
#!/bin/sh
#
# load modules
#

MODULES_PATH=\"/etc/modules\"
case \"\$1\" in
start)
echo \"Loading modules in ${MODULES_PATH}...\"
for line in \$(cat \${MODULES_PATH});
do
[[ \$line = \#* ]] && continue
modprobe \$line;
done
;;
stop)
;;
restart|reload)
;;
*)
echo \"Usage: \$0 {start|stop|restart}\"
exit 1
esac

exit \$?

EOF"

But I'm pretty sure there is a better and secure way to do this task. If
someone else create the same number script like mine S18**** What happens?

Could anyone help me?

Best regards.

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160323/1508ae81/attachment.html>
