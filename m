From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 17:00:34 +0100
Subject: [Buildroot] [git commit] u-boot: remove 2010.x versions,
	deprecate 2011.03 / 2011.06
Message-ID: <20120102160217.580058FFBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c5f68a4d31c1c437fbc920c2ecdad03301fb5da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 281a909..c8db9fb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -24,18 +24,11 @@ config BR2_TARGET_UBOOT_2011_09
 
 config BR2_TARGET_UBOOT_2011_06
 	bool "2011.06"
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2011_03
 	bool "2011.03"
-
-config BR2_TARGET_UBOOT_2010_12
-	bool "2010.12"
-
-config BR2_TARGET_UBOOT_2010_09
-	bool "2010.09"
-
-config BR2_TARGET_UBOOT_2010_06
-	bool "2010.06"
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
@@ -58,9 +51,6 @@ config BR2_TARGET_UBOOT_VERSION
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
-	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
-	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
-	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
