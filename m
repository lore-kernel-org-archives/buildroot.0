From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 26 Feb 2016 20:40:13 +0900
Subject: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux 4.4.3
Message-ID: <1456486813-28269-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to the latest kernel with DT path adjustment because Linux
commit ca5b34100c57 ("dts, arm64: Move dts files to vendor subdirs")
moved the DT file to the vendor sub-directory.

This commit was tested with the latest model (FVP v8 Foundation
Platform 9.5 build 41), so I updated the instruction in readme.txt
corresponding to it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 board/arm/foundation-v8/readme.txt |  4 ++--
 configs/arm_foundationv8_defconfig | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index 5406ed3..1dedf68 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -3,14 +3,14 @@ ARM software simulator of the AArch64 architecture.
 
 First, one has to download the AArch64 software simulator from:
 
-  https://silver.arm.com/download/download.tm?pv=2482590
+  https://silver.arm.com/download/download.tm?pv=2663527
 
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
 
 Finally, boot your system with:
 
- ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-4.1/Foundation_Platform \
+ ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-4.7/Foundation_Platform \
     --image output/images/linux-system.axf \
     --block-device output/images/rootfs.ext2 \
     --network=nat
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 8968c77..d31f69d 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,16 +1,16 @@
 BR2_aarch64=y
-# Linux headers same as kernel, a 3.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(LINUX_DIR)/arch/arm64/configs/defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="foundation-v8"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_BOOT_WRAPPER_AARCH64=y
-BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="foundation-v8"
+BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="arm/foundation-v8"
 BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS="root=/dev/vda consolelog=9 console=ttyAMA0 rw"
-- 
1.9.1
