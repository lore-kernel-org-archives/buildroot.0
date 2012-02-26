From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:07 -0200
Subject: [Buildroot] [PATCH 2/3] qt: Install QtDeclarative imports
In-Reply-To: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
References: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330258388-28391-2-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt/qt.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 68f9348..4871538 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -594,9 +594,12 @@ endif
 
 # Plugin installation
 define QT_INSTALL_TARGET_PLUGINS
+	mkdir -p $(TARGET_DIR)/usr/lib/qt
 	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins $(TARGET_DIR)/usr/lib/qt ; \
+	fi
+	if [ -d $(@D)/imports ] ; then \
+		cp -dpfr $(@D)/imports $(TARGET_DIR)/usr/lib/qt ; \
 	fi
 endef
 
-- 
1.7.9.1
