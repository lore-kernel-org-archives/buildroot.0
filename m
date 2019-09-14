From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Sep 2019 14:05:29 +0200
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi0: use dedicated rpi0
 dts file
In-Reply-To: <20190914120530.16829-1-peter@korsgaard.com>
References: <20190914120530.16829-1-peter@korsgaard.com>
Message-ID: <20190914120530.16829-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to the 20190819 snapshot there is now a dedicated dts file
for the rpi0, so use that rather than the rpi-b-plus one:

https://github.com/raspberrypi/linux/commit/bd1336d8b6544ce5c7ddb197c3d8c539082dac66

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi0.cfg | 2 +-
 configs/raspberrypi0_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
index a9d4c4501f..f21a52f31e 100644
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0.cfg
@@ -1,7 +1,7 @@
 image boot.vfat {
   vfat {
     files = {
-      "bcm2708-rpi-b-plus.dtb",
+      "bcm2708-rpi-zero.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 6c0dd20f6e..7255f8d067 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 # Build the DTBs for A/B from the kernel sources: the zero is the same
 # as the A+ model, just in a different form-factor
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.20.1
