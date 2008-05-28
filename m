From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 27 May 2008 18:21:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20080528012147.A097B3C5D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-05-27 18:21:45 -0700 (Tue, 27 May 2008)
New Revision: 22096

Log:
Remove bashisms


Modified:
   trunk/buildroot/package/kexec/kexec.mk


Changeset:
Modified: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2008-05-27 15:57:48 UTC (rev 22095)
+++ trunk/buildroot/package/kexec/kexec.mk	2008-05-28 01:21:45 UTC (rev 22096)
@@ -62,13 +62,13 @@
 	cp -dpf $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY) \
 		$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/kdump \
 		$(TARGET_DIR)/sbin/
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/sbin/k{exec,dump}
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/sbin/kexec $(TARGET_DIR)/sbin/kdump
 
 kexec: uclibc $(TARGET_DIR)/$(KEXEC_TARGET_BINARY)
 
 kexec-clean:
 	-$(MAKE) -C $(KEXEC_DIR) clean
-	rm -f $(TARGET_DIR)/sbin/k{exec,dump}
+	rm -f $(TARGET_DIR)/sbin/kexec $(TARGET_DIR)/sbin/kdump
 
 kexec-dirclean:
 	rm -rf $(KEXEC_DIR)
