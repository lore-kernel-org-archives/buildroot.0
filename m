From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Tue, 4 May 2010 21:38:14 +0200
Subject: [Buildroot] [git commit master] X11 OpenChrome driver depends on
	libxcomposite
Message-ID: <20100504194052.3FCEB8D422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca218debd5c54023517955babd080dc0db9204ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 ++++++
 Config.in                                          |    2 +-
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    1 +
 .../xdriver_xf86-video-openchrome.mk               |   14 +++++++++++++-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7ef6d81..21848a6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2010.05, Not yet released
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: xdriver_xf86-video-openchrome
+
 2010.05-rc1, Released May 3rd, 2010:
 
 	Cleaned up / restructured package menu.
diff --git a/Config.in b/Config.in
index 3a690d6..fc68bf9 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc1"
+	default "2010.05-rc1-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
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
 
-- 
1.6.3.3
