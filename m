From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 30 Jan 2009 11:30:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
Message-ID: <20090130113022.691E7765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-30 11:30:21 +0000 (Fri, 30 Jan 2009)
New Revision: 25163

Log:
qte.mk: Add a 'comment' to indicate the need for NPTL threads

Make sure the developer is informed why a package is not
visable and that they need to have a NPTL enabled
toolchain.
 
Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>


Modified:
   trunk/buildroot/package/qte/Config.in


Changeset:
Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2009-01-30 10:49:59 UTC (rev 25162)
+++ trunk/buildroot/package/qte/Config.in	2009-01-30 11:30:21 UTC (rev 25163)
@@ -14,9 +14,10 @@
 	  Only tested with threading on, PACKAGE_JPEG, PACKAGE_LIBPNG,
 	  but remove those if you like.
 
-comment "Qt/E requires a toolchain with C++ support enabled"
+comment "Qt/E requires a toolchain with C++ support enabled and native threading enabled (NPTL)"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_DEPRECATED
+	depends on !BR2_PTHREADS_NATIVE
 
 config BR2_PACKAGE_QTE_COMMERCIAL_USERNAME
 	string "Qt/E Commercial License Username"
