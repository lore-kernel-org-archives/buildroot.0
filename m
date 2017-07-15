From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 16:12:53 +0200
Subject: [Buildroot] [PATCH 2/2] minnowboard_max: bump to kernel 4.12.2
In-Reply-To: <20170715141253.4306-1-peter@korsgaard.com>
References: <20170715141253.4306-1-peter@korsgaard.com>
Message-ID: <20170715141253.4306-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop the version number from the linux configuration.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/{linux-4.8.config => linux.config} | 0
 configs/minnowboard_max-graphical_defconfig          | 6 +++---
 configs/minnowboard_max_defconfig                    | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename board/minnowboard/{linux-4.8.config => linux.config} (100%)

diff --git a/board/minnowboard/linux-4.8.config b/board/minnowboard/linux.config
similarity index 100%
rename from board/minnowboard/linux-4.8.config
rename to board/minnowboard/linux.config
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 621281b93c..ef0947cb78 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -3,7 +3,7 @@ BR2_x86_64=y
 BR2_x86_atom=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
@@ -21,9 +21,9 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Linux
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index fe43b5287c..674b144de8 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -7,8 +7,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
@@ -20,9 +20,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
-- 
2.11.0
