From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 14:33:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
Message-ID: <20080917213320.62BE93C670@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-17 14:33:19 -0700 (Wed, 17 Sep 2008)
New Revision: 23416

Log:
pcre: fixup paths in pcre-config

Modified:
   trunk/buildroot/package/pcre/pcre.mk


Changeset:
Modified: trunk/buildroot/package/pcre/pcre.mk
===================================================================
--- trunk/buildroot/package/pcre/pcre.mk	2008-09-17 11:45:37 UTC (rev 23415)
+++ trunk/buildroot/package/pcre/pcre.mk	2008-09-17 21:33:19 UTC (rev 23416)
@@ -20,5 +20,8 @@
 $(eval $(call AUTOTARGETS,package,pcre))
 
 $(PCRE_HOOK_POST_INSTALL): $(PCRE_TARGET_INSTALL_TARGET)
+	$(SED) 's,^prefix=.*,prefix=$(STAGING_DIR)/usr,' \
+		-e 's,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,' \
+		$(STAGING_DIR)/usr/bin/pcre-config
 	rm -rf $(TARGET_DIR)/usr/share/doc/pcre
 	touch $@
