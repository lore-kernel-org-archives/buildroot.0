From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Thu, 31 Mar 2016 10:51:32 +0000
Subject: [Buildroot] [PATCH 1/1] Raspberry PI 3 kernel,
	firmware and dtb update
Message-ID: <1459421492-18815-1-git-send-email-ubaldo@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
---
 board/raspberrypi/genimage-raspberrypi2.cfg | 1 +
 configs/raspberrypi2_defconfig              | 4 ++--
 package/rpi-firmware/rpi-firmware.mk        | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
index 443c821..453fb00 100644
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ b/board/raspberrypi/genimage-raspberrypi2.cfg
@@ -2,6 +2,7 @@ image boot.vfat {
   vfat {
     files = {
       "bcm2709-rpi-2-b.dtb",
+      "bcm2710-rpi-3-b.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index ce41ee3..b77db14 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -13,13 +13,13 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="20fe468af4bb40fec0f81753da4b20a8bfc259c9"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b bcm2710-rpi-3-b"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 291da3a..8476678 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 8b4e5482b52e6fb438dddc0d88ba0ba8d44af54b
+RPI_FIRMWARE_VERSION = 951799bbcd795ddf27769d14acf4813fdcbe53dc
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.9.1
