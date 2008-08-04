From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/argus
Message-ID: <20080804190810.05DD03C8DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:09 -0700 (Mon, 04 Aug 2008)
New Revision: 23033

Log:
argus: select libpcap

Modified:
   trunk/buildroot/package/argus/Config.in


Changeset:
Modified: trunk/buildroot/package/argus/Config.in
===================================================================
--- trunk/buildroot/package/argus/Config.in	2008-08-04 19:08:06 UTC (rev 23032)
+++ trunk/buildroot/package/argus/Config.in	2008-08-04 19:08:09 UTC (rev 23033)
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_ARGUS
 	bool "argus"
-	depends on BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  A Real Time Flow Monitor-based audit engine.
 
 	  http://qosient.com/argus/
-
-comment "argus		- disabled (requires libpcap)"
-	depends on !BR2_PACKAGE_LIBPCAP
