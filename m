From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Nov 2011 17:01:18 +0100
Subject: [Buildroot] [git commit branch/next] barebox: add 2011.11.0,
	remove 2011.08.0
Message-ID: <20111119185927.9C4968F5FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5a574afcc52972762ddb426d89079304815ffab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 8dfaeb2..0342a33 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,20 +8,20 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2011_10
+	default BR2_TARGET_BAREBOX_2011_11
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2011_08
-	depends on BR2_DEPRECATED
-	bool "2011.08"
-
 config BR2_TARGET_BAREBOX_2011_09
+	depends on BR2_DEPRECATED
 	bool "2011.09"
 
 config BR2_TARGET_BAREBOX_2011_10
 	bool "2011.10"
 
+config BR2_TARGET_BAREBOX_2011_11
+	bool "2011.11"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -39,9 +39,9 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2011.08.0"	if BR2_TARGET_BAREBOX_2011_08
 	default "2011.09.0"	if BR2_TARGET_BAREBOX_2011_09
 	default "2011.10.0"	if BR2_TARGET_BAREBOX_2011_10
+	default "2011.11.0"	if BR2_TARGET_BAREBOX_2011_11
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
