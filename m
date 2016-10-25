From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 25 Oct 2016 14:21:39 -0200
Subject: [Buildroot] [PATCH 1/2] imx28evk: Fix the first partition location
Message-ID: <1477412500-18757-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the SD card is connected to the host PC it can be mount as
/dev/mmcblk0.

In this case the first partition is /dev/mmcblk0p1, not /dev/mmcblk01.

So use the ${PART1} variable to correctly assign this location.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/imx28evk/create-boot-sd.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx28evk/create-boot-sd.sh b/board/freescale/imx28evk/create-boot-sd.sh
index 5e050cb..bce2212 100755
--- a/board/freescale/imx28evk/create-boot-sd.sh
+++ b/board/freescale/imx28evk/create-boot-sd.sh
@@ -71,7 +71,7 @@ sync
 
 # Copy the bootloader at offset 2048
 # (We need to skip the partition table in the .sd, too.)
-dd if=output/images/u-boot.sd of=${DEV}1 bs=1M
+dd if=output/images/u-boot.sd of=${PART1} bs=1M
 
 # Prepare a temp dir for mounting partitions
 TMPDIR=$(mktemp -d)
-- 
2.7.4
