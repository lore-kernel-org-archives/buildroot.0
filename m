From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 03:57:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070923105715.49DFF30087@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 03:57:15 -0700 (Sun, 23 Sep 2007)
New Revision: 19964

Log:
fix error when doing 'make %_defconfig

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-23 10:56:16 UTC (rev 19963)
+++ trunk/buildroot/Makefile	2007-09-23 10:57:15 UTC (rev 19964)
@@ -409,7 +409,7 @@
 
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
-	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
+	- $(MAKE) oldconfig
 
 help:
 	@echo 'Cleaning:'
