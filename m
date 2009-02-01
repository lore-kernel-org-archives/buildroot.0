From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  1 Feb 2009 16:10:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090201161048.2F41E7653E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-02-01 16:10:47 +0000 (Sun, 01 Feb 2009)
New Revision: 25205

Log:
Do not overwrite user configuration

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-02-01 00:40:45 UTC (rev 25204)
+++ trunk/buildroot/package/Makefile.in	2009-02-01 16:10:47 UTC (rev 25205)
@@ -10,19 +10,19 @@
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
 ifeq ($(BR2_OPTIMIZE_0),y)
-TARGET_OPTIMIZATION=-O0
+TARGET_OPTIMIZATION+=-O0
 endif
 ifeq ($(BR2_OPTIMIZE_1),y)
-TARGET_OPTIMIZATION=-O1
+TARGET_OPTIMIZATION+=-O1
 endif
 ifeq ($(BR2_OPTIMIZE_2),y)
-TARGET_OPTIMIZATION=-O2
+TARGET_OPTIMIZATION+=-O2
 endif
 ifeq ($(BR2_OPTIMIZE_3),y)
-TARGET_OPTIMIZATION=-O3
+TARGET_OPTIMIZATION+=-O3
 endif
 ifeq ($(BR2_OPTIMIZE_S),y)
-TARGET_OPTIMIZATION=-Os
+TARGET_OPTIMIZATION+=-Os
 endif
 ifeq ($(BR2_DEBUG_1),y)
 TARGET_DEBUGGING=-g1
