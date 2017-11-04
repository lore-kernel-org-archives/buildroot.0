From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  4 Nov 2017 22:40:46 +0300
Subject: [Buildroot] [PATCH 2/5] orange-pi-zero: add xr819 firmware
In-Reply-To: <20171104194049.24550-1-geomatsi@gmail.com>
References: <20171104194049.24550-1-geomatsi@gmail.com>
Message-ID: <20171104194049.24550-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make WiFi work out of the box on orange-pi-zero:
- add firmware to image
- add mdev for module autoloading

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                      | 2 ++
 configs/orangepi_zero_defconfig | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab2d0a36b9..a2e0fa0107 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1433,6 +1433,8 @@ F:	package/mpir/
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	package/xr819-xradio/
 F:	package/xr819-firmware/
+F:	board/orangepi/orangepi-zero
+F:	configs/orangepi_zero_defconfig
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index c96d9720ee..03e1d9c34e 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
@@ -30,8 +31,9 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
-# wireless driver
+# wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
+BR2_PACKAGE_XR819_FIRMWARE=y
 
 # wireless support
 BR2_PACKAGE_IW=y
-- 
2.11.0
