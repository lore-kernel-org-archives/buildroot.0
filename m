From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:32:49 +0100
Subject: [Buildroot] [git commit] configs/orangepi-pc-plus: enable WiFi
 support
Message-ID: <20171203222536.E81EB8221F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ddcdbedfb3ab23f57211c56e05b446552936458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make WiFi work out of the box on orangepi-pc-plus:
  - add rtl8xx firmware
  - add rtl8189fs driver
  - add mdev for module autoloading

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/orangepi_pc_plus_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index ec17728..b06b9b1 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
@@ -29,6 +30,11 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
+# wireless driver and firmware
+BR2_PACKAGE_RTL8189FS=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+
 # wireless tools
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
