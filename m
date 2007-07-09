From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 09 Jul 2007 14:01:50 +0200
Subject: [Buildroot] Global definition of Today's date.
Message-ID: <1183982510.5278.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Think I am going to need today's date in a few other places.
The date seems to be defined in mtd/mtd.mk, but
I think the top Makefile is more appropriate for this.
Anyone has a problem with me applying this patch?



Index: package/mtd/mtd.mk
===================================================================
--- package/mtd/mtd.mk  (revision 19054)
+++ package/mtd/mtd.mk  (arbetskopia)
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
Index: Makefile
===================================================================
--- Makefile    (revision 19054)
+++ Makefile    (arbetskopia)
@@ -25,6 +25,7 @@
 CONFIG_CONFIG_IN = Config.in
 CONFIG_DEFCONFIG = .defconfig
 CONFIG = package/config
+DATE:=$(shell date -u +%Y%m%d)
 
 noconfig_targets := menuconfig config oldconfig randconfig \
        defconfig allyesconfig allnoconfig release tags    \


Best Regards
Ulf Samuelsson
