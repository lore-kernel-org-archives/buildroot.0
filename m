From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Feb 2013 12:23:15 +0200
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5125F50C.7020902@petroprogram.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com>
 <5125F50C.7020902@petroprogram.com>
Message-ID: <20130221102315.GB12155@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Thu, Feb 21, 2013 at 12:21:00PM +0200, Stefan Fr?berg wrote:
> 21.2.2013 12:14, Stefan Fr?berg kirjoitti:
> > 21.2.2013 1:37, John Stile kirjoitti:
> >> I need a better way to auto-populate /dev, using buildroot-2011.11, with
> >> 2.6.30 kernel, but it seems not matter what I do, /dev/ is not populated
> >> automaticly. 
> >>
> >> My config looks like this:
> >>
> >> BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> >> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
> >> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
> >> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
> >> BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt target/generic/device_table_dev.txt"
> >> BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
> >> # BR2_ROOTFS_SKELETON_DEFAULT is not set
> >> BR2_ROOTFS_SKELETON_CUSTOM=y
> >> BR2_ROOTFS_SKELETON_CUSTOM_PATH="fs/skeletonMiLON"
> >> BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/atmel/at91sam9g20ek/post-build/post-build-scripts.bash"
> >>
> >> To use hwclock I had to create dev/rtc0.
> >> Although my kernel argument contains mtdparts, the  mtd* and mtdblock*
> >> devices are not created.
> >> There are others too.
> >>
> >> What should my config look like in order to auto-populate /dev?
> >>
> > Well, if you don't want to manually create your device nodes then there
> > are several ways to autopopulate /dev
> >
> > Maybe the simplest would be just let the kernel handle it by mounting
> > /dev with tmpfs
> > So selecting BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y is the
> > correct option.
> >
> > Also kernel .config file should also have CONFIG_DEVTMPFS and DEVTMPFS
> > as 'y'.
> 
> Sorry, that should have been CONFIG_DEVTMPFS=y and CONFIG_DEVTMPFS_MOUNT=y

Kernel version 2.6.30 is too old for that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
