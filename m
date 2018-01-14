From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jan 2018 22:01:14 +0100
Subject: [Buildroot] [PATCH 1/2] minnowboard-max: defconfigs: bump kernel to
 4.14.13
Message-ID: <20180114210115.7284-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use CONFIG_UNWINDER_FRAME_POINTER as CONFIG_UNWINDER_ORC needs libelf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/linux.config              | 1 +
 configs/minnowboard_max-graphical_defconfig | 4 ++--
 configs/minnowboard_max_defconfig           | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/minnowboard/linux.config b/board/minnowboard/linux.config
index fba48a163c..03ffc5e371 100644
--- a/board/minnowboard/linux.config
+++ b/board/minnowboard/linux.config
@@ -56,3 +56,4 @@ CONFIG_MMC_SDHCI_PCI=y
 CONFIG_MMC_SDHCI_ACPI=y
 CONFIG_PWM=y
 CONFIG_EXT4_FS=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 2c11fb378c..22b10dc733 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -3,7 +3,7 @@ BR2_x86_64=y
 BR2_x86_atom=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # needed for TARGET_GRUB2
@@ -23,7 +23,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Linux
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index db6e595779..f7ba26efdd 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -7,8 +7,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 
-# Linux headers same as kernel, a 4.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 # Needed for grub2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
@@ -23,7 +23,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
-- 
2.11.0
