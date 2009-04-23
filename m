From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 19:29:23 +0000 (UTC)
Subject: [Buildroot] svn commit: [26198] trunk/buildroot/package/directfb
Message-ID: <20090423192924.15ABA76454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 19:29:23 +0000 (Thu, 23 Apr 2009)
New Revision: 26198

Log:
directfb: bump version

Based on patch by Sven Neumann <s.neumann@phase-zero.de>, closes #281.

Added:
   trunk/buildroot/package/directfb/directfb--ppc-compile-fix.patch

Removed:
   trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Copied: trunk/buildroot/package/directfb/directfb--ppc-compile-fix.patch (from rev 26197, trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch)
===================================================================
--- trunk/buildroot/package/directfb/directfb--ppc-compile-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/directfb/directfb--ppc-compile-fix.patch	2009-04-23 19:29:23 UTC (rev 26198)
@@ -0,0 +1,17 @@
+---
+ lib/direct/ppcasm_memcpy_cachable.S |    2 --
+ 1 file changed, 2 deletions(-)
+
+Index: DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
+===================================================================
+--- DirectFB-1.2.7.orig/lib/direct/ppcasm_memcpy_cachable.S
++++ DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
+@@ -34,8 +34,6 @@
+ 
+ #define __ASSEMBLY__
+ 
+-#include <linux/config.h>
+-
+ #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
+ #define L1_CACHE_LINE_SIZE       16
+ #define LG_L1_CACHE_LINE_SIZE     4 

Deleted: trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch
===================================================================
--- trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch	2009-04-23 18:59:34 UTC (rev 26197)
+++ trunk/buildroot/package/directfb/directfb-1.2.7-ppc-compile-fix.patch	2009-04-23 19:29:23 UTC (rev 26198)
@@ -1,17 +0,0 @@
----
- lib/direct/ppcasm_memcpy_cachable.S |    2 --
- 1 file changed, 2 deletions(-)
-
-Index: DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
-===================================================================
---- DirectFB-1.2.7.orig/lib/direct/ppcasm_memcpy_cachable.S
-+++ DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
-@@ -34,8 +34,6 @@
- 
- #define __ASSEMBLY__
- 
--#include <linux/config.h>
--
- #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
- #define L1_CACHE_LINE_SIZE       16
- #define LG_L1_CACHE_LINE_SIZE     4 

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2009-04-23 18:59:34 UTC (rev 26197)
+++ trunk/buildroot/package/directfb/directfb.mk	2009-04-23 19:29:23 UTC (rev 26198)
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR:=1.2
-DIRECTFB_VERSION:=1.2.7
+DIRECTFB_VERSION:=1.2.8
 #DIRECTFB_VERSION:=1.3.0	is a development version
 #DIRECTFB_VERSION_MAJOR:=1.3
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
