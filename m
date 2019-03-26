From: Philip Molloy <philip@philipmolloy.com>
Date: Tue, 26 Mar 2019 00:07:45 +0000
Subject: [Buildroot] [PATCH 1/1] board: rename pine64 to pine64_a64
Message-ID: <Oqsf6ZigkT9qL6qRMvO1f_TiFird6B1pMrBmVFLQRMFfs8Wv_lt0OuqT_zUwe0rxjTolUCzKj2jIQJ5u8BB-O6LGmJESAiwSWtgiGpkTyOk=@philipmolloy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Submitting a patch that I previously sent using an unregistered e-mail address. See the following for more information:

http://lists.busybox.net/pipermail/buildroot/2019-March/245825.html

Signed-off-by: Philip Molloy <philip@philipmolloy.com>
---
 DEVELOPERS                                         | 2 +-
 board/pine64/{pine64 => a64}/boot.cmd              | 0
 board/pine64/{pine64 => a64}/genimage.cfg          | 0
 board/pine64/{pine64 => a64}/readme.txt            | 8 ++++----
 configs/{pine64_defconfig => pine64_a64_defconfig} | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename board/pine64/{pine64 => a64}/boot.cmd (100%)
 rename board/pine64/{pine64 => a64}/genimage.cfg (100%)
 rename board/pine64/{pine64 => a64}/readme.txt (80%)
 rename configs/{pine64_defconfig => pine64_a64_defconfig} (93%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 002ffa09c7..527fa85280 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1030,7 +1030,7 @@ F:	configs/orangepi_pc2_defconfig
 F:	configs/orangepi_prime_defconfig
 F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
-F:	configs/pine64_defconfig
+F:	configs/pine64_a64_defconfig
 F:	configs/pine64_sopine_defconfig

 N:	James Hilliard <james.hilliard1@gmail.com>
diff --git a/board/pine64/pine64/boot.cmd b/board/pine64/a64/boot.cmd
similarity index 100%
rename from board/pine64/pine64/boot.cmd
rename to board/pine64/a64/boot.cmd
diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/a64/genimage.cfg
similarity index 100%
rename from board/pine64/pine64/genimage.cfg
rename to board/pine64/a64/genimage.cfg
diff --git a/board/pine64/pine64/readme.txt b/board/pine64/a64/readme.txt
similarity index 80%
rename from board/pine64/pine64/readme.txt
rename to board/pine64/a64/readme.txt
index 85226fdd17..c35bf62037 100644
--- a/board/pine64/pine64/readme.txt
+++ b/board/pine64/a64/readme.txt
@@ -2,10 +2,10 @@ Intro
 =====

 This default configuration will allow you to start experimenting with the
-buildroot environment for the Pine64. With the current configuration
+buildroot environment for the Pine A64. With the current configuration
 it will bring-up the board, and allow access through the serial console.

-Pine64 link:
+Pine A64 link:
 https://www.pine64.org/?page_id=1194

 Wiki link:
@@ -16,7 +16,7 @@ This configuration uses U-Boot mainline and kernel mainline.
 How to build
 ============

-    $ make pine64_defconfig
+    $ make pine64_a64_defconfig

     $ make

@@ -34,5 +34,5 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
   $ sudo sync

-Insert the micro SDcard in your Pine64 and power it up. The console
+Insert the micro SDcard in your Pine A64 and power it up. The console
 is on the serial line, 115200 8N1.
diff --git a/configs/pine64_defconfig b/configs/pine64_a64_defconfig
similarity index 93%
rename from configs/pine64_defconfig
rename to configs/pine64_a64_defconfig
index 6e8eb15d73..17b10715e8 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_a64_defconfig
@@ -37,11 +37,11 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"

 # Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
+BR2_TARGET_GENERIC_ISSUE="Welcome to PINE A64"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/a64/genimage.cfg"
--
2.17.2
