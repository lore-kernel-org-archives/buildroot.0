From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 13:58:41 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/qt5wayland: fix
 installation with Qt 5.6
Message-ID: <20191118125121.6F0638F17D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16cac460d12264f6539e492ef9295051d9d52db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Install QtWayland only if the latest Qt version is selected. It does not
exist in version 5.6.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 21783d8403f4f41bd97014768e08f9fc355adf87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
