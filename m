From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 20:50:59 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/popt
Message-ID: <20090125205100.1BBE176D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 20:50:59 +0000 (Sun, 25 Jan 2009)
New Revision: 25019

Log:
Support libiconv option for popt

Modified:
   trunk/buildroot/package/popt/popt.mk


Changeset:
Modified: trunk/buildroot/package/popt/popt.mk
===================================================================
--- trunk/buildroot/package/popt/popt.mk	2009-01-25 20:44:23 UTC (rev 25018)
+++ trunk/buildroot/package/popt/popt.mk	2009-01-25 20:50:59 UTC (rev 25019)
@@ -5,10 +5,16 @@
 #############################################################
 POPT_VERSION:=1.14
 POPT_SITE:=http://rpm5.org/files/popt
-POPT_INSTALL_STAGING:=YES
-POPT_INSTALL_TARGET:=YES
-POPT_CONF_ENV:=ac_cv_va_copy=yes
+POPT_INSTALL_STAGING = YES
+POPT_INSTALL_TARGET = YES
 
+POPT_CONF_ENV = ac_cv_va_copy=yes
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+POPT_CONF_ENV += am_cv_lib_iconv=yes
+POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
+endif
+
 POPT_DEPENDENCIES:=uclibc
 
 $(eval $(call AUTOTARGETS,package,popt))
