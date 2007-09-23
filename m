From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 05:12:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20070923121223.5499030091@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 05:12:22 -0700 (Sun, 23 Sep 2007)
New Revision: 19966

Log:
Strip files the correct alsa-lib subdirectory

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-09-23 12:09:54 UTC (rev 19965)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-09-23 12:12:22 UTC (rev 19966)
@@ -53,7 +53,7 @@
 	cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
 	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libasound.so*
-	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/alsa-lib/*.so
+	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/alsa-lib/smixer/*.so
 	touch -c $@
 
 alsa-lib: uclibc $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
