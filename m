From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 04:14:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
Message-ID: <20061117121431.B42BE4860C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 04:14:31 -0800 (Fri, 17 Nov 2006)
New Revision: 16559

Log:
- bump version and pass the target cflags in properly (at least for most of the
  tools. Needs fixing upstream).


Modified:
   trunk/buildroot/package/pppd/pppd.mk


Changeset:
Modified: trunk/buildroot/package/pppd/pppd.mk
===================================================================
--- trunk/buildroot/package/pppd/pppd.mk	2006-11-17 11:54:45 UTC (rev 16558)
+++ trunk/buildroot/package/pppd/pppd.mk	2006-11-17 12:14:31 UTC (rev 16559)
@@ -3,9 +3,10 @@
 # pppd
 #
 #############################################################
-PPPD_SOURCE:=ppp-2.4.3.tar.gz
+PPPD_VERSION:=2.4.4
+PPPD_SOURCE:=ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE:=ftp://ftp.samba.org/pub/ppp
-PPPD_DIR:=$(BUILD_DIR)/ppp-2.4.3
+PPPD_DIR:=$(BUILD_DIR)/ppp-$(PPPD_VERSION)
 PPPD_CAT:=$(ZCAT)
 PPPD_BINARY:=pppd/pppd
 PPPD_TARGET_BINARY:=usr/sbin/pppd
@@ -49,7 +50,7 @@
 	touch $(PPPD_DIR)/.configured
 
 $(PPPD_DIR)/$(PPPD_BINARY): $(PPPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(PPPD_DIR)
+	$(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR)
 
 $(TARGET_DIR)/$(PPPD_TARGET_BINARY): $(PPPD_DIR)/$(PPPD_BINARY)
 	$(MAKE1) DESTDIR=$(TARGET_DIR)/usr CC=$(TARGET_CC) -C $(PPPD_DIR) install
