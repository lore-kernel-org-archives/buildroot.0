From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 19 Jun 2012 07:56:04 +0100
Subject: [Buildroot] [PATCH RFC 2/2] Use JavaScript install path from
	configuration during package installation
In-Reply-To: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
References: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
Message-ID: <1340088964-10630-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/explorercanvas/explorercanvas.mk       |    4 ++--
 package/flot/flot.mk                           |    4 ++--
 package/jquery-sparkline/jquery-sparkline.mk   |    4 ++--
 package/jquery-validation/jquery-validation.mk |    4 ++--
 package/jquery/jquery.mk                       |    4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 93dcb1f..e099faa 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -8,11 +8,11 @@ endef
 
 define EXPLORERCANVAS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/excanvas.compiled.js \
-		$(TARGET_DIR)/var/www/excanvas.js
+		$(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/excanvas.js
 endef
 
 define EXPLORERCANVAS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/excanvas.js
+	rm -f $(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/excanvas.js
 endef
 
 $(eval $(call GENTARGETS))
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index 8b51b55..3d6987e 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -12,12 +12,12 @@ FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
 
 define FLOT_INSTALL_TARGET_CMDS
 	for i in $(FLOT_FILES); do \
-		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js; \
+		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/$$i.js; \
 	done
 endef
 
 define FLOT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.flot*
+	rm -f $(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.flot*
 endef
 
 $(eval $(call GENTARGETS))
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index d0b478a..3ef1dc7 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -8,11 +8,11 @@ endef
 
 define JQUERY_SPARKLINE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SPARKLINE_SOURCE) \
-		$(TARGET_DIR)/var/www/jquery.sparkline.js
+		$(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.sparkline.js
 endef
 
 define JQUERY_SPARKLINE_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.sparkline.js
+	rm -f $(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.sparkline.js
 endef
 
 $(eval $(call GENTARGETS))
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 5fee4c1..ccf1155 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -8,11 +8,11 @@ endef
 
 define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/jquery.validate.min.js \
-		$(TARGET_DIR)/var/www/jquery.validate.js
+		$(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.validate.js
 endef
 
 define JQUERY_VALIDATION_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.validate.js
+	rm -f $(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.validate.js
 endef
 
 $(eval $(call GENTARGETS))
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 08dd4a3..93d8eab 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -8,11 +8,11 @@ endef
 
 define JQUERY_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SOURCE) \
-		$(TARGET_DIR)/var/www/jquery.js
+		$(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.js
 endef
 
 define JQUERY_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/var/www/jquery.js
+	rm -f $(TARGET_DIR)/$(BR2_JAVASCRIPT_INSTALL_PATH)/jquery.js
 endef
 
 $(eval $(call GENTARGETS))
-- 
1.7.9.5
