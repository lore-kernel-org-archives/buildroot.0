From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:14 +0200
Subject: [Buildroot] [PATCH 45/69] xlib_libX11: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-46-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fc19aa1d2814..259592413b89 100644
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
-- 
2.1.0
