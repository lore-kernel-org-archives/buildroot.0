From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Dec 2012 14:24:06 -0300
Subject: [Buildroot] [PATCH 2/3] jquery-validation: bump to version 1.10.0
In-Reply-To: <1354641847-5083-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354641847-5083-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354641847-5083-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-validation/jquery-validation.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 7d30270..746b534 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -1,13 +1,13 @@
-JQUERY_VALIDATION_VERSION = 1.9.0
+JQUERY_VALIDATION_VERSION = 1.10.0
 JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
-	unzip -d $(BUILD_DIR) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
 endef
 
 define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/jquery.validate.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/dist/jquery.validate.min.js \
 		$(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
-- 
1.7.8.6
