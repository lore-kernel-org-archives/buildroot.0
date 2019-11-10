From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 10 Nov 2019 20:49:16 -0300
Subject: [Buildroot] [PATCH] package/qt5wayland: fix installation with Qt 5.6
Message-ID: <20191110234916.1473-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Install QtWayland only if the latest Qt version is selected. It does not
exist in version 5.6.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 0bda596f3b..4790efc660 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -52,7 +52,7 @@ define QT5WAYLAND_INSTALL_COMPOSITOR
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Compositor.so* $(TARGET_DIR)/usr/lib
 endef
 endif
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
 define QT5WAYLAND_INSTALL_COMPOSITOR_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/
 endef
-- 
2.18.1
