From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 16:23:58 +0100
Subject: [Buildroot] [git commit branch/next]
	configs/olimex_imx233_olinuxino: readme: Improve SD card
	flashing procedure
Message-ID: <20161111153439.549F7819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5ad41a723f1e7d61cce61ac8e8a19314baf1883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Make the SD card flashing procedure text consistent with the other i.MX
boards.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/olimex/imx233_olinuxino/readme.txt | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
index d6a7377..2722c3a 100644
--- a/board/olimex/imx233_olinuxino/readme.txt
+++ b/board/olimex/imx233_olinuxino/readme.txt
@@ -17,13 +17,16 @@ output/images
 
 === Use of generated SD card image ===========================================
 
-Just write sdcard.img directly to the SD card
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
 
-***** WARNING: Double check that /dev/sdc is your MicroSD card *****
-*****      It might be /dev/sdb or some other device name      *****
-***** Failure to do so may result in you wiping your hard disk *****
+  cat /proc/partitions
+
+Then, run the following command as root:
+
+*** WARNING! The command will destroy all the card content. Use with care! ***
 
-   # dd if=output/images/sdcard.img of=/dev/sdc bs=512
+ sudo dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 === Manual creation of SD card image =========================================
 
