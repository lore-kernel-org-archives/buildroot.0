From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Oct 2008 02:14:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
Message-ID: <20081026091413.AEB70F801B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-26 02:14:13 -0700 (Sun, 26 Oct 2008)
New Revision: 23798

Log:
docker: requires pkgconfig, glib2 and X11

Modified:
   trunk/buildroot/package/docker/Config.in
   trunk/buildroot/package/docker/docker.mk


Changeset:
Modified: trunk/buildroot/package/docker/Config.in
===================================================================
--- trunk/buildroot/package/docker/Config.in	2008-10-26 09:14:10 UTC (rev 23797)
+++ trunk/buildroot/package/docker/Config.in	2008-10-26 09:14:13 UTC (rev 23798)
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_DOCKER
 	bool "docker"
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  a system tray dock for X
 

Modified: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	2008-10-26 09:14:10 UTC (rev 23797)
+++ trunk/buildroot/package/docker/docker.mk	2008-10-26 09:14:13 UTC (rev 23798)
@@ -19,7 +19,7 @@
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
-DOCKER_DEPENDENCIES = uclibc
+DOCKER_DEPENDENCIES = uclibc pkgconfig libglib2 $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,docker))
 
