From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 15 Jun 2017 18:18:16 +0200
Subject: [Buildroot] [PATCH 3/4] zynq_microzed: bump to U-Boot
	xilinx-v2017.1 (fix build)
In-Reply-To: <1497543497-17938-1-git-send-email-luca@lucaceresoli.net>
References: <1497543497-17938-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1497543497-17938-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Zynq MicroZed defconfig does not build anymore since commit
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
---
 configs/zynq_microzed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index dd580ab9eb56..f6e1599930f1 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.7.4
