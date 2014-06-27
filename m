From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jun 2014 18:19:37 -0300
Subject: [Buildroot] [PATCH] jquery-validation: bump to version 1.12.0
Message-ID: <1403903977-21512-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch homepage and upstream source, add license file (just mentions
it's under MIT, better than none). Also fixes:
http://autobuild.buildroot.net/results/a2e/a2ed2efe09b12612247a21c5fa3c129f58c9afd8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-validation/Config.in            | 2 +-
 package/jquery-validation/jquery-validation.mk | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
index 2a764c1..ab2ee26 100644
--- a/package/jquery-validation/Config.in
+++ b/package/jquery-validation/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_JQUERY_VALIDATION
 	  your existing forms, while making all kinds of
 	  customizations to fit your application really easy.
 
-	  http://bassistance.de/jquery-plugins/jquery-plugin-validation/
+	  http://jqueryvalidation.org/
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index a39560b..ca8cbdc 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-JQUERY_VALIDATION_VERSION = 1.11.1
-JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
+JQUERY_VALIDATION_VERSION = 1.12.0
+JQUERY_VALIDATION_SITE = http://jqueryvalidation.org/files
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
+JQUERY_VALIDATION_LICENSE_FILES = README.md
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
-- 
1.8.5.5
