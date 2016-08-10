From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:06:01 +0200
Subject: [Buildroot] [PATCH 05/11] Update and improve default configuration
	files for Arietta G25 (both 128MB and 256MB version)
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-7-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 configs/acmesystems_arietta_g25_128mb_defconfig | 43 +++++++++++++++++--------
 configs/acmesystems_arietta_g25_256mb_defconfig | 43 +++++++++++++++++--------
 2 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index e5ddf13..a197563 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -1,30 +1,45 @@
 # Architecture
 BR2_arm=y
 
+# Kernel header
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="arietta"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot !"
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_OVERLAY="board/acmesystems/arietta-g25/rootfs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/acmesystems/arietta-g25/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.16"
+BR2_LINUX_KERNEL_PATCH="board/acmesystems/arietta-g25/patches/linux/linux-4.4.16-arietta.patch"
+BR2_LINUX_KERNEL_DEFCONFIG="acme-arietta"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="acme-arietta"
+
+# Root filesystem configuration
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
-# Bootloader
+# AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="acmesystems-v1.0"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
 
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index cf6f67b..df350d1 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -1,30 +1,45 @@
 # Architecture
 BR2_arm=y
 
+# Kernel header
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="arietta"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot !"
+BR2_TARGET_GENERIC_ROOT_PASSWD="acmesystems"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_OVERLAY="board/acmesystems/arietta-g25/rootfs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/acmesystems/arietta-g25/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.16"
+BR2_LINUX_KERNEL_PATCH="board/acmesystems/arietta-g25/patches/linux/linux-4.4.16-arietta.patch"
+BR2_LINUX_KERNEL_DEFCONFIG="acme-arietta"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="acme-arietta"
+
+# Root filesystem configuration
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
-# Bootloader
+# AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="acmesystems-v1.0"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
 
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/arietta-g25/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_GENIMAGE=y
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
