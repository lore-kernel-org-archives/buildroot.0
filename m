From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Oct 2019 14:20:51 +0200
Subject: [Buildroot] [PATCH] configs/licheepi_zero: move to mainline
In-Reply-To: <1570781475-25808-1-git-send-email-angelo@amarulasolutions.com>
References: <1570781475-25808-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20191011142051.1e4e61be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Fri, 11 Oct 2019 10:11:15 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> -# Toolchain
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y

You still need to select an explicit version for the kernel headers.

> -
>  # System configuration
>  BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
> @@ -15,12 +12,8 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
>  
>  # Kernel
> -# Custom 4.14.14 kernel based on stable linux.4.14.y from Lichee-Pi Github repository
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/linux"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cda44c146b9b87290bc7c636ffa7d88cbfb03ace"
> -BR2_LINUX_KERNEL_DEFCONFIG="licheepi_zero"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"

You still need to select an explicit version for the Linux kernel.

>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
>  
> @@ -36,10 +29,6 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  
>  # Bootloaders
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/u-boot"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="32ab1804cd7c5858be8009e35ca07502dc8765c7"

And same for U-Boot.

See all our other defconfigs, even those that use mainline/upstream
versions of Linux and U-Boot.

Thanks

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
