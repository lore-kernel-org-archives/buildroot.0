From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 02:45:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20081027094538.C3D823C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-27 02:45:38 -0700 (Mon, 27 Oct 2008)
New Revision: 23810

Log:
Strip pango libraries on the target

Use the predefined INSTALL_STAGING_OPT and INSTALL_TARGET_OPT
behaviour of Makefile.autotools.in, so that installation on the target
is done using install-strip.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-10-27 09:45:34 UTC (rev 23809)
+++ trunk/buildroot/package/pango/pango.mk	2008-10-27 09:45:38 UTC (rev 23810)
@@ -9,8 +9,6 @@
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
 PANGO_INSTALL_TARGET = YES
-PANGO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
-PANGO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
