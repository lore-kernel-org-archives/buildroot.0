From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 10:48:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxslt
Message-ID: <20080615174834.06B493C8F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 10:48:33 -0700 (Sun, 15 Jun 2008)
New Revision: 22351

Log:
libxslt: use select instead of depends for pkgconfig like other packages

There's not much point in using depends instead of select for pkgconfig as
it's a host tool, E.G. it doesn't add anything to the rootfs.

At the same time, strip Config.in of trailing spaces.


Modified:
   trunk/buildroot/package/libxslt/Config.in


Changeset:
Modified: trunk/buildroot/package/libxslt/Config.in
===================================================================
--- trunk/buildroot/package/libxslt/Config.in	2008-06-15 11:49:42 UTC (rev 22350)
+++ trunk/buildroot/package/libxslt/Config.in	2008-06-15 17:48:33 UTC (rev 22351)
@@ -1,21 +1,18 @@
 config BR2_PACKAGE_LIBXSLT
 	bool "libxslt"
 	default n
-	depends BR2_PACKAGE_PKGCONFIG
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Install the xslt library which is used
 	  to transform XML files to other XML files.
 
-	  XSLT is designed for use as part of XSL, 
-	  which is a stylesheet language for XML. 
-	  In addition to XSLT, XSL includes an XML vocabulary 
-	  for specifying formatting. 
+	  XSLT is designed for use as part of XSL,
+	  which is a stylesheet language for XML.
+	  In addition to XSLT, XSL includes an XML vocabulary
+	  for specifying formatting.
 	  XSL specifies the styling of an XML document by using XSLT
 	  to describe how the document is transformed into another
 	  XML document that uses the formatting vocabulary.
 
 	  http://www.w3.org/TR/xslt
 
-comment "libxslt	- disabled (requires pkgconfig)"
-	depends !BR2_PACKAGE_PKGCONFIG
-
