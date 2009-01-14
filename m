From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 14 Jan 2009 14:38:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia:
	gst-plugins-base gst-plugins-good gst-pl etc...
Message-ID: <20090114143818.F1B2F769A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-14 14:38:18 +0000 (Wed, 14 Jan 2009)
New Revision: 24832

Log:
package/multimedia/gstreamer
package/multimedia/gst-plugins-*: I do not want docs installed in rootfs.

Stop it installing the docs in the ROOTFS by using the same fix
as has been applied to cairo.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
   trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk	2009-01-14 14:28:48 UTC (rev 24831)
+++ trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk	2009-01-14 14:38:18 UTC (rev 24832)
@@ -17,7 +17,9 @@
 		--disable-xshm \
 		--disable-oggtest \
 		--disable-vorbistest \
-		--disable-freetypetest
+		--disable-freetypetest \
+		--disable-gtk-doc \
+		--without-html-dir
 
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil
 

Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-14 14:28:48 UTC (rev 24831)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-14 14:38:18 UTC (rev 24832)
@@ -22,7 +22,9 @@
 		--disable-aalibtest \
 		--disable-esdtest \
 		--disable-shout2 \
-		--disable-shout2test
+		--disable-shout2test \
+		--disable-gtk-doc \
+		--without-html-dir
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 

Modified: trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2009-01-14 14:28:48 UTC (rev 24831)
+++ trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2009-01-14 14:38:18 UTC (rev 24832)
@@ -9,7 +9,9 @@
 
 GST_PLUGINS_UGLY_CONF_OPT = \
 		$(DISABLE_NLS) \
-		--disable-examples
+		--disable-examples \
+		--disable-gtk-doc \
+		--without-html-dir
 
 GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
 

Modified: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-14 14:28:48 UTC (rev 24831)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-14 14:38:18 UTC (rev 24832)
@@ -24,6 +24,8 @@
 		--disable-examples \
 		--disable-tests \
 		--disable-failing-tests
+		--disable-gtk-doc \
+		--without-html-dir
 
 GSTREAMER_DEPENDENCIES = libglib2 libxml2 pkgconfig
 
