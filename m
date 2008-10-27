From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 02:45:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20081027094544.E51AC3C744@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-27 02:45:44 -0700 (Mon, 27 Oct 2008)
New Revision: 23812

Log:
Strip gettext libraries on the target

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2008-10-27 09:45:41 UTC (rev 23811)
+++ trunk/buildroot/package/gettext/gettext.mk	2008-10-27 09:45:44 UTC (rev 23812)
@@ -154,6 +154,8 @@
 $(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.so* \
 		$(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgettext*.so*
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libintl*.so*
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/, \
 		libgettext*.so*.la libintl*.so*.la)
 	touch -c $@
