From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 16:06:16 +0000
Subject: [Buildroot] [PATCH 8/8] configs/raspberrypi3_defconfig: add
	raspberry pi 3 compute module support
In-Reply-To: <1488729976-7116-1-git-send-email-martin@barkynet.com>
References: <1488729976-7116-1-git-send-email-martin@barkynet.com>
Message-ID: <1488729976-7116-8-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 board/raspberrypi/genimage-raspberrypi3.cfg | 1 +
 configs/raspberrypi3_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
index 3c9f1e5..98ff709 100644
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -2,6 +2,7 @@ image boot.vfat {
   vfat {
     files = {
       "bcm2710-rpi-3-b.dtb",
+      "bcm2710-rpi-cm3.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 0d8c079..de0c42d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
-- 
2.7.4
