From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jan 2013 12:44:05 +0100
Subject: [Buildroot] [git commit] u-boot: add 2013.01
Message-ID: <20130118121227.A197C9A313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cd111e0df777fdce6f851872e52acd0de51e75d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d8458d9..f10b6d0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -14,10 +14,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2012_10
+	default BR2_TARGET_UBOOT_2013_01
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2013_01
+	bool "2013.01"
+
 config BR2_TARGET_UBOOT_2012_10
 	bool "2012.10"
 
@@ -55,6 +58,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2013.01"	if BR2_TARGET_UBOOT_2013_01
 	default "2012.10"	if BR2_TARGET_UBOOT_2012_10
 	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
 	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
