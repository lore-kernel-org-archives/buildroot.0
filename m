From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:50:40 +0200
Subject: [Buildroot] [git commit] configs/olimex_a33_olinuxino: U-Boot needs
 pylibfdt
Message-ID: <20190810124837.78C2D82877@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a96e471a5752c167c6d0f451ff021546fdb17657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot configuration for the olimex_a33_olinuxino needs pylibfdt,
and therefore needs host-swig. Without this, the build fails with:

  unable to execute 'swig': No such file or directory
  error: command 'swig' failed with exit status 1
  scripts/dtc/pylibfdt/Makefile:27: recipe for target 'scripts/dtc/pylibfdt/_libfdt.so' failed

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139202

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a33_olinuxino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index c71bdb1fb4..71b1669b27 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
