From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Sep 2017 08:59:43 -0300
Subject: [Buildroot] [PATCH 1/6] configs/imx6q-sabresd: Drop the 'quad'
	notation
Message-ID: <1506340788-9662-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that SPL is supported a single image can run on the different
variants of imx6 sabresd boards: imx6q, imx6dl and imx6qp.

So drop the 'quad' prefix from defconfig, directory and readme file
to make it generic.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../linux_qt5.fragment                             |  0
 .../{imx6q-sabresd => imx6-sabresd}/readme.txt     | 23 +++++++++++++---------
 .../rootfs_overlay/root/sabresd.json               |  0
 ...6q-sabresd_defconfig => imx6-sabresd_defconfig} |  0
 configs/imx6q-sabresd_qt5_defconfig                |  4 ++--
 5 files changed, 16 insertions(+), 11 deletions(-)
 rename board/freescale/{imx6q-sabresd => imx6-sabresd}/linux_qt5.fragment (100%)
 rename board/freescale/{imx6q-sabresd => imx6-sabresd}/readme.txt (77%)
 rename board/freescale/{imx6q-sabresd => imx6-sabresd}/rootfs_overlay/root/sabresd.json (100%)
 rename configs/{imx6q-sabresd_defconfig => imx6-sabresd_defconfig} (100%)

diff --git a/board/freescale/imx6q-sabresd/linux_qt5.fragment b/board/freescale/imx6-sabresd/linux_qt5.fragment
similarity index 100%
rename from board/freescale/imx6q-sabresd/linux_qt5.fragment
rename to board/freescale/imx6-sabresd/linux_qt5.fragment
diff --git a/board/freescale/imx6q-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
similarity index 77%
rename from board/freescale/imx6q-sabresd/readme.txt
rename to board/freescale/imx6-sabresd/readme.txt
index b57c4fb..ff6c9ba 100644
--- a/board/freescale/imx6q-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -1,18 +1,21 @@
 *******************************
-Freescale i.MX6Q Sabre SD board
+Freescale i.MX6 Sabre SD boards
 *******************************
 
-This file documents the Buildroot support for the Freescale i.MX6Q Sabre SD
-board.
+This file documents the Buildroot support for the Freescale i.MX6 Sabre SD
+boards based on i.MX6Q, i.MX6DL and iMX6QP.
+
+Thanks to the SPL support in U-Boot it is possible to run a single
+sdcard.img in all i.MX6 Sabre SD board variants.
 
 This configuration uses U-Boot mainline and kernel mainline.
 
 Build
 =====
 
-First, configure Buildroot for the i.MX6Q Sabre SD board:
+First, configure Buildroot for the i.MX6 Sabre SD board:
 
-  make imx6q-sabresd_defconfig
+  make imx6-sabresd_defconfig
 
 Build all components:
 
@@ -20,6 +23,8 @@ Build all components:
 
 You will find the following files in output/images/ :
   - imx6q-sabresd.dtb
+  - imx6dl-sabresd.dtb
+  - imx6qp-sabresd.dtb
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
@@ -45,8 +50,8 @@ command as root:
 For details about the medium image layout, see the definition in
 board/freescale/common/imx/genimage.cfg.template.
 
-Boot the i.MX6Q Sabre SD board
-==============================
+Boot the i.MX6 Sabre SD board
+=============================
 
 To boot your newly created system:
 - insert the SD card in the SD3 slot of the board (close to the HDMI connector);
@@ -54,8 +59,8 @@ To boot your newly created system:
   emulator at 115200 bps, 8n1;
 - power on the board.
 
-Testing graphics on the i.MX6Q Sabre SD board
-=============================================
+Testing graphics on the i.MX6 Sabre SD board
+============================================
 
 The imx6q-sabresd_qt5_defconfig allows to quickly test the graphics
 capabilities of i.MX6 using the opensource Etnaviv graphics stack
diff --git a/board/freescale/imx6q-sabresd/rootfs_overlay/root/sabresd.json b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
similarity index 100%
rename from board/freescale/imx6q-sabresd/rootfs_overlay/root/sabresd.json
rename to board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
diff --git a/configs/imx6q-sabresd_defconfig b/configs/imx6-sabresd_defconfig
similarity index 100%
rename from configs/imx6q-sabresd_defconfig
rename to configs/imx6-sabresd_defconfig
diff --git a/configs/imx6q-sabresd_qt5_defconfig b/configs/imx6q-sabresd_qt5_defconfig
index 801b256..94bf867 100644
--- a/configs/imx6q-sabresd_qt5_defconfig
+++ b/configs/imx6q-sabresd_qt5_defconfig
@@ -24,7 +24,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_ROOTFS_OVERLAY="board/freescale/imx6q-sabresd/rootfs_overlay"
+BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
@@ -40,7 +40,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6q-sabresd/linux_qt5.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6-sabresd/linux_qt5.fragment"
 
 # GL driver
 BR2_PACKAGE_MESA3D=y
-- 
2.7.4
