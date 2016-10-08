From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  8 Oct 2016 10:14:25 +0200
Subject: [Buildroot] [PATCH] minnowboard_max: defconfigs: bump linux kernel
	to 4.8.1
Message-ID: <20161008081425.25606-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/{linux-4.6.config => linux-4.8.config} | 0
 configs/minnowboard_max-graphical_defconfig              | 6 +++---
 configs/minnowboard_max_defconfig                        | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename board/minnowboard/{linux-4.6.config => linux-4.8.config} (100%)

diff --git a/board/minnowboard/linux-4.6.config b/board/minnowboard/linux-4.8.config
similarity index 100%
rename from board/minnowboard/linux-4.6.config
rename to board/minnowboard/linux-4.8.config
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index de803f0..1b95d8e 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -3,7 +3,7 @@ BR2_x86_64=y
 BR2_x86_atom=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
@@ -22,9 +22,9 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Linux
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.8.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 0adb382..63190ea 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -8,8 +8,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
-# Linux headers same as kernel, a 4.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
@@ -21,9 +21,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.8.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
-- 
2.9.3
