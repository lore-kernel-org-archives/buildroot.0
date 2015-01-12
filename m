From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 13 Jan 2015 00:30:37 +0100
Subject: [Buildroot] [PATCH] bootstrap: install production files only
Message-ID: <1421105437-14443-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bootstrap/bootstrap.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 1bf8aa2..1a1c4f1 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -14,8 +14,13 @@ define BOOTSTRAP_EXTRACT_CMDS
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/var/www/bootstrap
-	cp -dpfr $(@D)/dist/* $(TARGET_DIR)/var/www/bootstrap
+	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap-theme.min.css \
+		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap-theme.min.css
+	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap.min.css \
+		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
+	$(INSTALL) -m 0644 -D $(@D)/dist/js/bootstrap.min.js \
+		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
+	cp -r $(@D)/dist/fonts $(TARGET_DIR)/var/www/bootstrap/
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
