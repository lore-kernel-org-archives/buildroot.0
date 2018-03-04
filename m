From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 4 Mar 2018 19:25:53 +0200
Subject: [Buildroot] [PATCH v4 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <1520065060-20046-5-git-send-email-karl.erik.larsson@gmail.com>
References: <1520065060-20046-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520065060-20046-5-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180304172552.owvawfc35w2mg5hg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Sat, Mar 03, 2018 at 09:17:40AM +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
> ---

[snip]

> diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
> new file mode 100644
> index 0000000..313bfd9
> --- /dev/null
> +++ b/configs/freescale_imx8mqevk_defconfig
> @@ -0,0 +1,38 @@
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta"

You can now use the more recent 'rel_imx_4.9.51_8mq_beta_patch' tag here, ...

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mq-evk"
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta"

... here, and ...

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="o8.0.0_1.3.0_8m-prc"

... here.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
> +BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_IMX_MKIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
