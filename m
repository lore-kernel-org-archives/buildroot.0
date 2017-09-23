From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:07:56 +0200
Subject: [Buildroot] [git commit] configs: new raspberrypi3 qt5we config
Message-ID: <20170923201331.CC98581036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21234ce8666bfcce191de1d00c27bfcf5edaa86a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This config sets Qt5 WebEngine for raspberrypi 3.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/raspberrypi3_qt5we_defconfig | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
new file mode 100644
index 0000000..9df14c5
--- /dev/null
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -0,0 +1,50 @@
+BR2_arm=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9126e25b0934bd7bd843763310ea4b34c6e139d0"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+
+# Build Qt5 WebEngine
+BR2_PACKAGE_LIBERATION=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+BR2_PACKAGE_QT5BASE_PNG=y
+BR2_PACKAGE_QT5WEBENGINE=y
+BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_CA_CERTIFICATES=y
+BR2_PACKAGE_NTP=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="360M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
