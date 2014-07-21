From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:59:02 +0200
Subject: [Buildroot] [git commit] qt5: install qmls if quick module is
	selected
Message-ID: <20140721195948.417CF9D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1b50e62b3a7130d8018d80e23ec58accd5bd9b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5connectivity/qt5connectivity.mk |    2 +-
 package/qt5/qt5enginio/qt5enginio.mk           |    2 +-
 package/qt5/qt5sensors/qt5sensors.mk           |    2 +-
 package/qt5/qt5webkit/qt5webkit.mk             |    2 +-
 package/qt5/qt5websockets/qt5websockets.mk     |    2 +-
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
