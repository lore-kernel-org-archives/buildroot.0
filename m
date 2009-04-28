From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 18:30:20 +0000 (UTC)
Subject: [Buildroot] svn commit: [26229] trunk/buildroot/package/openssl
Message-ID: <20090428183020.6F3DA77118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 18:30:20 +0000 (Tue, 28 Apr 2009)
New Revision: 26229

Log:
package/openssl: fix uninstall

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:15 UTC (rev 26228)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-04-28 18:30:20 UTC (rev 26229)
@@ -73,3 +73,11 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/engines/lib*.so
 endif
 	touch $@
+
+$(OPENSSL_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -rf $(addprefix $(TARGET_DIR)/,etc/ssl usr/bin/openssl usr/include/openssl)
+	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
+	rm -rf $(addprefix $(STAGING_DIR)/,etc/ssl usr/bin/openssl usr/include/openssl)
+	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
+	rm -f $(OPENSSL_TARGET_INSTALL_TARGET) $(OPENSSL_HOOK_POST_INSTALL)
