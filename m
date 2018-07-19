From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 19 Jul 2018 12:31:03 +0200
Subject: [Buildroot] [PATCH v2 1/7] configs/freescale_imx8mqevk: add script
 arg to specify U-Boot dtb
In-Reply-To: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
References: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
Message-ID: <20180719103109.19887-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change will allow to have a more generic imx8-bootloader-prepare.sh
script which doesn't hadcode any dtb name/location.

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/freescale_imx8mqevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index f48e4f78e4..a6e9b940b5 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -3,6 +3,7 @@ BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
-- 
2.18.0
