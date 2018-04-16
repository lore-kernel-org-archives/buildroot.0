From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 17:47:34 +0200
Subject: [Buildroot] [git commit] qt5: qt5websockets: install missing qml
 modules
Message-ID: <20180416154748.0135B8851A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f726cef4c5709cf4f894e436b4022989adc9e9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QML modules for QtWebSockets are located in /usr/qml/QtWebSockets since
Qt 5.5.

/usr/qml/Qt/WebSockets still exists for compatibility reasons, but
it contains only a qmldir file which points to ../../QtWebSockets/.

see also: http://doc.qt.io/qt-5.6/qtwebsockets-qmlmodule.html

Signed-off-by: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
