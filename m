From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu,  1 Mar 2018 16:34:27 -0500
Subject: [Buildroot] [PATCH 3/4] Revert "qt5webkit: fix build issue with
 mesa3d w/out xcb"
In-Reply-To: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
References: <20180301213428.21011-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180301213428.21011-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit e46f9fde78e53740bd00c077275d3cd80d7792c7.

Supersede by:

	qt5base: fix build issue with mesa3d w/out xcb

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 5186671663..e8d368fb01 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -44,15 +44,8 @@ define QT5WEBKIT_PYTHON2_SYMLINK
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
-# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
-# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
-# the libxcb is not selected.
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
-QT5WEBKIT_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
-endif
-
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBKIT_QMAKEFLAGS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
-- 
2.16.1
