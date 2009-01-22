From: laird at uclibc.org <laird@uclibc.org>
Date: Thu, 22 Jan 2009 08:09:54 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090122080954.315EE765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-22 08:09:53 +0000 (Thu, 22 Jan 2009)
New Revision: 24953

Log:
package/multimedia/gst-plugins-good/Config.in

Use select instead of depends on as it makes clear what people 
need rather than hiding options based on choices they dont
know they need to make.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-22 07:53:24 UTC (rev 24952)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-22 08:09:53 UTC (rev 24953)
@@ -72,7 +72,8 @@
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
 	bool "matroska"
-	depends on BR2_PACKAGE_BZIP2 && BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
 	bool "monoscope"
@@ -131,7 +132,7 @@
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG
 	bool "jpeg (JPEG support)"
-	depends on BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_JPEG
 	default y
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
@@ -139,6 +140,6 @@
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG
 	bool "png (PNG support)"
-	depends on BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBPNG
 	default y
 endif
