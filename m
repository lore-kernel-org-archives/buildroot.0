From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:06:02 +0200
Subject: [Buildroot] [PATCH 06/11] Update README file for Arietta G25 named
	"readme.txt"
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-8-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Improve instructions for configuring and building Buildroot
- Add more documentation about AT91bootstrap and Linux kernel
  for Arietta-G25

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/arietta-g25/readme.txt | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
index 485e275..ab9d88c 100644
--- a/board/acmesystems/arietta-g25/readme.txt
+++ b/board/acmesystems/arietta-g25/readme.txt
@@ -1,11 +1,17 @@
-Acmesystems Arietta G25
+Acme Systems Arietta G25
 
 Intro
 =====
 
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Arietta G25. With the current configuration
-it will bring-up the board, and allow access through the serial console.
+Buildroot configuration for Arietta G25.
+This default configuration, based on AT91bootstrap v3.8.5 and 
+Linux Kernel image v4.4.16, allow you to build a minimal root filesystem
+which includes the support for the serial console.
+The default configuration for Arietta G25 includes the getty program that
+enables you to log in through the serial console ttyS0.
+After the boot, to log in at the getty prompt use the following credentials:
+Username: root
+Password: acmesystems
 
 You can find additional informations, tutorials and a very comprehensive
 documentation on http://www.acmesystems.it/arietta.
@@ -13,8 +19,8 @@ documentation on http://www.acmesystems.it/arietta.
 Build instructions
 ==================
 
-To build an image for the arietta g25 choose the configuration
-corresponding to the arietta variant.
+To build an image for the Arietta G25 choose the configuration
+corresponding to the Arietta variant.
 
 For 128MB RAM variant type:
 
@@ -24,7 +30,11 @@ else for 256MB RAM variant type:
 
 $ make acmesystems_arietta_g25_256mb_defconfig
 
-then:
+To customize the configuration choosed type:
+
+$ make menuconfig
+
+When you are ready to start building Buildroot type:
 
 $ make
 
@@ -34,12 +44,10 @@ How to write the microSD card
 Once the build process is finished you will have an image called "sdcard.img"
 in the output/images/ directory.
 
-Copy the bootable "sdcard.img" onto an SD card with "dd":
+Write the bootable SD card image "sdcard.img" onto an SD card with "dd" command:
 
   $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-Insert the microSD card into the arietta slot and power it.
+Insert the microSD card into the Arietta slot and power it.
 
-The image just built is fairly basic and the only output
-you will get is on serial console, please consider to use a DPI
-cable (http://www.acmesystems.it/DPI)
+To get the kernel log messages you can use a DPI cable (http://www.acmesystems.it/DPI)
-- 
2.7.4
