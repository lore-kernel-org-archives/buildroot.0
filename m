From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:23:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xstroke
Message-ID: <20080424132329.0B95B3C863@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:23:28 -0700 (Thu, 24 Apr 2008)
New Revision: 21838

Log:
select docker with xstroke so xstroke has a place to live

Modified:
   trunk/buildroot/package/xstroke/Config.in
   trunk/buildroot/package/xstroke/xstroke.mk


Changeset:
Modified: trunk/buildroot/package/xstroke/Config.in
===================================================================
--- trunk/buildroot/package/xstroke/Config.in	2008-04-24 13:22:34 UTC (rev 21837)
+++ trunk/buildroot/package/xstroke/Config.in	2008-04-24 13:23:28 UTC (rev 21838)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
+	select BR2_PACKAGE_DOCKER
 	default n
 	help
 	  Handwriting recognition for X

Modified: trunk/buildroot/package/xstroke/xstroke.mk
===================================================================
--- trunk/buildroot/package/xstroke/xstroke.mk	2008-04-24 13:22:34 UTC (rev 21837)
+++ trunk/buildroot/package/xstroke/xstroke.mk	2008-04-24 13:23:28 UTC (rev 21838)
@@ -11,7 +11,7 @@
 XSTROKE_INSTALL_TARGET = YES
 XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XSTROKE_DEPENDENCIES = uclibc docker
+XSTROKE_DEPENDENCIES = uclibc 
 
 $(eval $(call AUTOTARGETS,package,xstroke))
 
