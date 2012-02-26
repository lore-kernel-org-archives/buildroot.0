From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 21:00:27 -0200
Subject: [Buildroot] [PATCH] qt: Install QtDeclarative imports
Message-ID: <1330297227-8459-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/qt/qt.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 68f9348..212f9dc 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -595,8 +595,12 @@ endif
 # Plugin installation
 define QT_INSTALL_TARGET_PLUGINS
 	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins $(TARGET_DIR)/usr/lib/qt ; \
+	fi
+	if [ -d $(STAGING_DIR)/usr/imports ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt
+		cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr/lib/qt ; \
 	fi
 endef
 
-- 
1.7.9.1
