From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 14:36:26 +0100
Subject: [Buildroot] [git commit] barebox: add 2013.02.0, remove 2012.10
Message-ID: <20130207133631.43B469A9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0eb3eef966bbdf3d4d52bdb4d0c0b193cb447de4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 1ffe596..769a1bd 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,13 +8,10 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2013_01
+	default BR2_TARGET_BAREBOX_2013_02
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2012_10
-	bool "2012.10"
-
 config BR2_TARGET_BAREBOX_2012_11
 	bool "2012.11"
 
@@ -24,6 +21,9 @@ config BR2_TARGET_BAREBOX_2012_12
 config BR2_TARGET_BAREBOX_2013_01
 	bool "2013.01.0"
 
+config BR2_TARGET_BAREBOX_2013_02
+	bool "2013.02.0"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -41,10 +41,10 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
 	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
 	default "2012.12.1"	if BR2_TARGET_BAREBOX_2012_12
 	default "2013.01.0"	if BR2_TARGET_BAREBOX_2013_01
+	default "2013.02.0"	if BR2_TARGET_BAREBOX_2013_02
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
