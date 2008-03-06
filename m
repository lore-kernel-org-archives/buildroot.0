From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:18:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/metacity
Message-ID: <20080306181809.BD5EE12023A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:18:07 -0800 (Thu, 06 Mar 2008)
New Revision: 21212

Log:
fixed metacity makefile

Modified:
   trunk/buildroot/package/metacity/metacity.mk


Changeset:
Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2008-03-06 18:17:43 UTC (rev 21211)
+++ trunk/buildroot/package/metacity/metacity.mk	2008-03-06 18:18:07 UTC (rev 21212)
@@ -135,7 +135,7 @@
 	cp -a $(STAGING_DIR)/usr/share/themes/Clearlooks \
 		$(TARGET_DIR)/usr/share/themes/
 	(cd $(TARGET_DIR)/usr/share/themes; rm -rf Atlanta; ln -s Clearlooks Atlanta)
-	cp -a package/metacity/Xsession $(TARGET_DIR)/etc/X11/
+	cp package/metacity/Xsession $(TARGET_DIR)/etc/X11/
 
 metacity: uclibc zlib $(XSERVER) libgtk2 $(TARGET_DIR)/lib/*metacity*.so
 
