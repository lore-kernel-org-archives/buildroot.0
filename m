From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 13 Dec 2008 11:40:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ifplugd
Message-ID: <20081213194026.CD8DF3C2C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-13 11:40:26 -0800 (Sat, 13 Dec 2008)
New Revision: 24409

Log:
ifplugd: fix non-C++ build

The ifplugd configure script was checking for a C++ compiler, even
though it isn't used for anything.

Added:
   trunk/buildroot/package/ifplugd/ifplugd-no-cxx.patch

Modified:
   trunk/buildroot/package/ifplugd/ifplugd.mk


Changeset:
Added: trunk/buildroot/package/ifplugd/ifplugd-no-cxx.patch
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd-no-cxx.patch	                        (rev 0)
+++ trunk/buildroot/package/ifplugd/ifplugd-no-cxx.patch	2008-12-13 19:40:26 UTC (rev 24409)
@@ -0,0 +1,17 @@
+[PATCH] ifplugd: configure: don't check for C++ compiler
+
+The configure script was checking for a C++ compiler (and erroring out
+if not found), even though it isn't used for anything.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+diff -urpN ifplugd-0.28/configure.ac ifplugd-0.28.new/configure.ac
+--- ifplugd-0.28/configure.ac	2005-06-04 21:21:51.000000000 +0200
++++ ifplugd-0.28.new/configure.ac	2008-12-13 20:31:13.000000000 +0100
+@@ -33,7 +33,6 @@ if type -p stow > /dev/null && test -d /
+ fi
+ 
+ # Checks for programs.
+-AC_PROG_CXX
+ AC_PROG_CC
+ AC_PROG_CPP
+ AC_PROG_INSTALL

Modified: trunk/buildroot/package/ifplugd/ifplugd.mk
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd.mk	2008-12-13 16:15:50 UTC (rev 24408)
+++ trunk/buildroot/package/ifplugd/ifplugd.mk	2008-12-13 19:40:26 UTC (rev 24409)
@@ -6,7 +6,7 @@
 IFPLUGD_VERSION = 0.28
 IFPLUGD_SOURCE = ifplugd-$(IFPLUGD_VERSION).tar.gz
 IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd/
-IFPLUGD_AUTORECONF = NO
+IFPLUGD_AUTORECONF = YES
 IFPLUGD_INSTALL_STAGING = NO
 IFPLUGD_INSTALL_TARGET = YES
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
