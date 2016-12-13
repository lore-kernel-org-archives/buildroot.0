From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Dec 2016 23:52:36 +0300
Subject: [Buildroot] [PATCH 1/2] orangepipc: rename to orangepi-pc
Message-ID: <20161213205237.7119-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename orangepipc files, configs, and directories:
- oragepipc_defconfig -> orangepi_pc_defconfig
- board/orangepi/orangepipc -> board/orangepi/orangepi-pc

The purpose of the patch is to improve readability before
adding other boards of orangepi family.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                               | 2 +-
 board/orangepi/{orangepipc => orangepi-pc}/boot.cmd      | 0
 board/orangepi/{orangepipc => orangepi-pc}/genimage.cfg  | 0
 board/orangepi/{orangepipc => orangepi-pc}/post-build.sh | 0
 board/orangepi/{orangepipc => orangepi-pc}/post-image.sh | 0
 board/orangepi/{orangepipc => orangepi-pc}/readme.txt    | 2 +-
 configs/{orangepipc_defconfig => orangepi_pc_defconfig}  | 4 ++--
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename board/orangepi/{orangepipc => orangepi-pc}/boot.cmd (100%)
 rename board/orangepi/{orangepipc => orangepi-pc}/genimage.cfg (100%)
 rename board/orangepi/{orangepipc => orangepi-pc}/post-build.sh (100%)
 rename board/orangepi/{orangepipc => orangepi-pc}/post-image.sh (100%)
 rename board/orangepi/{orangepipc => orangepi-pc}/readme.txt (95%)
 rename configs/{orangepipc_defconfig => orangepi_pc_defconfig} (86%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 903e9a9..d855d11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1151,7 +1151,7 @@ F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/orangepi/
-F:	configs/orangepipc_defconfig
+F:	configs/orangepi_pc_defconfig
 F:	package/flickcurl/
 F:	package/libfastjson/
 F:	package/lzop/
diff --git a/board/orangepi/orangepipc/boot.cmd b/board/orangepi/orangepi-pc/boot.cmd
similarity index 100%
rename from board/orangepi/orangepipc/boot.cmd
rename to board/orangepi/orangepi-pc/boot.cmd
diff --git a/board/orangepi/orangepipc/genimage.cfg b/board/orangepi/orangepi-pc/genimage.cfg
similarity index 100%
rename from board/orangepi/orangepipc/genimage.cfg
rename to board/orangepi/orangepi-pc/genimage.cfg
diff --git a/board/orangepi/orangepipc/post-build.sh b/board/orangepi/orangepi-pc/post-build.sh
similarity index 100%
rename from board/orangepi/orangepipc/post-build.sh
rename to board/orangepi/orangepi-pc/post-build.sh
diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepi-pc/post-image.sh
similarity index 100%
rename from board/orangepi/orangepipc/post-image.sh
rename to board/orangepi/orangepi-pc/post-image.sh
diff --git a/board/orangepi/orangepipc/readme.txt b/board/orangepi/orangepi-pc/readme.txt
similarity index 95%
rename from board/orangepi/orangepipc/readme.txt
rename to board/orangepi/orangepi-pc/readme.txt
index f12c867..d316b6f 100644
--- a/board/orangepi/orangepipc/readme.txt
+++ b/board/orangepi/orangepi-pc/readme.txt
@@ -12,7 +12,7 @@ How to build it
 
 Configure Buildroot:
 
-    $ make orangepipc_defconfig
+    $ make orangepi_pc_defconfig
 
 Compile everything and build the SD card image:
 
diff --git a/configs/orangepipc_defconfig b/configs/orangepi_pc_defconfig
similarity index 86%
rename from configs/orangepipc_defconfig
rename to configs/orangepi_pc_defconfig
index 6d3a842..dd21d5f 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.3"
-- 
2.10.2
