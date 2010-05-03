From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 03 May 2010 19:51:58 +0300
Subject: [Buildroot] [PATCH] X11 OpenChrome driver depends on libxcomposite
Message-ID: <20100503165158.2533.82627.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    1 +
 .../xdriver_xf86-video-openchrome.mk               |   14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 25424ff..4a69246 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXVMC
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 44bc111..486ab6f 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -7,7 +7,19 @@ XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.904
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
 
-XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
+XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
+	xserver_xorg-server \
+	libdrm \
+	xlib_libX11 \
+	xlib_libXcomposite \
+	xlib_libXvMC \
+	xproto_fontsproto \
+	xproto_glproto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_xextproto \
+	xproto_xf86driproto \
+	xproto_xproto
 
 XDRIVER_XF86_VIDEO_OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
