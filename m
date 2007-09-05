From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 23:50:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070905065053.06E7AA4569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 23:50:53 -0700 (Tue, 04 Sep 2007)
New Revision: 19788

Log:
Add target to unpack gettext

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-09-05 06:49:57 UTC (rev 19787)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-09-05 06:50:53 UTC (rev 19788)
@@ -123,6 +123,8 @@
 
 gettext: uclibc pkgconfig $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
+gettext-unpacked: $(GETTEXT_DIR)/.unpacked
+
 gettext-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
 	-$(MAKE) -C $(GETTEXT_DIR) clean
