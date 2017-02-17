From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Feb 2017 19:34:37 +0100
Subject: [Buildroot] [PATCH] boards/nanopi-neo: update defconfig
Message-ID: <1487356477-3173-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update to released kernel and U-Boot,
- move the headers config closer to the kernel ones,
- update readme.txt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 board/nanopi-neo/readme.txt  |  7 +++----
 configs/nanopi_neo_defconfig | 11 +++++------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/board/nanopi-neo/readme.txt b/board/nanopi-neo/readme.txt
index 95fc628..539df54 100644
--- a/board/nanopi-neo/readme.txt
+++ b/board/nanopi-neo/readme.txt
@@ -2,7 +2,7 @@ Intro
 =====
 
 The instructions herein are valid for the FriendlyARM NanoPi NEO,
-both the 256MiB and 512MiB versions. They should also work the the
+both the 256MiB and 512MiB versions. They should also work for the
 NanoPi NEO Air, but this is untested so far.
 
 The FriendlyARM Nanopi NEO is a 4x4cm? board with an Allwiner H3 SoC:
@@ -14,9 +14,8 @@ The FriendlyARM Nanopi NEO is a 4x4cm? board with an Allwiner H3 SoC:
   - 10/100 ethernet MAC
   - GPIOs, SPI, I2c...
 
-Support for the Nanopi NEO in U-Boot and Linux is very recent, so
-much so that we have to use an -rc tag for U-Boot and a special
-Linux tree.
+Support for the Nanopi NEO in U-Boot and Linux is very recent, so only
+core, basic features are available.
 
 Unfortunately, support for the ethernet MAC and the USB OTG are not
 yet upstream, but are being actively worked on.
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index ba4534a..958c976 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -2,19 +2,18 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 
-# Cannot use same headers as the kernel, because kernel is 4.9
-# and we only know 4.8 at best so far
-BR2_KERNEL_HEADERS_4_8=y
-
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi-neo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi-neo/post-image.sh"
 
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
 # Use a -rc kernel to get the DTS
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9-rc3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.10"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
@@ -23,7 +22,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11-rc3"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.7.4
