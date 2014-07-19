From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Sat, 19 Jul 2014 20:33:26 +0300
Subject: [Buildroot] [PATCH 4/6] qt5: install qmls if quick module is
	selected
In-Reply-To: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
References: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1405791208-30356-5-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5connectivity/qt5connectivity.mk | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk           | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk           | 2 +-
 package/qt5/qt5webkit/qt5webkit.mk             | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 214d536..e601270 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -35,7 +35,7 @@ define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5CONNECTIVITY_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
 endef
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 8e4d50d..c33a405 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -35,7 +35,7 @@ define QT5ENGINIO_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5ENGINIO_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/Enginio $(TARGET_DIR)/usr/qml/
 endef
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 1b03293..4cc0c99 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -42,7 +42,7 @@ define QT5SENSORS_INSTALL_TARGET_LIBS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5SENSORS_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtSensors $(TARGET_DIR)/usr/qml
 endef
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 08c30be..c103a9c 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -39,7 +39,7 @@ define QT5WEBKIT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WEBKIT_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
 endef
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 5bfa1ed..7776414 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -35,7 +35,7 @@ define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/WebSockets $(TARGET_DIR)/usr/qml/Qt/
 endef
-- 
2.0.1
