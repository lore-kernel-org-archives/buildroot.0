From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:05 +0100
Subject: [Buildroot] [PATCH 08/14] boot/uboot/Config.in: Fix
	BR2_TARGET_UBOOT_SPL
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-9-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building an SPL image depends on the board configuration. This option
does not enable the SPL build, but only copies the built SPL image to
the binary images folder. The current help text is misleading.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/Config.in | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8a5bebc..801ea2d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -232,13 +232,15 @@ config BR2_TARGET_UBOOT_ETH1ADDR
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
-- 
2.1.3
