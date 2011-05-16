From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 16 May 2011 22:54:37 +0200
Subject: [Buildroot] [git commit] xlib_libX11: don't build docs for host
Message-ID: <20110516210341.10EEA8352F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=12cdabeeb5ad18f27ce415c18d8a5896699bee41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It depends on utils provided by host system, and
they sometimes are missing.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
