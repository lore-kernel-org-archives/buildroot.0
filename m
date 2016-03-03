From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu,  3 Mar 2016 11:38:52 +0900
Subject: [Buildroot] [PATCH] configs: rename Zynq defconfig files
Message-ID: <1456972732-9033-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These three are Zynq boards and the build procedure is almost the
same.  Having the SoC name prefix "zynq_" would be more consistent.
Also, this is the way in which the Linux Device Trees and the U-Boot
configuration files do.

This commit renames as follows:

   zedboard_defconfig     -> zynq_zed_defconfig
   microzed_defconfig     -> zynq_microzed_defconfig
   xilinx_zc706_defconfig -> zynq_zc706_defconfig

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 board/avnet/microzed/readme.txt                          | 2 +-
 board/avnet/zedboard/readme.txt                          | 2 +-
 board/xilinx/zc706/readme.txt                            | 2 +-
 configs/{microzed_defconfig => zynq_microzed_defconfig}  | 0
 configs/{xilinx_zc706_defconfig => zynq_zc706_defconfig} | 0
 configs/{zedboard_defconfig => zynq_zed_defconfig}       | 0
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename configs/{microzed_defconfig => zynq_microzed_defconfig} (100%)
 rename configs/{xilinx_zc706_defconfig => zynq_zc706_defconfig} (100%)
 rename configs/{zedboard_defconfig => zynq_zed_defconfig} (100%)

diff --git a/board/avnet/microzed/readme.txt b/board/avnet/microzed/readme.txt
index ab47069..d0fc5ee 100644
--- a/board/avnet/microzed/readme.txt
+++ b/board/avnet/microzed/readme.txt
@@ -7,7 +7,7 @@ available from http://www.zedboard.org .
 
 Steps to create a working system for Microzed:
 
-1) make microzed_defconfig
+1) make zynq_microzed_defconfig
 2) make
 3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
 	uImage, zynq-zed.dtb into your SD card
diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index 0f72d0d..01ef97c 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -7,7 +7,7 @@ available from http://www.zedboard.org .
 
 Steps to create a working system for Zedboard:
 
-1) make zedboard_defconfig
+1) make zynq_zed_defconfig
 2) make
 3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
 	uImage, zynq-zed.dtb into your SD card
diff --git a/board/xilinx/zc706/readme.txt b/board/xilinx/zc706/readme.txt
index 273752f..b180dea 100644
--- a/board/xilinx/zc706/readme.txt
+++ b/board/xilinx/zc706/readme.txt
@@ -16,7 +16,7 @@ boot.bin file.
 If you already have the Xilinx tools installed, the following sequence
 will unpack, patch and build the rfs, kernel, uboot, and uboot-spl.
 
-make xilinx_zc706_defconfig
+make zynq_zc706_defconfig
 make uboot-patch
 cp ${XILINX_SDK_LIB}/hwplatform_templates/ZC706_hw_platform/ps7_init.{c,h} \
    output/build/uboot-xilinx-v2014.1/board/xilinx/zynq/
diff --git a/configs/microzed_defconfig b/configs/zynq_microzed_defconfig
similarity index 100%
rename from configs/microzed_defconfig
rename to configs/zynq_microzed_defconfig
diff --git a/configs/xilinx_zc706_defconfig b/configs/zynq_zc706_defconfig
similarity index 100%
rename from configs/xilinx_zc706_defconfig
rename to configs/zynq_zc706_defconfig
diff --git a/configs/zedboard_defconfig b/configs/zynq_zed_defconfig
similarity index 100%
rename from configs/zedboard_defconfig
rename to configs/zynq_zed_defconfig
-- 
1.9.1
