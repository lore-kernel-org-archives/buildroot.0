From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu,  1 Mar 2018 16:34:28 -0500
Subject: [Buildroot] [PATCH 4/4] Revert "qt5multimedia: fix build issue with
 mesa3d w/out xcb"
In-Reply-To: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
References: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180301213428.21011-5-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit fadaaabe6f79da130f3e68fca23f12f0ffd6b20f.

Superseded by:

	qt5base: fix build issue with mesa3d w/out xcb

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 041ef49092..6df96bcab4 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -34,15 +34,8 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
 endif
 
-# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
-# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
-# the libxcb is not selected.
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
-QT5MULTIMEDIA_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
-endif
-
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5MULTIMEDIA_QMAKEFLAGS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
-- 
2.16.1
