From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 16:06:15 +0000
Subject: [Buildroot] [PATCH 7/8] configs/raspberrypi0_defconfig: add
	raspberry pi zero w support
In-Reply-To: <1488729976-7116-1-git-send-email-martin@barkynet.com>
References: <1488729976-7116-1-git-send-email-martin@barkynet.com>
Message-ID: <1488729976-7116-7-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
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
-- 
2.7.4
