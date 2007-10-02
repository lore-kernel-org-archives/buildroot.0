From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  2 Oct 2007 04:11:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltrace
Message-ID: <20071002111155.7DF73A6590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-02 04:11:54 -0700 (Tue, 02 Oct 2007)
New Revision: 20172

Log:
- has to select libelf (and should nowadays work without LFS)


Modified:
   trunk/buildroot/package/ltrace/Config.in


Changeset:
Modified: trunk/buildroot/package/ltrace/Config.in
===================================================================
--- trunk/buildroot/package/ltrace/Config.in	2007-10-02 11:06:43 UTC (rev 20171)
+++ trunk/buildroot/package/ltrace/Config.in	2007-10-02 11:11:54 UTC (rev 20172)
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	default n
-	depends on BR2_LARGEFILE
-	depends on BR2_PACKAGE_LIBELF
+	#depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBELF_HEADERS
 	help
 	  Debugging program which runs a specified command until it exits.
 
