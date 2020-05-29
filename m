From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 22:59:18 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] configs/raspberrypi{3,
 4}_64: enabling BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT no longer
 needed
Message-ID: <20200529204323.C469791EAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f6504fc5912386ecb07a95b2c90f8a88b4a8b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is now forcefully selected by
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS when the kernel is in
charge of building DTBs (BR2_LINUX_KERNEL_DTS_SUPPORT=y). So enabling
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is no longer needed in the 64-bit
defconfigs for Raspberry Pi 3 and 4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 562e602442ebe1db832d1673cda7a1261f24bd9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi3_64_defconfig | 1 -
 configs/raspberrypi4_64_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 148769e9db..1f27957c69 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2837-rpi-3-b"
-BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 056b89cecd..b14c66d227 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -17,7 +17,6 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
-BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
