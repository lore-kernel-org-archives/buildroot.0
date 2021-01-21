From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:43:24 +0100
Subject: [Buildroot] [git commit] Replace LIBFOO_CPE_ID_NAME by
 LIBFOO_CPE_ID_PRODUCT
Message-ID: <20210121212409.D91CD81040@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b6202f721f2f5ab36153ba44de65286f7811ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace LIBFOO_CPE_ID_NAME by LIBFOO_CPE_ID_PRODUCT to better "comply"
with the official "Well-Formed CPE Name Data Model" parameters:
 - https://csrc.nist.gov/publications/detail/nistir/7695/final
 - https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk                                      |  2 +-
 linux/linux.mk                                           |  2 +-
 package/angularjs/angularjs.mk                           |  2 +-
 package/apache/apache.mk                                 |  2 +-
 package/audit/audit.mk                                   |  2 +-
 package/dbus/dbus.mk                                     |  2 +-
 package/dropbear/dropbear.mk                             |  2 +-
 package/gesftpserver/gesftpserver.mk                     |  2 +-
 package/gtest/gtest.mk                                   |  2 +-
 package/iperf/iperf.mk                                   |  2 +-
 package/iwd/iwd.mk                                       |  2 +-
 package/lcms2/lcms2.mk                                   |  2 +-
 package/libcurl/libcurl.mk                               |  2 +-
 package/libfcgi/libfcgi.mk                               |  2 +-
 package/libglib2/libglib2.mk                             |  2 +-
 package/libopenssl/libopenssl.mk                         |  2 +-
 package/libsysfs/libsysfs.mk                             |  2 +-
 package/libzlib/libzlib.mk                               |  2 +-
 package/linux-headers/linux-headers.mk                   |  2 +-
 package/mtd/mtd.mk                                       |  2 +-
 package/netsnmp/netsnmp.mk                               |  2 +-
 package/pkg-generic.mk                                   | 16 ++++++++--------
 package/pppd/pppd.mk                                     |  2 +-
 package/python-lxml/python-lxml.mk                       |  2 +-
 package/python-setuptools/python-setuptools.mk           |  2 +-
 package/quota/quota.mk                                   |  2 +-
 package/samba4/samba4.mk                                 |  2 +-
 package/tftpd/tftpd.mk                                   |  2 +-
 package/uboot-tools/uboot-tools.mk                       |  2 +-
 package/vlc/vlc.mk                                       |  2 +-
 package/xerces/xerces.mk                                 |  2 +-
 .../package/cpe-id-pkg4/cpe-id-pkg4.mk                   |  2 +-
 .../package/cpe-id-pkg5/cpe-id-pkg5.mk                   |  4 ++--
 support/testing/tests/core/test_cpeid.py                 | 10 +++++-----
 34 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d92000f053..2478a2a1e9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -12,7 +12,7 @@ ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 endif
 UBOOT_CPE_ID_VENDOR = denx
-UBOOT_CPE_ID_NAME = u-boot
+UBOOT_CPE_ID_PRODUCT = u-boot
 
 UBOOT_INSTALL_IMAGES = YES
 
diff --git a/linux/linux.mk b/linux/linux.mk
index e53d548484..c2ea0008d7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -13,7 +13,7 @@ LINUX_LICENSE_FILES = \
 	LICENSES/exceptions/Linux-syscall-note
 endif
 LINUX_CPE_ID_VENDOR = linux
-LINUX_CPE_ID_NAME = linux_kernel
+LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
 
 define LINUX_HELP_CMDS
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 4c414c74fe..d393c82c19 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -11,7 +11,7 @@ ANGULARJS_LICENSE = MIT
 # There's no separate license file in the archive, so use angular.js instead.
 ANGULARJS_LICENSE_FILES = angular.js
 ANGULARJS_CPE_ID_VENDOR = angularjs
-ANGULARJS_CPE_ID_NAME = angular.js
+ANGULARJS_CPE_ID_PRODUCT = angular.js
 
 define ANGULARJS_EXTRACT_CMDS
 	unzip $(ANGULARJS_DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 0392e76144..6b9d18ac00 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -10,7 +10,7 @@ APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
-APACHE_CPE_ID_NAME = http_server
+APACHE_CPE_ID_PRODUCT = http_server
 # Needed for mod_php
 APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index a20767d24b..05a16e6e31 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -11,7 +11,7 @@ AUDIT_LICENSE_FILES = COPYING COPYING.LIB
 # 0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
 AUDIT_AUTORECONF = YES
 AUDIT_CPE_ID_VENDOR = linux_audit_project
-AUDIT_CPE_ID_NAME = linux_audit
+AUDIT_CPE_ID_PRODUCT = linux_audit
 
 AUDIT_INSTALL_STAGING = YES
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 75142ea200..d78e102427 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -9,7 +9,7 @@ DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_CPE_ID_VENDOR = d-bus_project
-DBUS_CPE_ID_NAME = d-bus
+DBUS_CPE_ID_PRODUCT = d-bus
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index dc2818f350..1cbe63682c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -12,7 +12,7 @@ DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
-DROPBEAR_CPE_ID_NAME = dropbear_ssh
+DROPBEAR_CPE_ID_PRODUCT = dropbear_ssh
 
 # Disable hardening flags added by dropbear configure.ac, and let
 # Buildroot add them when the relevant options are enabled. This
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 07718a4c42..85511a3c97 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -13,7 +13,7 @@ GESFTPSERVER_LICENSE_FILES = COPYING
 # "Missing prototype" warning treated as error
 GESFTPSERVER_CONF_OPTS = --disable-warnings-as-errors
 GESFTPSERVER_CPE_ID_VENDOR = green_end
-GESFTPSERVER_CPE_ID_NAME = sftpserver
+GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 
 # forgets to link against pthread when cross compiling
 GESFTPSERVER_CONF_ENV = LIBS=-lpthread
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index fc51d9f7a2..f8b2339d7e 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -11,7 +11,7 @@ GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3-Clause
 GTEST_LICENSE_FILES = googletest/LICENSE
 GTEST_CPE_ID_VENDOR = google
-GTEST_CPE_ID_NAME = google_test
+GTEST_CPE_ID_PRODUCT = google_test
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
 GTEST_DEPENDENCIES += host-gtest
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index f9000d3ba9..5df94a1f63 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -9,7 +9,7 @@ IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
 IPERF_CPE_ID_VENDOR = iperf2_project
-IPERF_CPE_ID_NAME = iperf2
+IPERF_CPE_ID_PRODUCT = iperf2
 
 IPERF_CONF_OPTS = \
 	--disable-web100
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index db98c02b58..652beb838f 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -10,7 +10,7 @@ IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
 IWD_LICENSE_FILES = COPYING
 IWD_CPE_ID_VENDOR = intel
-IWD_CPE_ID_NAME = inet_wireless_daemon
+IWD_CPE_ID_PRODUCT = inet_wireless_daemon
 # sources from git, no configure script provided
 IWD_AUTORECONF = YES
 IWD_SELINUX_MODULES = networkmanager
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 34c2795e93..862fdd5896 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -9,7 +9,7 @@ LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
-LCMS2_CPE_ID_NAME = little_cms
+LCMS2_CPE_ID_PRODUCT = little_cms
 LCMS2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 7dd665e6ad..4d75d05f27 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -13,7 +13,7 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
-LIBCURL_CPE_ID_NAME = libcurl
+LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index c40d9c5970..ee61c22c45 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -9,7 +9,7 @@ LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE.TERMS
 LIBFCGI_CPE_ID_VENDOR = fastcgi
-LIBFCGI_CPE_ID_NAME = fcgi
+LIBFCGI_CPE_ID_PRODUCT = fcgi
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4b2569eed2..c738415216 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -11,7 +11,7 @@ LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_M
 LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
 LIBGLIB2_CPE_ID_VENDOR = gnome
-LIBGLIB2_CPE_ID_NAME = glib
+LIBGLIB2_CPE_ID_PRODUCT = glib
 LIBGLIB2_INSTALL_STAGING = YES
 
 LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 21c2e9b5b2..f4bb62911c 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -16,7 +16,7 @@ LIBOPENSSL_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH))
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
 LIBOPENSSL_CPE_ID_VENDOR = $(LIBOPENSSL_PROVIDES)
-LIBOPENSSL_CPE_ID_NAME = $(LIBOPENSSL_PROVIDES)
+LIBOPENSSL_CPE_ID_PRODUCT = $(LIBOPENSSL_PROVIDES)
 
 ifeq ($(BR2_m68k_cf),y)
 # relocation truncated to fit: R_68K_GOT16O
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index fd8bfa6724..6cff8bf5fe 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -11,6 +11,6 @@ LIBSYSFS_INSTALL_STAGING = YES
 LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPL-2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 LIBSYSFS_CPE_ID_VENDOR = sysfsutils_project
-LIBSYSFS_CPE_ID_NAME = sysfsutils
+LIBSYSFS_CPE_ID_PRODUCT = sysfsutils
 
 $(eval $(autotools-package))
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 1325b1f0cb..a10fc748d1 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -12,7 +12,7 @@ LIBZLIB_LICENSE_FILES = README
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = gnu
-LIBZLIB_CPE_ID_NAME = zlib
+LIBZLIB_CPE_ID_PRODUCT = zlib
 
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 69ab16c443..807e574f4d 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -103,7 +103,7 @@ LINUX_HEADERS_LICENSE_FILES = \
 	LICENSES/exceptions/Linux-syscall-note
 endif
 LINUX_HEADERS_CPE_ID_VENDOR = linux
-LINUX_HEADERS_CPE_ID_NAME = linux_kernel
+LINUX_HEADERS_CPE_ID_PRODUCT = linux_kernel
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index d0e70b8c8b..c4fa56d260 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -10,7 +10,7 @@ MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
-MTD_CPE_ID_NAME = mtd-utils
+MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 09ca33f754..d8deaaf1b8 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -10,7 +10,7 @@ NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
-NETSNMP_CPE_ID_NAME = $(NETSNMP_CPE_ID_VENDOR)
+NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=no
 NETSNMP_CONF_OPTS = \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 357a4ce453..00f48a4609 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -616,13 +616,13 @@ $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)
 
 # If any of the <pkg>_CPE_ID_* variables are set, we assume the CPE ID
 # information is valid for this package.
-ifneq ($$($(2)_CPE_ID_VENDOR)$$($(2)_CPE_ID_NAME)$$($(2)_CPE_ID_VERSION)$$($(2)_CPE_ID_VERSION_MINOR)$$($(2)_CPE_ID_PREFIX),)
+ifneq ($$($(2)_CPE_ID_VENDOR)$$($(2)_CPE_ID_PRODUCT)$$($(2)_CPE_ID_VERSION)$$($(2)_CPE_ID_VERSION_MINOR)$$($(2)_CPE_ID_PREFIX),)
 $(2)_CPE_ID_VALID = YES
 endif
 
 # When we're a host package, make sure to use the variables of the
 # corresponding target package, if any.
-ifneq ($$($(3)_CPE_ID_VENDOR)$$($(3)_CPE_ID_NAME)$$($(3)_CPE_ID_VERSION)$$($(3)_CPE_ID_VERSION_MINOR)$$($(3)_CPE_ID_PREFIX),)
+ifneq ($$($(3)_CPE_ID_VENDOR)$$($(3)_CPE_ID_PRODUCT)$$($(3)_CPE_ID_VERSION)$$($(3)_CPE_ID_VERSION_MINOR)$$($(3)_CPE_ID_PREFIX),)
 $(2)_CPE_ID_VALID = YES
 endif
 
@@ -644,12 +644,12 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  endif
  endif
 
- # CPE_ID_NAME
- ifndef $(2)_CPE_ID_NAME
-  ifdef $(3)_CPE_ID_NAME
-   $(2)_CPE_ID_NAME = $$($(3)_CPE_ID_NAME)
+ # CPE_ID_PRODUCT
+ ifndef $(2)_CPE_ID_PRODUCT
+  ifdef $(3)_CPE_ID_PRODUCT
+   $(2)_CPE_ID_PRODUCT = $$($(3)_CPE_ID_PRODUCT)
   else
-   $(2)_CPE_ID_NAME = $$($(2)_RAWNAME)
+   $(2)_CPE_ID_PRODUCT = $$($(2)_RAWNAME)
   endif
  endif
 
@@ -681,7 +681,7 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  endif
 
  # Calculate complete CPE ID
- $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR):*:*:*:*:*:*
+ $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_VERSION_MINOR):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 
 # When a target package is a toolchain dependency set this variable to
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 118f9fc334..08560090b5 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -11,7 +11,7 @@ PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 PPPD_CPE_ID_VENDOR = samba
-PPPD_CPE_ID_NAME = ppp
+PPPD_CPE_ID_PRODUCT = ppp
 
 # 0001-pppd-Fix-bounds-check.patch
 PPPD_IGNORE_CVES += CVE-2020-8597
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 24c41f2c53..fe99f82472 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -16,7 +16,7 @@ PYTHON_LXML_LICENSE_FILES = \
 	doc/licenses/elementtree.txt \
 	src/lxml/isoschematron/resources/rng/iso-schematron.rng
 PYTHON_LXML_CPE_ID_VENDOR = lxml
-PYTHON_LXML_CPE_ID_NAME = lxml
+PYTHON_LXML_CPE_ID_PRODUCT = lxml
 
 # python-lxml can use either setuptools, or distutils as a fallback.
 # So, we use setuptools.
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index ade5ca5521..08a180ce0c 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -12,7 +12,7 @@ PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482a
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-PYTHON_SETUPTOOLS_CPE_ID_NAME = setuptools
+PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index ce7d3641fc..12d12b1296 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -10,7 +10,7 @@ QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
 QUOTA_CPE_ID_VENDOR = jan_kara
-QUOTA_CPE_ID_NAME = linux_diskquota
+QUOTA_CPE_ID_PRODUCT = linux_diskquota
 QUOTA_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"
 QUOTA_CONF_OPTS = --disable-pie
 
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 4b4611d3e1..61d8190127 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -11,7 +11,7 @@ SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_CPE_ID_VENDOR = samba
-SAMBA4_CPE_ID_NAME = samba
+SAMBA4_CPE_ID_PRODUCT = samba
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-nfs-utils host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 45023b4342..494e963d64 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -11,7 +11,7 @@ TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
-TFTPD_CPE_ID_NAME = tftpd-hpa
+TFTPD_CPE_ID_PRODUCT = tftpd-hpa
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 3a8e21ec9b..1313107e0e 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -10,7 +10,7 @@ UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 UBOOT_TOOLS_CPE_ID_VENDOR = denx
-UBOOT_TOOLS_CPE_ID_NAME = u-boot
+UBOOT_TOOLS_CPE_ID_PRODUCT = u-boot
 UBOOT_TOOLS_INSTALL_STAGING = YES
 
 # u-boot 2020.01+ needs make 4.0+
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6ee80fd45a..95eb7d39a2 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -10,7 +10,7 @@ VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_CPE_ID_VENDOR = videolan
-VLC_CPE_ID_NAME = vlc_media_player
+VLC_CPE_ID_PRODUCT = vlc_media_player
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
 
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index abfd4d6a30..d9174b44c7 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -10,7 +10,7 @@ XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_CPE_ID_VENDOR = apache
-XERCES_CPE_ID_NAME = xerces-c\+\+
+XERCES_CPE_ID_PRODUCT = xerces-c\+\+
 XERCES_INSTALL_STAGING = YES
 
 define XERCES_DISABLE_SAMPLES
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
index c37f73fa82..8603d20d9d 100644
--- a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
@@ -1,6 +1,6 @@
 CPE_ID_PKG4_VERSION = 67
 CPE_ID_PKG4_CPE_ID_VENDOR = foo
-CPE_ID_PKG4_CPE_ID_NAME = bar
+CPE_ID_PKG4_CPE_ID_PRODUCT = bar
 CPE_ID_PKG4_CPE_ID_VERSION = 42
 CPE_ID_PKG4_CPE_ID_VERSION_MINOR = b2
 CPE_ID_PKG4_CPE_ID_PREFIX = cpe:2.4:a
diff --git a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
index 18e98c4ca4..e1ac501e3e 100644
--- a/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
+++ b/support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
@@ -1,13 +1,13 @@
 CPE_ID_PKG5_VERSION = 57
 
 CPE_ID_PKG5_CPE_ID_VENDOR = foo
-CPE_ID_PKG5_CPE_ID_NAME = bar
+CPE_ID_PKG5_CPE_ID_PRODUCT = bar
 CPE_ID_PKG5_CPE_ID_VERSION = 42
 CPE_ID_PKG5_CPE_ID_VERSION_MINOR = b2
 CPE_ID_PKG5_CPE_ID_PREFIX = cpe:2.4:a
 
 HOST_CPE_ID_PKG5_CPE_ID_VENDOR = baz
-HOST_CPE_ID_PKG5_CPE_ID_NAME = fuz
+HOST_CPE_ID_PKG5_CPE_ID_PRODUCT = fuz
 HOST_CPE_ID_PKG5_CPE_ID_VERSION = 43
 HOST_CPE_ID_PKG5_CPE_ID_VERSION_MINOR = b3
 HOST_CPE_ID_PKG5_CPE_ID_PREFIX = cpe:2.5:a
diff --git a/support/testing/tests/core/test_cpeid.py b/support/testing/tests/core/test_cpeid.py
index acac8c3adf..af8d3c2896 100644
--- a/support/testing/tests/core/test_cpeid.py
+++ b/support/testing/tests/core/test_cpeid.py
@@ -22,7 +22,7 @@ class CpeIdTest(infra.basetest.BRConfigTest):
         # this package has no CPE ID information, it should not have
         # any CPE_ID variable defined.
         pkg_vars = self.get_vars("CPE_ID_PKG1_CPE_ID")
-        cpe_vars = ["CPE_ID_VALID", "CPE_ID_NAME", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
+        cpe_vars = ["CPE_ID_VALID", "CPE_ID_PRODUCT", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
                     "CPE_ID_PREFIX", "CPE_ID"]
         for v in cpe_vars:
             self.assertNotIn("CPE_ID_PKG1_%s" % v, pkg_vars)
@@ -39,7 +39,7 @@ class CpeIdTest(infra.basetest.BRConfigTest):
         # this package has no CPE ID information, it should not have
         # any CPE_ID variable defined.
         pkg_vars = self.get_vars("HOST_CPE_ID_PKG2_CPE_ID")
-        cpe_vars = ["CPE_ID_VALID", "CPE_ID_NAME", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
+        cpe_vars = ["CPE_ID_VALID", "CPE_ID_PRODUCT", "CPE_ID_VERSION", "CPE_ID_VERSION_MINOR",
                     "CPE_ID_PREFIX", "CPE_ID"]
         for v in cpe_vars:
             self.assertNotIn("HOST_CPE_ID_PKG2_%s" % v, pkg_vars)
@@ -68,7 +68,7 @@ class CpeIdTest(infra.basetest.BRConfigTest):
 
     def test_pkg4(self):
         # this package defines
-        # <pkg>_CPE_ID_{VENDOR,NAME,VERSION,VERSION_MINOR,PREFIX},
+        # <pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,VERSION_MINOR,PREFIX},
         # make sure we get the computed <pkg>_CPE_ID, and that it is
         # inherited by the host variant
         pkg_vars = self.get_vars("CPE_ID_PKG4_CPE_ID")
@@ -89,8 +89,8 @@ class CpeIdTest(infra.basetest.BRConfigTest):
 
     def test_pkg5(self):
         # this package defines
-        # <pkg>_CPE_ID_{VENDOR,NAME,VERSION,VERSION_MINOR,PREFIX} and
-        # HOST_<pkg>_CPE_ID_{VENDOR,NAME,VERSION,VERSION_MINOR,PREFIX}
+        # <pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,VERSION_MINOR,PREFIX} and
+        # HOST_<pkg>_CPE_ID_{VENDOR,PRODUCT,VERSION,VERSION_MINOR,PREFIX}
         # separately, with different values. Make sure we get the
         # right <pkg>_CPE_ID and HOST_<pkg>_CPE_ID values.
         pkg_vars = self.get_vars("CPE_ID_PKG5_CPE_ID")
