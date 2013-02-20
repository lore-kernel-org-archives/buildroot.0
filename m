From: John Stile <john@stilen.com>
Date: Wed, 20 Feb 2013 15:37:40 -0800
Subject: [Buildroot] editing device_table_dev.txt
Message-ID: <1361403460.22521.44.camel@genx.eng.msli.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need a better way to auto-populate /dev, using buildroot-2011.11, with
2.6.30 kernel, but it seems not matter what I do, /dev/ is not populated
automaticly. 

My config looks like this:

BR2_ROOTFS_DEVICE_CREATION_STATIC=y
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt target/generic/device_table_dev.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
# BR2_ROOTFS_SKELETON_DEFAULT is not set
BR2_ROOTFS_SKELETON_CUSTOM=y
BR2_ROOTFS_SKELETON_CUSTOM_PATH="fs/skeletonMiLON"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/atmel/at91sam9g20ek/post-build/post-build-scripts.bash"

To use hwclock I had to create dev/rtc0.
Although my kernel argument contains mtdparts, the  mtd* and mtdblock*
devices are not created.
There are others too.

What should my config look like in order to auto-populate /dev?
