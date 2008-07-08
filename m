From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon,  7 Jul 2008 23:40:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20080708064006.1998A3C674@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-07-07 23:40:05 -0700 (Mon, 07 Jul 2008)
New Revision: 22683

Log:
Don't $(CONFIG_UPDATE) openssl as it doesn't use autotools anyway


Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-07-08 05:41:44 UTC (rev 22682)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-07-08 06:40:05 UTC (rev 22683)
@@ -40,7 +40,6 @@
 endif
 	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
-	$(CONFIG_UPDATE) $(OPENSSL_DIR)
 	touch $@
 
 $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
