From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Jan 2017 21:29:18 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols2: install examples
Message-ID: <20170123202918.12826-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index a5ad3f6d4..8de7932f4 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -30,11 +30,18 @@ define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quickcontrols2 $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
+	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
