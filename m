From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Feb 2016 01:24:32 +0100
Subject: [Buildroot] [PATCH 8/9] olimex_a20_olinuxino_lime2: update to use
	genimage
In-Reply-To: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1456187073-2876-9-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Jan Viktorin <viktorin@rehivetech.com>
---
 board/olimex/a20_olinuxino/readme.txt        | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 18c069e1077e..7cfb51b5e8bf 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -52,7 +52,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
     +-- script.bin (lime_mali)
-    +-- sdcard.img (micro, lime)
+    +-- sdcard.img
     +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
     +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
     +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 1a2bb458dd7d..1e3fa4a1d22a 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -7,6 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
@@ -28,4 +29,5 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
1.9.1
