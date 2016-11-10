From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 10 Nov 2016 13:39:47 -0200
Subject: [Buildroot] [PATCH 3/4] imx233_olinuxino: readme: Improve SD card
	flashing procedure
In-Reply-To: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
References: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1478792388-13279-3-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the SD card flashing procedure text consistent with the other i.MX
boards.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
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
 
-- 
2.7.4
