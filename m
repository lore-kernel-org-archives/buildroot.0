From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:55:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080511065504.6AF0F3C87C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:55:04 -0700 (Sat, 10 May 2008)
New Revision: 21971

Log:
Use local time (Thanks Mike)

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-05-11 06:47:14 UTC (rev 21970)
+++ trunk/buildroot/Makefile	2008-05-11 06:55:04 UTC (rev 21971)
@@ -25,7 +25,7 @@
 CONFIG_CONFIG_IN=Config.in
 CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
-DATE:=$(shell date -u +%Y%m%d)
+DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags \
