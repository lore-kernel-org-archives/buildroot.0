From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:34:04 +0200
Subject: [Buildroot] [git commit] xlib_libX11: add explicit dependencies for
	host variant
Message-ID: <20160703073819.3892A807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a3e0e154f384c86e0fbf135d6de12a52ebc32a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fc19aa1..2595924 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -23,6 +23,18 @@ XLIB_LIBX11_DEPENDENCIES = \
 	xproto_xf86bigfontproto \
 	host-xproto_xproto
 
+HOST_XLIB_LIBX11_DEPENDENCIES = \
+	host-libxcb \
+	host-xutil_util-macros \
+	host-xlib_xtrans \
+	host-xlib_libXau \
+	host-xlib_libXdmcp \
+	host-xproto_kbproto \
+	host-xproto_xproto \
+	host-xproto_xextproto \
+	host-xproto_inputproto \
+	host-xproto_xf86bigfontproto
+
 XLIB_LIBX11_CONF_OPTS = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
