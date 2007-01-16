From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 15 Jan 2007 17:29:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070116012939.EF80D48582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-15 17:29:38 -0800 (Mon, 15 Jan 2007)
New Revision: 17322

Log:
Remove all of the binaries except for the one used for the target even though it is a MIPS binary and cannot be used. This package is still crap.


Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-01-16 00:33:24 UTC (rev 17321)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-01-16 01:29:38 UTC (rev 17322)
@@ -111,6 +111,9 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgettextpo.la
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgettextsrc.la
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libintl.la
+	rm -f $(STAGING_DIR)/bin/autopoint $(STAGING_DIR)/bin/envsubst
+	rm -f $(STAGING_DIR)/bin/gettext.sh $(STAGING_DIR)/bin/gettextize
+	rm -f $(STAGING_DIR)/bin/msg* $(STAGING_DIR)/bin/?gettext
 	touch -c $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
 gettext: uclibc pkgconfig $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
@@ -130,7 +133,7 @@
 
 gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) install
-	chmod +x $(TARGET_DIR)/lib/libintl.so.3.4.3 # identify as needing to be stipped
+	chmod +x $(TARGET_DIR)/lib/libintl.so.3.4.3 # identify as needing to be stripped
 	rm -rf  $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
 		$(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/aclocal \
