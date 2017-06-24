From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 14:33:58 +0200
Subject: [Buildroot] [git commit] board: engicam: Add icorem6 for i.CoreM6
	support
Message-ID: <20170624123420.2095081926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae3d3298f3af60387b5e599a38bf51e133e42b88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create board/engicam/icorem6 for i.CoreM6 supported files.
and update the readme.txt so-that it can list i.CoreM6 board
details.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/engicam/{ => icorem6}/genimage.cfg |  0
 board/engicam/{ => icorem6}/readme.txt   | 14 +++++++-------
 configs/engicam_imx6qdl_icore_defconfig  |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/engicam/genimage.cfg b/board/engicam/icorem6/genimage.cfg
similarity index 100%
rename from board/engicam/genimage.cfg
rename to board/engicam/icorem6/genimage.cfg
diff --git a/board/engicam/readme.txt b/board/engicam/icorem6/readme.txt
similarity index 81%
rename from board/engicam/readme.txt
rename to board/engicam/icorem6/readme.txt
index f1010a2..0ad60bf 100644
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
 
   make engicam_imx6qdl_icore_defconfig
 
@@ -53,7 +53,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/engicam/genimage.cfg
+board/engicam/icorem6/genimage.cfg
 
 Boot the i.CoreM6 boards with SD boot:
 =====================================
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
index 17acdf5..466d60c 100644
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -40,4 +40,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
