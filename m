From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 09:21:30 +0200
Subject: [Buildroot] [git commit] barebox: add 2012.04, remove 2011.12
Message-ID: <20120419194554.EBC2396B1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40bbf5334aeea60ad06090dc5718657dfc464cf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 4048d97..09a82eb 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,15 +8,12 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2012_03
+	default BR2_TARGET_BAREBOX_2012_04
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2011_12
-	depends on BR2_DEPRECATED
-	bool "2011.12"
-
 config BR2_TARGET_BAREBOX_2012_01
+	depends on BR2_DEPRECATED
 	bool "2012.01"
 
 config BR2_TARGET_BAREBOX_2012_02
@@ -25,6 +22,9 @@ config BR2_TARGET_BAREBOX_2012_02
 config BR2_TARGET_BAREBOX_2012_03
 	bool "2012.03"
 
+config BR2_TARGET_BAREBOX_2012_04
+	bool "2012.04"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -42,10 +42,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
 	default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
 	default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
 	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_03
+	default "2012.04.0"	if BR2_TARGET_BAREBOX_2012_04
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
