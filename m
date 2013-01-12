From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:36:12 +0100
Subject: [Buildroot] [git commit] xlib_libX11: split the DEPENDENCIES
	variable on multiple lines
Message-ID: <20130112215436.581B9996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6de4b198e3677fcb158fa780329321862b8d171
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 94107b2..ca4f06e 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -8,7 +8,19 @@ XLIB_LIBX11_VERSION = 1.4.2
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto host-xproto_xproto
+XLIB_LIBX11_DEPENDENCIES = \
+	libxcb \
+	xutil_util-macros \
+	xlib_xtrans \
+	xlib_libXau \
+	xlib_libXdmcp \
+	xproto_kbproto \
+	xproto_xproto \
+	xproto_xextproto \
+	xproto_inputproto \
+	xproto_xf86bigfontproto \
+	host-xproto_xproto
+
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
