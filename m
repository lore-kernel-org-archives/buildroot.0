From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:33:49 +0200
Subject: [Buildroot] [PATCH 1/1] Added support for Sinovoip BananaPi M2
 Ultra board.
In-Reply-To: <20180617004900.1413-1-dannym@scratchpost.org>
References: <20180617004900.1413-1-dannym@scratchpost.org>
Message-ID: <20180617143349.7840201d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Danny,

Thanks for your contribution. It's pretty good overall, but there are a
few things missing.

First of all, the commit title should be:

	configs/bananapi_m2_ultra: new defconfig

On Sun, 17 Jun 2018 02:49:00 +0200, Danny Milosavljevic wrote:
> Signed-off-by: Danny Milosavljevic <dannym@scratchpost.org>
> ---
>  board/sinovoip/m2-ultra/boot.cmd     |  7 +++++++
>  board/sinovoip/m2-ultra/genimage.cfg | 33 +++++++++++++++++++++++++++++++++
>  configs/bananapi_m2_ultra_defconfig  | 27 +++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)

Please add an entry to the DEVELOPERS file for this new platform. We
also normally have a readme.txt accompanying each board.

> diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
> new file mode 100644
> index 0000000000..a86d5923c6
> --- /dev/null
> +++ b/configs/bananapi_m2_ultra_defconfig
> @@ -0,0 +1,27 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sinovoip/m2-ultra/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=n

You need to specify an explicit Linux kernel version.

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=n

You need to specify an explicit U-Boot version.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapi_M2_Ultra"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-ultra/boot.cmd"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Other than that, looks good to me. Could you fix those issues and send
an updated version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
