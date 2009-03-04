From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 20:16:26 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iproute2
Message-ID: <20090304201627.146CB7626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 20:16:26 +0000 (Wed, 04 Mar 2009)
New Revision: 25530

Log:
iproute2: needs ipv6

Modified:
   trunk/buildroot/package/iproute2/Config.in


Changeset:
Modified: trunk/buildroot/package/iproute2/Config.in
===================================================================
--- trunk/buildroot/package/iproute2/Config.in	2009-03-04 20:16:21 UTC (rev 25529)
+++ trunk/buildroot/package/iproute2/Config.in	2009-03-04 20:16:26 UTC (rev 25530)
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
+	depends on BR2_INET_IPV6
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
 
 	  http://developer.osdl.org/dev/iproute2/
+
+comment "iproute2 requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
