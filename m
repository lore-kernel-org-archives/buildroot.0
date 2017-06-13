From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 13 Jun 2017 13:18:20 +0530
Subject: [Buildroot] [PATCH 1/5] board: Add support for Engicam i.CoreM6
	DualLite/Solo boards
In-Reply-To: <1497340104-25108-1-git-send-email-jteki@openedev.com>
References: <1497340104-25108-1-git-send-email-jteki@openedev.com>
Message-ID: <1497340104-25108-2-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for Engicam i.CoreM6 DualLite/Solo board
with below features:
- U-Boot 2017.05-rc1
- Linux 4.11
- Default packages from buildroot

U-Boot 2017.05-rc1 has common u-boot defconfig for All i.CoreM6
variant boards, so this patch update the same along with
buildroot defconfig that reflect the common name.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 DEVELOPERS                                                        | 2 +-
 board/engicam/genimage.cfg                                        | 1 +
 board/engicam/readme.txt                                          | 6 ++++--
 ...icam_imx6q_icore_defconfig => engicam_imx6qdl_icore_defconfig} | 8 ++++----
 4 files changed, 10 insertions(+), 7 deletions(-)
 rename configs/{engicam_imx6q_icore_defconfig => engicam_imx6qdl_icore_defconfig} (78%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a11f8b..cb498ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -829,7 +829,7 @@ F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
-F:	configs/engicam_imx6q_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
diff --git a/board/engicam/genimage.cfg b/board/engicam/genimage.cfg
index 43c81cf..cdccc90 100644
--- a/board/engicam/genimage.cfg
+++ b/board/engicam/genimage.cfg
@@ -2,6 +2,7 @@ image boot.vfat {
 	vfat {
 		files = {
 			"uImage",
+			"imx6dl-icore.dtb",
 			"imx6q-icore.dtb"
 		}
 	}
diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
index eb7503f..d02c3af 100644
--- a/board/engicam/readme.txt
+++ b/board/engicam/readme.txt
@@ -5,7 +5,7 @@ Buildroot for Engicam i.MX6 SOM platforms:
 This file documents the Buildroot support for all Engicam i.MX6 SOM
 platform boards.
 
-i.CoreM6 Quad/Dual SOM Starter kits:
+i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:
 https://www.engicam.com/vis-prod/101120
 
 This configuration uses U-Boot mainline and kernel mainline.
@@ -17,7 +17,7 @@ First, configure Buildroot for the Engicam i.MX SOM's:
 
 - for i.CoreM6 Quad/Dual:
 
-  make engicam_imx6q_icore_defconfig
+  make engicam_imx6qdl_icore_defconfig
 
 Build all components:
 
@@ -26,6 +26,8 @@ Build all components:
 You will find the following files in output/images/:
 - for i.CoreM6 Quad/Dual:
   - imx6q-icore.dtb
+- for i.CoreM6 DualLite/Solo:
+  - imx6dl-icore.dtb
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
diff --git a/configs/engicam_imx6q_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
similarity index 78%
rename from configs/engicam_imx6q_icore_defconfig
rename to configs/engicam_imx6qdl_icore_defconfig
index 63454ee..0d49905 100644
--- a/configs/engicam_imx6q_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -14,8 +14,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
@@ -30,10 +30,10 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-icore"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=""imx6dl-icore imx6q-icore"
 
 # Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual Starter Kit"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo Starter Kit"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
