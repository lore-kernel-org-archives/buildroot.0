From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  6 Nov 2017 13:16:51 +0300
Subject: [Buildroot] [PATCH v2 2/3] orange-pi-zero: add xr819 firmware
In-Reply-To: <20171106101652.28861-1-geomatsi@gmail.com>
References: <20171106101652.28861-1-geomatsi@gmail.com>
Message-ID: <20171106101652.28861-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make WiFi work out of the box on orange-pi-zero:
- add xr819 firmware to image
- add mdev for module autoloading

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                      | 2 ++
 configs/orangepi_zero_defconfig | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d27d55f73d..45e228286a 100644
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
index bd3862cb14..142b648fa8 100644
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
-- 
2.11.0
