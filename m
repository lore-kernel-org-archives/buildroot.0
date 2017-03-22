From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 14:13:31 -0400
Subject: [Buildroot] [RFC 3/3] configs: new raspberrypi3 qt5 config
In-Reply-To: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170322181331.23500-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This config sets Qt WebEngine for raspberrypi 3.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 configs/raspberrypi3_qt5_defconfig | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 configs/raspberrypi3_qt5_defconfig

diff --git a/configs/raspberrypi3_qt5_defconfig b/configs/raspberrypi3_qt5_defconfig
new file mode 100644
index 000000000..4baa96e9e
--- /dev/null
+++ b/configs/raspberrypi3_qt5_defconfig
@@ -0,0 +1,49 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_4_9=y
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
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+
+# Build Qt WebEngine module
+BR2_PACKAGE_LIBERATION=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_QT5WEBENGINE=y
+BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_CA_CERTIFICATES=y
+BR2_PACKAGE_NTP=y
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
-- 
2.12.0
