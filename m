From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 19:51:46 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090225195146.D3F0F7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-25 19:51:46 +0000 (Wed, 25 Feb 2009)
New Revision: 25456

Log:
gstreamer: flac plugin support

Patch by Sven Neumann. Closes #99.

Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-02-25 19:51:41 UTC (rev 25455)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-02-25 19:51:46 UTC (rev 25456)
@@ -149,6 +149,10 @@
 	bool "annodex (XML Library)"
 	select BR2_PACKAGE_LIBXML2
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
+	bool "flac (libFLAC)"
+	select BR2_PACKAGE_FLAC
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 

Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-02-25 19:51:41 UTC (rev 25455)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-02-25 19:51:46 UTC (rev 25456)
@@ -273,6 +273,12 @@
 GST_PLUGINS_GOOD_CONF_OPT += --disable-annodex
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-flac
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-flac
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-oss
 else
