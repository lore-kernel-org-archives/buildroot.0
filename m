From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 06:12:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080618131201.C636C3C7AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 06:12:00 -0700 (Wed, 18 Jun 2008)
New Revision: 22413

Log:
dnsmasq: use awk instead of nawk


Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-06-18 13:11:52 UTC (rev 22412)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-06-18 13:12:00 UTC (rev 22413)
@@ -43,7 +43,7 @@
 	$(SED) 's^.*#define HAVE_DBUS.*^/* #define HAVE_DBUS */^' \
 		$(DNSMASQ_DIR)/src/config.h
 endif
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" AWK=awk \
 		COPTS='$(DNSMASQ_COPTS)' PREFIX=/usr -C $(DNSMASQ_DIR)
 	touch -c $@
 
