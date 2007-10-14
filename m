From: Jorge S. <jorgesolla@gmail.com>
Date: Sun, 14 Oct 2007 19:24:39 +0200
Subject: [Buildroot] Writable EXT2 fs on dataflash (using MTD)
Message-ID: <6090c5eb0710141024k3eb26ccp39c7a87845719abb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've created a rootfs for my AT91RM9200 based custom board and i'm unable to
mount the ext2 fs on a writable way.

I'm using an AT45DB64 spi dataflash as an MTD device and i've defined 3
partitions using this kernel bootargs:

console=/dev/ttyS0,115200 root=/dev/mtdblock2
mtdparts=AT45DB642.spi0:168960(boot)ro,2162688(kernel),-(rootfs)rw
rootfstype=ext2 mem=32M

After booting the kernel always says:

VFS: Mounted root (ext2 filesystem) readonly.

Even if i try a "mount -o remount,rw /" from the busybox shell, i get this
message:

mount: /dev/root is write-protected, mounting read-only

The "rootfs" partition is defined "writable" at the u-boot code, so i think
i can assume the flash is Unlocked.


Any ideas? Did i miss something when building the Rootfs? any option?

Thanks in advance.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071014/52f07f49/attachment.htm 
