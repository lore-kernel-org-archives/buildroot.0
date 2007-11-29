From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:04:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071129130442.4B40F300A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:04:41 -0800 (Thu, 29 Nov 2007)
New Revision: 20587

Log:
Make avahi depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/avahi/Config.in


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2007-11-29 13:03:56 UTC (rev 20586)
+++ trunk/buildroot/package/avahi/Config.in	2007-11-29 13:04:41 UTC (rev 20587)
@@ -24,9 +24,13 @@
 	bool "mDNS/DNS-SD daemon"
 	default n
 	depends on BR2_PACKAGE_AVAHI
-	select BR2_PACKAGE_EXPAT
+	depends BR2_PACKAGE_EXPAT
 	help
 	  The Avahi mDNS/DNS-SD daemon implementing Apple's ZeroConf
 	  architecture (also known as "Rendezvous" or "Bonjour").
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
+
+comment "mDNS/DNS-SD daemon	- disabled (requires expat)"
+	depends on BR2_PACKAGE_AVAHI
+	depends !BR2_PACKAGE_EXPAT
