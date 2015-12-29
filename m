From: Eelco Chaudron <echaudron@xiot.nl>
Date: Tue, 29 Dec 2015 12:53:40 +0100
Subject: [Buildroot] [PATCH 1/1] This commit adds the readme.txt to the the
	Orange Pi PC board configuration.
Message-ID: <1451390020-3145-1-git-send-email-echaudron@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>
---
 board/orangepi/orangepipc/readme.txt | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 board/orangepi/orangepipc/readme.txt

diff --git a/board/orangepi/orangepipc/readme.txt b/board/orangepi/orangepipc/readme.txt
new file mode 100644
index 0000000..3953c80
--- /dev/null
+++ b/board/orangepi/orangepipc/readme.txt
@@ -0,0 +1,35 @@
+OrangePi PC
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi PC. With the current configuration
+it will bring-up the board, and allow access trough the serial console.
+
+Unfortunately this boards processor is not yet supported by the mainline 
+kernel, and therefore this default configuration is using a private Linux
+4.4RC kernel repository.
+
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepipc_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-- 
2.5.0
