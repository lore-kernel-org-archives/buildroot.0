From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 05:20:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070708122058.1547FA684E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 05:20:58 -0700 (Sun, 08 Jul 2007)
New Revision: 19033

Log:
- add help target


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-08 12:10:21 UTC (rev 19032)
+++ trunk/buildroot/Makefile	2007-07-08 12:20:58 UTC (rev 19033)
@@ -28,7 +28,7 @@
 
 noconfig_targets := menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags    \
-	source-check
+	source-check help
 
 #	$(shell find . -name *_defconfig |sed 's/.*\///')
 
@@ -342,8 +342,24 @@
 	cp $(shell find ./target/ -name $@) .config
 	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
 
+help:
+	@echo 'Cleaning:'
+	@echo '  clean                  - delete temporary files created by build'
+	@echo '  distclean              - delete all non-source files (including .config)'
+	@echo
+	@echo 'Build:'
+	@echo '  all                    - make world'
+	@echo
+	@echo 'Configuration:'
+	@echo '  menuconfig             - interactive curses-based configurator'
+	@echo '  oldconfig              - resolve any unresolved symbols in .config'
+	@echo
+	@echo 'Miscellaneous:'
+	@echo '  source                 - download all sources needed for offline-build'
+	@echo '  source-check           - check all packages for valid download URLS'
+	@echo
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
-	menuconfig tags check test depend defconfig
+	menuconfig tags check test depend defconfig help
 
 
