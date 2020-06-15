From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 15 Jun 2020 10:59:47 +0300
Subject: [Buildroot] [PATCH 1/1] configs/orangepi_zero_defconfig: use python
 3.x
Message-ID: <20200615075947.473808-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Orange Pi Zero defconfig has been updated to use U-Boot 2020.04 by
commit 9e2bfccf4da8 (configs/orangepi_zero: bump kernel and uboot
versions). Since then it requires Python 3.x on the host.

Fixes:
	https://gitlab.com/buildroot.org/buildroot/-/jobs/593313572

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 2ec71dbd71..f674ceaa24 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.27.0
