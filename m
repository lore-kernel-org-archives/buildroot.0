From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 13:33:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bind
Message-ID: <20090305133307.66DF67626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 13:33:06 +0000 (Thu, 05 Mar 2009)
New Revision: 25541

Log:
bind: needs largefile support, not ipv6

And at the same time move the comment below the install tools entry so it
gets identied properly.

Modified:
   trunk/buildroot/package/bind/Config.in


Changeset:
Modified: trunk/buildroot/package/bind/Config.in
===================================================================
--- trunk/buildroot/package/bind/Config.in	2009-03-05 13:28:55 UTC (rev 25540)
+++ trunk/buildroot/package/bind/Config.in	2009-03-05 13:33:06 UTC (rev 25541)
@@ -3,7 +3,7 @@
 
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
@@ -24,12 +24,11 @@
 
 	  http://www.isc.org/sw/bind/
 
-comment "bind requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_BIND_TOOLS
 	bool "Install tools"
 	depends on BR2_PACKAGE_BIND
 	help
 	  Install tools (host, nslookup, dig, nsupdate)
 
+comment "bind requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
