From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  9 Apr 2009 11:34:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [26042] trunk/buildroot/target
Message-ID: <20090409113412.73F38769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-09 11:34:11 +0000 (Thu, 09 Apr 2009)
New Revision: 26042

Log:
target/Makefile.in: make 3.80 compatibility fix

Patch by Andreas Schweigstill <aschweig@schweigstill.de>

Modified:
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2009-04-09 09:46:54 UTC (rev 26041)
+++ trunk/buildroot/target/Makefile.in	2009-04-09 11:34:11 UTC (rev 26042)
@@ -19,7 +19,8 @@
 	fi
 endef
 COPYTO=$(strip $(subst ",,$(BUILDROOT_COPYTO)))
-else ifneq ($(strip $(subst ",,$(BR2_COPYTO))),)	# Global override
+else
+ifneq ($(strip $(subst ",,$(BR2_COPYTO))),)	# Global override
 #"))
 define COPY_FILE
 	@echo "BR2_COPYTO: Copy to $(BR2_COPYTO)/$(strip $(3))" ; \
@@ -52,6 +53,7 @@
 endef
 #"))
 endif
+endif
 
 # make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
