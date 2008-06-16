From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:42:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080616114220.06FD23C970@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:42:19 -0700 (Mon, 16 Jun 2008)
New Revision: 22377

Log:
libvorbis: use BR2_SOFT_FLOAT to set default for tremor

Use BR2_SOFT_FLOAT to set default for tremor instead of hardcoded arch list.


Modified:
   trunk/buildroot/package/libvorbis/Config.in


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:42:16 UTC (rev 22376)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:42:19 UTC (rev 22377)
@@ -17,7 +17,7 @@
 
 config BR2_PACKAGE_LIBVORBIS_TREMOR
 	bool "use fixed point implementation (tremor)
-	default y if BR2_arm || BR2_avr32
+	default y if BR2_SOFT_FLOAT
 	default n
 	depends on BR2_PACKAGE_LIBVORBIS
 	help
