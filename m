From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:22:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
Message-ID: <20070717002239.0568B30086@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:22:39 -0700 (Mon, 16 Jul 2007)
New Revision: 19119

Log:
Build proftpd with IPv6 support only if the toolchain was configured as such.


Modified:
   trunk/buildroot/package/proftpd/proftpd.mk


Changeset:
Modified: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	2007-07-17 00:22:16 UTC (rev 19118)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2007-07-17 00:22:39 UTC (rev 19119)
@@ -11,6 +11,10 @@
 PROFTPD_BINARY:=proftpd
 PROFTPD_TARGET_BINARY:=usr/sbin/proftpd
 
+ifeq ($(BR2_INET_IPV6),y)
+ENABLE_IPV6:=--enable-ipv6
+endif
+
 $(DL_DIR)/$(PROFTPD_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(PROFTPD_SITE)/$(PROFTPD_SOURCE)
 
@@ -40,6 +44,7 @@
 		--disable-dso \
 		--enable-shadow \
 		$(DISABLE_LARGEFILE) \
+		$(ENABLE_IPV6) \
 		--with-gnu-ld \
 	);
 	touch $(PROFTPD_DIR)/.configured
