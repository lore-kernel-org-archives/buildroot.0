From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  7 Jul 2008 11:26:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080707182610.D0F223C3F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-07 11:26:09 -0700 (Mon, 07 Jul 2008)
New Revision: 22674

Log:
Add slashes to allow TOPDIR to end without a slash in the future

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-07 17:48:27 UTC (rev 22673)
+++ trunk/buildroot/Makefile	2008-07-07 18:26:09 UTC (rev 22674)
@@ -36,7 +36,7 @@
 ifneq ($(BUILDROOT_LOCAL),)
 BR2_LOCAL:=$(BUILDROOT_LOCAL)
 else
-BR2_LOCAL:=$(TOPDIR)local
+BR2_LOCAL:=$(TOPDIR)/local
 endif
 
 # $(shell find . -name *_defconfig |sed 's/.*\///')
@@ -349,7 +349,7 @@
 	$(MAKE) SPIDER=--spider source
 
 external-deps:
-	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)toolchain/wget-show-external-deps.sh \
+	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
 	source
 
 #############################################################
