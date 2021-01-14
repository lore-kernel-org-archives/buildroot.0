From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:34:30 +0100
Subject: [Buildroot] [PATCH 1/2] linux,
 package: do not use <pkg>_NAME when defining CPE ID variables
Message-ID: <20210114223432.456542-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we discussed on the mailing list, using $(<pkg>_NAME) when defining
CPE ID variables feels a bit odd and needlessly complicated. Just use
the package name directly.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                   | 4 ++--
 package/boost/boost.mk           | 2 +-
 package/busybox/busybox.mk       | 2 +-
 package/collectd/collectd.mk     | 2 +-
 package/dropbear/dropbear.mk     | 4 ++--
 package/gnupg/gnupg.mk           | 2 +-
 package/iperf/iperf.mk           | 4 ++--
 package/libarchive/libarchive.mk | 2 +-
 package/libssh2/libssh2.mk       | 2 +-
 package/lighttpd/lighttpd.mk     | 2 +-
 package/linux-pam/linux-pam.mk   | 4 ++--
 package/llvm/llvm.mk             | 2 +-
 package/openvpn/openvpn.mk       | 2 +-
 package/pcre/pcre.mk             | 2 +-
 package/pixman/pixman.mk         | 2 +-
 package/proftpd/proftpd.mk       | 2 +-
 package/python/python.mk         | 2 +-
 package/qemu/qemu.mk             | 2 +-
 package/rsyslog/rsyslog.mk       | 2 +-
 package/sqlite/sqlite.mk         | 2 +-
 package/strongswan/strongswan.mk | 2 +-
 package/tcl/tcl.mk               | 2 +-
 package/tcpdump/tcpdump.mk       | 2 +-
 package/tftpd/tftpd.mk           | 4 ++--
 package/valgrind/valgrind.mk     | 2 +-
 package/vim/vim.mk               | 2 +-
 package/xerces/xerces.mk         | 2 +-
 27 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 50d2ae3ff8..e53d548484 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -12,8 +12,8 @@ LINUX_LICENSE_FILES = \
 	LICENSES/preferred/GPL-2.0 \
 	LICENSES/exceptions/Linux-syscall-note
 endif
-LINUX_CPE_ID_VENDOR = $(LINUX_NAME)
-LINUX_CPE_ID_NAME = $(LINUX_NAME)_kernel
+LINUX_CPE_ID_VENDOR = linux
+LINUX_CPE_ID_NAME = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
 
 define LINUX_HELP_CMDS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index cb488c86a7..b8f90bb836 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -10,7 +10,7 @@ BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
-BOOST_CPE_ID_VENDOR = $(BOOST_NAME)
+BOOST_CPE_ID_VENDOR = boost
 
 # keep host variant as minimal as possible
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 67d2713669..032e487267 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -9,7 +9,7 @@ BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
-BUSYBOX_CPE_ID_VENDOR = $(BUSYBOX_NAME)
+BUSYBOX_CPE_ID_VENDOR = busybox
 
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 83bf01109a..8fa278df7e 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -12,7 +12,7 @@ COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
-COLLECTD_CPE_ID_VENDOR = $(COLLECTD_NAME)
+COLLECTD_CPE_ID_VENDOR = collectd
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 87c161f704..dc2818f350 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -11,8 +11,8 @@ DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
-DROPBEAR_CPE_ID_VENDOR = $(DROPBEAR_NAME)_ssh_project
-DROPBEAR_CPE_ID_NAME = $(DROPBEAR_NAME)_ssh
+DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
+DROPBEAR_CPE_ID_NAME = dropbear_ssh
 
 # Disable hardening flags added by dropbear configure.ac, and let
 # Buildroot add them when the relevant options are enabled. This
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index ba424fed96..9729441bd2 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -10,7 +10,7 @@ GNUPG_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-GNUPG_CPE_ID_VENDOR = $(GNUPG_NAME)
+GNUPG_CPE_ID_VENDOR = gnupg
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = \
 	--disable-rpath \
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index f1e65e7545..f9000d3ba9 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -8,8 +8,8 @@ IPERF_VERSION = 2.0.13
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-IPERF_CPE_ID_VENDOR = $(IPERF_NAME)2_project
-IPERF_CPE_ID_NAME = $(IPERF_NAME)2
+IPERF_CPE_ID_VENDOR = iperf2_project
+IPERF_CPE_ID_NAME = iperf2
 
 IPERF_CONF_OPTS = \
 	--disable-web100
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 0905eac26d..9cc69fd45a 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,7 +9,7 @@ LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
-LIBARCHIVE_CPE_ID_VENDOR = $(LIBARCHIVE_NAME)
+LIBARCHIVE_CPE_ID_VENDOR = libarchive
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index eb66ab5643..6147583a9e 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -8,7 +8,7 @@ LIBSSH2_VERSION = 1.9.0
 LIBSSH2_SITE = https://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
-LIBSSH2_CPE_ID_VENDOR = $(LIBSSH2_NAME)
+LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index df05227211..028ff17aa6 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -10,7 +10,7 @@ LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
-LIGHTTPD_CPE_ID_VENDOR = $(LIGHTTPD_NAME)
+LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
 	--without-wolfssl \
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 22ee258e7e..be4d11bb10 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -21,8 +21,8 @@ LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
-LINUX_PAM_CPE_ID_VENDOR = $(LINUX_PAM_NAME)
-LINUX_PAM_CPE_ID_NAME = $(LINUX_PAM_NAME)
+LINUX_PAM_CPE_ID_VENDOR = linux-pam
+LINUX_PAM_CPE_ID_NAME = linux-pam
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 177fff71bb..7d60fe7f8c 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -10,7 +10,7 @@ LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLV
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
-LLVM_CPE_ID_VENDOR = $(LLVM_NAME)
+LLVM_CPE_ID_VENDOR = llvm
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
 
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 913235679a..7c67e95074 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -10,7 +10,7 @@ OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
-OPENVPN_CPE_ID_VENDOR = $(OPENVPN_NAME)
+OPENVPN_CPE_ID_VENDOR = openvpn
 OPENVPN_CONF_OPTS = \
 	--disable-unit-tests \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index b37a2ca9b7..c8498b7acf 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -9,7 +9,7 @@ PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
 PCRE_LICENSE_FILES = LICENCE
-PCRE_CPE_ID_VENDOR = $(PCRE_NAME)
+PCRE_CPE_ID_VENDOR = pcre
 PCRE_INSTALL_STAGING = YES
 PCRE_CONFIG_SCRIPTS = pcre-config
 
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 52d4e36f2e..d99005ecb7 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -9,7 +9,7 @@ PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
-PIXMAN_CPE_ID_VENDOR = $(PIXMAN_NAME)
+PIXMAN_CPE_ID_VENDOR = pixman
 
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 7bae876a38..7dc3f267e0 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -8,7 +8,7 @@ PROFTPD_VERSION = 1.3.6e
 PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
-PROFTPD_CPE_ID_VENDOR = $(PROFTPD_NAME)
+PROFTPD_CPE_ID_VENDOR = proftpd
 
 PROFTPD_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
diff --git a/package/python/python.mk b/package/python/python.mk
index 6240cb6c2f..f4f9f8563b 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -10,7 +10,7 @@ PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
 PYTHON_LICENSE_FILES = LICENSE
-PYTHON_CPE_ID_VENDOR = $(PYTHON_NAME)
+PYTHON_CPE_ID_VENDOR = python
 PYTHON_LIBTOOL_PATCH = NO
 
 # Python needs itself to be built, so in order to cross-compile
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9d932ee860..323ae01283 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -12,7 +12,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
 #       individual source files.
-QEMU_CPE_ID_VENDOR = $(QEMU_NAME)
+QEMU_CPE_ID_VENDOR = qemu
 
 #-------------------------------------------------------------
 
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 9f5f5b0d7c..d20a13dbdd 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -8,7 +8,7 @@ RSYSLOG_VERSION = 8.2010.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-RSYSLOG_CPE_ID_VENDOR = $(RSYSLOG_NAME)
+RSYSLOG_CPE_ID_VENDOR = rsyslog
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d1b519a19b..fd0d84a023 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -10,7 +10,7 @@ SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2020
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
-SQLITE_CPE_ID_VENDOR = $(SQLITE_NAME)
+SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index e0e8bb0ce8..03aa9e185e 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -9,7 +9,7 @@ STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
-STRONGSWAN_CPE_ID_VENDOR = $(STRONGSWAN_NAME)
+STRONGSWAN_CPE_ID_VENDOR = strongswan
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
 STRONGSWAN_CONF_OPTS += \
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 913891e897..7c456e89b3 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -10,7 +10,7 @@ TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
 TCL_LICENSE_FILES = license.terms
-TCL_CPE_ID_VENDOR = $(TCL_NAME)
+TCL_CPE_ID_VENDOR = tcl
 TCL_SUBDIR = unix
 TCL_INSTALL_STAGING = YES
 TCL_AUTORECONF = YES
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 3f52428120..63991163ab 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -8,7 +8,7 @@ TCPDUMP_VERSION = 4.9.3
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-TCPDUMP_CPE_ID_VENDOR = $(TCPDUMP_NAME)
+TCPDUMP_CPE_ID_VENDOR = tcpdump
 TCPDUMP_CONF_ENV = \
 	ac_cv_linux_vers=2 \
 	td_cv_buggygetaddrinfo=no \
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 301a222e39..45023b4342 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -10,8 +10,8 @@ TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
-TFTPD_CPE_ID_VENDOR = $(TFTPD_NAME)-hpa_project
-TFTPD_CPE_ID_NAME = $(TFTPD_NAME)-hpa
+TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
+TFTPD_CPE_ID_NAME = tftpd-hpa
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 7d0070a974..a1b4d97ee6 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,7 +9,7 @@ VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-VALGRIND_CPE_ID_VENDOR = $(VALGRIND_NAME)
+VALGRIND_CPE_ID_VENDOR = valgrind
 VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 2bd3d437e4..36cb59331a 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -23,7 +23,7 @@ VIM_CONF_ENV = \
 VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
-VIM_CPE_ID_VENDOR = $(VIM_NAME)
+VIM_CPE_ID_VENDOR = vim
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 VIM_CONF_OPTS += --enable-acl
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index a1ddcb5cb6..abfd4d6a30 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -10,7 +10,7 @@ XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_CPE_ID_VENDOR = apache
-XERCES_CPE_ID_NAME = $(XERCES_NAME)-c\+\+
+XERCES_CPE_ID_NAME = xerces-c\+\+
 XERCES_INSTALL_STAGING = YES
 
 define XERCES_DISABLE_SAMPLES
-- 
2.29.2
