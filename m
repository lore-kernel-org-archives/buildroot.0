From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 15:26:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/asterisk
	package/aumix package/a etc...
Message-ID: <20070811222657.30C61A613D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 15:26:56 -0700 (Sat, 11 Aug 2007)
New Revision: 19444

Log:
Use STAGING_DIR/usr/lib instead of STAGING_DIR/lib

Modified:
   trunk/buildroot/package/asterisk/asterisk.mk
   trunk/buildroot/package/aumix/aumix.mk
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/curl/curl.mk
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/hotplug/hotplug.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/mpatrol/mpatrol.mk
   trunk/buildroot/package/mplayer/mplayer.mk
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/package/vpnc/vpnc.mk
   trunk/buildroot/package/xerces/xerces.mk
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/asterisk/asterisk.mk
===================================================================
--- trunk/buildroot/package/asterisk/asterisk.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/asterisk/asterisk.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -31,7 +31,7 @@
 	$(STRIP) $(TARGET_DIR)/usr/sbin/streamplayer
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/asterisk/modules/*.so
 	$(INSTALL) -m 755 $(ASTERISK_DIR)/contrib/init.d/rc.debian.asterisk $(TARGET_DIR)/etc/init.d/S60asterisk
-	mv $(TARGET_DIR)/usr/include/asterisk $(STAGING_DIR)/include/
+	mv $(TARGET_DIR)/usr/include/asterisk $(STAGING_DIR)/usr/include/
 	rm -Rf $(TARGET_DIR)/usr/share/man
 	rm -f $(TARGET_DIR)/usr/sbin/safe_asterisk
 	rm -f $(TARGET_DIR)/usr/sbin/autosupport
@@ -43,7 +43,7 @@
 asterisk-source: $(DL_DIR)/$(ASTERISK_SOURCE)
 
 asterisk-clean:
-	rm -Rf $(STAGING_DIR)/include/asterisk
+	rm -Rf $(STAGING_DIR)/usr/include/asterisk
 	rm -Rf $(TARGET_DIR)/etc/asterisk
 	rm -Rf $(TARGET_DIR)/usr/lib/asterisk
 	rm -Rf $(TARGET_DIR)/var/lib/asterisk

Modified: trunk/buildroot/package/aumix/aumix.mk
===================================================================
--- trunk/buildroot/package/aumix/aumix.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/aumix/aumix.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -28,7 +28,7 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		--libdir=$(STAGING_DIR)/lib \
-		--includedir=$(STAGING_DIR)/include \
+		--includedir=$(STAGING_DIR)/usr/include \
 		--without-gtk \
 		--without-gtk1 \
 		--without-alsa \

Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -4,10 +4,10 @@
 #
 #############################################################
 #
-# This program is free software; you can redistribute it 
-# and/or modify it under the terms of the GNU Lesser General 
-# Public License as published by the Free Software Foundation; 
-# either version 2.1 of the License, or (at your option) any 
+# This program is free software; you can redistribute it
+# and/or modify it under the terms of the GNU Lesser General
+# Public License as published by the Free Software Foundation;
+# either version 2.1 of the License, or (at your option) any
 # later version.
 
 AVAHI_VERSION:=0.6.19
@@ -48,7 +48,7 @@
 	(cd $(AVAHI_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		LIBDAEMON_CFLAGS="-I$(STAGING_DIR)/include" \
+		LIBDAEMON_CFLAGS="-I$(STAGING_DIR)/usr/include" \
 		LIBDAEMON_LIBS="-L$(STAGING_DIR)/lib -ldaemon" \
 		ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
@@ -116,7 +116,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \

Modified: trunk/buildroot/package/berkeleydb/berkeleydb.mk
===================================================================
--- trunk/buildroot/package/berkeleydb/berkeleydb.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/berkeleydb/berkeleydb.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -36,7 +36,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-gnu-ld \
@@ -47,7 +47,7 @@
 		--disable-tcl \
 		--disable-compat185 \
 		--with-pic \
-	        $(DISABLE_LARGEFILE) \
+		$(DISABLE_LARGEFILE) \
 	);
 	$(SED) 's/\.lo/.o/g' $(DB_DIR)/build_unix/Makefile
 	touch $(DB_DIR)/.configured
@@ -70,7 +70,7 @@
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libdb*so*
 
 $(TARGET_DIR)/usr/lib/libdb.a: $(STAGING_DIR)/lib/libdb-$(DB_SO_VERSION).a
-	cp -dpf $(STAGING_DIR)/include/db.h $(TARGET_DIR)/usr/include/
+	cp -dpf $(STAGING_DIR)/usr/include/db.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/lib/libdb*.a $(TARGET_DIR)/usr/lib/
 	cp -dpf $(STAGING_DIR)/lib/libdb*.la $(TARGET_DIR)/usr/lib/
 	touch -c $(TARGET_DIR)/usr/lib/libdb.a

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/cairo/cairo.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -95,13 +95,13 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/include \
+		--x-includes=$(STAGING_DIR)/usr/include \
 		--x-libraries=$(STAGING_DIR)/lib \
 		--enable-ps=yes \
 		--enable-pdf=yes \

Modified: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/curl/curl.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -63,7 +63,7 @@
 	rm -f $(TARGET_DIR)/usr/bin/curl
 	rm -f $(STAGING_DIR)/bin/curl*
 	rm -f $(STAGING_DIR)/lib/libcurl.so*
-	rm -rf $(STAGING_DIR)/include/curl
+	rm -rf $(STAGING_DIR)/usr/include/curl
 	-$(MAKE) -C $(CURL_DIR) clean
 
 curl-dirclean:

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -30,7 +30,7 @@
 		have_abstract_sockets=yes \
 		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
-		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/include/glib-2.0 -I$(STAGING_DIR)/lib/glib-2.0/include" \
+		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
 		PKG_CONFIG=/usr/bin/pkg-config \
 		./configure \

Modified: trunk/buildroot/package/dmalloc/dmalloc.mk
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/dmalloc/dmalloc.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -58,7 +58,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shlib \
@@ -84,14 +84,14 @@
 
 dmalloc: uclibc $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 
-dmalloc-clean: 
+dmalloc-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
 	rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
-	rm -f $(STAGING_DIR)/include/dmalloc.h
+	rm -f $(STAGING_DIR)/usr/include/dmalloc.h
 	rm -f $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 	$(MAKE) -C $(DMALLOC_DIR) clean
 
-dmalloc-dirclean: 
+dmalloc-dirclean:
 	rm -rf $(DMALLOC_DIR)
 
 

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -38,7 +38,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	);
@@ -53,7 +53,7 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libfreetype.la
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/include\',g" \
+		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
 		$(STAGING_DIR)/usr/bin/freetype-config
 	touch -c $(STAGING_DIR)/lib/libfreetype.so

Modified: trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
===================================================================
--- trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -100,11 +100,11 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/include \
+		--x-includes=$(STAGING_DIR)/usr/include \
 		--x-libraries=$(STAGING_DIR)/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \

Modified: trunk/buildroot/package/hal/hal.mk
===================================================================
--- trunk/buildroot/package/hal/hal.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/hal/hal.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -11,7 +11,7 @@
 HAL_BINARY:=hald/hald
 HAL_TARGET_BINARY:=usr/sbin/hald
 
-GLIB_CFLAGS:=-I$(STAGING_DIR)/include/glib-2.0 \
+GLIB_CFLAGS:=-I$(STAGING_DIR)/usr/include/glib-2.0 \
 	     -I$(STAGING_DIR)/lib/glib/include
 GLIB_LIBS:=$(STAGING_DIR)/lib/libglib-2.0.so	\
 	   $(STAGING_DIR)/lib/libgmodule-2.0.so \
@@ -69,6 +69,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rm -rf $(TARGET_DIR)/usr/share/hal/device-manager
 	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig
+	# remove _everything_ in $(TARGET_DIR)/usr/include?
 	rm -rf $(TARGET_DIR)/usr/include
 	rm -rf $(TARGET_DIR)/usr/lib/libhal*.so
 	rm -rf $(TARGET_DIR)/usr/lib/libhal*.la

Modified: trunk/buildroot/package/hotplug/hotplug.mk
===================================================================
--- trunk/buildroot/package/hotplug/hotplug.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/hotplug/hotplug.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -15,7 +15,7 @@
 
 $(HOTPLUG_DIR)/hotplug: $(HOTPLUG_DIR)
 	$(MAKE) CROSS=$(TARGET_CROSS) DEBUG=false KLIBC=false \
-	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/include \
+	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
 	    TARGET_DIR=$(TARGET_DIR) -C $(HOTPLUG_DIR);
 	$(STRIP) $(HOTPLUG_DIR)/hotplug;
 	touch -c $(HOTPLUG_DIR)/hotplug

Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/iperf/iperf.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -42,7 +42,7 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/include \
+		--includedir=$(STAGING_DIR)/usr/include \
 	);
 	touch $(IPERF_DIR)/.configured
 

Modified: trunk/buildroot/package/libglib12/libglib12.mk
===================================================================
--- trunk/buildroot/package/libglib12/libglib12.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/libglib12/libglib12.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -38,7 +38,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
@@ -60,7 +60,7 @@
 	    sharedstatedir=$(STAGING_DIR)/com \
 	    localstatedir=$(STAGING_DIR)/var \
 	    libdir=$(STAGING_DIR)/lib \
-	    includedir=$(STAGING_DIR)/include \
+	    includedir=$(STAGING_DIR)/usr/include \
 	    oldincludedir=$(STAGING_DIR)/include \
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \

Modified: trunk/buildroot/package/libgtk12/libgtk12.mk
===================================================================
--- trunk/buildroot/package/libgtk12/libgtk12.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/libgtk12/libgtk12.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -40,7 +40,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
@@ -68,7 +68,7 @@
 	    sharedstatedir=$(STAGING_DIR)/com \
 	    localstatedir=$(STAGING_DIR)/var \
 	    libdir=$(STAGING_DIR)/lib \
-	    includedir=$(STAGING_DIR)/include \
+	    includedir=$(STAGING_DIR)/usr/include \
 	    oldincludedir=$(STAGING_DIR)/include \
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -88,7 +88,7 @@
 	# The following is an truely evil hack!
 	# I dont yet understand why configure is not doing this right
 	# TODO: also remove 'odd-include-problem.patch' when this is fixed
-	$(SED) "s,^GDK_DEP_CFLAGS=.*,GDK_DEP_CFLAGS=\'-pthread -I$(STAGING_DIR)/include/glib-2.0 -I$(STAGING_DIR)/lib/glib-2.0/include -I$(STAGING_DIR)/include/pango-1.0 -I$(STAGING_DIR)/include/cairo\',g" $(LIBGTK2_DIR)/configure
+	$(SED) "s,^GDK_DEP_CFLAGS=.*,GDK_DEP_CFLAGS=\'-pthread -I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/lib/glib-2.0/include -I$(STAGING_DIR)/usr/include/pango-1.0 -I$(STAGING_DIR)/usr/include/cairo\',g" $(LIBGTK2_DIR)/configure
 	$(SED) "s,^GDK_DEP_LIBS=.*,GDK_DEP_LIBS=\'-L$(STAGING_DIR)/lib -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lfontconfig -lXext -lXrender -lX11 -lXinerama -lXrandr -lXcursor -lXfixes -lXft -lm\',g" $(LIBGTK2_DIR)/configure
 	(cd $(LIBGTK2_DIR); rm -rf config.cache; \
 		$(LIBGTK2_BUILD_ENV) \
@@ -105,13 +105,13 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/include \
+		--x-includes=$(STAGING_DIR)/usr/include \
 		--x-libraries=$(STAGING_DIR)/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \

Modified: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -48,8 +48,8 @@
 liblockfile-clean:
 	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
 	rm -f $(STAGING_DIR)/lib/liblockfile*
-	rm -f $(STAGING_DIR)/include/lockfile.h
-	rm -f $(STAGING_DIR)/include/mailfile.h
+	rm -f $(STAGING_DIR)/usr/include/lockfile.h
+	rm -f $(STAGING_DIR)/usr/include/mailfile.h
 	rm -rf $(STAGING_DIR)/man
 	$(MAKE) -C $(LIBLOCKFILE_DIR) clean
 

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -48,7 +48,7 @@
 
 libusb-clean:
 	rm -f $(STAGING_DIR)/bin/libusb-config
-	rm -f $(STAGING_DIR)/includes/usb*.h
+	rm -f $(STAGING_DIR)/usr/includes/usb*.h
 	rm -f $(STAGING_DIR)/lib/libusb*
 	rm -rf $(STAGING_DIR)/lib/pkgconfig
 	rm -f $(TARGET_DIR)/usr/lib/libusb*

Modified: trunk/buildroot/package/mpatrol/mpatrol.mk
===================================================================
--- trunk/buildroot/package/mpatrol/mpatrol.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/mpatrol/mpatrol.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -62,22 +62,22 @@
 		ln -sf libpthread.so.0 $(TARGET_DIR)/lib/libpthread.so; fi
 	(cd $(MPATROL_DIR); \
 		cp -dpf bin/mp* bin/hexwords $(TARGET_DIR)/usr/bin; \
-		cp -dpf src/mp*.h $(STAGING_DIR)/include; \
-		mkdir -p $(STAGING_DIR)/include/mpatrol; \
-		cp -dpf tools/*.h $(STAGING_DIR)/include/mpatrol)
+		cp -dpf src/mp*.h $(STAGING_DIR)/usr/include; \
+		mkdir -p $(STAGING_DIR)/usr/include/mpatrol; \
+		cp -dpf tools/*.h $(STAGING_DIR)/usr/include/mpatrol)
 	touch $(TARGET_DIR)/$(MPATROL_TARGET_BINARY)
 
 mpatrol: uclibc $(MPATROL_SYMBOL_DEPS) $(TARGET_DIR)/$(MPATROL_TARGET_BINARY)
 
-mpatrol-clean: 
+mpatrol-clean:
 	(cd $(TARGET_DIR)/usr/lib; rm -f libmpatrol* libmpalloc*)
 	(cd $(TARGET_DIR)/usr/bin; \
 		rm -f mpatrol mprof mptrace mleak mpsym mpedit hexwords)
-	(cd $(STAGING_DIR)/include; \
+	(cd $(STAGING_DIR)/usr/include; \
 		rm -rf mpatrol.h mpalloc.h mpdebug.h mpatrol)
 	$(MAKE) -C $(MPATROL_DIR)/build/unix clobber
 
-mpatrol-dirclean: 
+mpatrol-dirclean:
 	rm -rf $(MPATROL_DIR)
 
 

Modified: trunk/buildroot/package/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/mplayer/mplayer.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/mplayer/mplayer.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -38,7 +38,7 @@
 		--host-cc=$(HOSTCC) \
 		--cc=$(TARGET_CC) \
 		--as=$(TARGET_CROSS)as \
-		--with-extraincdir=$(STAGING_DIR)/include \
+		--with-extraincdir=$(STAGING_DIR)/usr/include \
 		--with-extralibdir=$(STAGING_DIR)/lib \
 		--enable-mad \
 		--enable-fbdev \

Modified: trunk/buildroot/package/mtd/20061007/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20061007/mtd.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/mtd/20061007/mtd.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -84,7 +84,7 @@
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
-	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/include $(TARGET_CFLAGS)" \
+	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
 		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/pango/pango.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -100,13 +100,13 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
 		--enable-static \
 		--with-x \
-		--x-includes=$(STAGING_DIR)/include \
+		--x-includes=$(STAGING_DIR)/usr/include \
 		--x-libraries=$(STAGING_DIR)/lib \
 		--disable-glibtest \
 		--enable-explicit-deps=no \

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/python/python.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -61,7 +61,7 @@
 $(PYTHON_DIR)/$(PYTHON_BINARY): $(PYTHON_DIR)/.configured
 	export PYTHON_DISABLE_SSL=1
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
-		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
+		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
@@ -71,7 +71,7 @@
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
-		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
+		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/sed/sed.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -116,7 +116,6 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--include=$(STAGING_DIR)/include \
 		--include=$(STAGING_DIR)/usr/include \
 		$(DISABLE_NLS) \
 	);

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -1,6 +1,6 @@
 #############################################################
 #
-# tcpdump 
+# tcpdump
 #
 #############################################################
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
@@ -42,7 +42,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-build-cc="$(HOSTCC)" \
@@ -56,7 +56,7 @@
 	$(MAKE) CC="$(TARGET_CC)" \
 		LDFLAGS="-L$(STAGING_DIR)/lib" \
 		LIBS="-lpcap" \
-		INCLS="-I. -I$(STAGING_DIR)/include" \
+		INCLS="-I. -I$(STAGING_DIR)/usr/include" \
 		-C $(TCPDUMP_DIR)
 
 $(TARGET_DIR)/sbin/tcpdump: $(TCPDUMP_DIR)/tcpdump

Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -40,16 +40,16 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
 		--enable-static \
 		--disable-cxx \
 		--without-x \
-		--with-jpeg-include-dir=$(STAGING_DIR)/include \
+		--with-jpeg-include-dir=$(STAGING_DIR)/usr/include \
 		--with-jpeg-lib-dir=$(STAGING_DIR)/lib \
-		--with-zlib-include-dir=$(STAGING_DIR)/include \
+		--with-zlib-include-dir=$(STAGING_DIR)/usr/include \
 		--with-zlib-lib-dir=$(STAGING_DIR)/lib \
 	);
 	touch $(TIFF_DIR)/.configured

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/udev/udev.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -63,7 +63,7 @@
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="extras/volume_id" -C $(UDEV_DIR)
-	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/include/libvolume_id.h
+	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/usr/include/libvolume_id.h
 	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.0.72.0 $(STAGING_DIR)/usr/lib/libvolume_id.so.0.72.0
 	-ln -sf libvolume_id.so.0.72.0 $(STAGING_DIR)/usr/lib/libvolume_id.so.0
 	-ln -sf libvolume_id.so.0 $(STAGING_DIR)/usr/lib/libvolume_id.so
@@ -77,7 +77,7 @@
 udev-volume_id: udev $(TARGET_DIR)/lib/udev/vol_id
 
 udev-volume_id-clean:
-	rm -f $(STAGING_DIR)/include/libvolume_id.h
+	rm -f $(STAGING_DIR)/usr/include/libvolume_id.h
 	rm -f $(STAGING_DIR)/usr/lib/libvolume_id.so*
 	rm -f $(TARGET_DIR)/usr/lib/libvolume_id.so.0*
 	rm -f $(TARGET_DIR)/lib/udev/vol_id

Modified: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -27,17 +27,18 @@
 
 $(VPNC_BINARY): $(VPNC_DIR)/.configured
 	rm -f $@
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/include	CC=$(TARGET_CC) -C $(VPNC_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/usr/include \
+		CC=$(TARGET_CC) -C $(VPNC_DIR)
 
 $(VPNC_TARGET_BINARY): $(VPNC_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS)	\
-		DESTDIR=$(TARGET_DIR)		\
-		BINDIR=/usr/local/bin		\
-		SBINDIR=/usr/local/sbin		\
-		ETCDIR=/etc/vpnc		\
-		MANDIR=/usr/local/share/man	\
-		VERSION=$(VPNC_VERSION)		\
-		INCLUDE=$(STAGING_DIR)/include		\
+	$(MAKE) $(TARGET_CONFIGURE_OPTS)		\
+		DESTDIR=$(TARGET_DIR)			\
+		BINDIR=/usr/local/bin			\
+		SBINDIR=/usr/local/sbin			\
+		ETCDIR=/etc/vpnc			\
+		MANDIR=/usr/local/share/man		\
+		VERSION=$(VPNC_VERSION)			\
+		INCLUDE=$(STAGING_DIR)/usr/include	\
 		LDFLAGS="-g -lgcrypt -lgpg-error"	\
 		-C $(VPNC_DIR) install
 	$(STRIP) --strip-unneeded $(VPNC_TARGET_BINARY)
@@ -46,7 +47,7 @@
 
 
 
-vpnc:	uclibc $(VPNC_TARGET_BINARY) 
+vpnc:	uclibc $(VPNC_TARGET_BINARY)
 
 vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
 

Modified: trunk/buildroot/package/xerces/xerces.mk
===================================================================
--- trunk/buildroot/package/xerces/xerces.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/package/xerces/xerces.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -22,7 +22,6 @@
 
 $(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
 	(cd $(XERCES_DIR)/src/xercesc; rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		XERCESCROOT=$(XERCES_DIR) \
 		./runConfigure -plinux -minmem \
@@ -47,7 +46,7 @@
 xerces: uclibc $(TARGET_DIR)/usr/$(XERCES_BINARY)
 
 xerces-clean:
-	rm -rf $(STAGING_DIR)/include/xercesc
+	rm -rf $(STAGING_DIR)/usr/include/xercesc
 	rm -f $(STAGING_DIR)/lib/libxerces*
 	rm -f $(TARGET_DIR)/usr/lib/libxerces*
 	-$(MAKE) -C $(XERCES_DIR) clean

Modified: trunk/buildroot/target/device/Sharp/LNode80/linux.mk
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -98,11 +98,11 @@
 	touch -c $(LINUX_KERNEL)
 
 $(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
-	mkdir -p $(STAGING_DIR)/include
-	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/include/
-	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/include/
+	mkdir -p $(STAGING_DIR)/usr/include
+	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/usr/include/
+	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/usr/include/
 
-linux: $(STAGING_DIR)/include/linux/version.h $(LINUX_KERNEL)
+linux: $(STAGING_DIR)/usr/include/linux/version.h $(LINUX_KERNEL)
 
 linux-source: $(DL_DIR)/$(LINUX_SOURCE)
 

Modified: trunk/buildroot/target/device/Soekris/net4521/linux.mk
===================================================================
--- trunk/buildroot/target/device/Soekris/net4521/linux.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/target/device/Soekris/net4521/linux.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -106,12 +106,12 @@
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	(cd $(TARGET_DIR)/lib/modules; ln -s $(LINUX_VERSION)/kernel/drivers .)
 
-$(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
-	mkdir -p $(STAGING_DIR)/include
-	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/include/
-	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/include/
+$(STAGING_DIR)/usr/include/linux/version.h: $(LINUX_DIR)/.configured
+	mkdir -p $(STAGING_DIR)/usr/include
+	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/usr/include/
+	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/usr/include/
 
-linux: $(STAGING_DIR)/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
+linux: $(STAGING_DIR)/usr/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
 
 linux-source: $(DL_DIR)/$(LINUX_SOURCE)
 

Modified: trunk/buildroot/target/device/Via/epia-mii/linux.mk
===================================================================
--- trunk/buildroot/target/device/Via/epia-mii/linux.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/target/device/Via/epia-mii/linux.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -95,12 +95,12 @@
 	$(MAKE) -C $(LINUX_DIR) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	(cd $(TARGET_DIR)/lib/modules; ln -s $(LINUX_VERSION)/kernel/drivers .)
 
-$(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
-	mkdir -p $(STAGING_DIR)/include
-	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/include/
-	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/include/
+$(STAGING_DIR)/usr/include/linux/version.h: $(LINUX_DIR)/.configured
+	mkdir -p $(STAGING_DIR)/usr/include
+	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/usr/include/
+	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/usr/include/
 
-linux: $(STAGING_DIR)/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
+linux: $(STAGING_DIR)/usr/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
 
 linux-source: $(DL_DIR)/$(LINUX_SOURCE)
 

Modified: trunk/buildroot/target/device/jp/q5/linux.mk
===================================================================
--- trunk/buildroot/target/device/jp/q5/linux.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/target/device/jp/q5/linux.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -109,12 +109,12 @@
 		DEPMOD=$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-depmod \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 
-$(STAGING_DIR)/include/linux/version.h: $(LINUX_DIR)/.configured
-	mkdir -p $(STAGING_DIR)/include
-	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/include/
-	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/include/
+$(STAGING_DIR)/usr/include/linux/version.h: $(LINUX_DIR)/.configured
+	mkdir -p $(STAGING_DIR)/usr/include
+	tar -ch -C $(LINUX_DIR)/include -f - linux | tar -xf - -C $(STAGING_DIR)/usr/include/
+	tar -ch -C $(LINUX_DIR)/include -f - asm | tar -xf - -C $(STAGING_DIR)/usr/include/
 
-linux: $(STAGING_DIR)/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
+linux: $(STAGING_DIR)/usr/include/linux/version.h $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
 
 linux-source: $(DL_DIR)/$(LINUX_SOURCE)
 

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -157,7 +157,7 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/include \
+		--includedir=$(STAGING_DIR)/usr/include \
 		$(DISABLE_NLS) \
 		--without-uiout $(DISABLE_GDBMI) \
 		--disable-tui --disable-gdbtk --without-x \

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-11 22:09:09 UTC (rev 19443)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-11 22:26:56 UTC (rev 19444)
@@ -280,13 +280,13 @@
 		HOSTCC="$(HOSTCC)" \
 		pregen install_dev
 	# Install the kernel headers to the first stage gcc include dir if necessary
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)	
+ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/linux/version.h ] ; \
 	then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
 	fi
 else
-	if [ ! -f $(STAGING_DIR)/include/linux/version.h ] ; then \
+	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
 		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] ; then \
@@ -332,7 +332,7 @@
 		install_runtime install_dev
 endif
 	# Install the kernel headers to the staging dir if necessary
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)	
+ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* $(STAGING_DIR)/usr/include/ ; \
 	fi
@@ -417,7 +417,7 @@
 		RUNTIME_PREFIX=/ \
 		install_dev
 	# Install the kernel headers to the target dir if necessary
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)	
+ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ] ; \
 	then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* $(TARGET_DIR)/usr/include/ ; \
