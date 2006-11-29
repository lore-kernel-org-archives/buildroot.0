From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 04:17:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20061129121727.B4A954857B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 04:17:26 -0800 (Wed, 29 Nov 2006)
New Revision: 16717

Log:
- fix typo in grub-clean


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2006-11-29 12:00:28 UTC (rev 16716)
+++ trunk/buildroot/target/x86/grub/grub.mk	2006-11-29 12:17:26 UTC (rev 16717)
@@ -83,7 +83,7 @@
 
 grub-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB_DIR) uninstall
-	-grub -C $(GRUB_DIR) clean
+	-$(MAKE) -C $(GRUB_DIR) clean
 
 grub-dirclean:
 	rm -rf $(GRUB_DIR)
