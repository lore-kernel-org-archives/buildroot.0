From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 13 Nov 2008 20:07:39 +0100
Subject: [Buildroot] [PATCH] package: don't default to y for categories
Message-ID: <200811132007.39723.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When doing 'make oldconfig' after a new category has been added, you
can't simply press <Enter> to go on without branching into that
category. Packages default to n and there is no reason to proceed with
the categories in a different manner.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/Config.in          |    8 --------
 package/audio/Config.in    |    1 -
 package/database/Config.in |    1 -
 package/editors/Config.in  |    1 -
 package/games/Config.in    |    1 -
 package/java/Config.in     |    1 -
 6 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 84aaa3e..a159220 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -28,7 +28,6 @@ endif
 
 #menuconfig BR2_APPLICATION_SUPPORT
 #	bool "Common Applications"
-#	default y
 #	help
 #	  A set of applications, utilities and libraries for
 #	  text processing, toolchain generation and other things.
@@ -132,7 +131,6 @@ endif
 
 menuconfig BR2_NETWORK_SUPPORT
 	bool "Networking"
-	default y
 	help
 	  Support for communication, networking and related packages
 
@@ -233,7 +231,6 @@ endif
 
 menuconfig BR2_BLOCKDEV_SUPPORT
 	bool "Hardware handling / blockdevices and filesystem maintenance"
-	default y
 	help
 	  Support for hardware handling and maintenance, block devices,
 	  filesystem creation and maintenance.
@@ -294,7 +291,6 @@ source "package/audio/Config.in"
 
 menuconfig BR2_GRAPHIC_SUPPORT
 	bool "Graphic libraries and applications (graphic/text)"
-	default y
 	help
 	  Support for graphic libraries, X Window system and related
 	  packages, graphical toolkits, etc.
@@ -417,7 +413,6 @@ endif
 
 menuconfig BR2_COMPRESSOR_SUPPORT
 	bool "Compressors / decompressors"
-	default y
 	help
 	  Support for compressors and decompressors like lzo, lzma, bzip2
 
@@ -432,7 +427,6 @@ endif
 
 menuconfig BR2_PACKAGEMGRS_SUPPORT
 	bool "Package managers"
-	default y
 	help
 	  Support for package managers like rpm, portage, ipkg, ..
 
@@ -446,7 +440,6 @@ endif
 
 menuconfig BR2_SCRIPTING_SUPPORT
 	bool "Interpreter languages / Scripting"
-	default y
 	help
 	  Support for scripting languages, interpreter languages.
 
@@ -461,7 +454,6 @@ endif
 
 menuconfig BR2_XML_SUPPORT
 	bool "XML handling"
-	default y
 	help
 	  Support for XML handling
 
diff --git a/package/audio/Config.in b/package/audio/Config.in
index 370467a..c6d1d65 100644
--- a/package/audio/Config.in
+++ b/package/audio/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_AUDIO_SUPPORT
 	bool "Audio libraries and applications"
-	default y
 	help
 	  Support for audio libraries and applications
 
diff --git a/package/database/Config.in b/package/database/Config.in
index 71593d7..de1f4c5 100644
--- a/package/database/Config.in
+++ b/package/database/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_DATABASE_SUPPORT
 	bool "Database"
-	default y
 
 if BR2_DATABASE_SUPPORT
 source "package/database/mysql_client/Config.in"
diff --git a/package/editors/Config.in b/package/editors/Config.in
index b4e7e40..2d9747b 100644
--- a/package/editors/Config.in
+++ b/package/editors/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_TEXTEDIT_SUPPORT
 	bool "Text editors"
-	default y
 	help
 	  Support for text editors
 
diff --git a/package/games/Config.in b/package/games/Config.in
index 4d73027..606ec4a 100644
--- a/package/games/Config.in
+++ b/package/games/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_GAMES
 	bool "Games"
-	default y
 	help
 	  Support for games
 
diff --git a/package/java/Config.in b/package/java/Config.in
index 1ed0475..e814271 100644
--- a/package/java/Config.in
+++ b/package/java/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_JAVA_SUPPORT
         bool "Java"
-        default y
         help
           Support java programs (classpath, vm, osgi)
 
-- 
1.6.0.4.620.g87fa
