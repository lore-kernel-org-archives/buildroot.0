From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:02:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/argus
Message-ID: <20071129130210.3829F30084@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:02:10 -0800 (Thu, 29 Nov 2007)
New Revision: 20583

Log:
Make argus depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/argus/Config.in


Changeset:
Modified: trunk/buildroot/package/argus/Config.in
===================================================================
--- trunk/buildroot/package/argus/Config.in	2007-11-29 13:01:45 UTC (rev 20582)
+++ trunk/buildroot/package/argus/Config.in	2007-11-29 13:02:10 UTC (rev 20583)
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_ARGUS
 	bool "argus"
 	default n
-	select BR2_PACKAGE_LIBPCAP
+	depends BR2_PACKAGE_LIBPCAP
 	help
 	  A Real Time Flow Monitor-based audit engine.
 
 	  http://qosient.com/argus/
 
+comment "argus		- disabled (requires libpcap)"
+	depends on !BR2_PACKAGE_LIBPCAP
