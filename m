From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 12:20:31 +0100
Subject: [Buildroot] [PATCH 6/7] configs/freescale_imx8qmmek: new
 defconfig
In-Reply-To: <20190909121525.13935-6-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-6-maeva.manuel@nxp.com>
Message-ID: <20200205122031.37d07400@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maeva,

On Mon, 9 Sep 2019 12:15:07 +0000
Maeva Manuel <maeva.manuel@nxp.com> wrote:

> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>

> diff --git a/board/freescale/imx8qmmek/readme.txt b/board/freescale/imx8qmmek/readme.txt
> new file mode 100644
> index 0000000000..15eecfa83e
> --- /dev/null
> +++ b/board/freescale/imx8qmmek/readme.txt
> @@ -0,0 +1,66 @@
> +***************************
> +Freescale i.MX8QM MEK board
> +***************************
> +
> +This file documents the Buildroot support for the Freescale i.MX8QM MEK board.
> +
> +Build
> +=====
> +
> +First, configure Buildroot for the i.MX8QM MEK board:
> +
> +  make freescale_imx8qmmek_defconfig
> +
> +Build all components:
> +
> +  make
> +
> +You will find in output/images/ the following files:
> +  - mx8qm-ahab-container.img

The file is now really named ahab-container.img


> diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
> new file mode 100644
> index 0000000000..b0c433cf4a
> --- /dev/null
> +++ b/configs/freescale_imx8qmmek_defconfig
> @@ -0,0 +1,40 @@
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +#GCC version must be inferior to 8_X because of -Wstringop-truncation message error
> +BR2_GCC_VERSION_7_X=y

Which component fails to build like this? Isn't this fixed by using a
newer 4.14 kernel such as 4.14.98 like other Freescale/NXP defconfigs
in Buildroot ?

For a new defconfig, it is really not good if we can't use the current
default version of gcc.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qm-mek.dtb"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="ssh://git at bitbucket.sw.nxp.com/imx/linux-imx.git"

This is not accessible to the public, you need to use public URLs.

Could you fix these issues and send an updated version ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
