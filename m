From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 10 Aug 2006 13:58:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20060810205815.29700485C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-08-10 13:58:14 -0700 (Thu, 10 Aug 2006)
New Revision: 15798

Log:
comparing $(ARCH) vs i.e. i386 isn't going to work when ARCH=i486 etc.
Need to instead compare vs BR2_i386 and friends.


Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2006-08-10 20:21:33 UTC (rev 15797)
+++ trunk/buildroot/package/portage/portage.mk	2006-08-10 20:58:14 UTC (rev 15798)
@@ -18,22 +18,22 @@
 SANDBOX_DIR:=$(BUILD_DIR)/sandbox-$(SANDBOX_VERSION)
 SANDBOX_TARGET_BINARY:=usr/bin/sandbox
 
-ifeq ($(ARCH),cris)
+ifeq ($(BR2_cris),y)
 	PORTAGE_ARCH:=x86
 endif
-ifeq ($(ARCH), mipsel)
+ifeq ($(BR2_mipsel),y)
 	PORTAGE_ARCH:=mips
 endif
-ifeq ($(ARCH), powerpc)
+ifeq ($(BR2_powerpc),y)
 	PORTAGE_ARCH:=ppc
 endif
-ifeq ($(ARCH),sh4)
+ifeq ($(BR2_sh4),y)
 	PORTAGE_ARCH:=sh
 endif
-ifeq ($(ARCH),sh64)
+ifeq ($(BR2_sh64),y)
 	PORTAGE_ARCH:=sh
 endif
-ifeq ($(ARCH), i386)
+ifeq ($(BR2_i386),y)
 	PORTAGE_ARCH:=x86
 endif
 ifeq ($(PORTAGE_ARCH),)
