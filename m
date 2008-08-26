From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 14:05:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/popt
Message-ID: <20080826210510.77957F8024@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 14:05:10 -0700 (Tue, 26 Aug 2008)
New Revision: 23225

Log:
popt: use := assignments

Modified:
   trunk/buildroot/package/popt/popt.mk


Changeset:
Modified: trunk/buildroot/package/popt/popt.mk
===================================================================
--- trunk/buildroot/package/popt/popt.mk	2008-08-26 21:05:05 UTC (rev 23224)
+++ trunk/buildroot/package/popt/popt.mk	2008-08-26 21:05:10 UTC (rev 23225)
@@ -3,13 +3,13 @@
 # popt
 #
 #############################################################
-POPT_VERSION = 1.14
-POPT_SITE = http://rpm5.org/files/popt
-POPT_INSTALL_STAGING = YES
+POPT_VERSION:=1.14
+POPT_SITE:=http://rpm5.org/files/popt
+POPT_INSTALL_STAGING:=YES
 POPT_INSTALL_TARGET:=YES
-POPT_CONF_ENV = ac_cv_va_copy=yes
+POPT_CONF_ENV:=ac_cv_va_copy=yes
+POPT_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
-POPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install-strip
+POPT_DEPENDENCIES:=uclibc
 
-
 $(eval $(call AUTOTARGETS,package,popt))
