From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Sep 2017 08:59:46 -0300
Subject: [Buildroot] [PATCH 4/6] configs/imx6q-sabresd_qt5: Switch to SPL
In-Reply-To: <1506340788-9662-1-git-send-email-festevam@gmail.com>
References: <1506340788-9662-1-git-send-email-festevam@gmail.com>
Message-ID: <1506340788-9662-4-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot 2017.09 uses SPL, so bump to this version so that we can
have a single qt5 image that supports the different imx6 sabresd
boards: imx6q, imx6dl and imx6qp.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx6-sabresd/readme.txt                        |  4 ++--
 ...{imx6q-sabresd_qt5_defconfig => imx6-sabresd_qt5_defconfig} | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename configs/{imx6q-sabresd_qt5_defconfig => imx6-sabresd_qt5_defconfig} (87%)

diff --git a/board/freescale/imx6-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
index ff6c9ba..f13d430 100644
--- a/board/freescale/imx6-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -62,13 +62,13 @@ To boot your newly created system:
 Testing graphics on the i.MX6 Sabre SD board
 ============================================
 
-The imx6q-sabresd_qt5_defconfig allows to quickly test the graphics
+The imx6-sabresd_qt5_defconfig allows to quickly test the graphics
 capabilities of i.MX6 using the opensource Etnaviv graphics stack
 and kernel mainline.
 
 In order to build it:
 
-make imx6q-sabresd_qt5_defconfig
+make imx6-sabresd_qt5_defconfig
 make
 
 Then flash the SD card as explained above.
diff --git a/configs/imx6q-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
similarity index 87%
rename from configs/imx6q-sabresd_qt5_defconfig
rename to configs/imx6-sabresd_qt5_defconfig
index 3128555..2ade242 100644
--- a/configs/imx6q-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -28,10 +28,12 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -39,7 +41,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
 
 # GL driver
-- 
2.7.4
