From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 25 Oct 2008 23:03:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081026060323.89E3E3C2C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-25 23:03:23 -0700 (Sat, 25 Oct 2008)
New Revision: 23793

Log:
qtopia4: reduce the use of BR2_PACKAGE_QTOPIA4

Use one conditional if statement instead of several single "depends on".

Patch by Markus Heidelberg.

Cleaned up trailing white space while we're at it.

Modified:
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-10-26 00:24:38 UTC (rev 23792)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-10-26 06:03:23 UTC (rev 23793)
@@ -7,16 +7,16 @@
 
 	  http://www.trolltech.com/
 
+if BR2_PACKAGE_QTOPIA4
+
 config BR2_PACKAGE_QTOPIA4_DEBUG
 	bool "Compile with debug support"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  If unsure, say N.
 
 choice
 	prompt "Library type"
 	default BR2_PACKAGE_QTOPIA4_SHARED
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Selects the library type: Shared or Static
 
@@ -40,7 +40,6 @@
 choice
 	prompt "Qtopia 4 Core license type"
 	default BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Selects the type of license you which to use for Qtopia 4 Core.
 
@@ -54,7 +53,7 @@
 
 config BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED
 	bool "Approve Qtopia Core 4 GPL licence"
-	depends on BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
+	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL
 	help
 	  Select this if you approve the GNU GENERAL PUBLIC LICENSE Version 2
 	  on the Qtopia Core 4 library. By doing this you will not be asked
@@ -67,7 +66,7 @@
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
 	string "Qtopia Core 4 Commercial License Username"
 	default ""
-	depends on BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
+	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
 	  Commercial users can download their source directly by
 	  providing a username.
@@ -75,14 +74,13 @@
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
 	string "Qtopia Core 4 Commercial License Password"
 	default ""
-	depends on BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
+	depends on BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
 	  Commercial users can download their source directly by
 	  providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
 	bool "Compatibility with Qt3"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Turns on support for older Qt3. This will create an additional
 	  library with proxy code and increase the space required on target.
@@ -91,26 +89,22 @@
 config BR2_PACKAGE_QTOPIA4_DEPTHS
 	string "color depths to support"
 	default "-depths 24,16,8"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Which color depths to support for the library. Default is "-depths
 	  24,16,8". Different depths are specified by a comma separated list.
 
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  This compiles and installs the plugin for GIF reading support.
 
 config BR2_PACKAGE_QTOPIA4_LIBMNG
 	bool "Enable libmng support"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  This compiles and installs the plugin for MNG support.
 
 choice
 	prompt "JPEG support"
-	depends on BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_NOJPEG
 	help
 	  Select libjpeg support.
@@ -134,7 +128,6 @@
 
 choice
 	prompt "PNG support"
-	depends on BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_NOPNG
 	help
 	  Select which library to use if PNG support should be enabled.
@@ -152,7 +145,6 @@
 
 choice
 	prompt "TIFF support"
-	depends on BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_NOTIFF
 	help
 	  Select which library to use if TIFF support should be enabled.
@@ -170,7 +162,6 @@
 
 choice
 	prompt "zlib support"
-	depends on BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_QTZLIB
 	help
 	  Select zlib support.
@@ -179,17 +170,16 @@
 	bool "Qt zlib"
 	help
 	  Use the zlib bundled with Qt.
-	
+
 config BR2_PACKAGE_QTOPIA4_SYSTEMZLIB
 	bool "System zlib"
 	select BR2_PACKAGE_ZLIB
 	help
 	  Use the shared zlib from the system.
 endchoice
-								
+
 choice
 	prompt "freetype2 support"
-	depends on BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_NOFREETYPE
 	help
 	  Select freetype2 support.
@@ -204,7 +194,7 @@
 	bool "Qt freetype2"
 	help
 	  Use the libfreetype bundled with Qt.
-	
+
 config BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE
 	bool "System freetype2"
 	select BR2_PACKAGE_FREETYPE
@@ -212,7 +202,7 @@
 	  Use shared libfreetype from the target system.
 	  See http://www.freetype.org/
 endchoice
-	
+
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
 	string "The embedded platform we are making Qtopia4 for"
 	default "arm"	if BR2_arm
@@ -231,13 +221,11 @@
 	default "generic"	if BR2_sh
 	default "generic"	if BR2_sh64
 	default "generic"	if BR2_sparc
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  The target platform.
 
 menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
 	bool "SQL Module"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Compile Qtopia SQL Module
 if BR2_PACKAGE_QTOPIA4_SQL_MODULE
@@ -246,28 +234,24 @@
 
 config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
 	bool "XML Patterns Module"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Build QtXmlPatterns module.
 	  If unsure, say n
 
 config BR2_PACKAGE_QTOPIA4_SVG
 	bool "SVG Module"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Build the SVG module.
 	  If unsure, say n
 
 config BR2_PACKAGE_QTOPIA4_WEBKIT
 	bool "WebKit Module"
-	depends on BR2_PACKAGE_QTOPIA4
 	help
 	  Build the WebKit module.
 	  If unsure, say n.
 
 config BR2_PACKAGE_QTOPIA4_OPENSSL
 	bool "Enable OpenSSL support"
-	depends on BR2_PACKAGE_QTOPIA4
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable support for the OpenSSL encryption library. If you use
@@ -275,3 +259,4 @@
 	  target.
 	  If unsure, say n.
 
+endif # BR2_PACKAGE_QTOPIA4
