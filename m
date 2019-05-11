From: nowrep at gmail.com <nowrep@gmail.com>
Date: Sat, 11 May 2019 17:07:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5wayland: install compositor QML
 files
Message-ID: <20190511150750.5985-1-nowrep@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Rosca <nowrep@gmail.com>

Fixes using QtWayland.Compositor QML import.

Signed-off-by: David Rosca <nowrep@gmail.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index f96e4c2f8f..6ff8ba169f 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -46,6 +46,7 @@ ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5WAYLAND_INSTALL_COMPOSITOR
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/
 endef
 else
 define QT5WAYLAND_INSTALL_COMPOSITOR
-- 
2.21.0
