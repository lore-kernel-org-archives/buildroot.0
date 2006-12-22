From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 05:38:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dialog
Message-ID: <20061222133805.4B07C4859C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 05:38:04 -0800 (Fri, 22 Dec 2006)
New Revision: 17052

Log:
- bump version
- add to targets. Closes #724


Modified:
   trunk/buildroot/package/dialog/Config.in
   trunk/buildroot/package/dialog/dialog.mk


Changeset:
Modified: trunk/buildroot/package/dialog/Config.in
===================================================================
--- trunk/buildroot/package/dialog/Config.in	2006-12-22 12:36:13 UTC (rev 17051)
+++ trunk/buildroot/package/dialog/Config.in	2006-12-22 13:38:04 UTC (rev 17052)
@@ -5,7 +5,7 @@
     help
         dialog - display dialog boxes from shell scripts
 
-        This application provides a method of displaying several different types
-        of dialog boxes from shell scripts.  This allows a developer of a script
-        to interact with the user in a much friendlier manner.
+        This application provides a method of displaying several different
+	types of dialog boxes from shell scripts.  This allows a developer
+	of a script to interact with the user in a much friendlier manner.
 

Modified: trunk/buildroot/package/dialog/dialog.mk
===================================================================
--- trunk/buildroot/package/dialog/dialog.mk	2006-12-22 12:36:13 UTC (rev 17051)
+++ trunk/buildroot/package/dialog/dialog.mk	2006-12-22 13:38:04 UTC (rev 17052)
@@ -4,7 +4,7 @@
 #
 #############################################################
 ###testing: DIALOG_VERSION:=1.0-20050116-1
-DIALOG_VERSION:=1.0-20050206
+DIALOG_VERSION:=1.0-20060221
 DIALOG_SOURCE:=dialog_$(DIALOG_VERSION).orig.tar.gz
 DIALOG_SITE:=http://ftp.debian.org/debian/pool/main/d/dialog
 DIALOG_DIR:=$(BUILD_DIR)/dialog-$(DIALOG_VERSION)
@@ -56,3 +56,11 @@
 dialog-dirclean:
 	rm -rf $(DIALOG_DIR)
 
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DIALOG)),y)
+TARGETS+=dialog
+endif
