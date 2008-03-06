From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:19:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  ng-spice-rework
Message-ID: <20080306181942.C65031201F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:19:42 -0800 (Thu, 06 Mar 2008)
New Revision: 21216

Log:
added ngspice-rework 

Added:
   trunk/buildroot/package/ng-spice-rework/
   trunk/buildroot/package/ng-spice-rework/Config.in
   trunk/buildroot/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch
   trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk


Changeset:
Added: trunk/buildroot/package/ng-spice-rework/Config.in
===================================================================
--- trunk/buildroot/package/ng-spice-rework/Config.in	                        (rev 0)
+++ trunk/buildroot/package/ng-spice-rework/Config.in	2008-03-06 18:19:42 UTC (rev 21216)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NG_SPICE_REWORK
+	bool "ng-spice-rework"
+	default n
+	help
+	  Ngspice is a mixed-level/mixed-signal circuit simulator.
+
+	  http://superb-west.dl.sourceforge.net/sourceforge/ngspice

Added: trunk/buildroot/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch
===================================================================
--- trunk/buildroot/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch	                        (rev 0)
+++ trunk/buildroot/package/ng-spice-rework/ng-spice-rework-17-makeidx.patch	2008-03-06 18:19:42 UTC (rev 21216)
@@ -0,0 +1,12 @@
+--- a/src/Makefile.in	2005-08-30 03:58:00.000000000 -0400
++++ b/src/Makefile.in	2008-02-13 14:38:04.000000000 -0500
+@@ -882,7 +882,8 @@ spice.o: main.c
+ 		$(COMPILE) -DSIMULATOR -o spice.o  -c $(srcdir)/main.c
+ 
+ ngspice.idx: makeidx
+-	./makeidx $(srcdir)/ngspice.txt
++	gcc -I/usr/include -I.. -I./include $(makeidx_SOURCES) -o makeidx-host
++	./makeidx-host $(srcdir)/ngspice.txt
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:

Added: trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk
===================================================================
--- trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	                        (rev 0)
+++ trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-03-06 18:19:42 UTC (rev 21216)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# ng-spice-rework
+#
+#############################################################
+NG_SPICE_REWORK_VERSION = 17
+NG_SPICE_REWORK_SOURCE = ng-spice-rework-$(NG_SPICE_REWORK_VERSION).tar.gz
+NG_SPICE_REWORK_SITE = http://superb-west.dl.sourceforge.net/sourceforge/ngspice
+NG_SPICE_REWORK_AUTORECONF = NO
+NG_SPICE_REWORK_INSTALL_STAGING = NO
+NG_SPICE_REWORK_INSTALL_TARGET = YES
+
+NG-SPICE-REWORK_CONF_OPT = 
+
+NG-SPICE-REWORK_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,ng-spice-rework))
+
