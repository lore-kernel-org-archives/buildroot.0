From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Mar 2009 14:58:45 +0000 (UTC)
Subject: [Buildroot] svn commit: [25652] trunk/buildroot/package/metacity
Message-ID: <20090314145845.0E9557643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-14 14:58:44 +0000 (Sat, 14 Mar 2009)
New Revision: 25652

Log:
metacity: fix target install with tinyx

Modified:
   trunk/buildroot/package/metacity/metacity.mk


Changeset:
Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2009-03-14 14:58:40 UTC (rev 25651)
+++ trunk/buildroot/package/metacity/metacity.mk	2009-03-14 14:58:44 UTC (rev 25652)
@@ -134,7 +134,7 @@
 	cp -a $(STAGING_DIR)/usr/share/themes/Clearlooks \
 		$(TARGET_DIR)/usr/share/themes/
 	(cd $(TARGET_DIR)/usr/share/themes; rm -rf Atlanta; ln -s Clearlooks Atlanta)
-	cp package/metacity/Xsession $(TARGET_DIR)/etc/X11/
+	install -D package/metacity/Xsession $(TARGET_DIR)/etc/X11/Xsession
 
 metacity: uclibc zlib $(XSERVER) libgtk2 $(TARGET_DIR)/lib/*metacity*.so
 
