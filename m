From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Mar 2008 04:19:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain
Message-ID: <20080304121917.1068712C853@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-04 04:19:16 -0800 (Tue, 04 Mar 2008)
New Revision: 21162

Log:
buildroot: add external-deps target

Add external-deps target to show what external files are needed to recreate
the build.


Added:
   trunk/buildroot/toolchain/wget-show-external-deps.sh

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-04 12:19:13 UTC (rev 21161)
+++ trunk/buildroot/Makefile	2008-03-04 12:19:16 UTC (rev 21162)
@@ -322,6 +322,10 @@
 _source-check:
 	$(MAKE) SPIDER=--spider source
 
+external-deps:
+	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)toolchain/wget-show-external-deps.sh \
+	source
+
 #############################################################
 #
 # Cleanup and misc junk
@@ -461,6 +465,7 @@
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
+	@echo '  external-deps          - list external packages used'
 	@echo
 	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo

Added: trunk/buildroot/toolchain/wget-show-external-deps.sh
===================================================================
--- trunk/buildroot/toolchain/wget-show-external-deps.sh	                        (rev 0)
+++ trunk/buildroot/toolchain/wget-show-external-deps.sh	2008-03-04 12:19:16 UTC (rev 21162)
@@ -0,0 +1,6 @@
+#!/bin/sh
+#
+# replacement for wget (see BR2_WGET) which simply shows the file name to be
+# downloaded. Used by the external-deps make target.
+
+exec basename ${!#}
\ No newline at end of file


Property changes on: trunk/buildroot/toolchain/wget-show-external-deps.sh
___________________________________________________________________
Name: svn:executable
   + *
