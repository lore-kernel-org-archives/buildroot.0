From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:02:34 +0200
Subject: [Buildroot] [git commit] zynq_zc706: bump to U-Boot xilinx-v2017.1
	(fix build)
Message-ID: <20170615200208.93B2A81E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e3f56f08974b044b217dbe19f962fc5e483e832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Zynq ZC706 defconfig does not build anymore since commit
6cda724efb20682bb98e6d738e5f7c909415ae07 ("package/gcc: switch to gcc
6.x as the default"). Fix by upgrading to the latest U-Boot version,
xilinx-v2017.1, based on mainline v2017.01.

Fixes:
  In file included from include/linux/compiler.h:54:0,
                   from include/linux/bitops.h:5,
                   from ./include/common.h:20:
  include/linux/compiler-gcc.h:114:30: fatal error: linux/compiler-gcc6.h: No such file or directory
   #include gcc_header(__GNUC__)
                                ^
  compilation terminated.

[Build-tested only]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 1317655..86dea63 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
