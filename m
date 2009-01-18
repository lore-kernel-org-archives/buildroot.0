From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sun, 18 Jan 2009 09:26:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: bridge-utils gmpc
	libconfuse libcurl lib etc...
Message-ID: <20090118092629.CF61277108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-18 09:26:28 +0000 (Sun, 18 Jan 2009)
New Revision: 24897

Log:
Getting rid of a bit more  configure options that's been centralized.


Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk
   trunk/buildroot/package/gmpc/gmpc.mk
   trunk/buildroot/package/libconfuse/libconfuse.mk
   trunk/buildroot/package/libcurl/libcurl.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libxml2/libxml2.mk
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
   trunk/buildroot/package/multimedia/speex/speex.mk
   trunk/buildroot/package/netcat/netcat.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/rpm/rpm.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -11,7 +11,7 @@
 BRIDGE_INSTALL_STAGING:=NO
 BRIDGE_INSTALL_TARGET:=YES
 BRIDGE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
-BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR) $(DISABLE_NLS)
+BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR)
 BRIDGE_DEPENDENCIES:=uclibc
 
 $(eval $(call AUTOTARGETS,package,bridge))

Modified: trunk/buildroot/package/gmpc/gmpc.mk
===================================================================
--- trunk/buildroot/package/gmpc/gmpc.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/gmpc/gmpc.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -8,7 +8,7 @@
 GMPC_SITE = http://download.sarine.nl/download/Programs/gmpc/$(GMPC_VERSION)/
 GMPC_LIBTOOL_PATCH = NO
 GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes
-GMPC_CONF_OPT = --disable-mmkeys $(DISABLE_NLS)
+GMPC_CONF_OPT = --disable-mmkeys
 
 
 GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd

Modified: trunk/buildroot/package/libconfuse/libconfuse.mk
===================================================================
--- trunk/buildroot/package/libconfuse/libconfuse.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/libconfuse/libconfuse.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -10,7 +10,7 @@
 LIBCONFUSE_INSTALL_STAGING:=YES
 LIBCONFUSE_INSTALL_TARGET:=YES
 
-LIBCONFUSE_CONF_OPT:=--enable-shared --disable-rpath $(DISABLE_NLS)
+LIBCONFUSE_CONF_OPT:=--enable-shared --disable-rpath
 
 LIBCONFUSE_DEPENDENCIES = uclibc
 

Modified: trunk/buildroot/package/libcurl/libcurl.mk
===================================================================
--- trunk/buildroot/package/libcurl/libcurl.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/libcurl/libcurl.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -8,7 +8,7 @@
 LIBCURL_SITE = http://curl.haxx.se/download/
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols \
-		   $(DISABLE_NLS) $(DISABLE_LARGEFILE) $(DISABLE_IPV6)
+		   $(DISABLE_IPV6)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl

Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -11,7 +11,7 @@
 LIBDAEMON_INSTALL_STAGING:=YES
 LIBDAEMON_INSTALL_TARGET:=YES
 LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
-LIBDAEMON_CONF_OPT:=--disable-lynx $(DISABLE_NLS) $(DISABLE_LARGEFILE)
+LIBDAEMON_CONF_OPT:=--disable-lynx 
 
 LIBDAEMON_DEPENDENCIES:=uclibc pkgconfig
 

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -75,7 +75,6 @@
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \
-		$(DISABLE_LARGEFILE) \
 		$(LIBGTK2_CONF_OPT_X)  \
 		$(LIBGTK2_CONF_OPT_DFB)
 

Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -16,7 +16,7 @@
 LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
 		--enable-static $(DISABLE_IPV6) \
 		--without-debugging --without-python \
-		--without-threads $(DISABLE_NLS)
+		--without-threads 
 
 LIBXML2_DEPENDENCIES = uclibc
 

Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/lzo/lzo.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -11,7 +11,6 @@
 LZO_INSTALL_TARGET = YES
 LZO_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install
 LZO_CONF_ENV =
-LZO_CONF_OPT = $(DISABLE_LARGEFILE)
 LZO_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,lzo))

Modified: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -19,8 +19,6 @@
 endif
 
 GSTREAMER_CONF_OPT = \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
 		--disable-examples \
 		--disable-tests \
 		--disable-failing-tests

Modified: trunk/buildroot/package/multimedia/speex/speex.mk
===================================================================
--- trunk/buildroot/package/multimedia/speex/speex.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/multimedia/speex/speex.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -12,7 +12,7 @@
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
 		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
-		 --enable-fixed-point $(DISABLE_NLS)
+		 --enable-fixed-point 
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
 	SPEEX_CONF_OPT += --enable-arm4-asm

Modified: trunk/buildroot/package/netcat/netcat.mk
===================================================================
--- trunk/buildroot/package/netcat/netcat.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/netcat/netcat.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -10,7 +10,6 @@
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
-NETCAT_CONF_OPT:= $(DISABLE_NLS)
 
 NETCAT_DEPENDENCIES = uclibc
 

Modified: trunk/buildroot/package/psmisc/psmisc.mk
===================================================================
--- trunk/buildroot/package/psmisc/psmisc.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/psmisc/psmisc.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -11,7 +11,7 @@
 PSMISC_INSTALL_TARGET:=YES
 PSMISC_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes \
 		 ac_cv_func_realloc_0_nonnull=yes
-PSMISC_CONF_OPT:= $(DISABLE_NLS) $(DISABLE_IPV6)
+PSMISC_CONF_OPT:= $(DISABLE_IPV6)
 PSMISC_DEPENDENCIES:=uclibc ncurses
 
 ifeq ($(BR2_ENABLE_LOCALE),y)

Modified: trunk/buildroot/package/rpm/rpm.mk
===================================================================
--- trunk/buildroot/package/rpm/rpm.mk	2009-01-18 00:05:57 UTC (rev 24896)
+++ trunk/buildroot/package/rpm/rpm.mk	2009-01-18 09:26:28 UTC (rev 24897)
@@ -20,8 +20,7 @@
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR) \
 	--with-mutex=UNIX/fcntl \
-	--with-bzip2 \
-	$(DISABLE_NLS)
+	--with-bzip2
 
 RPM_MAKE_OPT = -j1
 
