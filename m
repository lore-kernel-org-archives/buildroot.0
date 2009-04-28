From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 18:30:15 +0000 (UTC)
Subject: [Buildroot] svn commit: [26228] trunk/buildroot/package/openssl
Message-ID: <20090428183015.C0B3B77118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 18:30:15 +0000 (Tue, 28 Apr 2009)
New Revision: 26228

Log:
package/openssl: STRIP_STRIP_ALL should be used for binaries

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:10 UTC (rev 26227)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:15 UTC (rev 26228)
@@ -58,7 +58,7 @@
 $(OPENSSL_HOOK_POST_INSTALL):
 	$(if $(BR2_HAVE_DEVFILES),,rm -rf $(TARGET_DIR)/usr/lib/ssl)
 ifeq ($(BR2_PACKAGE_OPENSSL_BIN),y)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/openssl
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/openssl
 else
 	rm -f $(TARGET_DIR)/usr/bin/openssl
 endif
