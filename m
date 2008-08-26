From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20080826204716.4A30E3C7EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:15 -0700 (Tue, 26 Aug 2008)
New Revision: 23220

Log:
neon: strip target library

neon doesn't have an install-strip target, so do it afterwards instead.

Modified:
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:12 UTC (rev 23219)
+++ trunk/buildroot/package/neon/neon.mk	2008-08-26 20:47:15 UTC (rev 23220)
@@ -27,3 +27,8 @@
 endif
 
 $(eval $(call AUTOTARGETS,package,neon))
+
+# neon doesn't have an install-strip target, so do it afterwards
+$(NEON_HOOK_POST_INSTALL): $(NEON_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libneon.so
+	touch $@
