From: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Date: Wed, 11 Apr 2018 14:40:37 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: qt5websockets: install missing qml
 modules
Message-ID: <3fc9a546-61c8-d7bf-f0eb-b757cae0dfe2@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QML modules for QtWebSockets are located in /usr/qml/QtWebSockets since
Qt 5.5.

/usr/qml/Qt/WebSockets still exists for compatibility reasons, but
it contains only a qmldir file which points to ../../QtWebSockets/.

see also: http://doc.qt.io/qt-5.6/qtwebsockets-qmlmodule.html

Signed-off-by: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
---
 package/qt5/qt5websockets/qt5websockets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 4d9df9257b..c67db198db 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -41,6 +41,7 @@ endef
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/WebSockets $(TARGET_DIR)/usr/qml/Qt/
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebSockets $(TARGET_DIR)/usr/qml/
 endef
 endif
 
-- 
2.11.0
