From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:55:55 +0200
Subject: [Buildroot] [git commit] board/synopsys/hsdk: remove duplicate
 console
Message-ID: <20180910205521.2436183CAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c6ab08cc9f907dba9bad218dc921d4fd7141812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch removes duplicate messages in Linux log on HSDK board.
For HSDK board we setup bootargs via device tree,
see https://elixir.bootlin.com/linux/latest/source/arch/arc/boot/dts/hsdk.dts#L25
"console=ttyS3" was mistakenly placed in u-boot bootargs which are
appended to Kernel bootargs in case of using buildin .dtb.

Before patch log is like:
------------------------8<-------------------------------------
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz,...
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz,...
mmc0: new SDHC card at address 59b4
mmc0: new SDHC card@address 59b4
blk_queue_max_segment_size: set to minimum 8192
blk_queue_max_segment_size: set to minimum 8192
------------------------>8-------------------------------------

After patch log is like:
------------------------8<-------------------------------------
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz,...
mmc0: new SDHC card at address 59b4
blk_queue_max_segment_size: set to minimum 8192
------------------------8<-------------------------------------

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/synopsys/hsdk/uboot.env.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/synopsys/hsdk/uboot.env.txt b/board/synopsys/hsdk/uboot.env.txt
index 6bcfb56a77..216f0c9043 100644
--- a/board/synopsys/hsdk/uboot.env.txt
+++ b/board/synopsys/hsdk/uboot.env.txt
@@ -1,5 +1,5 @@
 baudrate=115200
-bootargs=console=ttyS3,115200n8 root=/dev/mmcblk0p2 rootwait
+bootargs=root=/dev/mmcblk0p2 rootwait
 bootcmd=fatload mmc 0:1; bootm
 bootdelay=2
 bootfile=uImage
