From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:40 -0000
Subject: [Buildroot] [git commit] orange-pi-zero: add xr819 firmware
Message-ID: <20171201205313.997977FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce957ccd36e9bef8137c24fa8d62bdc123d78545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make WiFi work out of the box on orange-pi-zero:
- add xr819 firmware to image
- add mdev for module autoloading

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                      | 2 ++
 configs/orangepi_zero_defconfig | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d27d55f..45e2282 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1433,6 +1433,8 @@ F:	package/mpir/
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	package/xr819-xradio/
 F:	package/armbian-firmware/
+F:	board/orangepi/orangepi-zero
+F:	configs/orangepi_zero_defconfig
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index bd3862c..142b648 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
@@ -30,8 +31,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
-# wireless driver
+# wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
+BR2_PACKAGE_ARMBIAN_FIRMWARE=y
+BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
 
 # wireless support
 BR2_PACKAGE_IW=y
