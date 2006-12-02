From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 11:01:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20061202190111.2B05D48606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 11:01:10 -0800 (Sat, 02 Dec 2006)
New Revision: 16763

Log:
- andersee, what was that good for? It just slows down rebuilds as it delves into each sub-file needlessly.. Ripping out.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-12-02 18:36:55 UTC (rev 16762)
+++ trunk/buildroot/Makefile	2006-12-02 19:01:10 UTC (rev 16763)
@@ -28,8 +28,9 @@
 
 noconfig_targets := menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags    \
-	$(shell find . -name *_defconfig |sed 's/.*\///')
 
+#	$(shell find . -name *_defconfig |sed 's/.*\///')
+
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(TOPDIR).config
