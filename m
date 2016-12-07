From: Matt Kraai <kraai@ftbfs.org>
Date: Wed,  7 Dec 2016 07:11:30 -0800
Subject: [Buildroot] [PATCH] qt5connectivity: install examples
Message-ID: <20161207151130.6836-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5connectivity/qt5connectivity.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 0f7257d..bcbdd2e 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -54,12 +54,22 @@ define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
 endef
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/bluetooth $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_NEARD),y)
 define QT5CONNECTIVITY_INSTALL_TARGET_NFC
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Nfc.so.* $(TARGET_DIR)/usr/lib
 endef
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_NFC_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/nfc $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
 endif
 
 define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
@@ -67,6 +77,8 @@ define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
 	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC)
 	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS)
 	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS)
+	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_EXAMPLES)
+	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_EXAMPLES)
 endef
 
 $(eval $(generic-package))
-- 
2.10.2
