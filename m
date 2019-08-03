From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 08:41:54 +0200
Subject: [Buildroot] [PATCH 2/2] board/orangepi: Add support for
 OrangePi Rk3399 board
In-Reply-To: <20190422180433.15886-2-shyam.saini@amarulasolutions.com>
References: <20190422180433.15886-1-shyam.saini@amarulasolutions.com>
 <20190422180433.15886-2-shyam.saini@amarulasolutions.com>
Message-ID: <20190803084154.303f5f34@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For this one, there is a need of a change on your side, which requires
a respin. See my comments below.

On Mon, 22 Apr 2019 23:34:33 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> This initial support includes:
>         Custom u-boot
>         Linux next

Could you send a new iteration with a final Linux kernel, as I believe
this platform is now supported in a Linux kernel official release.

>         ATF v2.0
>         Buildroot default packages
> 
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

Also, fix the commit title to:

	configs/orangepi_rk3399: new defconfig

> +# Linux headers same as kernel, a 5.0 series
> +BR2_KERNEL_HEADERS_5_0=y

Use the "Same as kernel" functionality for the kernel headers.

> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="OrangePi RK3399"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to OrangePi RK3399!"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"

Use the default ext2 filesystem size.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
