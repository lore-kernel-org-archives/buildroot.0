From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 00:24:25 +0300
Subject: [Buildroot] PATCH [2/2] update x11r7 packages to use NAME_PREFIX
 when calling AUTOTARGETS
Message-ID: <46FD7109.6000500@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The second patch updates x11r7 packages to use NAME_PREFIX when calling AUTOTARGETS:

----------------------------------

Index: package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_VIA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VIA_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto
xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-via))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-via,x11r7))
Index: package/x11r7/xapp_xdm/xapp_xdm.mk
===================================================================
--- package/x11r7/xapp_xdm/xapp_xdm.mk	(revision 20086)
+++ package/x11r7/xapp_xdm/xapp_xdm.mk	(working copy)
@@ -10,4 +10,4 @@
 XAPP_XDM_AUTORECONF = YES
 XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto

-$(eval $(call AUTOTARGETS,xapp_xdm))
+$(eval $(call AUTOTARGETS,xapp_xdm,x11r7))
Index: package/x11r7/xfont_encodings/xfont_encodings.mk
===================================================================
--- package/x11r7/xfont_encodings/xfont_encodings.mk	(revision 20086)
+++ package/x11r7/xfont_encodings/xfont_encodings.mk	(working copy)
@@ -10,4 +10,4 @@
 XFONT_ENCODINGS_AUTORECONF = YES
 XFONT_ENCODINGS_MAKE_OPT =

-$(eval $(call AUTOTARGETS,xfont_encodings))
+$(eval $(call AUTOTARGETS,xfont_encodings,x11r7))
Index: package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk
===================================================================
--- package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk	(revision 20086)
+++ package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk	(working copy)
@@ -12,4 +12,4 @@
 XLIB_LIBLBXUTIL_DEPENDENCIES = xproto_xextproto
 XLIB_LIBLBXUTIL_CONF_OPT = --enable-shared --disable-static

-$(eval $(call AUTOTARGETS,xlib_liblbxutil))
+$(eval $(call AUTOTARGETS,xlib_liblbxutil,x11r7))
Index: package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	(revision 20086)
+++ package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	(working copy)
@@ -12,4 +12,4 @@
 XSERVER_XORG_SERVER_DEPENDENCIES = xutil_util-macros xlib_libXfont libdrm xlib_libxkbui xproto_compositeproto xproto_damageproto xproto_fixesproto xproto_glproto xproto_kbproto xproto_randrproto
freetype xlib_libX11 xlib_libXau xlib_libXaw xlib_libXdmcp xlib_libXext xlib_libXfixes xlib_libXi xlib_libXmu xlib_libXpm xlib_libXrender xlib_libXres xlib_libXtst xlib_libXft xlib_libXcursor
xlib_libXinerama xlib_libXrandr xlib_libXdamage xlib_libXxf86misc xlib_libXxf86vm xlib_liblbxutil xlib_libxkbfile xlib_xtrans xdata_xbitmaps xproto_bigreqsproto xproto_evieext xproto_fontsproto
xproto_inputproto xproto_recordproto xproto_renderproto xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto
xproto_xf86driproto xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto
 XSERVER_XORG_SERVER_CONF_OPT = --disable-xprint --disable-xinerama --disable-xnest --disable-xvfb --disable-dmx --disable-dri --disable-xdmcp --disable-screensaver

-$(eval $(call AUTOTARGETS,xserver_xorg-server))
+$(eval $(call AUTOTARGETS,xserver_xorg-server,x11r7))
Index: package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-tdfx))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-tdfx,x11r7))
Index: package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xf86miscproto
xproto_xineramaproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-ati))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-ati,x11r7))
Index: package/x11r7/xlib_libX11/xlib_libX11.mk
===================================================================
--- package/x11r7/xlib_libX11/xlib_libX11.mk	(revision 20086)
+++ package/x11r7/xlib_libX11/xlib_libX11.mk	(working copy)
@@ -13,4 +13,4 @@
 XLIB_LIBX11_CONF_ENV = ac_cv_func_mmap_fixed_mapped=yes CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
 XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static

-$(eval $(call AUTOTARGETS,xlib_libX11))
+$(eval $(call AUTOTARGETS,xlib_libX11,x11r7))
Index: package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto
xproto_xf86driproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-glint))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-glint,x11r7))
Index: package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto
xproto_xf86miscproto xproto_xineramaproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-sis))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-sis,x11r7))
Index: package/x11r7/libxcb/libxcb.mk
===================================================================
--- package/x11r7/libxcb/libxcb.mk	(revision 20086)
+++ package/x11r7/libxcb/libxcb.mk	(working copy)
@@ -13,5 +13,5 @@
 LIBXCB_DEPENDENCIES = pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"

-$(eval $(call AUTOTARGETS,libxcb))
+$(eval $(call AUTOTARGETS,libxcb,x11r7))

Index: package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-savage))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-savage,x11r7))
Index: package/x11r7/xlib_libXt/xlib_libXt.mk
===================================================================
--- package/x11r7/xlib_libXt/xlib_libXt.mk	(revision 20086)
+++ package/x11r7/xlib_libXt/xlib_libXt.mk	(working copy)
@@ -13,4 +13,4 @@
 XLIB_LIBXT_CONF_ENV = CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static

-$(eval $(call AUTOTARGETS,xlib_libXt))
+$(eval $(call AUTOTARGETS,xlib_libXt,x11r7))
Index: package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-mga))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-mga,x11r7))
Index: package/x11r7/xapp_xauth/xapp_xauth.mk
===================================================================
--- package/x11r7/xapp_xauth/xapp_xauth.mk	(revision 20086)
+++ package/x11r7/xapp_xauth/xapp_xauth.mk	(working copy)
@@ -10,4 +10,4 @@
 XAPP_XAUTH_AUTORECONF = YES
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu

-$(eval $(call AUTOTARGETS,xapp_xauth))
+$(eval $(call AUTOTARGETS,xapp_xauth,x11r7))
Index: package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_SUNFFB_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-sunffb))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-sunffb,x11r7))
Index: package/x11r7/xutil_util-macros/xutil_util-macros.mk
===================================================================
--- package/x11r7/xutil_util-macros/xutil_util-macros.mk	(revision 20086)
+++ package/x11r7/xutil_util-macros/xutil_util-macros.mk	(working copy)
@@ -11,4 +11,4 @@
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO

-$(eval $(call AUTOTARGETS,xutil_util-macros))
+$(eval $(call AUTOTARGETS,xutil_util-macros,x11r7))
Index: package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_I810_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_I810_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-i810))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-i810,x11r7))
Index: package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
===================================================================
--- package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk	(revision 20086)
+++ package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk	(working copy)
@@ -10,4 +10,4 @@
 XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto

-$(eval $(call AUTOTARGETS,xdriver_xf86-video-vesa))
+$(eval $(call AUTOTARGETS,xdriver_xf86-video-vesa,x11r7))
Index: package/x11r7/openchrome/openchrome.mk
===================================================================
--- package/x11r7/openchrome/openchrome.mk	(revision 20086)
+++ package/x11r7/openchrome/openchrome.mk	(working copy)
@@ -12,4 +12,4 @@
 OPENCHROME_AUTORECONF = YES
 OPENCHROME_CONF_OPT = --enable-shared --disable-static

-$(eval $(call AUTOTARGETS,openchrome))
+$(eval $(call AUTOTARGETS,openchrome,x11r7))


---------------------

Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
