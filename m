From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 18:41:58 +0000 (UTC)
Subject: [Buildroot] svn commit: [25898] trunk/buildroot/package/iptables
Message-ID: <20090330184159.0D145775ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 18:41:58 +0000 (Mon, 30 Mar 2009)
New Revision: 25898

Log:
iptables: needs largefile support in toolchain

Modified:
   trunk/buildroot/package/iptables/Config.in


Changeset:
Modified: trunk/buildroot/package/iptables/Config.in
===================================================================
--- trunk/buildroot/package/iptables/Config.in	2009-03-30 18:41:53 UTC (rev 25897)
+++ trunk/buildroot/package/iptables/Config.in	2009-03-30 18:41:58 UTC (rev 25898)
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_IPTABLES
 	bool "iptables"
+	depends on BR2_LARGEFILE
 	help
 	  Linux kernel (2.4+) firewall, NAT, and packet mangling tools.
 
 	  http://www.iptables.org/
+
+comment "iptables requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
