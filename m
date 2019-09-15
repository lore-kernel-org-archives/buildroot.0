From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:54:14 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi0w: fix dts file name
 after kernel bump
Message-ID: <20190915124945.B8E018E27E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcecfb66d1fb749426306dbea50fdeb37d4706d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #12816

Commit 42d22f3bdba41da ({configs/raspberrypi,package/rpi-firmware}: bump
kernel/firmware to 20190819 version) updated the kernel version but failed
to take into consideration that the rpi0w dts file has been renamed:

https://github.com/raspberrypi/linux/commit/6f91b5dbfdb62a434571a73f2dc15181963e3bea

Fix it by renaming the dts/dtb file referenced from the kernel build and
genimage.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/genimage-raspberrypi0w.cfg | 2 +-
 configs/raspberrypi0w_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
index 3aafd9b6fc..f76256ef8a 100644
--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0w.cfg
@@ -1,7 +1,7 @@
 image boot.vfat {
   vfat {
     files = {
-      "bcm2708-rpi-0-w.dtb",
+      "bcm2708-rpi-zero-w.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 2a567cbb03..57276aa8f7 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
