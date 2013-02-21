From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Feb 2013 00:14:47 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <1361403460.22521.44.camel@genx.eng.msli.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
Message-ID: <5126AA67.5020500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/02/13 00:37, John Stile wrote:
> I need a better way to auto-populate /dev, using buildroot-2011.11, with
> 2.6.30 kernel, but it seems not matter what I do, /dev/ is not populated
> automaticly.
>
> My config looks like this:
>
> BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
> BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt target/generic/device_table_dev.txt"
> BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
> # BR2_ROOTFS_SKELETON_DEFAULT is not set
> BR2_ROOTFS_SKELETON_CUSTOM=y
> BR2_ROOTFS_SKELETON_CUSTOM_PATH="fs/skeletonMiLON"
> BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/atmel/at91sam9g20ek/post-build/post-build-scripts.bash"
>
> To use hwclock I had to create dev/rtc0.

  /dev/rtc is part of device_table_dev.txt. Isn't that enough?

> Although my kernel argument contains mtdparts, the  mtd* and mtdblock*
> devices are not created.

  device_table_dev.txt creates /dev/mtd0 through /dev/mtd3.

  Can you check in the tar file if these device nodes do exist? Note that 
they will not appear in the output/target/dev, they are only created when 
the rootfs is created.


  Regards,
  Arnout

> There are others too.
>
> What should my config look like in order to auto-populate /dev?


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
