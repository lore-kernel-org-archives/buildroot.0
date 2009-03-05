From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 12:14:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bind
Message-ID: <20090305121437.DE28E7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 12:14:37 +0000 (Thu, 05 Mar 2009)
New Revision: 25537

Log:
bind: needs ipv6 support

Modified:
   trunk/buildroot/package/bind/Config.in


Changeset:
Modified: trunk/buildroot/package/bind/Config.in
===================================================================
--- trunk/buildroot/package/bind/Config.in	2009-03-05 12:11:36 UTC (rev 25536)
+++ trunk/buildroot/package/bind/Config.in	2009-03-05 12:14:37 UTC (rev 25537)
@@ -3,6 +3,7 @@
 
 config BR2_PACKAGE_BIND
 	bool "bind"
+	depends on BR2_INET_IPV6
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
@@ -23,6 +24,9 @@
 
 	  http://www.isc.org/sw/bind/
 
+comment "bind requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
+
 config BR2_PACKAGE_BIND_TOOLS
 	bool "Install tools"
 	depends on BR2_PACKAGE_BIND
