From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 22:07:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libupnp
Message-ID: <20090114220718.3399676C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 22:07:17 +0000 (Wed, 14 Jan 2009)
New Revision: 24843

Log:
Remove references to sys/timeb.h in libupnp configure, ftime is removed from source already

Added:
   trunk/buildroot/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch

Modified:
   trunk/buildroot/package/libupnp/libupnp.mk


Changeset:
Added: trunk/buildroot/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
===================================================================
--- trunk/buildroot/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch	                        (rev 0)
+++ trunk/buildroot/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch	2009-01-14 22:07:17 UTC (rev 24843)
@@ -0,0 +1,11 @@
+diff -urN libupnp-1.6.6-0rig/configure libupnp-1.6.6/configure
+--- libupnp-1.6.6-0rig/configure	2008-04-25 13:47:24.000000000 +0200
++++ libupnp-1.6.6/configure	2009-01-14 21:55:16.000000000 +0100
+@@ -21096,7 +21096,6 @@
+ 	sys/ioctl.h \
+ 	sys/socket.h \
+ 	sys/time.h \
+-	sys/timeb.h \
+ 	syslog.h \
+ 	unistd.h \
+ 

Modified: trunk/buildroot/package/libupnp/libupnp.mk
===================================================================
--- trunk/buildroot/package/libupnp/libupnp.mk	2009-01-14 22:05:19 UTC (rev 24842)
+++ trunk/buildroot/package/libupnp/libupnp.mk	2009-01-14 22:07:17 UTC (rev 24843)
@@ -7,6 +7,8 @@
 LIBUPNP_SOURCE:=libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pupnp
 
+LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
+
 LIBUPNP_INSTALL_STAGING:=YES
 
 $(eval $(call AUTOTARGETS,package,libupnp))
