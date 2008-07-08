From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  8 Jul 2008 06:49:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20080708134924.70FD83C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-08 06:49:23 -0700 (Tue, 08 Jul 2008)
New Revision: 22690

Log:
openssl: re-revert r22644

The build without CONFIG_UPDATE has now been verified on arm/armeb/avr32,
so lets revert this for good.

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-07-08 10:53:17 UTC (rev 22689)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-07-08 13:49:23 UTC (rev 22690)
@@ -40,7 +40,6 @@
 endif
 	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
-	$(CONFIG_UPDATE) $(OPENSSL_DIR)
 	touch $@
 
 $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
