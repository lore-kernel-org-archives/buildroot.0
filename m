From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  1 Mar 2013 23:13:58 +0100
Subject: [Buildroot] [PATCH] qt5base: install bundled fonts to target
Message-ID: <1362176038-17503-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If not using font-config, Qt 5 offers a set of standard fonts to
use instead. Install these to target.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/qt5/qt5base/qt5base.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index f44da31..fc08b77 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -173,9 +173,17 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
+define QT5BASE_INSTALL_TARGET_FONTS
+	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
+	fi
+endef
+
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
+	$(QT5BASE_INSTALL_TARGET_FONTS)
 endef
 
 $(eval $(generic-package))
-- 
1.7.10.4
