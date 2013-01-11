From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 11 Jan 2013 10:55:25 +0100
Subject: [Buildroot] [PATCH] configs: add RaspberryPi defconfig
Message-ID: <1357898125-29197-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a default configuration for the RaspberryPi, tested and functionnal.

The kernel used is the one developped by the RaspberryPi foundation as it's not
supported currently in mainline kernel.
The configuration used for the kernel is the default bcmrpi.

Note that the kernel generated is a zImage but it must be renamed to kernel.img
to work.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 configs/rpi_defconfig |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 configs/rpi_defconfig

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
new file mode 100644
index 0000000..8c73d0e
--- /dev/null
+++ b/configs/rpi_defconfig
@@ -0,0 +1,19 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_LIBCOFI=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="31a951046155b27361127d9cf85a1f58719fe9b3"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.10.4
