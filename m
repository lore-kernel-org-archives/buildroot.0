From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:04 +0200
Subject: [Buildroot] [PATCH] imagemagick: fix Magick[++|Core|Wand]-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357250947-23296-5-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/imagemagick/imagemagick.mk |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0476ace..00aa81f 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -119,6 +119,25 @@ define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 		     Magick MagickCore MagickWand Wand Magick++))
 endef
 
+define IMAGEMAGICK_STAGING_IMAGEMAGICK_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick-config
+
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick++-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick++-config
+
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/MagickCore-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/MagickCore-config
+
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/MagickWand-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/MagickWand-config
+
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Wand-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Wand-config
+endef
+
+IMAGEMAGICK_POST_INSTALL_STAGING_HOOKS += IMAGEMAGICK_STAGING_IMAGEMAGICK_CONFIG_FIXUP
+
 ifneq ($(BR2_HAVE_DEVFILES),y)
 IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 endif
-- 
1.7.7.6
