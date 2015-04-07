From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:30:05 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi: remove
	BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
Message-ID: <20150407193011.95B49819B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9674d2f4fe99cfdfaee1865a4591fbc8ac4c0c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS became ineffective in commit a5ce7590c4b
(package/rpi-firmware: bump version), and was removed in commit 4e92ffdc47cc
(rpi-firmware: remove no longer used BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS).
Remove it from the Pi configs.

Also, remove the now obsolete comment in these config files.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi2_defconfig   |    2 --
 configs/raspberrypi_dt_defconfig |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 4d4944f..814e182 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -19,6 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="23c76b7f608e51258c6fca02aebeb5d588583149"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
-# Install the DTB files, as the RPi2 uses the Device Tree
 BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index ca62084..c727a7c 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -17,6 +17,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
-# Install the DTB files
 BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
