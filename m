From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:49:18 +0200
Subject: [Buildroot] [git commit] board/raspberrypi: add support for rpi3 b+
Message-ID: <20180406201113.D36C3875BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=012c400f9d5eef2fb04dcde931d08852cc19ffdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/genimage-raspberrypi3.cfg | 1 +
 board/raspberrypi/readme.txt                | 3 ++-
 configs/raspberrypi3_defconfig              | 2 +-
 configs/raspberrypi3_qt5we_defconfig        | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
index 98ff709035..0a547241f4 100644
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3.cfg
@@ -2,6 +2,7 @@ image boot.vfat {
   vfat {
     files = {
       "bcm2710-rpi-3-b.dtb",
+      "bcm2710-rpi-3-b-plus.dtb",
       "bcm2710-rpi-cm3.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 948269347b..9f91581054 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -30,7 +30,7 @@ For model 2 B:
 
   $ make raspberrypi2_defconfig
 
-For model 3 B:
+For model 3 B and B+:
 
   $ make raspberrypi3_defconfig
 
@@ -56,6 +56,7 @@ After building, you should obtain this tree:
     +-- bcm2708-rpi-b-plus.dtb      [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
+    +-- bcm2710-rpi-3-b-plus.dtb    [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 88e78a98b5..45a76beb6a 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -16,7 +16,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index bbf5f210d7..ee76f2b682 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
 
 # Build Qt5 WebEngine
 BR2_PACKAGE_LIBERATION=y
