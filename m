From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 16 May 2011 18:10:50 +0300
Subject: [Buildroot] [PATCH 3/3] xlib_libXfont: don't build devel
	documentation for host
In-Reply-To: <1305558650-15826-1-git-send-email-anarsoul@gmail.com>
References: <1305558650-15826-1-git-send-email-anarsoul@gmail.com>
Message-ID: <1305558650-15826-3-git-send-email-anarsoul@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
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
1.7.5.rc1
