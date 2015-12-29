From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:05:15 +0100
Subject: [Buildroot] [git commit] configs: add readme.txt for the orangepipc
	defconfig
Message-ID: <20151229170528.E341F82572@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1354803789cd897839fe36e2a7e6e33a9f1502a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: minor tweaks.]

Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/orangepi/orangepipc/readme.txt | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/board/orangepi/orangepipc/readme.txt b/board/orangepi/orangepipc/readme.txt
new file mode 100644
index 0000000..0792bf4
--- /dev/null
+++ b/board/orangepi/orangepipc/readme.txt
@@ -0,0 +1,33 @@
+OrangePi PC
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi PC. With the current configuration
+it will bring-up the board, and allow access trough the serial console.
+
+Unfortunately this boards processor is not yet supported by the
+mainline kernel, and therefore this default configuration is using a
+private Linux kernel repository based on 4.4-rc.
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
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
