From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Sep 2020 20:35:18 +0200
Subject: [Buildroot] [PATCH] configs/lafrite_defconfig: bump kernel to 5.8.10
Message-ID: <20200917183519.31494-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brings a number of fixes and audio support.  The aarch64 defconfig has
grown, so bump the ext4 size to make it fit.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/lafrite_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 63370928e5..5496bbc30d 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/librecomputer/lafrite/overlay/"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/librecomputer/lafrite/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s805x-libretech-ac"
@@ -16,5 +16,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.20.1
