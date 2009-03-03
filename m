From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 22:28:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20090303222816.DD9FE7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 22:28:15 +0000 (Tue, 03 Mar 2009)
New Revision: 25516

Log:
iptables: bump version

- bump version to 1.4.2
- add uninstall target

Patch by Olaf Rempel <razzor@kopf-tisch.de>

Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2009-03-03 22:23:22 UTC (rev 25515)
+++ trunk/buildroot/package/iptables/iptables.mk	2009-03-03 22:28:15 UTC (rev 25516)
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.1
+IPTABLES_VERSION = 1.4.2
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
@@ -16,3 +16,10 @@
 IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,iptables))
+
+$(IPTABLES_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
+	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
+	rm -rf $(TARGET_DIR)/usr/lib/xtables
+	rm -f $(IPTABLES_TARGET_INSTALL_TARGET)
