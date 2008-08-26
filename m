From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 14:05:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/popt
Message-ID: <20080826210507.2182AF8021@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 14:05:05 -0700 (Tue, 26 Aug 2008)
New Revision: 23224

Log:
popt: use install-strip for target install

Modified:
   trunk/buildroot/package/popt/popt.mk


Changeset:
Modified: trunk/buildroot/package/popt/popt.mk
===================================================================
--- trunk/buildroot/package/popt/popt.mk	2008-08-26 21:05:01 UTC (rev 23223)
+++ trunk/buildroot/package/popt/popt.mk	2008-08-26 21:05:05 UTC (rev 23224)
@@ -6,10 +6,10 @@
 POPT_VERSION = 1.14
 POPT_SITE = http://rpm5.org/files/popt
 POPT_INSTALL_STAGING = YES
-
+POPT_INSTALL_TARGET:=YES
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-POPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+POPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install-strip
 
 
 $(eval $(call AUTOTARGETS,package,popt))
