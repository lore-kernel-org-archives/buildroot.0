From: Michael Durrant <mdurrant@ArcturusNetworks.com>
Date: Mon, 10 Aug 2020 10:58:17 -0400
Subject: [Buildroot] configs/arcturus_ucls1012a: bump kernel to 4.14.140 and
 u-boot version to 2019.10
In-Reply-To: <20200808185725.40db193f@windsurf.home>
References: <20200808185725.40db193f@windsurf.home>
Message-ID: <34880163-6f5d-1417-cb2f-8633cbef3489@ArcturusNetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: 
  
  https://gitlab.com/buildroot.org/buildroot/-/jobs/674933582

Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
---
 board/arcturus/aarch64-ucls1012a/post-build.sh | 5 +++++
 configs/arcturus_ucls1012a_defconfig           | 9 +++++----
 2 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100755 board/arcturus/aarch64-ucls1012a/post-build.sh

diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
new file mode 100755
index 0000000000..f8ba78095f
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+mkdir -p ${TARGET_DIR}/lib/firmware
+cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
+cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a.its ${BINARIES_DIR}/
diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
index fceaed0db7..fd33ebf1f6 100644
--- a/configs/arcturus_ucls1012a_defconfig
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -1,20 +1,21 @@
 # Architecture
 BR2_aarch64=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # System settings
 BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
 BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/aarch64-ucls1012a/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v0.2.1935)/linux-v0.2.1935.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-kernel,v.20.31)/linux-v.20.31.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
@@ -27,7 +28,7 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v0.2.1935)/uboot-v0.2.1935.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCLS1012A-uboot,v.20.31)/uboot-v.20.31.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
 
 # Tools
