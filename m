From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 30 Jan 2009 10:50:01 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
Message-ID: <20090130105001.98CDB765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-30 10:49:59 +0000 (Fri, 30 Jan 2009)
New Revision: 25162

Log:
qte.mk: Use depends on for toolchain features 

Buildroot is adopting depends on for toolchain features and
select for packages. Make this change in this file.
 
Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>


Modified:
   trunk/buildroot/package/qte/Config.in


Changeset:
Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2009-01-30 10:35:55 UTC (rev 25161)
+++ trunk/buildroot/package/qte/Config.in	2009-01-30 10:49:59 UTC (rev 25162)
@@ -2,7 +2,7 @@
 	bool "Qt/E"
 	depends on BR2_DEPRECATED
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PTHREADS_NATIVE
+	depends on BR2_PTHREADS_NATIVE
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
 	help
