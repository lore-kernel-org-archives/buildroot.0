From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 22 Sep 2016 10:54:09 -0300
Subject: [Buildroot] [PATCH 1/2] configs/imx6qsabresd: Use zImage by default
Message-ID: <1474552450-29870-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the generated sdcard.img does not boot because U-Boot looks for
a zImage type of kernel instead of uImage.

Remove the generation of uImage, so that the sdcard.img can successfully
boot.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/freescale_imx6qsabresd_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index b7419b0..fc465a2 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -17,8 +17,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
 
-- 
2.7.4
