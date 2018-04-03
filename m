From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 22:49:18 +0200
Subject: [Buildroot] [git commit] Synopsys: Cleanup files related to Synopsys
Message-ID: <20180403205247.606A583C92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=439826eeccb1a148783c8fc38fc91f55e9fae808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing entries in DEVELOPERS file for synopsys boards.
Add missing readme.txt for recently introduced synopsys/hsdk board.
Reduce size of FAT partition for HSDK image.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                       |  4 ++++
 board/synopsys/hsdk/genimage.cfg |  2 +-
 board/synopsys/hsdk/readme.txt   | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 38e727ecc3..4ed7422645 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -163,7 +163,11 @@ F:	package/wf111/
 N:	ARC Maintainers <arc-buildroot@synopsys.com>
 F:	arch/Config.in.arc
 F:	board/synopsys/
+F:	configs/snps_arc700_axs101_defconfig
+F:	configs/snps_archs38_axs103_defconfig
+F:	configs/snps_archs38_haps_defconfig
 F:	configs/snps_archs38_hsdk_defconfig
+F:	configs/snps_archs38_vdk_defconfig
 
 N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 F:	package/axfsutils/
diff --git a/board/synopsys/hsdk/genimage.cfg b/board/synopsys/hsdk/genimage.cfg
index 87282fcb79..9103b20299 100644
--- a/board/synopsys/hsdk/genimage.cfg
+++ b/board/synopsys/hsdk/genimage.cfg
@@ -7,7 +7,7 @@ image boot.vfat {
       image = "uboot-env.bin"
     }
   }
-  size = 100M
+  size = 20M
 }
 
 image sdcard.img {
diff --git a/board/synopsys/hsdk/readme.txt b/board/synopsys/hsdk/readme.txt
new file mode 100644
index 0000000000..f4c6501111
--- /dev/null
+++ b/board/synopsys/hsdk/readme.txt
@@ -0,0 +1,33 @@
+Synopsys, Inc.
+ARC HS Development Kit (HSDK)
+
+https://embarc.org/platforms.html
+
+How to build it
+===============
+
+Select the default configuration for the target:
+$ make snps_archs38_hsdk_defconfig
+
+Optional: modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+Result of the build
+===================
+output/images/
+????????? boot.vfat
+????????? rootfs.ext2
+????????? sdcard.img
+????????? u-boot
+????????? u-boot.bin
+????????? uboot-env.bin
+????????? uImage
+
+To copy the image file to the sdcard use dd:
+$ dd if=output/images/sdcard.img of=/dev/XXX
+
+2018, Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+
