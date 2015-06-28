From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:16 +0200
Subject: [Buildroot] [PATCH 07/11] configs/raspberrypi_plus: new defconfig
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <a6dd7680c12291b10caa513ea6934ae64fad72e6.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Same defconfig as the one just submitted, but with the DTB for the Plus
variants A+ and B+.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 configs/raspberrypi_plus_dt_defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 configs/raspberrypi_plus_dt_defconfig

diff --git a/configs/raspberrypi_plus_dt_defconfig b/configs/raspberrypi_plus_dt_defconfig
new file mode 100644
index 0000000..2587f58
--- /dev/null
+++ b/configs/raspberrypi_plus_dt_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+# Lock to 4.0 headers as the RPi kernel stable tree is
+# based off the 4.0 branch
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.0.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9ef19eae373337b18759152fd9ca94788c8fe11c"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
-- 
1.9.1
