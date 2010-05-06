From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 May 2010 20:20:05 +0200
Subject: [Buildroot] [PATCH 5/7] Enable xapp_bdftopcf dependencies for the
	host
In-Reply-To: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a10439d3cd1d836fccf3fdf8e7949a71bf341ba9.1273169997.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that xapp_bdftopcf is enabled on the host, we also need its
dependencies to be available for the host. The dependency of
host-xapp_bdftopcf is host-xlib_libXfont, which itself depends on a
bunch of other packages. Some of them were already available for the
host, some not (xfont_encodings, xlib_xtrans, xproto_fontcacheproto,
xproto_fontsproto) and are therefore added by this patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    2 ++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    3 +++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    1 +
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    1 +
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    1 +
 5 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 20a192b..ed94e49 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -10,5 +10,7 @@ XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_AUTORECONF = NO
 XFONT_ENCODINGS_MAKE_OPT =
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
+HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings))
+$(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings,host))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index df4ecec..3cb52c3 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -12,4 +12,7 @@ XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static --disable-devel-docs
 
+HOST_XLIB_LIBXFONT_DEPENDENCIES = host-freetype host-xlib_libfontenc host-xlib_xtrans host-xproto_fontcacheproto host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
+
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfont))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfont,host))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 0968bdf..aaf2208 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -11,3 +11,4 @@ XLIB_XTRANS_AUTORECONF = NO
 XLIB_XTRANS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_xtrans))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_xtrans,host))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 9c2ef47..40917cd 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -12,3 +12,4 @@ XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_fontcacheproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_fontcacheproto,host))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index dc18399..5e2a64a 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -12,3 +12,4 @@ XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_fontsproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_fontsproto,host))
-- 
1.6.3.3
