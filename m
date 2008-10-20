From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 04:53:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20081020115308.7AFD03C7ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 04:53:08 -0700 (Mon, 20 Oct 2008)
New Revision: 23743

Log:
neon: don't strip if BR2_ENABLE_DEBUG is enabled

Modified:
   trunk/buildroot/package/neon/neon.mk


Changeset:
Modified: trunk/buildroot/package/neon/neon.mk
===================================================================
--- trunk/buildroot/package/neon/neon.mk	2008-10-20 11:53:05 UTC (rev 23742)
+++ trunk/buildroot/package/neon/neon.mk	2008-10-20 11:53:08 UTC (rev 23743)
@@ -28,7 +28,9 @@
 
 $(eval $(call AUTOTARGETS,package,neon))
 
+ifeq ($(BR2_ENABLE_DEBUG),)
 # neon doesn't have an install-strip target, so do it afterwards
 $(NEON_HOOK_POST_INSTALL): $(NEON_TARGET_INSTALL_TARGET)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libneon.so
 	touch $@
+endif
