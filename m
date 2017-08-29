From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 29 Aug 2017 09:38:31 -0300
Subject: [Buildroot] [PATCH 2/2] configs/imx6q-sabresd_defconfig: Switch to
	SPL boot
In-Reply-To: <1504010311-29937-1-git-send-email-fabio.estevam@nxp.com>
References: <1504010311-29937-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1504010311-29937-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot 2017.07 has switched to SPL boot, which allows the same binary to
boot on imx6dl, imx6q and imx6qp sabresd boards.

Switch to the SPL mechanism.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/imx6q-sabresd_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/configs/imx6q-sabresd_defconfig b/configs/imx6q-sabresd_defconfig
index b26dc2a..e010315 100644
--- a/configs/imx6q-sabresd_defconfig
+++ b/configs/imx6q-sabresd_defconfig
@@ -22,10 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -33,4 +35,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
-- 
2.7.4
