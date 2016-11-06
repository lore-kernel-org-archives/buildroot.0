From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 6 Nov 2016 12:38:53 +0100
Subject: [Buildroot] [PATCH] configs/mini2440_defconfig: remove defconfig
In-Reply-To: <1478355899-30146-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478355899-30146-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <91e46535-61a4-d1cc-7dae-cb0cab23ebfa@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/11/2016 ? 15:24, Thomas Petazzoni a ?crit :
> This defconfig has not been updated in any significant way since 2011,
> when Peter moved it to use a mainline kernel. It's now using an
> ancient 3.0 kernel, and a vendor-specific U-Boot version that fails to
> build with various "undefined reference" errors:
> 
>   undefined reference to `show_boot_progress'
>   undefined reference to `image_print_contents'
>   undefined reference to `wait_ms'
> 
> So it's time to get rid of the defconfig for this platform.

The mini2440 has been added in u-boot upstream on 2012-10-03 (v2012.10) and
removed on 2014-01-13 (v2014.01).

I still have this board but I never used the u-boot mainline version.
IIRC, I've tested this board up to kernel 3.10 long time ago.

Acked-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Of course, if anyone has access to this platform and is interested in
> having a defconfig in Buildroot, it's possible: just let us know, and
> send a patch updating the defconfig. Thanks!
> ---
>  configs/mini2440_defconfig | 34 ----------------------------------
>  1 file changed, 34 deletions(-)
>  delete mode 100644 configs/mini2440_defconfig
> 
> diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
> deleted file mode 100644
> index 2891d10..0000000
> --- a/configs/mini2440_defconfig
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -# Architecture
> -BR2_arm=y
> -BR2_arm920t=y
> -
> -# Serial port
> -BR2_TARGET_GENERIC_GETTY=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttySAC0"
> -
> -# Filesystem
> -BR2_TARGET_ROOTFS_JFFS2=y
> -BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
> -BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
> -BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
> -BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
> -BR2_TARGET_ROOTFS_JFFS2_LE=y
> -BR2_TARGET_ROOTFS_TAR=y
> -
> -# Linux headers same as kernel, a 3.0 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
> -
> -# Bootloader
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BOARDNAME="mini2440"
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://repo.or.cz/w/u-boot-openmoko/mini2440.git/snapshot/dev-mini2440-stable.tar.gz"
> -
> -#
> -# Kernel
> -#
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.0.4"
> -BR2_LINUX_KERNEL_DEFCONFIG="mini2440"
> -BR2_LINUX_KERNEL_UIMAGE=y
> 
