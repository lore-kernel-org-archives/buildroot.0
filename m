From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 17:07:06 -0300
Subject: [Buildroot] [PATCH 3/3] configs/raspberrypi: add CM dtb
In-Reply-To: <1452197226-15625-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452197226-15625-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1452197226-15625-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/raspberrypi/genimage-raspberrypi.cfg | 1 +
 configs/raspberrypi_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
index 45be4d0..74758f5 100644
--- a/board/raspberrypi/genimage-raspberrypi.cfg
+++ b/board/raspberrypi/genimage-raspberrypi.cfg
@@ -3,6 +3,7 @@ image boot.vfat {
     files = {
       "bcm2708-rpi-b.dtb",
       "bcm2708-rpi-b-plus.dtb",
+      "bcm2708-rpi-cm.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 98e6ae3..093f05a 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_ZIMAGE=y
 
 # Build the DTBs for A/B and A+/B+ from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-cm"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
-- 
2.4.10
