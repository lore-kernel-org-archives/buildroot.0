From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jul 2015 21:42:54 +0200
Subject: [Buildroot] [PATCH 1/3] package/mesa3d: disable libva support
Message-ID: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Informations about the circular dependency can be found here:
http://linuxfromscratch.org/blfs/view/systemd/multimedia/libva.html

Fixes
http://autobuild.buildroot.net/results/b51/b516676ca0e695b3dbc3c33622d527b89a227932/
http://autobuild.buildroot.net/results/035/03588be2fbd71bfc68619297dace52a909ffe261/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e5afed2..82b1001 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -121,6 +121,10 @@ endif
 #     remove dri.pc and gl.pc in this case (MESA3D_REMOVE_OPENGL_PC)
 MESA3D_CONF_OPTS += --enable-opengl
 
+# libva and mesa3d have a circular dependency
+# we do not need libva support in mesa3d, therefore disable this option
+MESA3D_CONF_OPTS += --disable-va
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 MESA3D_EGL_PLATFORMS = drm
-- 
2.1.4
