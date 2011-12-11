From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 22:36:01 +0100
Subject: [Buildroot] [git commit] barebox: add 2011.12 release,
	remove 2011.09
Message-ID: <20111211215606.AFC838F8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1010c311c49b9f498e38941d86ba0a375bad1b8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And mark 2011.10 as deprecated.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0342a33..b8e2b95 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,20 +8,20 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2011_11
+	default BR2_TARGET_BAREBOX_2011_12
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2011_09
-	depends on BR2_DEPRECATED
-	bool "2011.09"
-
 config BR2_TARGET_BAREBOX_2011_10
+	depends on BR2_DEPRECATED
 	bool "2011.10"
 
 config BR2_TARGET_BAREBOX_2011_11
 	bool "2011.11"
 
+config BR2_TARGET_BAREBOX_2011_12
+	bool "2011.12"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -39,9 +39,9 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2011.09.0"	if BR2_TARGET_BAREBOX_2011_09
 	default "2011.10.0"	if BR2_TARGET_BAREBOX_2011_10
 	default "2011.11.0"	if BR2_TARGET_BAREBOX_2011_11
+	default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
