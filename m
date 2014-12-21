From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:22:14 +0100
Subject: [Buildroot] [git commit] boot/uboot/Config.in: Fix
	BR2_TARGET_UBOOT_SPL
Message-ID: <20141221222307.100F580587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=591286389076c0675f252a8da484beea6615bcaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building an SPL image depends on the board configuration. This option
does not enable the SPL build, but only copies the built SPL image to
the binary images folder. The current help text is misleading.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 46d1109..397d2ca 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -214,13 +214,15 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 endif # BR2_TARGET_UBOOT_NETWORK
 
 config BR2_TARGET_UBOOT_SPL
-	bool "U-Boot SPL support"
+	bool "Install U-Boot SPL binary image"
 	depends on !BR2_TARGET_XLOADER
 	help
-	  Enable the U-Boot SPL support. SPL is a first stage
-	  bootloader loaded into internal memory in charge of
-	  enabling and configuring the external memory (DDR),
-	  and load the u-boot program into DDR.
+	  Install the U-Boot SPL binary image to the images
+	  directory.
+	  SPL is a first stage bootloader loaded into internal
+	  memory in charge of enabling and configuring the
+	  external memory (DDR), and load the u-boot program
+	  into DDR.
 
 config BR2_TARGET_UBOOT_SPL_NAME
 	string "U-Boot SPL target name"
