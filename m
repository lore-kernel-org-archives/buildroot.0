From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:05:57 +0200
Subject: [Buildroot] [PATCH 01/11] Update genimage configuration file for
	Arietta-G25 in order to build a bootable SD card image named
	"sdcard.img"
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-3-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/arietta-g25/genimage.cfg | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 1080b0e..83ca110 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -2,16 +2,10 @@
 #
 image boot.vfat {
 	vfat {
-		file zImage {
-			image = "zImage"
-		}
-
-		file acme-arietta.dtb {
-			image = "at91-ariag25.dtb"
-		}
-
-		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
+		files = {
+			"zImage",
+			"acme-arietta.dtb",
+			"boot.bin"
 		}
 	}
 	size = 16M
-- 
2.7.4
