From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 20 Oct 2015 13:32:22 +0200
Subject: [Buildroot] [PATCH v2 4/7] altera: update text about the mkpimage
In-Reply-To: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445340745-1000-5-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we've integrated the mkpimage, we just leave some notes
about other available tools and give an advice how to enable
this feature in Buildroot.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/altera/readme.txt | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index ddd9e03..fdd7316 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -75,21 +75,23 @@ After building, you should obtain this tree:
     ??? socfpga.dtb
     ??? u-boot.img
     ??? u-boot-spl.bin
+    ??? u-boot-spl.bin.crc
     ??? uImage
 
 
 Signing the Preloader
 ---------------------
 
-*** BEWARE ****
-The u-boot-spl.bin must be signed using the Altera's tool "mkpimage".
-This tool comes as a part of the Altera development environnment (SoC EDS).
-A fork of this tool have been done by Maxime Hadjinlian and can be found here :
-https://github.com/maximeh/mkpimage
+The u-boot-spl.bin needs a checksum computed by the Altera's tool "mkpimage".
+This tool comes as a part of the Altera development environnment (SoC EDS),
+as a standalone tool https://github.com/maximeh/mkpimage and as a part of the
+Barebox project. The boards do not boot without the checksum.
 
-Remember that without signing the u-boot-spl.bin, the board will not boot !!!
+The Buildroot integrates the mkpimage and you can find it in the configuration.
+If you check: "Bootloaders/U-Boot/CRC SPL image for SoC FPGA" the build system
+calls mkpimage on the SPL for you automatically.
 
-  $ mkpimage u-boot-spl.bin -o u-boot-spl-signed.bin
+  $ mkpimage u-boot-spl.bin -o u-boot-spl.bin.crc
 
 Prepare your SDcard
 ===================
-- 
2.6.1
