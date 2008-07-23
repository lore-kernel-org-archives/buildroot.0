From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 03:35:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20080723103550.70E8B3C7D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-23 03:35:50 -0700 (Wed, 23 Jul 2008)
New Revision: 22929

Log:
gettext: also remove from staging on -clean

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2008-07-23 08:41:08 UTC (rev 22928)
+++ trunk/buildroot/package/gettext/gettext.mk	2008-07-23 10:35:50 UTC (rev 22929)
@@ -125,6 +125,7 @@
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 
 gettext-clean:
+	-$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
 	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
 	-$(MAKE) -C $(GETTEXT_DIR) clean
 
