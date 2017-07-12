From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Jul 2017 17:03:15 +0200
Subject: [Buildroot] [git commit] olimex_a20_olinuxino_micro: bump to U-Boot
	2017.5 and fix build
Message-ID: <20170712150159.43DC4800DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19ffb84e03b228fe3334ebed7bb6ff257a01abac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig does not build anymore since commit
6cda724efb20682bb98e6d738e5f7c909415ae07 ("package/gcc: switch to gcc
6.x as the default"). Fix by upgrading to the latest U-Boot version.

Fixes:
  In file included from include/linux/compiler.h:54:0,
                   from include/linux/bitops.h:5,
                   from ./include/common.h:20:
  include/linux/compiler-gcc.h:114:30: fatal error: linux/compiler-gcc6.h: No such file or directory
   #include gcc_header(__GNUC__)
                                ^
  compilation terminated.

[Build- and run-tested]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_a20_olinuxino_micro_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 6690df6..0b788f3 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -31,9 +31,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloaders
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino_MICRO"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
