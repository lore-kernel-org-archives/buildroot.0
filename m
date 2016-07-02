From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:19 +0200
Subject: [Buildroot] [PATCH 50/69] xlib_libXfont: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-51-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index adc22b4df7b2..d7acab44c94e 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -11,9 +11,14 @@ XLIB_LIBXFONT_LICENSE = MIT
 XLIB_LIBXFONT_LICENSE_FILES = COPYING
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
+
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
-XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
+HOST_XLIB_LIBXFONT_DEPENDENCIES = \
+	host-freetype host-xlib_libfontenc host-xlib_xtrans \
+	host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
+
+XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 HOST_XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
 ifeq ($(BR2_microblaze),y)
-- 
2.1.0
