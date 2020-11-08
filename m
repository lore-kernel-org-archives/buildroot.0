From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 7 Nov 2020 21:05:10 -0300
Subject: [Buildroot] [PATCH v2 8/8] configs/imx8mmevk: new defconfig
In-Reply-To: <20201107135909.1265116-9-xroumegue@gmail.com>
References: <20201103233934.1ab8a7fc@windsurf.home>
 <20201107135909.1265116-9-xroumegue@gmail.com>
Message-ID: <CAOMZO5AyxDcLGyd2SEMd8pdFVsecMLRQRbDSJYf1tjE6J9nuLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

On Sat, Nov 7, 2020 at 10:59 AM Xavier Roumegue <xroumegue@gmail.com> wrote:
>
> Introduce NXP imx8mm evk board configuration that uses mainline atf,
> uboot and kernel.
>
> Mainline uboot mkimage tool generates the boot image.

Thanks for working on this series!

> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

You missed to pass the specific kernel version like:
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"


> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_FW_FILES="lpddr4*.bin"
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_IMX_FIT=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin spl/u-boot-spl"

You missed to pass the specific U-Boot version like:
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"

Thanks
