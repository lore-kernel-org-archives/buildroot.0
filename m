From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 16 Aug 2013 10:23:17 +0200
Subject: [Buildroot] BeagleBone defconfig broken?
Message-ID: <520DE175.1050103@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am currently trying to get the latest buildroot to run on my
beaglebone with little success. The last version that seem to run out of
the box is 2012.08, where I can simply copy MLO, u-boot.img and uImage
to the boot partition, dd rootfs.ext2 to the second partition and the
system works.

The current build fails to boot, because u-boot expects the image and
dts in /boot within the root filesystem. After putting them there with a
post build script, u-boot starts the kernel, but the kernel fails to
mount root:
> [    1.509962] Waiting for root device /dev/mmcblk0p2...
The SD partitions seem o.k.:
> Disk /dev/sdi: 3965 MB, 3965190144 bytes
> 255 heads, 63 sectors/track, 482 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdi1   *           1           9       72292    c  W95 FAT32 (LBA)
> /dev/sdi2              10         133      996030   83  Linux
and /dev/mmcblk0p2 sounds like the right partition.

Can anybody give a hint where to look further?

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
