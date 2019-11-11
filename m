From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:29:58 +0100
Subject: [Buildroot] [git commit] package/qt5wayland: fix installation with
 Qt 5.6
Message-ID: <20191111152243.EE70C8ED48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21783d8403f4f41bd97014768e08f9fc355adf87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install QtWayland only if the latest Qt version is selected. It does not
exist in version 5.6.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
