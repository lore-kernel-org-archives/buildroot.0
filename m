From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  7 Jul 2008 16:20:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080707232011.1D0473C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-07 16:20:09 -0700 (Mon, 07 Jul 2008)
New Revision: 22676

Log:
Fix log

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-07 18:32:41 UTC (rev 22675)
+++ trunk/buildroot/Makefile	2008-07-07 23:20:09 UTC (rev 22676)
@@ -485,9 +485,8 @@
 log:	.lognr.$(PROJECT)
 	@expr `cat .lognr.$(PROJECT)` + 1 > .lognr.$(PROJECT)	
 	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
-	@$(MAKE) testing > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
+	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1 
 
-testing:
 
 cross: $(BASE_TARGETS)
 
