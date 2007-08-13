From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 12:35:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20070813193509.D2880A6890@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 12:35:08 -0700 (Mon, 13 Aug 2007)
New Revision: 19490

Log:
Store openssl files in /usr/lib/ssl

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2007-08-13 19:33:36 UTC (rev 19489)
+++ trunk/buildroot/package/openssl/openssl.mk	2007-08-13 19:35:08 UTC (rev 19490)
@@ -44,10 +44,12 @@
 	CFLAGS="-DOPENSSL_NO_KRB5 -DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 $(TARGET_CFLAGS)" \
 	PATH=$(TARGET_PATH) \
 	./Configure linux-$(OPENSSL_TARGET_ARCH) --prefix=/ \
-		--openssldir=/usr/lib/ssl -L$(STAGING_DIR)/lib -ldl \
+		--openssldir=/lib/ssl -L$(STAGING_DIR)/lib -ldl \
 		-I$(STAGING_DIR)/usr/include $(OPENSSL_OPTS) threads \
 		shared no-idea no-mdc2 no-rc5)
 
+# --openssldir=/usr/lib/ssl results in files in /usr/usr/lib...
+
 $(OPENSSL_DIR)/apps/openssl: $(OPENSSL_DIR)/Makefile
 	$(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) all build-shared
 	# Work around openssl build bug to link libssl.so with libcrypto.so.
