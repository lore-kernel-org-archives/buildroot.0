From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 20:19:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package/directfb
	toolchain/gcc
Message-ID: <20090125201902.94BC4768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-25 20:19:01 +0000 (Sun, 25 Jan 2009)
New Revision: 25016

Log:
Makefile: globally define variables used at different places

$(comma) and $(space) are used in packages and the toolchain.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-25 20:11:45 UTC (rev 25015)
+++ trunk/buildroot/Makefile	2009-01-25 20:19:01 UTC (rev 25016)
@@ -40,6 +40,11 @@
 BR2_LOCAL:=$(TOPDIR)/local
 endif
 
+# Variables for use in Make constructs
+comma:=,
+empty:=
+space:=$(empty) $(empty)
+
 # $(shell find . -name *_defconfig |sed 's/.*\///')
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2009-01-25 20:11:45 UTC (rev 25015)
+++ trunk/buildroot/package/directfb/directfb.mk	2009-01-25 20:19:01 UTC (rev 25016)
@@ -52,9 +52,6 @@
 ifeq ($(DIRECTFB_GFX),)
 DIRECTFB_GFX:=none
 else
-comma:=,
-empty:=
-space:=$(empty) $(empty)
 DIRECTFB_GFX:=$(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
 endif
 
@@ -75,9 +72,6 @@
 ifeq ($(DIRECTFB_INPUT),)
 DIRECTFB_INPUT:=none
 else
-comma:=,
-empty:=
-space:=$(empty) $(empty)
 DIRECTFB_INPUT:=$(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
 endif
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-01-25 20:11:45 UTC (rev 25015)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-01-25 20:19:01 UTC (rev 25016)
@@ -233,7 +233,6 @@
 # affect gcc-target. However, I haven't tested gcc-target yet so no
 # guarantees. mjn3
 
-comma:=,
 GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
