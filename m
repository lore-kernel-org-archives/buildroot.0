From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:42:59 +0100
Subject: [Buildroot] [git commit] configs/cubieboard2: U-Boot needs pylibfdt
Message-ID: <20181123094044.32679866EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70d1aafd8b047b8dacafd09cb71b32b1a639e226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
