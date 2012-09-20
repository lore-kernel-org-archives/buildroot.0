From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 22:26:46 +0200
Subject: [Buildroot] [git commit] u-boot: add version 2012.07
Message-ID: <20120920205954.6EC1299670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47a7a2771a728a1e89b8ea70d610c3670e783bf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in                               |    6 +++++-
 ...ot-tools-2012.07-drop-configh-from-tools.patch} |    0
 ...ot-tools-2012.07-hostcflags-override-fix.patch} |    0
 package/uboot-tools/uboot-tools.mk                 |    2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 900fac7..7f3cae0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2012_04
+	default BR2_TARGET_UBOOT_2012_07
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2012_07
+	bool "2012.07"
+
 config BR2_TARGET_UBOOT_2012_04
 	bool "2012.04.01"
 
@@ -50,6 +53,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
 	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
diff --git a/package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch
rename to package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
diff --git a/package/uboot-tools/uboot-tools-2012.04.01-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-2012.04.01-hostcflags-override-fix.patch
rename to package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 53764f7..7628b77 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -1,4 +1,4 @@
-UBOOT_TOOLS_VERSION = 2012.04.01
+UBOOT_TOOLS_VERSION = 2012.07
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 
