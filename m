From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 02:46:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20070815094629.01F99A5D2D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 02:46:29 -0700 (Wed, 15 Aug 2007)
New Revision: 19513

Log:
Use /usr/include as std include in Xorg

Modified:
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-08-15 09:42:33 UTC (rev 19512)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-08-15 09:46:29 UTC (rev 19513)
@@ -90,6 +90,7 @@
 	$(SED) 's:REPLACE_GCCINC_DIR:$(shell $(TARGET_CROSS)gcc -print-file-name=include):g' $(XORG_CF)
 	$(SED) 's:REPLACE_STAGING_DIR:$(STAGING_DIR):g' $(XORG_CF)
 	$(SED) 's:REPLACE_ARCH:$(ARCH):g' $(XORG_CF)
+	$(SED) 's:#define StdIncDir.*:#define StdIncDir $(STAGING_DIR)/usr/include:g' $(XORG_CF)
 	$(SED) 's:#define CcCmd.*:#define CcCmd $(TARGET_CROSS)gcc:g' $(XORG_CF)
 	$(SED) 's:#define RanlibCmd.*:#define RanlibCmd $(TARGET_CROSS)ranlib:g' $(XORG_CF)
 	$(SED) 's:#define LdCmd.*:#define LdCmd $(TARGET_CROSS)ld:g' $(XORG_CF)
