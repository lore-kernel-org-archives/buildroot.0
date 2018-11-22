From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 10:41:48 +0100
Subject: [Buildroot] [PATCH 5/6] configs/orangepi_zero_plus2: U-Boot needs
 pylibfdt
In-Reply-To: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181122094150.10403-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building U-Boot for this platform:

unable to execute 'swig': No such file or directory
error: command 'swig' failed with exit status 1
scripts/dtc/pylibfdt/Makefile:26: recipe for target 'scripts/dtc/pylibfdt/_libfdt.so' failed

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771103

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_zero_plus2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 8c83b3acd1..618104ff5e 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-- 
2.19.1
