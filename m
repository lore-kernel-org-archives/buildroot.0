From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:32:56 +0100
Subject: [Buildroot] [git commit] qt5connectivity: install examples
Message-ID: <20161207223300.B365D817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=520d9975bda643d2cdea6007baf0411c2ea622a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
