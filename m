From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 18:42:03 +0000 (UTC)
Subject: [Buildroot] svn commit: [25899] trunk/buildroot/package/iptables
Message-ID: <20090330184203.18F22775ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 18:42:02 +0000 (Mon, 30 Mar 2009)
New Revision: 25899

Log:
iptables: use correct variable for configure options

Introduced in r23409.

Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2009-03-30 18:41:58 UTC (rev 25898)
+++ trunk/buildroot/package/iptables/iptables.mk	2009-03-30 18:42:02 UTC (rev 25899)
@@ -7,7 +7,7 @@
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
-IPTABLES_CONF_OPT = --libexecdir=/usr/lib
+IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 ifneq ($(BR2_INET_IPV6),y)
 IPTABLES_CONF_OPT += --enable-ipv6=no
 endif
@@ -16,7 +16,6 @@
 
 IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES =
-IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR)
 
 $(eval $(call AUTOTARGETS,package,iptables))
 
