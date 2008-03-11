From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 01:17:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/autoconf
	package/automake packag etc...
Message-ID: <20080311081718.E5305120137@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-11 01:17:17 -0700 (Tue, 11 Mar 2008)
New Revision: 21286

Log:
buildroot: Use BR2_GNU_MIRROR everywhere

Patch by Nigel Kukard.


Modified:
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/m4/m4.mk
   trunk/buildroot/package/make/make.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 AUTOCONF_VERSION:=2.61
 AUTOCONF_SOURCE:=autoconf-$(AUTOCONF_VERSION).tar.bz2
-AUTOCONF_SITE:=http://ftp.gnu.org/pub/gnu/autoconf
+AUTOCONF_SITE:=$(BR2_GNU_MIRROR)/gnu/autoconf
 AUTOCONF_CAT:=$(BZCAT)
 AUTOCONF_SRC_DIR:=$(TOOL_BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)
 AUTOCONF_DIR:=$(BUILD_DIR)/autoconf-$(AUTOCONF_VERSION)

Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/automake/automake.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 AUTOMAKE_VERSION:=1.10
 AUTOMAKE_SOURCE:=automake-$(AUTOMAKE_VERSION).tar.bz2
-AUTOMAKE_SITE:=http://ftp.gnu.org/pub/gnu/automake
+AUTOMAKE_SITE:=$(BR2_GNU_MIRROR)/gnu/automake
 AUTOMAKE_CAT:=$(BZCAT)
 AUTOMAKE_SRC_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VERSION)
 AUTOMAKE_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VERSION)

Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/bash/bash.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 BASH_VERSION:=3.2
 BASH_SOURCE:=bash-$(BASH_VERSION).tar.gz
-BASH_SITE:=http://ftp.gnu.org/pub/gnu/bash
+BASH_SITE:=$(BR2_GNU_MIRROR)/gnu/bash
 BASH_CAT:=$(ZCAT)
 BASH_DIR:=$(BUILD_DIR)/bash-$(BASH_VERSION)
 BASH_BINARY:=bash

Modified: trunk/buildroot/package/bison/bison.mk
===================================================================
--- trunk/buildroot/package/bison/bison.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/bison/bison.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 BISON_VERSION:=2.3
 BISON_SOURCE:=bison-$(BISON_VERSION).tar.bz2
-BISON_SITE:=http://ftp.gnu.org/pub/gnu/bison
+BISON_SITE:=$(BR2_GNU_MIRROR)/gnu/bison
 BISON_DIR:=$(BUILD_DIR)/bison-$(BISON_VERSION)
 BISON_CAT:=$(BZCAT)
 BISON_BINARY:=src/bison

Modified: trunk/buildroot/package/coreutils/coreutils.mk
===================================================================
--- trunk/buildroot/package/coreutils/coreutils.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/coreutils/coreutils.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -6,7 +6,7 @@
 COREUTILS_VERSION:=6.9
 COREUTILS_SOURCE:=coreutils-$(COREUTILS_VERSION).tar.bz2
 #COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
-COREUTILS_SITE:=http://ftp.gnu.org/pub/gnu/coreutils
+COREUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/coreutils
 COREUTILS_CAT:=$(BZCAT)
 COREUTILS_DIR:=$(BUILD_DIR)/coreutils-$(COREUTILS_VERSION)
 COREUTILS_BINARY:=src/vdir

Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -6,7 +6,7 @@
 DIFFUTILS_VERSION=2.8.7
 DIFFUTILS_SOURCE:=diffutils-$(DIFFUTILS_VERSION).tar.gz
 #DIFFUTILS_SITE:=ftp://alpha.gnu.org/gnu/diffutils/
-DIFFUTILS_SITE:=http://mirrors.ircam.fr/pub/gnu/alpha/gnu/diffutils
+DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/diffutils
 DIFFUTILS_CAT:=$(ZCAT)
 DIFFUTILS_DIR:=$(BUILD_DIR)/diffutils-$(DIFFUTILS_VERSION)
 DIFFUTILS_BINARY:=src/diff

Modified: trunk/buildroot/package/findutils/findutils.mk
===================================================================
--- trunk/buildroot/package/findutils/findutils.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/findutils/findutils.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -6,7 +6,7 @@
 FINDUTILS_VERSION:=4.2.31
 FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VERSION).tar.gz
 #FINDUTILS_SITE:=ftp://alpha.gnu.org/gnu/findutils
-FINDUTILS_SITE:=http://ftp.gnu.org/pub/gnu/findutils/
+FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/findutils/
 FINDUTILS_CAT:=$(ZCAT)
 FINDUTILS_DIR:=$(BUILD_DIR)/findutils-$(FINDUTILS_VERSION)
 FINDUTILS_BINARY:=find/find

Modified: trunk/buildroot/package/gawk/gawk.mk
===================================================================
--- trunk/buildroot/package/gawk/gawk.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/gawk/gawk.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 GAWK_VERSION:=3.1.5
 GAWK_SOURCE:=gawk-$(GAWK_VERSION).tar.bz2
-GAWK_SITE:=http://ftp.gnu.org/pub/gnu/gawk
+GAWK_SITE:=$(BR2_GNU_MIRROR)/gnu/gawk
 GAWK_CAT:=$(BZCAT)
 GAWK_DIR:=$(BUILD_DIR)/gawk-$(GAWK_VERSION)
 GAWK_BINARY:=gawk

Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/gettext/gettext.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 GETTEXT_VERSION:=0.16.1
 GETTEXT_SOURCE:=gettext-$(GETTEXT_VERSION).tar.gz
-GETTEXT_SITE:=http://ftp.gnu.org/pub/gnu/gettext
+GETTEXT_SITE:=$(BR2_GNU_MIRROR)/gnu/gettext
 GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VERSION)
 GETTEXT_CAT:=$(ZCAT)
 GETTEXT_BINARY:=gettext-runtime/src/gettext

Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/gzip/gzip.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -6,7 +6,7 @@
 GZIP_VERSION:=1.3.5
 GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
 #GZIP_SITE:=ftp://alpha.gnu.org/gnu/gzip
-GZIP_SITE:=http://mirrors.ircam.fr/pub/gnu/alpha/gnu/gzip
+GZIP_SITE:=$(BR2_GNU_MIRROR)/gnu/gzip
 GZIP_DIR:=$(BUILD_DIR)/gzip-$(GZIP_VERSION)
 GZIP_CAT:=$(ZCAT)
 GZIP_BINARY:=$(GZIP_DIR)/gzip

Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/libtool/libtool.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 LIBTOOL_VERSION:=1.5.24
 LIBTOOL_SOURCE:=libtool-$(LIBTOOL_VERSION).tar.gz
-LIBTOOL_SITE:=http://ftp.gnu.org/pub/gnu/libtool
+LIBTOOL_SITE:=$(BR2_GNU_MIRROR)/gnu/libtool
 LIBTOOL_CAT:=$(ZCAT)
 LIBTOOL_SRC_DIR:=$(TOOL_BUILD_DIR)/libtool-$(LIBTOOL_VERSION)
 LIBTOOL_DIR:=$(BUILD_DIR)/libtool-$(LIBTOOL_VERSION)

Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/m4/m4.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -6,7 +6,7 @@
 M4_VERSION:=1.4.9
 M4_SOURCE:=m4-$(M4_VERSION).tar.bz2
 M4_CAT:=$(BZCAT)
-M4_SITE:=http://ftp.gnu.org/pub/gnu/m4
+M4_SITE:=$(BR2_GNU_MIRROR)/gnu/m4
 M4_DIR:=$(BUILD_DIR)/m4-$(M4_VERSION)
 M4_HOST_DIR:=$(TOOL_BUILD_DIR)/m4-$(M4_VERSION)
 M4_BINARY:=m4

Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/make/make.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 GNUMAKE_VERSION:=3.81
 GNUMAKE_SOURCE:=make-$(GNUMAKE_VERSION).tar.bz2
-GNUMAKE_SITE:=http://ftp.gnu.org/pub/gnu/make
+GNUMAKE_SITE:=$(BR2_GNU_MIRROR)/gnu/make
 GNUMAKE_DIR:=$(BUILD_DIR)/make-$(GNUMAKE_VERSION)
 GNUMAKE_CAT:=$(BZCAT)
 GNUMAKE_BINARY:=make

Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -24,7 +24,7 @@
 
 # TARGETS
 NCURSES_VERSION:=5.6
-NCURSES_SITE:=http://ftp.gnu.org/pub/gnu/ncurses
+NCURSES_SITE:=$(BR2_GNU_MIRROR)/gnu/ncurses
 NCURSES_DIR:=$(BUILD_DIR)/ncurses-$(NCURSES_VERSION)
 NCURSES_SOURCE:=ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_CAT:=$(ZCAT)

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/sed/sed.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 SED_VERSION:=4.1.5
 SED_SOURCE:=sed-$(SED_VERSION).tar.gz
-SED_SITE:=http://ftp.gnu.org/pub/gnu/sed
+SED_SITE:=$(BR2_GNU_MIRROR)/gnu/sed
 SED_CAT:=$(ZCAT)
 SED_DIR1:=$(TOOL_BUILD_DIR)/sed-$(SED_VERSION)
 SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VERSION)

Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/tar/tar.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 GNUTAR_VERSION:=1.18
 GNUTAR_SOURCE:=tar-$(GNUTAR_VERSION).tar.bz2
-GNUTAR_SITE:=$(BR2_GNU_MIRROR)/tar/
+GNUTAR_SITE:=$(BR2_GNU_MIRROR)/gnu/tar/
 GNUTAR_DIR:=$(BUILD_DIR)/tar-$(GNUTAR_VERSION)
 GNUTAR_CAT:=$(BZCAT)
 GNUTAR_BINARY:=src/tar

Modified: trunk/buildroot/package/wget/wget.mk
===================================================================
--- trunk/buildroot/package/wget/wget.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/package/wget/wget.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -5,7 +5,7 @@
 #############################################################
 WGET_VERSION:=1.10.2
 WGET_SOURCE:=wget-$(WGET_VERSION).tar.gz
-WGET_SITE:=http://ftp.gnu.org/pub/gnu/wget
+WGET_SITE:=$(BR2_GNU_MIRROR)/gnu/wget
 WGET_DIR:=$(BUILD_DIR)/wget-$(WGET_VERSION)
 WGET_CAT:=$(ZCAT)
 WGET_BINARY:=src/wget

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-03-11 08:17:03 UTC (rev 21285)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-03-11 08:17:17 UTC (rev 21286)
@@ -10,29 +10,29 @@
 #"))
 BINUTILS_SITE:=ftp://ftp.kernel.org/pub/linux/devel/binutils
 ifeq ($(BINUTILS_VERSION),2.18)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 endif
 ifeq ($(BINUTILS_VERSION),2.17)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 endif
 ifeq ($(BINUTILS_VERSION),2.16)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.16.1)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.15)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.14)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.13)
-BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.15.97)
