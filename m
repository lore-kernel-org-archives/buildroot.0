From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:31:02 +0200
Subject: [Buildroot] [git commit] package/libva: fix mesa3d glx support
Message-ID: <20191008212517.1826D8B87A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=196e3d2b3393ff477f9162a2fbb0c7df8557faf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.buildroot.net/buildroot/commit/package/mesa3d?id=5cb821d5635626b7327d5d704555c412e5ed5a1f

added a new option to enable GLX support.

This patch adjusts libva to use the new logic.

Fixes:
http://autobuild.buildroot.net/results/797/79776104e681402c24160be15789fe67bb69f833/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 7bf1839f4c..6c8243da90 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -20,7 +20,7 @@ LIBVA_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 LIBVA_DEPENDENCIES += mesa3d
 LIBVA_CONF_OPTS += --enable-glx
 endif
