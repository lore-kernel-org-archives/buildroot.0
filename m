From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 08:47:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/dependencies
Message-ID: <20070820154743.7DF17A45E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 08:47:42 -0700 (Mon, 20 Aug 2007)
New Revision: 19591

Log:
Add BUILDROOT_DL_DIR to dependencies.sh and fix whitespace damage (sorry)

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-20 13:00:14 UTC (rev 19590)
+++ trunk/buildroot/Makefile	2007-08-20 15:47:42 UTC (rev 19591)
@@ -37,7 +37,7 @@
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(TOPDIR).config
 endif
-ifneq	($(BUILDROOT_DL_DIR),)
+ifneq ($(BUILDROOT_DL_DIR),)
 BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
 endif
 

Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-08-20 13:00:14 UTC (rev 19590)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-08-20 15:47:42 UTC (rev 19591)
@@ -11,6 +11,13 @@
 # check build system 'environment'
 #
 #############################################################
+if test -n "$BUILDROOT_DL_DIR" ; then
+	/bin/echo -e "Overriding \$(DL_DIR) in '.config'.		Ok"
+	/bin/echo -e "External download directory:			Ok ($BUILDROOT_DL_DIR)"
+else
+	echo "BUILDROOT_DL_DIR clean:				Ok"
+fi
+
 if test -n "$CC" ; then
 	echo "CC clean:						FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CC' so buildroot can run with";
@@ -19,7 +26,6 @@
 fi;
 echo "CC clean:					Ok"
 
-
 if test -n "$CXX" ; then
 	echo "CXX clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CXX' so buildroot can run with";
