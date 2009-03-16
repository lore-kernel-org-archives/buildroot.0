From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:52 +0000 (UTC)
Subject: [Buildroot] svn commit: [25684] trunk/buildroot/package/iptables
Message-ID: <20090316154852.BE9887643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:52 +0000 (Mon, 16 Mar 2009)
New Revision: 25684

Log:
iptables: doesn't use glib

Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2009-03-16 15:48:43 UTC (rev 25683)
+++ trunk/buildroot/package/iptables/iptables.mk	2009-03-16 15:48:52 UTC (rev 25684)
@@ -13,7 +13,6 @@
 IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES =
 IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR)
-IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,iptables))
 
