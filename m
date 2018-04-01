From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 23:48:30 +0200
Subject: [Buildroot] [git commit] Revert "qt5multimedia: fix build issue
 with mesa3d w/out xcb"
Message-ID: <20180401214843.5DF2E83761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a41e1c672fdb2b6e7f70dbdf117d0fac3a79a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit fadaaabe6f79da130f3e68fca23f12f0ffd6b20f.

Superseded by:

	qt5base: fix build issue with mesa3d w/out xcb

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
