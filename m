From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Oct 2006 04:34:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20061014113415.9A1E148622@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-10-14 04:34:14 -0700 (Sat, 14 Oct 2006)
New Revision: 16379

Log:
fix CrossCompileDir (patch by Andrew E. Milesk)

Modified:
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2006-10-14 11:12:20 UTC (rev 16378)
+++ trunk/buildroot/package/xorg/xorg.mk	2006-10-14 11:34:14 UTC (rev 16379)
@@ -93,7 +93,7 @@
 	$(SED) 's:#define LdCmd.*:#define LdCmd $(TARGET_CROSS)ld:g' $(XORG_CF)
 	$(SED) 's:#.*define.*HasPam.*YES::g' $(XORG_DIR)/config/cf/linux.cf
 	$(SED) 's:#.*define.*CrossCompiling.*NO:#define CrossCompiling YES:g' $(XORG_DIR)/config/cf/Imake.tmpl
-	$(SED) 's:#.*undef.*CrossCompileDir.*:#define CrossCompileDir$(STAGING_DIR)/bin:g' $(XORG_DIR)/config/cf/Imake.tmpl
+	$(SED) 's:#.*undef.*CrossCompileDir.*:#define CrossCompileDir $(STAGING_DIR)/bin:g' $(XORG_DIR)/config/cf/Imake.tmpl
 	$(SED) 's:REPLACE_XORG_ARCH:$(XARCH):g' $(XORG_DIR)/config/cf/cross.def
 	touch $(XORG_DIR)/.configured
 
