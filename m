From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 16 May 2011 22:54:37 +0200
Subject: [Buildroot] [git commit] xlib_libXfont: don't build devel
	documentation for host
Message-ID: <20110516210341.7962E8352F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=017e3061fdd62d42ffb851057b67e6d96b1fd47a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 3cb52c3..a91999c 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -12,6 +12,7 @@ XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static --disable-devel-docs
 
+HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 HOST_XLIB_LIBXFONT_DEPENDENCIES = host-freetype host-xlib_libfontenc host-xlib_xtrans host-xproto_fontcacheproto host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfont))
-- 
1.7.3.4
