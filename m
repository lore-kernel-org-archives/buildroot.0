From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 10 Jan 2012 15:40:33 +0100
Subject: [Buildroot] [PATCH v3] barebox: add 2012.01 release, remove 2011.10
Message-ID: <1326206433-20758-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And mark 2011.11 as deprecated.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
v3:

	sorry v2 and v1 are the wrong patch

Best Regards,
J.
 boot/barebox/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index b8e2b95..b98878b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,20 +8,20 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2011_12
+	default BR2_TARGET_BAREBOX_2012_01
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2011_10
-	depends on BR2_DEPRECATED
-	bool "2011.10"
-
 config BR2_TARGET_BAREBOX_2011_11
+	depends on BR2_DEPRECATED
 	bool "2011.11"
 
 config BR2_TARGET_BAREBOX_2011_12
 	bool "2011.12"
 
+config BR2_TARGET_BAREBOX_2012_01
+	bool "2012.01"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -39,9 +39,9 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2011.10.0"	if BR2_TARGET_BAREBOX_2011_10
 	default "2011.11.0"	if BR2_TARGET_BAREBOX_2011_11
 	default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
+	default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
-- 
1.7.7
