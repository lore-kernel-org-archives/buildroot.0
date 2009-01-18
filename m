From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sun, 18 Jan 2009 00:05:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libgtk2
	multimedia/gst-plugins-base mul etc...
Message-ID: <20090118000558.DC88077108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-18 00:05:57 +0000 (Sun, 18 Jan 2009)
New Revision: 24896

Log:
Finish the gtk-doc stuff and start on the smae thing with LARGEFILE and NLS.


Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
   trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-01-17 10:11:12 UTC (rev 24895)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-01-18 00:05:57 UTC (rev 24896)
@@ -249,6 +249,8 @@
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		$(DISABLE_DOCUMENTATION) \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
 		$(QUIET) $($(PKG)_CONF_OPT)
 	$(Q)touch $@
 

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-17 10:11:12 UTC (rev 24895)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 00:05:57 UTC (rev 24896)
@@ -75,7 +75,6 @@
 		--disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug \
-		--without-html-dir \
 		$(DISABLE_LARGEFILE) \
 		$(LIBGTK2_CONF_OPT_X)  \
 		$(LIBGTK2_CONF_OPT_DFB)

Modified: trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk	2009-01-17 10:11:12 UTC (rev 24895)
+++ trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk	2009-01-18 00:05:57 UTC (rev 24896)
@@ -17,9 +17,7 @@
 		--disable-xshm \
 		--disable-oggtest \
 		--disable-vorbistest \
-		--disable-freetypetest \
-		--disable-gtk-doc \
-		--without-html-dir
+		--disable-freetypetest
 
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil
 

Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-17 10:11:12 UTC (rev 24895)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-18 00:05:57 UTC (rev 24896)
@@ -22,9 +22,7 @@
 		--disable-aalibtest \
 		--disable-esdtest \
 		--disable-shout2 \
-		--disable-shout2test \
-		--disable-gtk-doc \
-		--without-html-dir
+		--disable-shout2test
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 

Modified: trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2009-01-17 10:11:12 UTC (rev 24895)
+++ trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2009-01-18 00:05:57 UTC (rev 24896)
@@ -9,9 +9,7 @@
 
 GST_PLUGINS_UGLY_CONF_OPT = \
 		$(DISABLE_NLS) \
-		--disable-examples \
-		--disable-gtk-doc \
-		--without-html-dir
+		--disable-examples
 
 GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
 

Modified: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-17 10:11:12 UTC (rev 24895)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-18 00:05:57 UTC (rev 24896)
@@ -23,9 +23,7 @@
 		$(DISABLE_LARGEFILE) \
 		--disable-examples \
 		--disable-tests \
-		--disable-failing-tests \
-		--disable-gtk-doc \
-		--without-html-dir
+		--disable-failing-tests
 
 GSTREAMER_DEPENDENCIES = libglib2 libxml2 pkgconfig
 
