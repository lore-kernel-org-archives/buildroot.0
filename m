From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  1 Oct 2014 17:03:44 +0200
Subject: [Buildroot] [PATCH v2 1/3] freescale/imx6-sabresd: use global patch
	dir for U-Boot patches
In-Reply-To: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1412175826-9010-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The best practice is to use the BR2_GLOBAL_PATCH_DIR for patches against
U-Boot, not BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch | 0
 configs/freescale_imx6dlsabresd_defconfig                             | 4 +++-
 configs/freescale_imx6qsabresd_defconfig                              | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)
 rename board/freescale/imx6sabresd/{ => patches/uboot}/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch (100%)

diff --git a/board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
similarity index 100%
rename from board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
rename to board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 62caf79..b8c4b22 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -2,6 +2,9 @@
 BR2_arm=y
 BR2_cortex_a9=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
+
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
@@ -25,4 +28,3 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
-BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/freescale/imx6sabresd"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index bc0aa46..40a9384 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -2,6 +2,9 @@
 BR2_arm=y
 BR2_cortex_a9=y
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
+
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
@@ -25,4 +28,3 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
-BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/freescale/imx6sabresd"
-- 
1.9.1
