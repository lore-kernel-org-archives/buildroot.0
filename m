From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:22 +0100
Subject: [Buildroot] [PATCH 10/28] xlib_libX11: split the DEPENDENCIES
	variable on multiple lines
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4b66e0b0fbda91a2852bfcd0ab64235e23d27f6a.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
