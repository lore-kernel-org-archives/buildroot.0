From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Sun, 21 Aug 2016 17:00:06 +0200
Subject: [Buildroot] [PATCH 1/1] how to install output/img on the beaglebone
Message-ID: <1471791606-13449-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

readme.txt could use a little more information on what to install
and how to install it. I simply copied the content of
board/acmesystems/arietta-g25/readme.txt.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 board/beaglebone/readme.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index 43ebe53..664bde2 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -32,3 +32,13 @@ After building, you should get a tree like this:
   ??? u-boot.img
   ??? uEnv.txt
   ??? zImage
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-- 
2.1.4
