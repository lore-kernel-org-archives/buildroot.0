From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:47:26 +0200
Subject: [Buildroot] [git commit] board/beaglebone: add details on how to
	use the resulting sdcard.img
Message-ID: <20160822144738.46A918212E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1adaf87c1c4e0531694a3a6f690d0644f729bf8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/readme.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index 43ebe53..664bde2 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -32,3 +32,13 @@ After building, you should get a tree like this:
   ????????? u-boot.img
   ????????? uEnv.txt
   ????????? zImage
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
