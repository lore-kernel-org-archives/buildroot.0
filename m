From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 16 May 2011 18:10:48 +0300
Subject: [Buildroot] [PATCH 1/3] xlib_libX11: don't build docs for host
Message-ID: <1305558650-15826-1-git-send-email-anarsoul@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It depends on utils provided by host system, and
they sometimes are missing.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 1acc35c..7ecc368 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -18,6 +18,9 @@ XLIB_LIBX11_CONF_OPT = \
 	--with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h \
 	--disable-specs
 
+HOST_XLIB_LIBX11_CONF_OPT = \
+	--disable-specs
+
 HOST_XLIB_LIBX11_DEPENDENCIES = host-xproto_xextproto host-libxcb host-xutil_util-macros host-xlib_xtrans host-xlib_libXau host-xlib_libXdmcp host-xproto_kbproto host-xproto_xproto host-xproto_xextproto host-xproto_inputproto host-xproto_xf86bigfontproto xproto_bigreqsproto host-xproto_xcmiscproto
 
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
-- 
1.7.5.rc1
