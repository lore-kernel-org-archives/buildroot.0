From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 13 Jan 2009 16:36:17 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libidn
Message-ID: <20090113163618.02A6D76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-13 16:36:16 +0000 (Tue, 13 Jan 2009)
New Revision: 24817

Log:
package/libidn: Add a new package (required by later WebKits...)

GNU Libidn is a fully documented implementation of the Stringprep, 
Punycode and IDNA specifications. Libidn's purpose is to encode 
and decode internationalized domain names. The native C, C# 
and Java libraries are available under 
the GNU Lesser General Public License version 2.1 or later. 

Not quite sure I've put it in the correct menu but it will work.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Added:
   trunk/buildroot/package/libidn/
   trunk/buildroot/package/libidn/Config.in
   trunk/buildroot/package/libidn/libidn.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-13 15:22:50 UTC (rev 24816)
+++ trunk/buildroot/package/Config.in	2009-01-13 16:36:16 UTC (rev 24817)
@@ -77,6 +77,7 @@
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libiconv/Config.in"
+source "package/libidn/Config.in"
 source "package/liblockfile/Config.in"
 source "package/liboil/Config.in"
 source "package/libsysfs/Config.in"

Added: trunk/buildroot/package/libidn/Config.in
===================================================================
--- trunk/buildroot/package/libidn/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libidn/Config.in	2009-01-13 16:36:16 UTC (rev 24817)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBIDN
+	bool "libidn"
+	help
+	  http://www.gnu.org/software/libidn/
+	  Libidn's purpose is to encode and decode internationalized domain names. 
+

Added: trunk/buildroot/package/libidn/libidn.mk
===================================================================
--- trunk/buildroot/package/libidn/libidn.mk	                        (rev 0)
+++ trunk/buildroot/package/libidn/libidn.mk	2009-01-13 16:36:16 UTC (rev 24817)
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libidn
+#
+#############################################################
+LIBIDN_VERSION = 1.9
+LIBIDN_SOURCE = libidn-$(LIBIDN_VERSION).tar.gz
+LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
+LIBIDN_INSTALL_STAGING = YES
+LIBIDN_INSTALL_TARGET = YES
+LIBIDN_CONF_OPT = --enable-shared
+LIBIDN_DEPENDENCIES = uclibc pkgconfig gettext $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+$(eval $(call AUTOTARGETS,package,libidn))
