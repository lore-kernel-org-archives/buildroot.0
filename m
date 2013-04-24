From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 09:14:53 +0200
Subject: [Buildroot] [git commit] u-boot: add 2013.04,
	deprecate 2011.12 / 2012.04, drop 2011.06 / 2011.09
Message-ID: <20130424071928.9FBBF9B7F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3510d8b4af396106e315e21440bc63c2cdf534b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d377fd1..2e95f76 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -14,10 +14,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2013_01
+	default BR2_TARGET_UBOOT_2013_04
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2013_04
+	bool "2013.04"
+
 config BR2_TARGET_UBOOT_2013_01
 	bool "2013.01.01"
 
@@ -29,16 +32,10 @@ config BR2_TARGET_UBOOT_2012_07
 
 config BR2_TARGET_UBOOT_2012_04
 	bool "2012.04.01"
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2011_12
 	bool "2011.12"
-
-config BR2_TARGET_UBOOT_2011_09
-	bool "2011.09"
-	depends on BR2_DEPRECATED
-
-config BR2_TARGET_UBOOT_2011_06
-	bool "2011.06"
 	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -58,13 +55,12 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2013.04"	if BR2_TARGET_UBOOT_2013_04
 	default "2013.01.01"	if BR2_TARGET_UBOOT_2013_01
 	default "2012.10"	if BR2_TARGET_UBOOT_2012_10
 	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
 	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
-	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
-	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
