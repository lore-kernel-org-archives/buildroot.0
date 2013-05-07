From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 15:17:52 +0200
Subject: [Buildroot] [git commit] jquery-ui-themes: strip theme name
Message-ID: <20130507133103.0B0C599AD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2c8569f04f36a545c9e63e1372495e8e502efa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-ui-themes/jquery-ui-themes.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
