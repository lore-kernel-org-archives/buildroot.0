From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 06:58:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070929135836.8D28E300BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 06:58:30 -0700 (Sat, 29 Sep 2007)
New Revision: 20112

Log:
- Nowadays there is no need to strip the config symbols anymore


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-29 10:05:08 UTC (rev 20111)
+++ trunk/buildroot/Makefile	2007-09-29 13:58:30 UTC (rev 20112)
@@ -127,7 +127,7 @@
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 
 
-ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
+ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # cc-option
 # Usage: cflags-y+=$(call cc-option, -march=winchip-c6, -march=i586)
@@ -349,7 +349,7 @@
 	bzip2 -9 buildroot.tar; \
 
 
-else # ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
+else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
 
@@ -434,7 +434,7 @@
 distclean: clean
 	rm -rf sources/*
 
-endif # ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
+endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
