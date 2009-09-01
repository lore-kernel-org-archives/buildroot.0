From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 15:23:06 +0200
Subject: [Buildroot] [git commit master] u-boot: add 2009.08
Message-ID: <20090901132354.C636E77704@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7cbed5d3352d0b424661ab745464352cf310cbd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index a62e851..b3646c2 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -13,16 +13,20 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2009_06
+	default BR2_TARGET_UBOOT_2009_08
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2009_08
+	bool "u-boot-2009.08"
+
 config BR2_TARGET_UBOOT_2009_06
 	bool "u-boot-2009.06"
+	depends on BR2_DEPRECATED || BR2_RECENT
 
 config BR2_TARGET_UBOOT_2009_03
 	bool "u-boot-2009.03"
-	depends on BR2_DEPRECATED || BR2_RECENT
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2009_01
 	bool "u-boot-2009.01"
@@ -44,6 +48,7 @@ endchoice
 
 config BR2_UBOOT_VERSION
 	string
+	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
 	default "2009.06"	if BR2_TARGET_UBOOT_2009_06
 	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
-- 
1.6.3.3
