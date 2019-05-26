From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:03:15 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5wayland: install compositor
 QML files
Message-ID: <20190526195805.DD81183D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a7a85169fd4e260ae32f050b54aed3ac8eee7a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes using QtWayland.Compositor QML import.

Signed-off-by: David Rosca <nowrep@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index f96e4c2f8f..449640c881 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -52,6 +52,11 @@ define QT5WAYLAND_INSTALL_COMPOSITOR
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Compositor.so* $(TARGET_DIR)/usr/lib
 endef
 endif
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WAYLAND_INSTALL_COMPOSITOR_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/
+endef
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
@@ -65,6 +70,7 @@ define QT5WAYLAND_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
 	$(QT5WAYLAND_INSTALL_COMPOSITOR)
+	$(QT5WAYLAND_INSTALL_COMPOSITOR_QMLS)
 	$(QT5WAYLAND_INSTALL_TARGET_EXAMPLES)
 endef
 
