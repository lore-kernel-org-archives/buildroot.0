From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080804190816.5A38A3C8F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:15 -0700 (Mon, 04 Aug 2008)
New Revision: 23035

Log:
avahi: select expat

Modified:
   trunk/buildroot/package/avahi/Config.in


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2008-08-04 19:08:12 UTC (rev 23034)
+++ trunk/buildroot/package/avahi/Config.in	2008-08-04 19:08:15 UTC (rev 23035)
@@ -22,13 +22,9 @@
 config BR2_PACKAGE_AVAHI_DAEMON
 	bool "mDNS/DNS-SD daemon"
 	depends on BR2_PACKAGE_AVAHI
-	depends on BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_EXPAT
 	help
 	  The Avahi mDNS/DNS-SD daemon implementing Apple's ZeroConf
 	  architecture (also known as "Rendezvous" or "Bonjour").
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
-
-comment "mDNS/DNS-SD daemon	- disabled (requires expat)"
-	depends on BR2_PACKAGE_AVAHI
-	depends on !BR2_PACKAGE_EXPAT
