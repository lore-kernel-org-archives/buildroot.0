From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  3 Dec 2017 14:56:19 +0200
Subject: [Buildroot] [PATCH 8/8] odroidc2: update readme file
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203125619.30919-8-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/readme.txt | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/board/hardkernel/odroidc2/readme.txt b/board/hardkernel/odroidc2/readme.txt
index b44aa67f5a..5f6c1c5a64 100644
--- a/board/hardkernel/odroidc2/readme.txt
+++ b/board/hardkernel/odroidc2/readme.txt
@@ -10,7 +10,11 @@ How to build it
 
   $ make odroidc2_defconfig
 
-Then you can edit the build options using
+For vendor based configuration or
+
+  $ make odroidc2_mainline_defconfig
+
+For community based configuration, then you can edit the build options using
 
   $ make menuconfig
 
@@ -24,7 +28,9 @@ download the packages' sources.
 Result of the build
 -------------------
 
-After building, you should obtain this tree:
+After building, you should obtain one of the following trees:
+
+For vendor based configuration:
 
     output/images/
     +-- Image
@@ -37,7 +43,26 @@ After building, you should obtain this tree:
     +-- sdcard.img
     `-- u-boot.bin
 
+For community based configuration:
+
+    output/images/
+    +-- Image
+    +-- uImage			   [2]
+    +-- boot.scr                   [1]
+    +-- boot.vfat
+    +-- meson-gxbb-odroidc2.dtb
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- bl1.bin.hardkernel	   [4]
+    +-- uboot-odc2.img		   [3]
+    `-- u-boot.bin
+
 [1] This is the ODROID-C2 configuration file used in u-boot.
+[2] This is the ODROID-C2 kernel image file which will be booted.
+[3] This is the ODROID-C2 signed u-boot image which will be used.
+[4] This is the vendor's firmware which is needed for the board to boot.
 
 How to write the SD card or eMMC
 ================================
-- 
2.15.1
