From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 19:36:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090115193608.37CB776850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-15 19:36:06 +0000 (Thu, 15 Jan 2009)
New Revision: 24862

Log:
Makefile: implement make release

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-15 14:50:20 UTC (rev 24861)
+++ trunk/buildroot/Makefile	2009-01-15 19:36:06 UTC (rev 24862)
@@ -516,6 +516,12 @@
 	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo
 
+release: distclean
+	OUT=buildroot-$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
+	rm -rf ../$$OUT*; cp -al . ../$$OUT; cd ..; \
+	tar cfz $$OUT.tar.gz --exclude .svn --exclude .git --exclude \*~ $$OUT; \
+	rm -rf $$OUT
+
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
 
