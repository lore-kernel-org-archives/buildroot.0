From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 18:02:28 +0000
Subject: [Buildroot] [PATCH v3 3/7] board/raspberrypi: add support for rpi3
 b+
In-Reply-To: <20180316180232.18829-1-martin@barkynet.com>
References: <20180316180232.18829-1-martin@barkynet.com>
Message-ID: <20180316180232.18829-4-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

----
Changes v1 -> v2:
 - none

Changes v2 -> v3:
 - none
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
index a8217cfd12..062dbbd43a 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index b8458c6742..5e91390630 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
 
 # Build Qt5 WebEngine
 BR2_PACKAGE_LIBERATION=y
-- 
2.16.2
