From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Dec 2018 13:44:49 +0100
Subject: [Buildroot] [PATCH 1/1] board: add Bananapi M2 Ultra support
In-Reply-To: <20181009132503.15531-1-lothar.felten@gmail.com>
References: <20181009132503.15531-1-lothar.felten@gmail.com>
Message-ID: <20181208124449.GN2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lothar, All,

On 2018-10-09 15:25 +0200, Lothar Felten spake thusly:
> Add intial support for Bananapi M2 Ultra board based on the Allwinner
> R40 SoC.
> 
> - U-Boot 2018.07
> - Linux 4.18.12

Now that we have added support for the 4.19 linux kernel, this defconfig
no longer builds:

    https://gitlab.com/ymorin/buildroot/-/jobs/131781882

See below...

[--SNIP--]
> diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
> new file mode 100644
> index 0000000000..5dd3edd664
> --- /dev/null
> +++ b/configs/bananapi_m2_ultra_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.12"

This also requires an explicit:

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y

Regards,
Yann E. MORIN.

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
