From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 21:26:45 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi: add dtb for compute
	module
Message-ID: <20160201224712.3322E7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dbc3c30a26aab71ddc10867c81b25efd2dd1e23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: describe what 'CM' stands for, update comment]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi.cfg | 1 +
 configs/raspberrypi_defconfig              | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

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
index 98e6ae3..a6db191 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -19,9 +19,9 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
-# Build the DTBs for A/B and A+/B+ from the kernel sources
+# Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-cm"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
