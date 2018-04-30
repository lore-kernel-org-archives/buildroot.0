From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:50:07 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qt5: qt5websockets:
 install missing qml modules
Message-ID: <20180501073415.85FDF890BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdce9595946da261719a3f40315741b2ec61c290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

QML modules for QtWebSockets are located in /usr/qml/QtWebSockets since
Qt 5.5.

/usr/qml/Qt/WebSockets still exists for compatibility reasons, but
it contains only a qmldir file which points to ../../QtWebSockets/.

see also: http://doc.qt.io/qt-5.6/qtwebsockets-qmlmodule.html

Signed-off-by: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f726cef4c5709cf4f894e436b4022989adc9e9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5websockets/qt5websockets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 4cb2aed1db..661bc83e52 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -41,6 +41,7 @@ endef
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/WebSockets $(TARGET_DIR)/usr/qml/Qt/
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebSockets $(TARGET_DIR)/usr/qml/
 endef
 endif
 
