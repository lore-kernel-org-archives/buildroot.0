From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Mar 2008 06:36:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080302143646.80F9112C727@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-02 06:36:46 -0800 (Sun, 02 Mar 2008)
New Revision: 21154

Log:
dnsmasq: bump version


Removed:
   trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:43 UTC (rev 21153)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:46 UTC (rev 21154)
@@ -5,7 +5,7 @@
 #############################################################
 
 DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
-DNSMASQ_UPVER:=2.40
+DNSMASQ_UPVER:=2.41
 DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
 DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
 DNSMASQ_BINARY:=dnsmasq

Deleted: trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch	2008-03-02 14:36:43 UTC (rev 21153)
+++ trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch	2008-03-02 14:36:46 UTC (rev 21154)
@@ -1,12 +0,0 @@
-diff -upr dnsmasq-2.39/src/dnsmasq.h dnsmasq-2.39-orig/src/dnsmasq.h
---- dnsmasq-2.39/src/dnsmasq.h	2007-04-20 12:53:38.000000000 +0200
-+++ dnsmasq-2.39-orig/src/dnsmasq.h	2007-06-12 11:12:19.000000000 +0200
-@@ -79,7 +79,7 @@
- /* There doesn't seem to be a universally-available 
-    userpace header for this. */
- extern int capset(cap_user_header_t header, cap_user_data_t data);
--#include <sys/prctl.h>
-+#include <linux/prctl.h>
- #endif
- 
- /* Min buffer size: we check after adding each record, so there must be 
