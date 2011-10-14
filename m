From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:52:01 +0100
Subject: [Buildroot] [PATCH 9/9] Mesa3d does not build with --enable-static
	set
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-10-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 1fc1631..d1d6ec4 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -8,7 +8,7 @@ MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 
 MESA3D_AUTORECONF = NO
-MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
+MESA3D_CONF_OPT = --disable-static --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
 MESA3D_INSTALL_STAGING = YES
 
 MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
-- 
1.7.2.5
