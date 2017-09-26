From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:32:35 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: Bump kernel to
	4.13.3
Message-ID: <20170926222615.CEC367FBC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2945559a84cfdfcd34953376c3ae0d568d2c373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel version to 4.13.3.

Kernel 4.13.3 uses the /dev/dri/card0 device as rendering node, so
adjust it accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/freescale/imx6-sabresd/readme.txt                       | 2 +-
 board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json | 2 +-
 configs/imx6-sabresd_qt5_defconfig                            | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/freescale/imx6-sabresd/readme.txt b/board/freescale/imx6-sabresd/readme.txt
index f13d430..a4ecfae 100644
--- a/board/freescale/imx6-sabresd/readme.txt
+++ b/board/freescale/imx6-sabresd/readme.txt
@@ -75,7 +75,7 @@ Then flash the SD card as explained above.
 
 Running kmscube application:
 
-# kmscube -D /dev/dri/card1
+# kmscube
 
 Running Qt5 Cinematic Demo:
 
diff --git a/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
index 9469dc1..d5d063a 100644
--- a/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
+++ b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
@@ -1,5 +1,5 @@
 {
-  "device": "/dev/dri/card1",
+  "device": "/dev/dri/card0",
   "hwcursor": false,
   "pbuffers": true,
   "outputs": [
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 2ade242..832e326 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 
 # Additional features needed for packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
@@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
