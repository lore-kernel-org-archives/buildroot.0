From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 01:32:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070216093215.3443048093@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 01:32:12 -0800 (Fri, 16 Feb 2007)
New Revision: 17903

Log:
- busybox provides gzip


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-02-15 21:19:50 UTC (rev 17902)
+++ trunk/buildroot/package/Config.in	2007-02-16 09:32:12 UTC (rev 17903)
@@ -297,7 +297,9 @@
 	  Support for compressors and decompressors like lzo, lzma, bzip2
 
 if BR2_COMPRESSOR_SUPPORT
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/gzip/Config.in"
+endif
 source "package/lzo/Config.in"
 source "package/lzma/Config.in"
 source "package/zlib/Config.in"
