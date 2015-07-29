From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:48:53 +0200
Subject: [Buildroot] [git commit branch/next] package/mesa3d: disable libva
	support
Message-ID: <20150808105650.2E7007FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=361bfbc70b2bc7b9957e7b82c40b21cf01060686
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Informations about the circular dependency can be found here:
http://linuxfromscratch.org/blfs/view/systemd/multimedia/libva.html

Fixes
http://autobuild.buildroot.net/results/b51/b516676ca0e695b3dbc3c33622d527b89a227932/
http://autobuild.buildroot.net/results/035/03588be2fbd71bfc68619297dace52a909ffe261/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
