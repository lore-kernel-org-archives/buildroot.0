From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:43:51 +0100
Subject: [Buildroot] [git commit branch/next] olimex_a20_olinuxino_lime2:
	update to use genimage
Message-ID: <20160224224623.E8363801D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae13fd947b0e844da5b806acaf5301ecb223e78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/olimex/a20_olinuxino/readme.txt        | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 8be1bf4..d6871ce 100644
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
index 1a2bb45..1e3fa4a 100644
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
