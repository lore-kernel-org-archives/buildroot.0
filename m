From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue,  7 May 2013 11:09:16 +0100
Subject: [Buildroot] [PATCH] jquery-ui-themes: strip theme name
Message-ID: <1367921356-8018-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/jquery-ui-themes/jquery-ui-themes.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index 3c51b89..c410b64 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -19,10 +19,10 @@ endef
 
 define JQUERY_UI_THEMES_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D \
-		$(@D)/themes/$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME)/jquery-ui.css \
+		$(@D)/themes/$(call qstrip,$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME))/jquery-ui.css \
 		$(TARGET_DIR)/var/www/jquery-ui.css
 	$(INSTALL) -d $(TARGET_DIR)/var/www/images
-	cp -a $(@D)/themes/$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME)/images/*.png \
+	cp -a $(@D)/themes/$(call qstrip,$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME))/images/*.png \
 		$(TARGET_DIR)/var/www/images
 	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
 endef
-- 
1.8.1.2
