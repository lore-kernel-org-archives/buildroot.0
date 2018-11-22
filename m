From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Nov 2018 10:41:45 +0100
Subject: [Buildroot] [PATCH 2/6] configs/cubieboard2: U-Boot needs pylibfdt
In-Reply-To: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181122094150.10403-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building U-Boot for this platform:

unable to execute 'swig': No such file or directory
error: command 'swig' failed with exit status 1
scripts/dtc/pylibfdt/Makefile:27: recipe for target 'scripts/dtc/pylibfdt/_libfdt.so' failed

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771048

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/cubieboard2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index fa86be3622..fd50742d09 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-- 
2.19.1
