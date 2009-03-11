From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 15:43:43 +0000 (UTC)
Subject: [Buildroot] svn commit: [25609] trunk/buildroot/package/gmpc
Message-ID: <20090311154344.0DED47645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 15:43:43 +0000 (Wed, 11 Mar 2009)
New Revision: 25609

Log:
gmpc: fix build without libSM

Modified:
   trunk/buildroot/package/gmpc/gmpc.mk


Changeset:
Modified: trunk/buildroot/package/gmpc/gmpc.mk
===================================================================
--- trunk/buildroot/package/gmpc/gmpc.mk	2009-03-11 15:07:44 UTC (rev 25608)
+++ trunk/buildroot/package/gmpc/gmpc.mk	2009-03-11 15:43:43 UTC (rev 25609)
@@ -10,8 +10,13 @@
 GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes
 GMPC_CONF_OPT = --disable-mmkeys
 
-
 GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
+GMPC_DEPENENCIES += xlib_libSM
+GMPC_CONF_OPT += --enable-sm
+else
+GMPC_CONF_OPT += --disable-sm
+endif
 
 $(eval $(call AUTOTARGETS,package,gmpc))
