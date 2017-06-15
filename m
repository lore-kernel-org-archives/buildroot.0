From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 10:37:42 +0200
Subject: [Buildroot] [git commit] configs/pc_x86_64_{bios,
	efi}_defconfig: unbreak after qemu bump to linux-4.11
Message-ID: <20170615093124.8A6B18050C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08325e5c2bbc10e00771d92530b00698995f0695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pc_x86_64 defconfigs reuse the linux configuration from qemu_x86_64, but
they weren't adjusted when this was updated to use linux-4.11 in 28d97609b25
(configs/qemu: bump to the latest kernel version), breaking the build.

Fix it by also moving them to linux-4.11.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pc_x86_64_bios_defconfig | 8 ++++----
 configs/pc_x86_64_efi_defconfig  | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 65b0016..b8515d1 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -21,15 +21,15 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 57b3ec2..212d72f 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -24,15 +24,15 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.5.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
