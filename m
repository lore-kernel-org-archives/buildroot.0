From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:51 +0100
Subject: [Buildroot] [PATCH resend 17/22] xlib_libX11: removed redundant
	HOST_FOO_DEPENDENCIES and incorrect target dependency
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-18-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

By deriving HOST_XLIB_LIBX11_DEPENDENCIES from XLIB_LIBX11_DEPENDENCIES, it
turned out that that one had a redundant dependency on xproto_bigreqsproto.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index e017fea..4d12a84 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -9,7 +9,7 @@ XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto host-xproto_xproto
+XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_xcmiscproto host-xproto_xproto
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
@@ -19,8 +19,6 @@ XLIB_LIBX11_CONF_OPT = \
 HOST_XLIB_LIBX11_CONF_OPT = \
 	--disable-specs
 
-HOST_XLIB_LIBX11_DEPENDENCIES = host-xproto_xextproto host-libxcb host-xutil_util-macros host-xlib_xtrans host-xlib_libXau host-xlib_libXdmcp host-xproto_kbproto host-xproto_xproto host-xproto_xextproto host-xproto_inputproto host-xproto_xf86bigfontproto xproto_bigreqsproto host-xproto_xcmiscproto
-
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
 # doesn't know about cross compilation so this doesn't work.
-- 
1.7.8.3
