From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  8 Jul 2008 03:13:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20080708101305.8702C3C697@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-08 03:13:04 -0700 (Tue, 08 Jul 2008)
New Revision: 22687

Log:
Revert patch which breaks AVR32 build

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-07-08 10:09:28 UTC (rev 22686)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-07-08 10:13:04 UTC (rev 22687)
@@ -40,6 +40,7 @@
 endif
 	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
+	$(CONFIG_UPDATE) $(OPENSSL_DIR)
 	touch $@
 
 $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
