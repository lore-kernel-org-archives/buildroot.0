From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:32:08 +0200
Subject: [Buildroot] [git commit branch/next]
 configs/raspberrypi3_64_defconfig: add support for rpi3b+
Message-ID: <20180520103452.7403581239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbb45f6d7f937e503900a04ff920320c411d8f34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The kernel now includes the rpi3b+ device tree for aarch64

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/genimage-raspberrypi3-64.cfg | 1 +
 configs/raspberrypi3_64_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
index c5f86527d0..0d0ca750a7 100644
--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
@@ -2,6 +2,7 @@ image boot.vfat {
   vfat {
     files = {
       "bcm2710-rpi-3-b.dtb",
+      "bcm2710-rpi-3-b-plus.dtb",
       "bcm2837-rpi-3-b.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 1a6e378e2c..3d74815fc2 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -16,7 +16,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2837-rpi-3-b"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
