From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Dec 2012 22:55:02 -0800
Subject: [Buildroot] [git commit] xlib_libX11: disable nls compose overview
	generation
Message-ID: <20121204190927.C4CF899716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cceda0efeaaa73af490940a628dbd175db3aa277
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Perl is only used to generate compose overview documentation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index f7dc4eb..75d172c 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -12,10 +12,12 @@ XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
-	--disable-specs
+	--disable-specs \
+	--without-perl
 
 HOST_XLIB_LIBX11_CONF_OPT = \
-	--disable-specs
+	--disable-specs \
+	--without-perl
 
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
