From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Feb 2009 08:05:14 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090226080515.20E69764B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-26 08:05:14 +0000 (Thu, 26 Feb 2009)
New Revision: 25458

Log:
gst-plugins-good: remove dependencies for matroska plugin

This was forgotten when adding config options for zlib and bzip2. The
matroska plugin doesn't need these dependencies, they are optional.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-02-26 08:05:07 UTC (rev 25457)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-02-26 08:05:14 UTC (rev 25458)
@@ -171,7 +171,6 @@
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-matroska
-GST_PLUGINS_GOOD_DEPENDENCIES += zlib bzip2
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-matroska
 endif
