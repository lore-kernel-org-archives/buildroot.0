From: Naitik Amin <Naitik.Amin@ametek.com>
Date: Tue, 22 Oct 2013 15:30:48 -0400
Subject: [Buildroot] No proc mounted
Message-ID: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I have been generating the rootfs using buildroot. Then dd'ing the 
rootfs.ext3 to the rootfs partition on my sdcard. After inserting the 
sdcard into my target, it comes up with no /proc, /sys etc...

In fstab, I do see the line which should mount /proc, but doesnt seem to 
happen..

Any ideas..

$ cat /etc/fstab
# /etc/fstab: static file system information.
#
# <file system> <mount pt>     <type>   <options>         <dump> <pass>
/dev/root       /              ext2     rw,noauto         0      1
proc            /proc          proc     defaults          0      0
devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0      0
tmpfs           /dev/shm       tmpfs    mode=0777         0      0
tmpfs           /tmp           tmpfs    defaults          0      0
sysfs           /sys           sysfs    defaults          0      0

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131022/a2d1ddf3/attachment.html>
