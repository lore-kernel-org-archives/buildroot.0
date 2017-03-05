From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:25:51 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi0_defconfig: add
	raspberry pi zero w support
Message-ID: <20170305202606.BE38B81945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab07865f7e06b49121308d2dd74096ef047cccf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/genimage-raspberrypi0.cfg | 1 +
 configs/raspberrypi0_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
index a9d4c45..212c306 100644
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0.cfg
@@ -2,6 +2,7 @@ image boot.vfat {
   vfat {
     files = {
       "bcm2708-rpi-b-plus.dtb",
+      "bcm2708-rpi-0-w.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index d93484f..75b189a 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -16,7 +16,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 # Build the DTBs for A/B from the kernel sources: the zero is the same
 # as the A+ model, just in a different form-factor
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus bcm2708-rpi-0-w"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
