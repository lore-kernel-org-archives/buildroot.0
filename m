From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 04:53:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/speex
	blackbox ethtool fbdump font etc...
Message-ID: <20081020115317.3C0193C7FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 04:53:16 -0700 (Mon, 20 Oct 2008)
New Revision: 23744

Log:
package/: remove redundant install-strip in *_TARGET_INSTALL_OPT

It's default now.

Modified:
   trunk/buildroot/package/audio/speex/speex.mk
   trunk/buildroot/package/blackbox/blackbox.mk
   trunk/buildroot/package/ethtool/ethtool.mk
   trunk/buildroot/package/fbdump/fbdump.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/haserl/haserl.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/iptables/iptables.mk
   trunk/buildroot/package/libconfig/libconfig.mk
   trunk/buildroot/package/libconfuse/libconfuse.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libupnp/libupnp.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/netcat/netcat.mk
   trunk/buildroot/package/pcre/pcre.mk
   trunk/buildroot/package/pixman/pixman.mk
   trunk/buildroot/package/popt/popt.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/rsync/rsync.mk
   trunk/buildroot/package/sawman/sawman.mk
   trunk/buildroot/package/sdl_net/sdl_net.mk
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk
   trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk
   trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk
   trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk
   trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/audio/speex/speex.mk
===================================================================
--- trunk/buildroot/package/audio/speex/speex.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/audio/speex/speex.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,6 @@
 SPEEX_AUTORECONF = NO
 SPEEX_INSTALL_STAGING = YES
 SPEEX_INSTALL_TARGET = YES
-SPEEX_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
 		 --with-ogg-includes=$(STAGING_DIR)/usr/include \

Modified: trunk/buildroot/package/blackbox/blackbox.mk
===================================================================
--- trunk/buildroot/package/blackbox/blackbox.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/blackbox/blackbox.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,7 +10,6 @@
 BLACKBOX_AUTORECONF:=NO
 BLACKBOX_INSTALL_STAGING:=NO
 BLACKBOX_INSTALL_TARGET:=YES
-BLACKBOX_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib

Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,8 +10,6 @@
 ETHTOOL_AUTORECONF:=no
 ETHTOOL_INSTALL_STAGING:=NO
 ETHTOOL_INSTALL_TARGET:=YES
-ETHTOOL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
-ETHTOOL_UNINSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) uninstall
 
 ETHTOOL_DEPENDENCIES:=uclibc
 

Modified: trunk/buildroot/package/fbdump/fbdump.mk
===================================================================
--- trunk/buildroot/package/fbdump/fbdump.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/fbdump/fbdump.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,6 @@
 FBDUMP_AUTORECONF = NO
 FBDUMP_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
 FBDUMP_INSTALL_TARGET = YES
-FBDUMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 $(eval $(call AUTOTARGETS,package,fbdump))
 

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,8 +10,6 @@
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
 
-FONTCONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
-
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
 		--with-expat="$(STAGING_DIR)/usr/lib" \

Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/haserl/haserl.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -11,7 +11,9 @@
 HASERL_AUTORECONF:=no
 HASERL_INSTALL_STAGING:=NO
 HASERL_INSTALL_TARGET:=YES
+ifeq ($(BR2_ENABLE_DEBUG),)
 HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
+endif
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh

Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/iperf/iperf.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,7 +10,6 @@
 IPERF_AUTORECONF:=NO
 IPERF_INSTALL_STAGING:=NO
 IPERF_INSTALL_TARGET:=YES
-IPERF_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 IPERF_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes
 IPERF_CONF_OPT:=--disable-dependency-tracking --disable-web100 $(DISABLE_IPV6)
 

Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/iptables/iptables.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,6 @@
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib
 IPTABLES_INSTALL_TARGET = YES
-IPTABLES_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES =

Modified: trunk/buildroot/package/libconfig/libconfig.mk
===================================================================
--- trunk/buildroot/package/libconfig/libconfig.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/libconfig/libconfig.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,6 @@
 LIBCONFIG_AUTORECONF:=NO
 LIBCONFIG_INSTALL_STAGING:=YES
 LIBCONFIG_INSTALL_TARGET:=YES
-LIBCONFIG_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPT:=--disable-cxx

Modified: trunk/buildroot/package/libconfuse/libconfuse.mk
===================================================================
--- trunk/buildroot/package/libconfuse/libconfuse.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/libconfuse/libconfuse.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,6 @@
 LIBCONFUSE_AUTORECONF:=NO
 LIBCONFUSE_INSTALL_STAGING:=YES
 LIBCONFUSE_INSTALL_TARGET:=YES
-LIBCONFUSE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 LIBCONFUSE_CONF_OPT:=--enable-shared --disable-rpath $(DISABLE_NLS)
 

Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,7 +10,6 @@
 LIBDAEMON_AUTORECONF:=no
 LIBDAEMON_INSTALL_STAGING:=YES
 LIBDAEMON_INSTALL_TARGET:=YES
-LIBDAEMON_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT:=--disable-lynx $(DISABLE_NLS) $(DISABLE_LARGEFILE)
 

Modified: trunk/buildroot/package/libupnp/libupnp.mk
===================================================================
--- trunk/buildroot/package/libupnp/libupnp.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/libupnp/libupnp.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -8,6 +8,5 @@
 LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pupnp
 
 LIBUPNP_INSTALL_STAGING:=YES
-LIBUPNP_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 $(eval $(call AUTOTARGETS,package,libupnp))

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -8,7 +8,6 @@
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
-LIBXML2_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"

Modified: trunk/buildroot/package/netcat/netcat.mk
===================================================================
--- trunk/buildroot/package/netcat/netcat.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/netcat/netcat.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,7 +10,6 @@
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
-NETCAT_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 NETCAT_CONF_OPT:= $(DISABLE_NLS)
 
 NETCAT_DEPENDENCIES = uclibc

Modified: trunk/buildroot/package/pcre/pcre.mk
===================================================================
--- trunk/buildroot/package/pcre/pcre.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/pcre/pcre.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -8,7 +8,6 @@
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
 PCRE_INSTALL_TARGET = YES
-PCRE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available

Modified: trunk/buildroot/package/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/pixman/pixman.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/pixman/pixman.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -8,7 +8,5 @@
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
 PIXMAN_INSTALL_STAGING = YES
-PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
-PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 $(eval $(call AUTOTARGETS,package,pixman))

Modified: trunk/buildroot/package/popt/popt.mk
===================================================================
--- trunk/buildroot/package/popt/popt.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/popt/popt.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -8,7 +8,6 @@
 POPT_INSTALL_STAGING:=YES
 POPT_INSTALL_TARGET:=YES
 POPT_CONF_ENV:=ac_cv_va_copy=yes
-POPT_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
 POPT_DEPENDENCIES:=uclibc
 

Modified: trunk/buildroot/package/psmisc/psmisc.mk
===================================================================
--- trunk/buildroot/package/psmisc/psmisc.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/psmisc/psmisc.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,6 @@
 PSMISC_AUTORECONF:=no
 PSMISC_INSTALL_STAGING:=no
 PSMISC_INSTALL_TARGET:=YES
-PSMISC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 PSMISC_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes \
 		 ac_cv_func_realloc_0_nonnull=yes
 PSMISC_CONF_OPT:= $(DISABLE_NLS) $(DISABLE_IPV6)

Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/rsync/rsync.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -10,8 +10,10 @@
 RSYNC_AUTORECONF:=no
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
+ifeq ($(BR2_ENABLE_DEBUG),)
 RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  STRIPPROG="$(TARGET_STRIP)" install-strip
+endif
 RSYNC_CONF_OPT:=--with-included-popt
 
 RSYNC_DEPENDENCIES:=uclibc

Modified: trunk/buildroot/package/sawman/sawman.mk
===================================================================
--- trunk/buildroot/package/sawman/sawman.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/sawman/sawman.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,7 +9,11 @@
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_INSTALL_TARGET = YES
 SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
+ifeq ($(BR2_ENABLE_DEBUG),y)
+SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+else
 SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install-strip
+endif
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS,package,sawman))

Modified: trunk/buildroot/package/sdl_net/sdl_net.mk
===================================================================
--- trunk/buildroot/package/sdl_net/sdl_net.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/sdl_net/sdl_net.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -11,7 +11,6 @@
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
 SDL_NET_INSTALL_STAGING = YES
-SDL_NET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 SDL_NET_DEPENDENCIES = sdl
 

Modified: trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = NO
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_INSTALL_TARGET = YES
-XLIB_LIBX11_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
 XLIB_LIBX11_CONF_ENV = ac_cv_func_mmap_fixed_mapped=yes CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
 XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static

Modified: trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libXaw/xlib_libXaw.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_AUTORECONF = NO
 XLIB_LIBXAW_INSTALL_STAGING = YES
-XLIB_LIBXAW_INSTALL_TARGET = YES
-XLIB_LIBXAW_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
 XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static
 

Modified: trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_AUTORECONF = NO
 XLIB_LIBXEXT_INSTALL_STAGING = YES
-XLIB_LIBXEXT_INSTALL_TARGET = YES
-XLIB_LIBXEXT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
 

Modified: trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = NO
 XLIB_LIBXFONT_INSTALL_STAGING = YES
-XLIB_LIBXFONT_INSTALL_TARGET = YES
-XLIB_LIBXFONT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static
 

Modified: trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFT_AUTORECONF = NO
 XLIB_LIBXFT_INSTALL_STAGING = YES
-XLIB_LIBXFT_INSTALL_TARGET = YES
-XLIB_LIBXFT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 XLIB_LIBXFT_CONF_OPT = --enable-shared --disable-static
 

Modified: trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libXi/xlib_libXi.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_AUTORECONF = NO
 XLIB_LIBXI_INSTALL_STAGING = YES
-XLIB_LIBXI_INSTALL_TARGET = YES
-XLIB_LIBXI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
 

Modified: trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -9,8 +9,6 @@
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = NO
 XLIB_LIBXT_INSTALL_STAGING = YES
-XLIB_LIBXT_INSTALL_TARGET = YES
-XLIB_LIBXT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb
 XLIB_LIBXT_CONF_ENV = CC_FOR_BUILD="/usr/bin/gcc -I$(STAGING_DIR)/usr/include"
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static --disable-install-makestrs

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-10-20 11:53:08 UTC (rev 23743)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-10-20 11:53:16 UTC (rev 23744)
@@ -52,7 +52,6 @@
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
-XSERVER_XORG_SERVER_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 # Optional packages
 ifeq ($(strip $(BR2_PACKAGE_TSLIB)),y)
