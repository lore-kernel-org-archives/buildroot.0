From: Sylvain LG <forum@sylvainlegourr.com>
Date: Mon, 1 Sep 2014 19:39:09 +0200
Subject: [Buildroot] rsync issue during compilation on a VM
Message-ID: <CAK9TtU39N6G9smB0iZKO83b3LLk1qiw5B2Rps7BJ=dQfXzX16Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to compile my system with buildroot running on a virtualized Debian
(VirtualBox).
Host is MacOs.

I cloned Buildroot on a shared folder: files are not stored directly on the
VM.

Here comes the error log:

BR2_DEFCONFIG=''
> KCONFIG_AUTOCONFIG=/home/username/sharedfolder/buildroot/output/build/buildroot-config/auto.conf
> KCONFIG_AUTOHEADER=/home/username/sharedfolder/buildroot/output/build/buildroot-config/autoconf.h
> KCONFIG_TRISTATE=/home/username/sharedfolder/buildroot/output/build/buildroot-config/tristate.config
> BR2_CONFIG=/home/username/sharedfolder/buildroot/.config
> BR2_EXTERNAL=support/dummy-external
> /home/username/sharedfolder/buildroot/output/build/buildroot-config/conf
> --silentoldconfig Config.in
> make[1]: Leaving directory
> `/home/username/sharedfolder/buildroot/buildroot-haba'
> mkdir -p /home/username/sharedfolder/buildroot/output/target
> rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg
> --exclude .bzr --exclude CVS \
> --chmod=Du+w --exclude .empty --exclude '*~' \
> /home/username/sharedfolder/buildroot/system/skeleton/
> /home/username/sharedfolder/buildroot/output/target/
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/run": Operation not
> permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/dev/log": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/etc/mtab": Operation
> not permitted (1)

rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/etc/resolv.conf":
> Operation not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/cache": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/lock": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/log": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/pcmcia": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/run": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/spool": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/tmp": Operation
> not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/lib/misc":
> Operation not permitted (1)
> rsync: failed to set times on
> "/home/username/sharedfolder/buildroot/output/target/var/lib/pcmcia":
> Operation not permitted (1)
> rsync error: some files/attrs were not transferred (see previous errors)
> (code 23) at main.c(1070) [sender=3.0.9]
> make: *** [/home/username/sharedfolder/buildroot/output/build/.root] Error
> 23



How can I fix this issue?

It seems that rsync option -O / --omit-dir-times can help, but I don't know
where to set it.


Thank you,

Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140901/563cccb3/attachment.html>
