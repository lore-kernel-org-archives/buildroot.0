From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:35:44 +0200
Subject: [Buildroot] [git commit] xlib_libXfont: add explicit dependencies
	for host variant
Message-ID: <20160703073819.A877F807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=037f7ba8158664f673e64f2f5508a764ce9d2f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index adc22b4..d7acab4 100644
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
