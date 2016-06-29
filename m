From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:08 +0200
Subject: [Buildroot] [PATCH 01/24] x11r7: drop unused host variants
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-2-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/libxcb/libxcb.mk                                   | 3 ---
 package/x11r7/xfont_encodings/xfont_encodings.mk                 | 1 -
 package/x11r7/xlib_libX11/xlib_libX11.mk                         | 6 ------
 package/x11r7/xlib_libXau/xlib_libXau.mk                         | 1 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk                 | 1 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk                     | 1 -
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk                   | 1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk                     | 3 ---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk                 | 1 -
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk                 | 1 -
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk                 | 1 -
 package/x11r7/xlib_xtrans/xlib_xtrans.mk                         | 1 -
 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk             | 1 -
 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk     | 1 -
 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk             | 1 -
 package/x11r7/xproto_inputproto/xproto_inputproto.mk             | 1 -
 package/x11r7/xproto_kbproto/xproto_kbproto.mk                   | 1 -
 package/x11r7/xproto_renderproto/xproto_renderproto.mk           | 1 -
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk           | 2 --
 package/x11r7/xproto_xextproto/xproto_xextproto.mk               | 2 --
 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk | 1 -
 21 files changed, 32 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 7f7823bf5303..f8ef57c076af 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -17,11 +17,8 @@ LIBXCB_DEPENDENCIES = \
 	host-xcb-proto host-python host-pkgconf
 
 LIBXCB_CONF_OPTS = --with-doxygen=no
-HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
 
 # libxcb is not python3 friendly, so force the python interpreter
-HOST_LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 568dbcbde81f..3d2fdc165237 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -13,4 +13,3 @@ XFONT_ENCODINGS_LICENSE_FILES = COPYING
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf xutil_util-macros
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fc19aa1d2814..2aeaf1e072ef 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -29,10 +29,6 @@ XLIB_LIBX11_CONF_OPTS = \
 	--disable-specs \
 	--without-perl
 
-HOST_XLIB_LIBX11_CONF_OPTS = \
-	--disable-specs \
-	--without-perl
-
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
 # doesn't have X11_CFLAGS_FOR_BUILD so this doesn't work.  For buildroot,
@@ -43,7 +39,5 @@ define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 endef
 
 XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
-HOST_XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 8ef48e4a7b30..c074e6fb8a5a 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -13,4 +13,3 @@ XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 508b5e21c522..196f249333fc 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -13,4 +13,3 @@ XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 119c01813713..9e443a743a74 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -13,4 +13,3 @@ XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 2a10d49eb15c..c15ecbdf4847 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -13,4 +13,3 @@ XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index adc22b4df7b2..a4929ba7d0a3 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -14,8 +14,6 @@ XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
-HOST_XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
-
 ifeq ($(BR2_microblaze),y)
 # The microblaze toolchains don't define the __ELF__ preprocessor
 # symbol even though they do use the elf format. LibXfont checks for
@@ -27,4 +25,3 @@ XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
 endif
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 949dea3f146c..35da6815f897 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -14,4 +14,3 @@ XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index aff1f1a5d954..541603b859d4 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -13,4 +13,3 @@ XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 51c58c04a0da..1bef74981763 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -13,4 +13,3 @@ XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 40f613cc35f5..dcb7900a5a46 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -12,4 +12,3 @@ XLIB_XTRANS_LICENSE_FILES = COPYING
 XLIB_XTRANS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 55212b26785c..036b9f31e39b 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -13,4 +13,3 @@ XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 0cb205ad594b..d47b1f1ecec4 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -13,4 +13,3 @@ XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index b4e6d6a84847..3cb2b9f533ac 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -13,4 +13,3 @@ XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 20169b5c4639..f8bd1991757f 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -13,4 +13,3 @@ XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index b6c818f70547..57aee1633c04 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -13,4 +13,3 @@ XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 41a84454093a..63f5538c7225 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -13,4 +13,3 @@ XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 3bef2e979214..4e7a3b5db667 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -11,7 +11,5 @@ XPROTO_XCMISCPROTO_LICENSE = MIT
 XPROTO_XCMISCPROTO_LICENSE_FILES = COPYING
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
-HOST_XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index c17dd938b75d..4d8609aa219c 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -11,7 +11,5 @@ XPROTO_XEXTPROTO_LICENSE = MIT
 XPROTO_XEXTPROTO_LICENSE_FILES = COPYING
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
-HOST_XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index f88f5ecace5f..a455f3ece08c 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -13,4 +13,3 @@ XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
