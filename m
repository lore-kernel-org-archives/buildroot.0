From: Andi Shyti <andi.shyti@gmail.com>
Date: Tue, 28 Jun 2016 03:03:03 +0900
Subject: [Buildroot] [PATCH 1/2] package: add Odroid BL bootloader
 binaries
In-Reply-To: <20160626221048.02818b93@free-electrons.com>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-2-git-send-email-andi@etezian.org>
 <20160626221048.02818b93@free-electrons.com>
Message-ID: <20160627180303.GL424@jack.zhora.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > The above files are provided by the hardkernel u-boot from
> > 
> >  https://github.com/hardkernel/u-boot/tree/odroidxu3-v2012.07
> 
> So the source code for those binary files is not available at all?

Unfortunately not, it is not even available to me :(

> > +config BR2_PACKAGE_ODROID_XU_BL
> > +	bool "odroid-xu-bl"
> 
> 	depends on BR2_arm
> 
> would be good to have here

OK.

> Also, I think this package should be included in the Bootloaders menu
> rather than the firmware menu. Maybe we should name it
> odroid-xu-bootloader or odroid-xu-boot so that it is clear what it does.

OK.

> > +ODROID_XU_BL_VERSION = odroidxu3-v2012.07
> > +ODROID_XU_BL_SITE = $(call github,hardkernel,u-boot,$(ODROID_XU_BL_VERSION))
> 
> It's a bit annoying that we end up downloading an entire U-Boot source
> tree, and in fact not use it except for those 3 files.
> 
> In fact, why don't you simply build this U-Boot version with the U-Boot
> package that already exists in Buildroot, and then use:

It is indeed annoying: I don't like the idea of

 1. downloading two u-boot
 2. download u-boot for just two files.

But, on the other hand, I don't like the hardkernel u-boot
either. I think it's old, ugly and too hacky; as a buildroot
user, I would like as much as I can to use mainline software.
Besides, the cool thing of this board is that it is well
supported both from the Linux Kernel and u-boot.

How about creating a new repository with just these three files?
If it sounds good, I will check with the licensing, even though I
don't thing it will be a problem.

Thanks a lot,
Andi
