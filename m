From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Feb 2008 13:34:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080224213456.DC1E412C5AA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-24 13:34:52 -0800 (Sun, 24 Feb 2008)
New Revision: 21103

Log:
add BR2_TEXTEDIT_SUPPORT submenu

Group text editors under BR2_TEXTEDIT_SUPPORT submenu.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-02-24 20:18:00 UTC (rev 21102)
+++ trunk/buildroot/package/Config.in	2008-02-24 21:34:52 UTC (rev 21103)
@@ -87,10 +87,6 @@
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"
 endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# busybox has an editor..
-source "package/nano/Config.in"
-endif
 source "package/portage/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
@@ -110,16 +106,28 @@
 source "package/tinylogin/Config.in"
 endif
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# busybox has an editor..
-source "package/uemacs/Config.in"
-endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/util-linux/Config.in"
 endif
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/which/Config.in"
 endif
 
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+# busybox has an editor
+
+menuconfig BR2_TEXTEDIT_SUPPORT
+	bool "Text editors"
+	default y
+	help
+	  Support for text editors
+
+if BR2_TEXTEDIT_SUPPORT
+source "package/nano/Config.in"
+source "package/uemacs/Config.in"
+endif
+
+endif
+
 menuconfig BR2_NETWORK_SUPPORT
 	bool "Networking"
 	default y
