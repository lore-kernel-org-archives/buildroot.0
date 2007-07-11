From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 11 Jul 2007 08:01:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/mtd
Message-ID: <20070711150143.5AF71A610D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-11 08:01:42 -0700 (Wed, 11 Jul 2007)
New Revision: 19067

Log:
Define date of build as DATE, use in mtd/mtd.mk

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-11 14:47:39 UTC (rev 19066)
+++ trunk/buildroot/Makefile	2007-07-11 15:01:42 UTC (rev 19067)
@@ -25,6 +25,7 @@
 CONFIG_CONFIG_IN = Config.in
 CONFIG_DEFCONFIG = .defconfig
 CONFIG = package/config
+DATE:=$(shell date -u +%Y%m%d)
 
 noconfig_targets := menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags    \

Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-07-11 14:47:39 UTC (rev 19066)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-07-11 15:01:42 UTC (rev 19067)
@@ -5,8 +5,8 @@
 #############################################################
 ifeq ($(strip $(BR2_PACKAGE_MTD_SNAPSHOT)),y)
 # Be aware that this changes daily....
-TODAY:=$(shell date -u +%Y%m%d)
-MTD_DL_SOURCE:=mtd-snapshot-$(TODAY).tar.bz2
+
+MTD_DL_SOURCE:=mtd-snapshot-$(DATE).tar.bz2
 MTD_CAT:=$(BZCAT)
 MTD_SOURCE:=mtd-snapshot.tar.bz2
 MTD_SITE:=ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs
