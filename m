From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:18:39 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Fix
	glamor dependency
Message-ID: <20150829211854.0C85C818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9141ea81f0423efa0c93daffb91b56418f8ea0d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

X.org xserver depends on libepoxy for glamor support, which depends on
EGL support. Mesa3d is not the only possible EGL provider therefore
change the dependency check.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index c88614b..617bcbc 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -203,7 +203,7 @@ endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
 endif
