From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 10:10:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [25604] trunk/buildroot/package/libgtk2
Message-ID: <20090311101055.21CC97645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 10:10:54 +0000 (Wed, 11 Mar 2009)
New Revision: 25604

Log:
libgtk2: don't install demo sources

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-11 10:10:48 UTC (rev 25603)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-11 10:10:54 UTC (rev 25604)
@@ -135,4 +135,5 @@
 
 $(LIBGTK2_HOOK_POST_INSTALL):
 	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
+	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo
 	touch $@
