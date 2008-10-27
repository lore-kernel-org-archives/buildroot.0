From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 02:45:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20081027094541.97C6B3C6F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-27 02:45:41 -0700 (Mon, 27 Oct 2008)
New Revision: 23811

Log:
Strip libgtk2 in the target

Rely on the sane default values of Makefile.autotools.in for the
staging and target installs. The immediate benefit is that the target
install will use install-strip instead of install, leading to a quite
nice size reduction in the libraries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-10-27 09:45:38 UTC (rev 23810)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-10-27 09:45:41 UTC (rev 23811)
@@ -9,8 +9,6 @@
 LIBGTK2_AUTORECONF = NO
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_INSTALL_TARGET = YES
-LIBGTK2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
-LIBGTK2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 LIBGTK2_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no \
