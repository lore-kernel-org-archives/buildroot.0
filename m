From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun,  6 Apr 2008 06:14:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cpio
Message-ID: <20080406131407.C36F73C436@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-06 06:14:07 -0700 (Sun, 06 Apr 2008)
New Revision: 21655

Log:
Fixed typo in cpioroot, we're working with CPIO_BASE not TAR_TARGET


Modified:
   trunk/buildroot/target/cpio/cpioroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2008-04-06 10:35:22 UTC (rev 21654)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2008-04-06 13:14:07 UTC (rev 21655)
@@ -49,7 +49,7 @@
 endif
 	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
 	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
