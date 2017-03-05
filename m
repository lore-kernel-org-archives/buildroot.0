From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:25:51 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi3_defconfig: add
	raspberry pi 3 compute module support
Message-ID: <20170305202606.C6E7481945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a726c7dff8557bd3592c6e1eb1d6f3616ba90131
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
