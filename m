From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 11 Oct 2019 17:57:09 +0200
Subject: [Buildroot] [PATCH] configs/licheepi_zero: fix default dtb
Message-ID: <1570809429-2140-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Plain licheepi zero needs the sun8i-v3s-licheepi-zero dtb to run instead
of the dock variant. There some differences in dtbs that make the RGB led
not working when a dock dtb is used on a non dock board.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 board/licheepi/boot.cmd         | 2 +-
 configs/licheepi_zero_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/licheepi/boot.cmd b/board/licheepi/boot.cmd
index 383b347..fe5aa0a 100644
--- a/board/licheepi/boot.cmd
+++ b/board/licheepi/boot.cmd
@@ -1,4 +1,4 @@
 setenv bootargs console=ttyS0,115200 panic=5 console=tty0 rootwait root=/dev/mmcblk0p2 earlyprintk rw
 load mmc 0:1 0x41000000 zImage
-load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero-dock.dtb
+load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero.dtb
 bootz 0x41000000 - 0x41800000
diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 8bb2129..ccea173 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero"
 
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
-- 
2.7.4
