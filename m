From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Jun 2009 20:59:39 +0200
Subject: [Buildroot] [git commit] u-boot: add 2009.06 release
Message-ID: <20090630194636.E623777626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a928430ff7f8e40f910db6628efd1d923e96a414
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index bd0251b..a4994c4 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -13,16 +13,20 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2009_03
+	default BR2_TARGET_UBOOT_2009_06
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2009_06
+	bool "u-boot-2009.06"
+
 config BR2_TARGET_UBOOT_2009_03
 	bool "u-boot-2009.03"
+	depends on BR2_DEPRECATED || BR2_RECENT
 
 config BR2_TARGET_UBOOT_2009_01
 	bool "u-boot-2009.01"
-	depends on BR2_DEPRECATED || BR2_RECENT
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
@@ -39,6 +43,7 @@ endchoice
 
 config BR2_UBOOT_VERSION
 	string
+	default "2009.06"	if BR2_TARGET_UBOOT_2009_06
 	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
 	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
-- 
1.6.3.3
