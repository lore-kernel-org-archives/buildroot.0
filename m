From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 23:51:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20080401065159.9E0D23C4B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 23:51:59 -0700 (Mon, 31 Mar 2008)
New Revision: 21604

Log:
direct: don't fail clean target if directory doesn't exist

Patch by Hebbar.


Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2008-03-31 20:30:38 UTC (rev 21603)
+++ trunk/buildroot/package/directfb/directfb.mk	2008-04-01 06:51:59 UTC (rev 21604)
@@ -108,7 +108,7 @@
 		$(TARGET_DIR)/usr/lib/libdirectfb.so
 
 directfb-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR) uninstall
 	-$(MAKE) -C $(DIRECTFB_DIR) clean
 
 directfb-dirclean:
