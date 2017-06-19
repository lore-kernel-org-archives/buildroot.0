From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Mon, 19 Jun 2017 12:57:30 +0530
Subject: [Buildroot] [PATCH v4 4/6] board: engicam: Add icorem6 for i.CoreM6
	support
In-Reply-To: <1497857252-8308-1-git-send-email-jteki@openedev.com>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
Message-ID: <1497857252-8308-5-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Create board/engicam/icorem6 for i.CoreM6 supported files.
and update the readme.txt so-that it can list i.CoreM6 board
details.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- Update .gitlab-ci.yml
Changes for v3:
- Use kernel version 4.11.5
Changes for v2:
- Fix genimage.cfg path in readme.txt

 board/engicam/{ => icorem6}/genimage.cfg    |  0
 board/engicam/{ => icorem6}/readme.txt      | 14 +++++++-------
 configs/engicam_imx6qdl_icore_mmc_defconfig |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename board/engicam/{ => icorem6}/genimage.cfg (100%)
 rename board/engicam/{ => icorem6}/readme.txt (81%)

diff --git a/board/engicam/genimage.cfg b/board/engicam/icorem6/genimage.cfg
similarity index 100%
rename from board/engicam/genimage.cfg
rename to board/engicam/icorem6/genimage.cfg
diff --git a/board/engicam/readme.txt b/board/engicam/icorem6/readme.txt
similarity index 81%
rename from board/engicam/readme.txt
rename to board/engicam/icorem6/readme.txt
index 0ef108d..a86360b 100644
--- a/board/engicam/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -1,8 +1,8 @@
-*****************************************
-Buildroot for Engicam i.MX6 SOM platforms:
-*****************************************
+*********************************************
+Buildroot for Engicam i.CoreM6 SOM platforms:
+*********************************************
 
-This file documents the Buildroot support for all Engicam i.MX6 SOM
+This file documents the Buildroot support for Engicam i.CoreM6
 platform boards.
 
 i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:
@@ -13,9 +13,9 @@ This configuration uses U-Boot mainline and kernel mainline.
 Build
 =====
 
-First, configure Buildroot for the Engicam i.MX SOM's:
+First, configure Buildroot for the Engicam i.CoreM6:
 
-- for i.CoreM6 Quad/Dual:
+- for i.CoreM6 Quad/Dual/DualLite/Solo:
 
   make engicam_imx6qdl_icore_mmc_defconfig
 
@@ -52,7 +52,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/engicam/genimage.cfg
+board/engicam/icorem6/genimage.cfg
 
 Boot the i.CoreM6 boards with SD boot:
 =====================================
diff --git a/configs/engicam_imx6qdl_icore_mmc_defconfig b/configs/engicam_imx6qdl_icore_mmc_defconfig
index ffb3546..25048c4 100644
--- a/configs/engicam_imx6qdl_icore_mmc_defconfig
+++ b/configs/engicam_imx6qdl_icore_mmc_defconfig
@@ -38,4 +38,4 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
-- 
2.7.4
