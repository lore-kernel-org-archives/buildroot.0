From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Oct 2012 23:04:06 +0200
Subject: [Buildroot] [git commit] u-boot: add 2012.10, deprecate 2011.09,
	remove 2011.03
Message-ID: <20121015211007.B3BEA99837@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=501ba89958a6202745fbb65f7d2f3ca4e257429a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 87f6561..d8458d9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -14,10 +14,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2012_07
+	default BR2_TARGET_UBOOT_2012_10
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2012_10
+	bool "2012.10"
+
 config BR2_TARGET_UBOOT_2012_07
 	bool "2012.07"
 
@@ -29,15 +32,12 @@ config BR2_TARGET_UBOOT_2011_12
 
 config BR2_TARGET_UBOOT_2011_09
 	bool "2011.09"
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2011_06
 	bool "2011.06"
 	depends on BR2_DEPRECATED
 
-config BR2_TARGET_UBOOT_2011_03
-	bool "2011.03"
-	depends on BR2_DEPRECATED
-
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -55,12 +55,12 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2012.10"	if BR2_TARGET_UBOOT_2012_10
 	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
 	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
-	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
