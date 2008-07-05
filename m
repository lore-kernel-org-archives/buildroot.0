From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 23:54:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20080705065435.89AC13C670@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 23:54:35 -0700 (Fri, 04 Jul 2008)
New Revision: 22644

Log:
Update config.* of openssl

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-07-05 06:46:43 UTC (rev 22643)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-07-05 06:54:35 UTC (rev 22644)
@@ -37,6 +37,7 @@
 		$(OPENSSL_DIR)/Configure
 	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
+	$(CONFIG_UPDATE) $(OPENSSL_DIR)
 	touch $@
 
 $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
