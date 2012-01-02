From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 15:56:37 +0100
Subject: [Buildroot] [git commit] u-boot: add version 2011.12
Message-ID: <20120102160217.474E38FFC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f63d39eeb12d1d833e71ff690a638a396ed2bba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f154bd1..281a909 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_09
+	default BR2_TARGET_UBOOT_2011_12
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_12
+	bool "2011.12"
+
 config BR2_TARGET_UBOOT_2011_09
 	bool "2011.09"
 
@@ -51,6 +54,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
