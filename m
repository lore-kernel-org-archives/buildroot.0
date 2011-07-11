From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 11 Jul 2011 10:08:23 -0700
Subject: [Buildroot] tmpfs puzzle
Message-ID: <CALo-6+iVEYuZm=Tr9opt-VOz+4ZqnGQJ8LbD-tV-dEojfdXMMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am puzzled why "tmpfs" is not mounting in my buildroot glibc root
filesystem and would appreciate a "clue" or at least a sarcastic
"RTFM" if one could tell me *which* "FM" and what its URL might be.

Here is my /etc/fstab, a cat or /proc/mounts and the result of "mount
-a", which fails on tmpfs.

# cat /etc/fstab
# /etc/fstab: static file system information.
#
# <file system> <mount pt>     <type>   <options>         <dump> <pass>
/dev/root       /              ext2     rw,noauto         0      1
proc            /proc          proc     defaults          0      0
devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0      0
tmpfs           /tmp           tmpfs    defaults          0      0
sysfs           /sys           sysfs    defaults          0      0
#
#
# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / jffs2 rw,relatime 0 0
devtmpfs /dev devtmpfs rw,relatime,mode=0755 0 0
proc /proc proc rw,relatime 0 0
devpts /dev/pts devpts rw,relatime,gid=5,mode=620 0 0
sysfs /sys sysfs rw,relatime 0 0
#
#
#
# mount -a
mount: mounting tmpfs on /tmp failed: Invalid argument
#


-- 
Charles Krinke
