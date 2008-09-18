From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 18 Sep 2008 04:08:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20080918110827.E4B493C664@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-18 04:08:27 -0700 (Thu, 18 Sep 2008)
New Revision: 23425

Log:
iptables: fix install rule to install everything in appropriate directories

This patch will install iptables with the install-strip command, and also use
/usr/lib as target for the filter libraries.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2008-09-18 09:22:41 UTC (rev 23424)
+++ trunk/buildroot/package/iptables/iptables.mk	2008-09-18 11:08:27 UTC (rev 23425)
@@ -7,14 +7,13 @@
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
-IPTABLES_INSTALL_STAGING = NO
+IPTABLES_CONF_OPT = --libexecdir=/usr/lib
 IPTABLES_INSTALL_TARGET = YES
-IPTABLES_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec-am
+IPTABLES_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 IPTABLES_AUTORECONF = YES
-IPTABLES_DEPENDENCIES = 
-IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR) 
+IPTABLES_DEPENDENCIES =
+IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR)
 IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=/usr/bin/glib-genmarshal GLIB_MKENUMS=/usr/bin
 
 $(eval $(call AUTOTARGETS,package,iptables))
-
