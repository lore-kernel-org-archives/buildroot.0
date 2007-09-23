From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 07:36:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070923143605.9BC2A3009A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 07:36:04 -0700 (Sun, 23 Sep 2007)
New Revision: 19975

Log:
Ensure make %_defconfig works without error - now silently

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-23 14:26:19 UTC (rev 19974)
+++ trunk/buildroot/Makefile	2007-09-23 14:36:04 UTC (rev 19975)
@@ -409,7 +409,7 @@
 
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
-	- $(MAKE) oldconfig
+	-@$(MAKE) oldconfig
 
 help:
 	@echo 'Cleaning:'
