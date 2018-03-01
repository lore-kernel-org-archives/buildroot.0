From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu,  1 Mar 2018 16:34:26 -0500
Subject: [Buildroot] [PATCH 2/4] Revert "qt5wayland: fix build issue with
 mesa3d w/out xcb"
In-Reply-To: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
References: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180301213428.21011-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 85483968bec8c5bb3332f61b22cc9be8f0ad15f7.

Supersede by:

	qt5base: fix build issue with mesa3d w/out xcb

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 8a7f2e1fb5..0a7bdb8cf9 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -26,13 +26,6 @@ ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
 QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
 endif
 
-# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
-# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
-# the libxcb is not selected.
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
-QT5WAYLAND_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
-endif
-
 define QT5WAYLAND_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
 endef
-- 
2.16.1
