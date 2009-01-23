From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 23 Jan 2009 10:39:36 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090123103936.BC485769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-23 10:39:35 +0000 (Fri, 23 Jan 2009)
New Revision: 24979

Log:
gst-plugins-good: Fix style issues and use of --disable-png.

Update ordering and configure options.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-23 02:07:14 UTC (rev 24978)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-01-23 10:39:35 UTC (rev 24979)
@@ -27,6 +27,20 @@
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
+GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PNG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-libpng
+GST_PLUGINS_GOOD_DEPENDENCIES += libpng
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-libpng
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-bz2
 GST_PLUGINS_GOOD_DEPENDENCIES += bzip2
@@ -41,20 +55,6 @@
 GST_PLUGINS_GOOD_CONF_OPT += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
-GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PNG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-png
-GST_PLUGINS_GOOD_DEPENDENCIES += libpng
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-png
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
 else
