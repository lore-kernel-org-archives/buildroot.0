From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Oct 2019 10:48:20 -0300
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx7ulpevk: new
 defconfig
In-Reply-To: <20191018133845.16532-1-fabrice.goucem@nxp.com>
References: <20191018133845.16532-1-fabrice.goucem@nxp.com>
Message-ID: <CAOMZO5A1-ZeEVeUSOvab6XjbJUpfMyV-aVeJixY2xtYHNNUQ2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Thanks for sending this patch.

I am also interested in getting imx7ulp evk supported in Buildroot :-)

On Fri, Oct 18, 2019 at 10:39 AM Fabrice Goucem <fabrice.goucem@nxp.com> wrote:

Please add a commit log.

> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>

> +Create a bootable SD card
> +=========================
> +
> +To determine the device associated to the SD card have a look in the
> +/proc/partitions file:
> +
> +  cat /proc/partitions
> +
> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
> +directory, ready to be dumped on a SD card. Launch the following
> +command as root:
> +
> +  dd if=./output/images/sdcard.img of=/dev/<your-sd-device>
> +
> +*** WARNING! This will destroy all the card content. Use with care! ***
> +
> +For details about the medium image layout, see the definition in
> +board/freescale/common/imx/genimage.cfg.template.

An important step that is missing is regarding the M4 firmware.

We should probably put the M4 firmware into the the rootfs and explain
the commands to flash the QSPI with the M4 firmware.

Please see Thomas' feedback when an earlier attempt to add support for
this board was made:
https://patchwork.ozlabs.org/patch/945237/


> @@ -0,0 +1,27 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.0.0"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7ulp-evkb"
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7=y

Is this option really needed?

Thanks
