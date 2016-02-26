From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 15:52:44 +0100
Subject: [Buildroot] [git commit branch/next] configs: pandaboard: bump
	u-boot to 2016.01 and kernel to 4.4.3 and use ext4
Message-ID: <20160226145754.71FCC802CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55fad2b5b669160696fb3a15309ad98523b24d9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pandaboard/readme.txt  | 4 ++--
 configs/pandaboard_defconfig | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
index 8741349..e18ae52 100644
--- a/board/pandaboard/readme.txt
+++ b/board/pandaboard/readme.txt
@@ -27,7 +27,7 @@ The result of the build with the default settings should be these files:
   ????????? omap4-panda-a4.dtb
   ????????? omap4-panda.dtb
   ????????? omap4-panda-es.dtb
-  ????????? rootfs.ext2
+  ????????? rootfs.ext4
   ????????? u-boot.img
   ????????? zImage
 
@@ -73,4 +73,4 @@ and u-boot.img to it.
 The last step is to copy the rootfs image to the sdcard's second
 partition using 'dd':
 
-  $ sudo dd if=rootfs.ext2 of=/dev/sdX2 bs=1M conv=fsync
+  $ sudo dd if=rootfs.ext4 of=/dev/sdX2 bs=1M conv=fsync
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 76b4caa..c217d3b 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -2,22 +2,23 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap4_panda"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
