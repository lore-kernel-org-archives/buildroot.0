From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 May 2020 16:02:21 +0200
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi{3,
 4}_64: enabling BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT no longer
 needed
In-Reply-To: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com>
References: <20200516140221.1464063-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200516140221.1464063-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is now forcefully selected by
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS when the kernel is in
charge of building DTBs (BR2_LINUX_KERNEL_DTS_SUPPORT=y). So enabling
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is no longer needed in the 64-bit
defconfigs for Raspberry Pi 3 and 4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi3_64_defconfig | 1 -
 configs/raspberrypi4_64_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 10e6079d54..27bd5aa0bb 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2837-rpi-3-b"
-BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index fd6f8e4dce..283ef4ba36 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
-BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.26.2
