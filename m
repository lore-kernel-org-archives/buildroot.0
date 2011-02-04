From: Mike <kenziem@sympatico.ca>
Date: Fri, 4 Feb 2011 14:57:43 -0500
Subject: [Buildroot] ISO image question
Message-ID: <BLU0-SMTP3809CE19EBC125B18D8251CAE60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've recently built an ISO image for i386 (git clone 2011-02-02). 

I ended up using  make qemu_x86_defconfig  to get it to build successfully.

When I mount the image it is almost empty 

drwxr-xr-x 3 root root    2048 2011-02-02 11:14 boot
-r--r--r-- 1 root root    2048 2011-02-02 11:14 boot.catalog
-rw-r--r-- 1 root root 2338816 2011-02-02 11:14 initrd
-rw-r--r-- 1 root root 1351488 2011-02-02 11:14 kernel

When I look at the rootfs.ext2 that was created it seems to be complete

drwxr-xr-x 2 root root   2048 2011-02-02 11:14 bin
drwxr-xr-x 3 root root   1024 2011-02-01 22:21 boot
drwxr-xr-x 6 root root   3072 2011-02-01 22:07 dev
drwxr-xr-x 5 root root   1024 2011-02-01 22:07 etc
drwxr-xr-x 3 root root   1024 2011-02-01 22:07 home
drwxr-xr-x 2 root root   1024 2011-02-02 11:14 lib
lrwxrwxrwx 1 root root     11 2011-02-01 22:07 linuxrc -> bin/busybox
drwx------ 2 root root 116736 2011-02-02 11:14 lost+found
drwxr-xr-x 2 root root   1024 2011-02-01 21:51 mnt
drwxr-xr-x 2 root root   1024 2011-02-01 21:51 opt
drwxr-xr-x 2 root root   1024 2011-02-01 21:51 proc
drwxr-xr-x 2 root root   1024 2011-02-01 21:51 root
drwxr-xr-x 2 root root   1024 2011-02-02 11:14 sbin
drwxr-xr-x 2 root root   1024 2011-02-01 21:51 sys
drwxrwxrwt 3 root root   1024 2011-02-01 22:07 tmp
drwxr-xr-x 6 root root   1024 2011-02-01 22:07 usr
drwxr-xr-x 3 root root   1024 2011-01-31 15:21 var

Did I miss an option that would have copied the rootfs to the ISO image? 

I'm trying to run it under Virtualbox and it fails to mount root 
looking at menu.lst shows that the root (hd1,1) is not 

> cat menu.lst
default         0
timeout         10
color cyan/blue white/blue

title           Hard Drive (first partition)
rootnoverify    (hd0)
chainloader     +1

title           BuildRoot ISO9660 image
kernel          /kernel
initrd          /initrd



-- 
Collector of vintage computers http://www.ncf.ca/~ba600
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110204/018ea7f2/attachment-0001.html>
