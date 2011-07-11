From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 11 Jul 2011 13:51:21 -0700
Subject: [Buildroot] /tmp puzzle
Message-ID: <CALo-6+h28+HSpczw86fD=Jk0GJa3m+JR9hmHswTpvE59xvMKig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need to ask a slighly different question in my desire to understand
what is going on.

If I disable "devtmpfs", I build my kernel and rootfilesystem and when
it is mounted, I have a /tmp directory with *stuff* in it, but it is
mounted at /var/tmp. I dont understand how /tmp got mounted. Would
someone be willing to help me understand how "/tmp" got mounted when
it is not in the result of "mount" ?

# cat /etc/fstab
# /etc/fstab: static file system information.
#
# <file system> <mount pt>     <type>   <options>         <dump> <pass>
/dev/root       /              jffs2    rw,noauto         0      1
proc            /proc          proc     defaults          0      0
devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0      0
tmpfs           /tmp           tmpfs    defaults          0      0
sysfs           /sys           sysfs    defaults          0      0

# mount
rootfs on / type rootfs (rw)
/dev/root on / type jffs2 (rw,relatime)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
sysfs on /sys type sysfs (rw,relatime)

# mount -a
mount: mounting tmpfs on /tmp failed: Invalid argument
#

# ls /tmp
dropbear.pid     log              sshd
ifstate          messages         subsys
ldconfig         portmap_mapping  utmp
#

-- 
Charles Krinke
