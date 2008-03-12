From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 04:23:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080312112313.D9C2C12011A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 04:23:11 -0700 (Wed, 12 Mar 2008)
New Revision: 21312

Log:
added debugging option

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-12 01:13:46 UTC (rev 21311)
+++ trunk/buildroot/Config.in	2008-03-12 11:23:11 UTC (rev 21312)
@@ -211,6 +211,15 @@
 	  none    do not strip (only for debugging!)
 endchoice
 
+if BR2_STRIP_none
+config BR2_ENABLE_DEBUG
+	bool "build packages with debugging symbols"
+	default n
+	help
+	  Build packages with debugging symbols
+	  enabled
+endif
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	default n
