From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Feb 2015 23:18:54 +0100
Subject: [Buildroot] [PATCHv2] configs/raspberrypi_dt: update and fix our
	defconfig
Message-ID: <1425075534-31364-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lock to 3.18 headers; add comment about installing DTBs;
bump kernel sha1.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - rebase on top of master, not next  (Peter)
---
 configs/raspberrypi_dt_defconfig | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index d841a2b..ca62084 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -1,12 +1,22 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
+
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+# Lock to 3.18 headers as the RPi kernel with
+# DT support is based off the 3.18 branch
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03d0d9c73c17f74a7afa64ed9f022565e89b8dd5"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="246530ff8a4f302b8666c6d9cf509407d8c1257a"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
+
+# Install the DTB files
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
-- 
1.9.1
