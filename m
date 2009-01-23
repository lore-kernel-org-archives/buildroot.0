From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 23 Jan 2009 00:54:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090123005432.D97D576850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-23 00:54:23 +0000 (Fri, 23 Jan 2009)
New Revision: 24977

Log:
Do not reapply linux patches if LINUX26_PATCH_SOURCE is empty, and we are continuing building after a failure

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-22 23:10:12 UTC (rev 24976)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-23 00:54:23 UTC (rev 24977)
@@ -71,8 +71,12 @@
 LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
 #"))
 
-LINUX_HEADERS_DEPENDS:= $(DL_DIR)/$(LINUX26_PATCH_SOURCE) $(LINUX26_BSP_PATCH)
+LINUX_HEADERS_DEPENDS:=  $(LINUX26_BSP_PATCH)
 
+ifneq ($(LINUX26_PATCH_SOURCE),)
+LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX26_PATCH_SOURCE)
+endif
+
 # ------------------------------------
 # kernel patches provided by buildroot
 ifeq ($(strip $(LINUX26_PATCH_DIR)),)
