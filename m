From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Feb 2018 09:43:57 +0200
Subject: [Buildroot] [PATCH v2 3/3] add support iMX8MQ-evk board
In-Reply-To: <1519293778-5185-4-git-send-email-karl.erik.larsson@gmail.com>
References: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519293778-5185-4-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180225074357.4aqpnqmq7ls3pd4e@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Thu, Feb 22, 2018 at 11:02:58AM +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> ---
>  .../common/imx/genimage.cfg.template_imx8          |  40 ++
>  board/freescale/common/imx/post-image.sh           |  10 +-
>  board/freescale/imx8mqevk/linux-4.9.config         | 625 +++++++++++++++++++++
>  configs/freescale_imx8mqevk_defconfig              |  37 ++
>  4 files changed, 709 insertions(+), 3 deletions(-)
>  create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
>  create mode 100644 board/freescale/imx8mqevk/linux-4.9.config
>  create mode 100644 configs/freescale_imx8mqevk_defconfig

[snip]

> diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
> new file mode 100644
> index 0000000..bc12e7c
> --- /dev/null
> +++ b/configs/freescale_imx8mqevk_defconfig
> @@ -0,0 +1,37 @@
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_4.9.51_imx8m_beta"

For the sake of reproducibility we don't use branch names in defconfigs, since 
these might change over time. Use the 'rel_imx_4.9.51_8mq_beta' tag name 
instead. If you believe that commits that follow that tag are essential, you 
can use the raw commit id of current imx_4.9.51_imx8m_beta branch tip.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/imx8mqevk/linux-4.9.config"
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
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="imx_4.9.51_imx8m_beta"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="imx_v2017.03_4.9.51_imx8m_beta"

This is also a branch. You can use the 'o8.0.0_1.3.0_8m-prc' tag, which is 
currently almost the same, or a commit id.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
> +BR2_TARGET_UBOOT_FORMAT_IMX=y
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
