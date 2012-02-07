From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 23:13:25 +0100
Subject: [Buildroot] [git commit] libevas: x11 glx option needs Xrender,
	Xext and libeet
Message-ID: <20120207223219.9F73F90A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5617a52d0401a42a70f733bb3f593497f117f2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in  |    3 +++
 package/efl/libevas/libevas.mk |    3 ++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index f5e79b3..e2f5349 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -98,7 +98,10 @@ config BR2_PACKAGE_LIBEVAS_X11_GLX
 	bool "libevas X11 GLX backend"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_LIBEET
 	help
 	  This enables the OpenGL X11 rendering engine that renders
 	  using GLX which may be hardware accelerated.
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 7758b18..14f49bb 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -65,7 +65,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
 LIBEVAS_CONF_OPT += --enable-gl-xlib
-LIBEVAS_DEPENDENCIES += xproto_glproto xlib_libX11
+LIBEVAS_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
+			xlib_libXext libeet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
