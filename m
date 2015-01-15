From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:41:42 +0100
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20150115084148.78AC4803E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0db263726f96047a052831050d00fdb089f2a20f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/alsa-lib.mk                 |   14 ++++++++------
 package/bcusdk/bcusdk.mk                     |   13 +++++++++----
 package/enlightenment/enlightenment.mk       |    7 ++++---
 package/fluxbox/fluxbox.mk                   |    5 +++--
 package/giblib/giblib.mk                     |    5 +++--
 package/jimtcl/jimtcl.mk                     |    7 ++++---
 package/libgtk3/libgtk3.mk                   |    8 +++++---
 package/libnspr/libnspr.mk                   |    5 +++--
 package/linknx/linknx.mk                     |    8 ++++++--
 package/schifra/schifra.mk                   |    5 +++--
 package/socat/socat.mk                       |    9 +++++----
 package/speex/speex.mk                       |    7 ++++---
 package/strace/strace.mk                     |    5 +++--
 package/uclibc/uclibc.mk                     |    5 +++--
 package/x11r7/xapp_xconsole/xapp_xconsole.mk |    5 +++--
 package/x11r7/xapp_xdm/xapp_xdm.mk           |    5 +++--
 package/x11r7/xapp_xlogo/xapp_xlogo.mk       |    5 +++--
 package/xerces/xerces.mk                     |    5 +++--
 18 files changed, 75 insertions(+), 48 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2890a38..16d184e 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -12,10 +12,11 @@ ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
 ALSA_LIB_AUTORECONF = YES
-ALSA_LIB_CONF_OPTS = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
-		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
-		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
-		    --without-versioned
+ALSA_LIB_CONF_OPTS = \
+	--with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
+	--with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
+	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
+	--without-versioned
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -73,7 +74,8 @@ ifeq ($(BR2_bfin),y)
 ALSA_LIB_CFLAGS += -Dversionsort=alphasort
 endif
 
-ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
-		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
+ALSA_LIB_CONF_ENV = \
+	CFLAGS="$(ALSA_LIB_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
 $(eval $(autotools-package))
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index bbf988d..80c98af 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -10,10 +10,15 @@ BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib
 BCUSDK_LICENSE = GPLv2+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
-BCUSDK_CONF_OPTS = --enable-onlyeibd --enable-ft12 --enable-pei16 \
-		 --enable-eibnetip --enable-eibnetipserver \
-		 --enable-eibnetiptunnel --without-pth-test \
-		 --with-pth=$(STAGING_DIR)/usr
+BCUSDK_CONF_OPTS = \
+	--enable-onlyeibd \
+	--enable-ft12 \
+	--enable-pei16 \
+	--enable-eibnetip \
+	--enable-eibnetipserver \
+	--enable-eibnetiptunnel \
+	--without-pth-test \
+	--with-pth=$(STAGING_DIR)/usr
 
 BCUSDK_DEPENDENCIES = libpthsem
 
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index a1ca4da..ddebe06 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -24,9 +24,10 @@ ENLIGHTENMENT_DEPENDENCIES = 	\
 	host-libeet		\
 	xcb-util-keysyms
 
-ENLIGHTENMENT_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
-			 --disable-rpath
+ENLIGHTENMENT_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--disable-rpath
 
 # uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 0340465..30255c4 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -10,8 +10,9 @@ FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBO
 FLUXBOX_LICENSE = MIT
 FLUXBOX_LICENSE_FILES = COPYING
 
-FLUXBOX_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		   --x-libraries=$(STAGING_DIR)/usr/lib
+FLUXBOX_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 8d11426..b0a9620 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -9,8 +9,9 @@ GIBLIB_SITE = http://linuxbrit.co.uk/downloads
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
-GIBLIB_CONF_OPTS = --with-imlib2-prefix=$(STAGING_DIR)/usr \
-		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
+GIBLIB_CONF_OPTS = \
+	--with-imlib2-prefix=$(STAGING_DIR)/usr \
+	--with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 GIBLIB_CONFIG_SCRIPTS = giblib-config
 GIBLIB_LICENSE = MIT
 GIBLIB_LICENSE_FILES = COPYING
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index d573276..75c0382 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -32,9 +32,10 @@ JIMTCL_INSTALL_LIB =
 else
 JIMTCL_SHARED = --shared
 JIMTCL_LIB = so.$(JIMTCL_VERSION)
-JIMTCL_INSTALL_LIB = $(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
-		     $(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
-		     ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
+JIMTCL_INSTALL_LIB = \
+	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
+	$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
+	ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
 endif
 
 define JIMTCL_CONFIGURE_CMDS
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index b406c09..07c669d 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -18,7 +18,8 @@ LIBGTK3_CONF_ENV = \
 	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
 	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/usr/bin/pkgconf
 
-LIBGTK3_CONF_OPTS = --disable-glibtest \
+LIBGTK3_CONF_OPTS = \
+	--disable-glibtest \
 	--enable-explicit-deps=no \
 	--enable-gtk2-dependency \
 	--disable-introspection
@@ -147,8 +148,9 @@ HOST_LIBGTK3_DEPENDENCIES = \
 	host-gdk-pixbuf \
 	host-pkgconf
 
-HOST_LIBGTK3_CFLAGS = $(shell $(HOST_DIR)/usr/bin/pkgconf \
-		      --cflags --libs gdk-pixbuf-2.0)
+HOST_LIBGTK3_CFLAGS = \
+	$(shell $(HOST_DIR)/usr/bin/pkgconf \
+	--cflags --libs gdk-pixbuf-2.0)
 
 define HOST_LIBGTK3_CONFIGURE_CMDS
 	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 702978c..c4f86cc 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -14,8 +14,9 @@ LIBNSPR_LICENSE = MPLv2.0
 LIBNSPR_LICENSE_FILES = nspr/LICENSE
 
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
-LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
-		   HOST_LDFLAGS="-lc"
+LIBNSPR_CONF_ENV = \
+	HOST_CFLAGS="-g -O2" \
+	HOST_LDFLAGS="-lc"
 # NSPR mixes up --build and --host
 LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index f117b9c..a7e6adb 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -8,8 +8,12 @@ LINKNX_VERSION = 0.0.1.32
 LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
 LINKNX_LICENSE = GPLv2+
 LINKNX_INSTALL_STAGING = YES
-LINKNX_CONF_OPTS = --without-lua --without-log4cpp --without-pth-test \
-		  --with-pth=$(STAGING_DIR)/usr --disable-smtp
+LINKNX_CONF_OPTS = \
+	--without-lua \
+	--without-log4cpp \
+	--without-pth-test \
+	--with-pth=$(STAGING_DIR)/usr \
+	--disable-smtp
 
 LINKNX_DEPENDENCIES = libpthsem
 
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index e55bf02..661ef04 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -11,8 +11,9 @@ SCHIFRA_INSTALL_STAGING = YES
 SCHIFRA_LICENSE = schifra license
 SCHIFRA_LICENSE_FILES = schifra_license.txt
 
-SCHIFRA_MAKE_OPTS = COMPILER="$(TARGET_CXX)" \
-		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+SCHIFRA_MAKE_OPTS = \
+	COMPILER="$(TARGET_CXX)" \
+	OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
 
 # The examples are the only buildable artefacts.
 ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 711e20e..bae4b4c 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -9,10 +9,11 @@ SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPLv2
 SOCAT_LICENSE_FILES = COPYING
-SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
-		 sc_cv_sys_crdly_shift=9 \
-		 sc_cv_sys_tabdly_shift=11 \
-		 sc_cv_sys_csize_shift=4
+SOCAT_CONF_ENV = \
+	sc_cv_termios_ispeed=no \
+	sc_cv_sys_crdly_shift=9 \
+	sc_cv_sys_tabdly_shift=11 \
+	sc_cv_sys_csize_shift=4
 
 # We need to run autoconf to regenerate the configure script, in order
 # to ensure that the test checking linux/ext2_fs.h works
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 0bf2de0..595ae16 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -11,9 +11,10 @@ SPEEX_LICENSE_FILES = COPYING
 
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = libogg
-SPEEX_CONF_OPTS = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
-		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
-		 --enable-fixed-point
+SPEEX_CONF_OPTS = \
+	--with-ogg-libraries=$(STAGING_DIR)/usr/lib \
+	--with-ogg-includes=$(STAGING_DIR)/usr/include \
+	--enable-fixed-point
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
 	SPEEX_CONF_OPTS += --enable-arm4-asm
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 2ac3b17..e1299aa 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,8 +10,9 @@ STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VE
 STRACE_LICENSE = BSD-3c
 STRACE_LICENSE_FILES = COPYING
 
-STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
-		  ac_cv_header_linux_netlink_h=yes
+STRACE_CONF_ENV = \
+	ac_cv_header_linux_if_packet_h=yes \
+	ac_cv_header_linux_netlink_h=yes
 
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index d3b11f6..8654926 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -54,8 +54,9 @@ ifeq ($(UCLIBC_GENERATE_LOCALES),)
 UCLIBC_LOCALES = en_US
 else
 # Strip out the encoding part of locale names, if any
-UCLIBC_LOCALES = $(foreach locale,$(UCLIBC_GENERATE_LOCALES),\
-		   $(firstword $(subst .,$(space),$(locale))))
+UCLIBC_LOCALES = \
+	$(foreach locale,$(UCLIBC_GENERATE_LOCALES),\
+	$(firstword $(subst .,$(space),$(locale))))
 endif
 
 #
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index b04b737..971b1b3 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -9,7 +9,8 @@ XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.bz2
 XAPP_XCONSOLE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
 XAPP_XCONSOLE_LICENSE_FILES = COPYING
-XAPP_XCONSOLE_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXt xproto_xproto \
-			     xlib_libXmu
+XAPP_XCONSOLE_DEPENDENCIES = \
+	xlib_libX11 xlib_libXaw xlib_libXt xproto_xproto \
+	xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 955dc1c..8f846a8 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -11,8 +11,9 @@ XAPP_XDM_LICENSE = MIT
 XAPP_XDM_LICENSE_FILES = COPYING
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
-XAPP_XDM_CONF_OPTS = --with-utmp-file=/var/adm/utmpx \
-		    --with-wtmp-file=/var/adm/wtmpx
+XAPP_XDM_CONF_OPTS = \
+	--with-utmp-file=/var/adm/utmpx \
+	--with-wtmp-file=/var/adm/wtmpx
 
 define XAPP_XDM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index af5b222..380acfc 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -9,7 +9,8 @@ XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOGO_LICENSE = MIT
 XAPP_XLOGO_LICENSE_FILES = COPYING
-XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXrender \
-			  xlib_libXft host-pkgconf
+XAPP_XLOGO_DEPENDENCIES = \
+	xlib_libXaw xlib_libXrender \
+	xlib_libXft host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 9b2bb81..59b8d8a 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -11,8 +11,9 @@ XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
-XERCES_CONF_OPTS = --disable-threads \
-		  --with-gnu-ld
+XERCES_CONF_OPTS = \
+	--disable-threads \
+	--with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XERCES_CONF_ENV += LIBS=-liconv
