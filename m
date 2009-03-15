From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Mar 2009 13:54:56 +0000 (UTC)
Subject: [Buildroot] svn commit: [25663] trunk/buildroot/package/qtopia4
Message-ID: <20090315135456.8CEC8763D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-15 13:54:56 +0000 (Sun, 15 Mar 2009)
New Revision: 25663

Log:
qtopia4: remove selection of GPL/LPGL licenses

Choosing between GPL or LGPL doesn't change the build process, so it's
sufficient to have a selection for the commercial license.

Also change the URLs to the licenses to the Qt web page, where the
exception for the LGPL is included.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-15 13:51:30 UTC (rev 25662)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-15 13:54:56 UTC (rev 25663)
@@ -39,39 +39,23 @@
 
 endchoice
 
-choice
-	prompt "Qtopia 4 Core license type"
-	default BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_LGPL
-	help
-	  Selects the type of license you which to use for Qtopia 4 Core.
-
-config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_LGPL
-	bool "LGPL license"
-
-config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
-	bool "GPL license"
-
 config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
-	bool "Commercial license"
+	bool "Use commercial license"
 
-endchoice
-
 config BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED
-	bool "Approve Qtopia Core 4 license"
-	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL || BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_LGPL
+	bool "Approve free license"
+	depends on !BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	  Select this if you approve the above selected license for the
-	  Qtopia Core 4 library.
+	  Select this if you approve one of the available free licenses for the
+	  Qt4 library.
 	  By doing this you will not be asked while the library is compiled.
 	  Please read and understand the license terms before approving this.
 
-	  For full GPL version 2 see http://www.gnu.org/licenses/gpl2.txt
-	  For full LGPL see http://www.gnu.org/licenses/lgpl.txt
+	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
+	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
 
-
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
 	string "Qtopia Core 4 Commercial License Username"
-	default ""
 	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
 	  Commercial users can download their source directly by
@@ -79,7 +63,6 @@
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
 	string "Qtopia Core 4 Commercial License Password"
-	default ""
 	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
 	  Commercial users can download their source directly by
