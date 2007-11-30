From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 04:34:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libogg
Message-ID: <20071130123454.E42B030058@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 04:34:54 -0800 (Fri, 30 Nov 2007)
New Revision: 20598

Log:
Strip libogg, when copied to root fs

Modified:
   trunk/buildroot/package/libogg/libogg.mk


Changeset:
Modified: trunk/buildroot/package/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/libogg/libogg.mk	2007-11-30 12:33:37 UTC (rev 20597)
+++ trunk/buildroot/package/libogg/libogg.mk	2007-11-30 12:34:54 UTC (rev 20598)
@@ -51,6 +51,7 @@
 
 $(TARGET_DIR)/usr/lib/libogg.so: $(STAGING_DIR)/usr/lib/libogg.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libogg.so* $(TARGET_DIR)/usr/lib
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libogg.so*
 ifneq ($(strip $(BR2_HAVE_MANPAGES)),y)
 	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
 endif
