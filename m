From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:40:43 +0200
Subject: [Buildroot] [git commit] configs: rename Zynq defconfig files
Message-ID: <20160331164048.E522680462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c13f89668623adadeb9ca67b952d8f91352be4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These three are Zynq boards and the build procedure is almost the
same.  Having the SoC name prefix "zynq_" would be more consistent.
Also, this is the way in which the Linux Device Trees and the U-Boot
configuration files do.

This commit renames as follows:

   zedboard_defconfig     -> zynq_zed_defconfig
   microzed_defconfig     -> zynq_microzed_defconfig
   xilinx_zc706_defconfig -> zynq_zc706_defconfig

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/avnet/microzed/readme.txt                          | 2 +-
 board/avnet/zedboard/readme.txt                          | 2 +-
 board/xilinx/zc706/readme.txt                            | 2 +-
 configs/{microzed_defconfig => zynq_microzed_defconfig}  | 0
 configs/{xilinx_zc706_defconfig => zynq_zc706_defconfig} | 0
 configs/{zedboard_defconfig => zynq_zed_defconfig}       | 0
 6 files changed, 3 insertions(+), 3 deletions(-)

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
