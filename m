From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Dec 2011 16:50:03 +0100
Subject: [Buildroot] [git commit] u-boot: add version 2011.09
Message-ID: <20111201155255.2B1F08F733@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0239612fb2af681984af222c9a84bf06ce9b77ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 506f354..dd49a2c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_06
+	default BR2_TARGET_UBOOT_2011_09
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_09
+	bool "2011.09"
+
 config BR2_TARGET_UBOOT_2011_06
 	bool "2011.06"
 
@@ -48,6 +51,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
