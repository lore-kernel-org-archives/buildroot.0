From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:15:43 +0200
Subject: [Buildroot] [PATCH 14/46] u-boot: support building for mkimage
In-Reply-To: <877hm9i4fd.fsf@macbook.be.48ers.dk>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<09b5460223d8c9930125c60c4ab8dab52b05372b.1275343447.git.thomas.petazzoni@free-electrons.com>
	<877hm9i4fd.fsf@macbook.be.48ers.dk>
Message-ID: <20100612161543.0e06da9a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 08 Jun 2010 23:45:58 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas>  U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
>  Thomas> +U_BOOT_BOARD_NAME:=$(call
>  Thomas> qstrip,$(BR2_TARGET_UBOOT_BOARDNAME)) +
>  Thomas> +# An U-Boot version and board might not be specified if
>  Thomas> U-Boot isn't +# explicitly selected, but mkimage needs to be
>  Thomas> compiled. In this case, +# we just take a random U-Boot
>  Thomas> version and configuration. +ifeq ($(U_BOOT_VERSION),)
>  Thomas> +U_BOOT_VERSION=2010.03
>  Thomas> +U_BOOT_BOARD_NAME=smdk2410
>  Thomas> +endif
>   
>  Thomas>  # u-boot still uses arch=ppc for powerpc
>  Thomas>  U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
>  
> Does that work if KERNEL_ARCH != arm?

Yes, it was. But I looked more closely at this and discovered that it
was possible to build mkimage *without* configuring U-Boot. I've taken
advantage of this to not configure U-Boot with a fake board.

> Huh, isn't that supposed to be mkimage for the host? Why do you need
> to pass all this target stuff?

I've removed this and simplified the build of mkimage for the host.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
