From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 13 Sep 2017 17:12:08 +0530
Subject: [Buildroot] [PATCH v3 3/6] engicam: icorem6: Add OF C.TOUCH 10.1 Kit
In-Reply-To: <1505302931-17387-1-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
Message-ID: <1505302931-17387-4-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This patch add support for Open Frame C.TOUCH 10.1 Kit.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- newly added

 board/engicam/icorem6/genimage.cfg      | 3 ++-
 board/engicam/icorem6/readme.txt        | 4 ++++
 configs/engicam_imx6qdl_icore_defconfig | 4 ++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/genimage.cfg
index f409a08..50c01bb 100644
--- a/board/engicam/icorem6/genimage.cfg
+++ b/board/engicam/icorem6/genimage.cfg
@@ -3,7 +3,8 @@ image boot.vfat {
 		files = {
 			"uImage",
 			"imx6dl-icore.dtb",
-			"imx6q-icore.dtb"
+			"imx6q-icore.dtb",
+			"imx6q-icore-ofcap10.dtb"
 		}
 	}
 	size = 64M
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
index 9a9ecf0..e822ae0 100644
--- a/board/engicam/icorem6/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -7,6 +7,8 @@ platform boards.
 
 i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:
 https://www.engicam.com/vis-prod/101120
+i.CoreM6 Quad/Dual/DualLite/Solo Open Frame 10.1 C.TOUCH kits:
+https://www.engicam.com/vis-prod/101133
 
 This configuration uses U-Boot mainline and kernel mainline.
 
@@ -28,6 +30,8 @@ You will find the following files in output/images/:
   - imx6q-icore.dtb
 - for i.CoreM6 DualLite/Solo:
   - imx6dl-icore.dtb
+- for i.CoreM6 Quad/Dual ofcap 10:
+  - imx6q-icore-ofcap10.dtb
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
index 03e65bd..8e1908b 100644
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -30,10 +30,10 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10"
 
 # Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo Starter Kit"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
