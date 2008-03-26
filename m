From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 25 Mar 2008 20:28:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: asterisk autoconf
	automake bash bison cl etc...
Message-ID: <20080326032810.DB4563C2F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-03-25 20:28:09 -0700 (Tue, 25 Mar 2008)
New Revision: 21494

Log:
Applied patch from Nathanael D. Noblet <nathanael@gnat.ca> to fix
broken GNU download paths. Also fix gnuchess, xboard and classpath
packages to use $(BR2_GNU_MIRROR) rather than hardcoded urls.



Modified:
   trunk/buildroot/package/asterisk/asterisk.mk
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/classpath/classpath.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/gnuchess/gnuchess.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/make/make.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/xboard/xboard.mk


Changeset:
Modified: trunk/buildroot/package/asterisk/asterisk.mk
===================================================================
--- trunk/buildroot/package/asterisk/asterisk.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/asterisk/asterisk.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -3,9 +3,9 @@
 # asterisk
 #
 ##############################################################
-ASTERISK_VERSION:=1.2.0-beta1
+ASTERISK_VERSION:=1.6.0-beta6
 ASTERISK_SOURCE:=asterisk-$(ASTERISK_VERSION).tar.gz
-ASTERISK_SITE:=ftp://ftp.digium.com/pub/asterisk/old-releases
+ASTERISK_SITE:=http://downloads.digium.com/pub/asterisk/old-releases
 ASTERISK_DIR:=$(BUILD_DIR)/asterisk-$(ASTERISK_VERSION)
 ASTERISK_BINARY:=asterisk
 ASTERISK_TARGET_BINARY:=usr/sbin/asterisk

Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 AUTOCONF_VERSION:=2.61
 AUTOCONF_SOURCE:=autoconf-$(AUTOCONF_VERSION).tar.bz2
-AUTOCONF_SITE:=$(BR2_GNU_MIRROR)/gnu/autoconf
+AUTOCONF_SITE:=$(BR2_GNU_MIRROR)/autoconf
 AUTOCONF_CAT:=$(BZCAT)
 AUTOCONF_SRC_DIR:=$(TOOL_BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)
 AUTOCONF_DIR:=$(BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)

Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/automake/automake.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 AUTOMAKE_VERSION:=1.10
 AUTOMAKE_SOURCE:=automake-$(AUTOMAKE_VERSION).tar.bz2
-AUTOMAKE_SITE:=$(BR2_GNU_MIRROR)/gnu/automake
+AUTOMAKE_SITE:=$(BR2_GNU_MIRROR)/automake
 AUTOMAKE_CAT:=$(BZCAT)
 AUTOMAKE_SRC_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VERSION)
 AUTOMAKE_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VERSION)

Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/bash/bash.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 BASH_VERSION:=3.2
 BASH_SOURCE:=bash-$(BASH_VERSION).tar.gz
-BASH_SITE:=$(BR2_GNU_MIRROR)/gnu/bash
+BASH_SITE:=$(BR2_GNU_MIRROR)/bash
 BASH_CAT:=$(ZCAT)
 BASH_DIR:=$(BUILD_DIR)/bash-$(BASH_VERSION)
 BASH_BINARY:=bash

Modified: trunk/buildroot/package/bison/bison.mk
===================================================================
--- trunk/buildroot/package/bison/bison.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/bison/bison.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 BISON_VERSION:=2.3
 BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
-BISON_SITE:=$(BR2_GNU_MIRROR)/gnu/bison
+BISON_SITE:=$(BR2_GNU_MIRROR)/bison
 BISON_DIR:=$(BUILD_DIR)/bison-$(BISON_VERSION)
 BISON_CAT:=$(BZCAT)
 BISON_BINARY:=src/bison

Modified: trunk/buildroot/package/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/classpath/classpath.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/classpath/classpath.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 CLASSPATH_VERSION = 0.96.1
 CLASSPATH_SOURCE = classpath-$(CLASSPATH_VERSION).tar.gz
-CLASSPATH_SITE = ftp://ftp.gnu.org/gnu/classpath/
+CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
 CLASSPATH_AUTORECONF = NO
 CLASSPATH_INSTALL_STAGING = YES
 CLASSPATH_INSTALL_TARGET = YES

Modified: trunk/buildroot/package/coreutils/coreutils.mk
===================================================================
--- trunk/buildroot/package/coreutils/coreutils.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/coreutils/coreutils.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -6,7 +6,7 @@
 COREUTILS_VERSION:=6.9
 COREUTILS_SOURCE:=coreutils-$(COREUTILS_VERSION).tar.bz2
 #COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
-COREUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/coreutils
+COREUTILS_SITE:=$(BR2_GNU_MIRROR)/coreutils
 COREUTILS_CAT:=$(BZCAT)
 COREUTILS_DIR:=$(BUILD_DIR)/coreutils-$(COREUTILS_VERSION)
 COREUTILS_BINARY:=src/vdir

Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -6,7 +6,7 @@
 DIFFUTILS_VERSION=2.8.7
 DIFFUTILS_SOURCE:=diffutils-$(DIFFUTILS_VERSION).tar.gz
 #DIFFUTILS_SITE:=ftp://alpha.gnu.org/gnu/diffutils/
-DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/diffutils
+DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_CAT:=$(ZCAT)
 DIFFUTILS_DIR:=$(BUILD_DIR)/diffutils-$(DIFFUTILS_VERSION)
 DIFFUTILS_BINARY:=src/diff

Modified: trunk/buildroot/package/findutils/findutils.mk
===================================================================
--- trunk/buildroot/package/findutils/findutils.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/findutils/findutils.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -6,7 +6,7 @@
 FINDUTILS_VERSION:=4.2.31
 FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VERSION).tar.gz
 #FINDUTILS_SITE:=ftp://alpha.gnu.org/gnu/findutils
-FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/findutils/
+FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/findutils/
 FINDUTILS_CAT:=$(ZCAT)
 FINDUTILS_DIR:=$(BUILD_DIR)/findutils-$(FINDUTILS_VERSION)
 FINDUTILS_BINARY:=find/find

Modified: trunk/buildroot/package/gawk/gawk.mk
===================================================================
--- trunk/buildroot/package/gawk/gawk.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/gawk/gawk.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 GAWK_VERSION:=3.1.5
 GAWK_SOURCE:=gawk-$(GAWK_VERSION).tar.bz2
-GAWK_SITE:=$(BR2_GNU_MIRROR)/gnu/gawk
+GAWK_SITE:=$(BR2_GNU_MIRROR)/gawk
 GAWK_CAT:=$(BZCAT)
 GAWK_DIR:=$(BUILD_DIR)/gawk-$(GAWK_VERSION)
 GAWK_BINARY:=gawk

Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/gettext/gettext.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 GETTEXT_VERSION:=0.16.1
 GETTEXT_SOURCE:=gettext-$(GETTEXT_VERSION).tar.gz
-GETTEXT_SITE:=$(BR2_GNU_MIRROR)/gnu/gettext
+GETTEXT_SITE:=$(BR2_GNU_MIRROR)/gettext
 GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VERSION)
 GETTEXT_CAT:=$(ZCAT)
 GETTEXT_BINARY:=gettext-runtime/src/gettext

Modified: trunk/buildroot/package/gnuchess/gnuchess.mk
===================================================================
--- trunk/buildroot/package/gnuchess/gnuchess.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/gnuchess/gnuchess.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 GNUCHESS_VERSION = 5.07
 GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
-GNUCHESS_SITE = http://ftp.gnu.org/pub/gnu/chess
+GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_AUTORECONF = NO
 GNUCHESS_INSTALL_STAGING = NO
 GNUCHESS_INSTALL_TARGET = YES

Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/gzip/gzip.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -6,7 +6,7 @@
 GZIP_VERSION:=1.3.5
 GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
 #GZIP_SITE:=ftp://alpha.gnu.org/gnu/gzip
-GZIP_SITE:=$(BR2_GNU_MIRROR)/gnu/gzip
+GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
 GZIP_DIR:=$(BUILD_DIR)/gzip-$(GZIP_VERSION)
 GZIP_CAT:=$(ZCAT)
 GZIP_BINARY:=$(GZIP_DIR)/gzip

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/libtool/libtool.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 LIBTOOL_VERSION:=1.5.24
 LIBTOOL_SOURCE:=libtool-$(LIBTOOL_VERSION).tar.gz
-LIBTOOL_SITE:=$(BR2_GNU_MIRROR)/gnu/libtool
+LIBTOOL_SITE:=$(BR2_GNU_MIRROR)/libtool
 LIBTOOL_CAT:=$(ZCAT)
 LIBTOOL_SRC_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VERSION)
 LIBTOOL_DIR:=$(BUILD_DIR)/libtool-$(LIBTOOL_VERSION)

Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/m4/m4.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -6,7 +6,7 @@
 M4_VERSION:=1.4.9
 M4_SOURCE:=m4-$(M4_VERSION).tar.bz2
 M4_CAT:=$(BZCAT)
-M4_SITE:=$(BR2_GNU_MIRROR)/gnu/m4
+M4_SITE:=$(BR2_GNU_MIRROR)/m4
 M4_DIR:=$(BUILD_DIR)/m4-$(M4_VERSION)
 M4_HOST_DIR:=$(TOOL_BUILD_DIR)/m4-$(M4_VERSION)
 M4_BINARY:=m4

Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/make/make.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 GNUMAKE_VERSION:=3.81
 GNUMAKE_SOURCE:=make-$(GNUMAKE_VERSION).tar.bz2
-GNUMAKE_SITE:=$(BR2_GNU_MIRROR)/gnu/make
+GNUMAKE_SITE:=$(BR2_GNU_MIRROR)/make
 GNUMAKE_DIR:=$(BUILD_DIR)/make-$(GNUMAKE_VERSION)
 GNUMAKE_CAT:=$(BZCAT)
 GNUMAKE_BINARY:=make

Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -24,7 +24,7 @@
 
 # TARGETS
 NCURSES_VERSION:=5.6
-NCURSES_SITE:=$(BR2_GNU_MIRROR)/gnu/ncurses
+NCURSES_SITE:=$(BR2_GNU_MIRROR)/ncurses
 NCURSES_DIR:=$(BUILD_DIR)/ncurses-$(NCURSES_VERSION)
 NCURSES_SOURCE:=ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_CAT:=$(ZCAT)

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/sed/sed.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 SED_VERSION:=4.1.5
 SED_SOURCE:=sed-$(SED_VERSION).tar.gz
-SED_SITE:=$(BR2_GNU_MIRROR)/gnu/sed
+SED_SITE:=$(BR2_GNU_MIRROR)/sed
 SED_CAT:=$(ZCAT)
 SED_DIR1:=$(TOOL_BUILD_DIR)/sed-$(SED_VERSION)
 SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VERSION)

Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/tar/tar.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 GNUTAR_VERSION:=1.18
 GNUTAR_SOURCE:=tar-$(GNUTAR_VERSION).tar.bz2
-GNUTAR_SITE:=$(BR2_GNU_MIRROR)/gnu/tar/
+GNUTAR_SITE:=$(BR2_GNU_MIRROR)/tar/
 GNUTAR_DIR:=$(BUILD_DIR)/tar-$(GNUTAR_VERSION)
 GNUTAR_CAT:=$(BZCAT)
 GNUTAR_BINARY:=src/tar

Modified: trunk/buildroot/package/wget/wget.mk
===================================================================
--- trunk/buildroot/package/wget/wget.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/wget/wget.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 WGET_VERSION:=1.10.2
 WGET_SOURCE:=wget-$(WGET_VERSION).tar.gz
-WGET_SITE:=$(BR2_GNU_MIRROR)/gnu/wget
+WGET_SITE:=$(BR2_GNU_MIRROR)/wget
 WGET_DIR:=$(BUILD_DIR)/wget-$(WGET_VERSION)
 WGET_CAT:=$(ZCAT)
 WGET_BINARY:=src/wget

Modified: trunk/buildroot/package/xboard/xboard.mk
===================================================================
--- trunk/buildroot/package/xboard/xboard.mk	2008-03-25 14:40:35 UTC (rev 21493)
+++ trunk/buildroot/package/xboard/xboard.mk	2008-03-26 03:28:09 UTC (rev 21494)
@@ -5,7 +5,7 @@
 #############################################################
 XBOARD_VERSION = 4.2.7
 XBOARD_SOURCE = xboard-$(XBOARD_VERSION).tar.gz
-XBOARD_SITE = http://ftp.gnu.org/gnu/xboard
+XBOARD_SITE = $(BR2_GNU_MIRROR)/xboard
 XBOARD_AUTORECONF = NO
 XBOARD_INSTALL_STAGING = NO
 XBOARD_INSTALL_TARGET = YES
