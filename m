From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Jul 2012 00:01:14 +0200
Subject: [Buildroot] [git commit] barebox: remove old version and add last 4
	versions.
Message-ID: <20120703220226.962868F633@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1b7bec1760692e7db19062c76dc905e77054479
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   21 ++++++++-------------
 1 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 13009d2..574bfae 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,19 +12,15 @@ choice
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_01
-	depends on BR2_DEPRECATED
-	bool "2012.01"
-
-config BR2_TARGET_BAREBOX_2012_02
-	bool "2012.02"
-
-config BR2_TARGET_BAREBOX_2012_03
-	bool "2012.03"
-
 config BR2_TARGET_BAREBOX_2012_04
 	bool "2012.04"
 
+config BR2_TARGET_BAREBOX_2012_05
+	bool "2012.05"
+
+config BR2_TARGET_BAREBOX_2012_06
+	bool "2012.06"
+
 config BR2_TARGET_BAREBOX_2012_07
 	bool "2012.07"
 
@@ -45,10 +41,9 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
-	default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
-	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_03
 	default "2012.04.0"	if BR2_TARGET_BAREBOX_2012_04
+	default "2012.05.0"	if BR2_TARGET_BAREBOX_2012_05
+	default "2012.06.0"	if BR2_TARGET_BAREBOX_2012_06
 	default "2012.07.0"	if BR2_TARGET_BAREBOX_2012_07
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
