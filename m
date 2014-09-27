From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 27 Sep 2014 21:32:41 +0200
Subject: [Buildroot] [PATCH 04 of 15] packages: rename
 FOO_INSTALL_STAGING_OPT into FOO_INSTALL_STAGING_OPTS
In-Reply-To: <patchbomb.1411846357@localhost>
References: <patchbomb.1411846357@localhost>
Message-ID: <5e619025a3cc1987ff0f.1411846361@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_INSTALL_STAGING_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_INSTALL_STAGING_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: rebase

 docs/manual/adding-packages-autotools.txt                                                    |   2 +-
 docs/manual/adding-packages-cmake.txt                                                        |   2 +-
 docs/manual/adding-packages-python.txt                                                       |   6 ++--
 package/acl/acl.mk                                                                           |   2 +-
 package/atk/atk.mk                                                                           |   2 +-
 package/attr/attr.mk                                                                         |   2 +-
 package/cups/cups.mk                                                                         |   2 +-
 package/e2fsprogs/e2fsprogs.mk                                                               |   2 +-
 package/expat/expat.mk                                                                       |   2 +-
 package/glibc/glibc.mk                                                                       |   2 +-
 package/libdnet/libdnet.mk                                                                   |   2 +-
 package/libglib2/libglib2.mk                                                                 |   2 +-
 package/libseccomp/libseccomp.mk                                                             |   2 +-
 package/lite/lite.mk                                                                         |   2 +-
 package/lvm2/lvm2.mk                                                                         |   2 +-
 package/mxml/mxml.mk                                                                         |   2 +-
 package/netsnmp/netsnmp.mk                                                                   |   2 +-
 package/php/php.mk                                                                           |   2 +-
 package/pkg-autotools.mk                                                                     |   4 +-
 package/pkg-cmake.mk                                                                         |   4 +-
 package/pkg-python.mk                                                                        |  12 +++++-----
 package/tslib/tslib.mk                                                                       |   2 +-
 package/util-linux/util-linux.mk                                                             |   2 +-
 package/webkit/webkit.mk                                                                     |   2 +-
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk                             |   2 +-
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk                               |   2 +-
 package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk               |   2 +-
 package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk                 |   2 +-
 package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk                 |   2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk                                           |   2 +-
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk                               |   2 +-
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk                                   |   2 +-
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk                                     |   2 +-
 package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk |   2 +-
 package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk   |   2 +-
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk                                         |   2 +-
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk                                     |   2 +-
 package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk                     |   2 +-
 package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk                       |   2 +-
 package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk                       |   2 +-
 package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk                       |   2 +-
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk                               |   2 +-
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk                               |   2 +-
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk                                     |   2 +-
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk                                   |   2 +-
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk                                   |   2 +-
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk                                     |   2 +-
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk                                 |   2 +-
 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk                           |   2 +-
 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk                           |   2 +-
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk                               |   2 +-
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk                                   |   2 +-
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk                                   |   2 +-
 package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk                       |   2 +-
 package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk                       |   2 +-
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk                                   |   2 +-
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk                                     |   2 +-
 package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk                   |   2 +-
 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk                           |   2 +-
 package/xenomai/xenomai.mk                                                                   |   2 +-
 60 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -147,7 +147,7 @@
   not. Valid values are +YES+ and +NO+. By
   default, the value is +YES+
 
-* +LIBFOO_INSTALL_STAGING_OPT+ contains the make options
+* +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options
   used to install the package to the staging directory. By default, the
   value is +DESTDIR=$(STAGING_DIR) install+, which is
   correct for most autotools packages. It is still possible to override
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -112,7 +112,7 @@
   in the build step. These are passed after the +make+ command. By
   default, empty.
 
-* +LIBFOO_INSTALL_STAGING_OPT+ contains the make options used to
+* +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options used to
   install the package to the staging directory. By default, the value
   is +DESTDIR=$(STAGING_DIR) install+, which is correct for most
   CMake packages. It is still possible to override it.
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -127,16 +127,16 @@
   packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPT+ options are already
   passed automatically by the infrastructure.
 
-* +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPT+,
+* +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
   to the Python +setup.py+ script during the target installation step,
   the staging installation step or the host installation,
   respectively. Note that the infrastructure is automatically passing
   some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+
-  or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT+ (for target distutils
+  or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
   packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
   distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT+ (for target setuptools
+  +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS+ (for target setuptools
   packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
   setuptools packages).
 
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -16,7 +16,7 @@
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
 # around their deficiencies by passing installation paths.
-ACL_INSTALL_STAGING_OPT = 			\
+ACL_INSTALL_STAGING_OPTS = 			\
 	prefix=$(STAGING_DIR)/usr 		\
 	exec_prefix=$(STAGING_DIR)/usr 		\
 	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -11,7 +11,7 @@
 ATK_LICENSE = LGPLv2+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
-ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 		glib_cv_stack_grows=no glib_cv_uscore=no \
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -15,7 +15,7 @@
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
 # around their deficiencies by passing installation paths.
-ATTR_INSTALL_STAGING_OPT = 			\
+ATTR_INSTALL_STAGING_OPTS = 			\
 	prefix=$(STAGING_DIR)/usr 		\
 	exec_prefix=$(STAGING_DIR)/usr 		\
 	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -10,7 +10,7 @@
 CUPS_LICENSE = GPLv2 LGPLv2
 CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
-CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
+CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 CUPS_CONF_OPT = --without-perl \
 		--without-java \
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -9,7 +9,7 @@
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
-E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs
+E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
 
 E2FSPROGS_CONF_OPT = \
 	$(if $(BR2_PREFER_STATIC_LIB),,--enable-elf-shlibs) \
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -7,7 +7,7 @@
 EXPAT_VERSION = 2.1.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_INSTALL_STAGING = YES
-EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
+EXPAT_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -30,7 +30,7 @@
 
 GLIBC_INSTALL_STAGING = YES
 
-GLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
+GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
 
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -19,7 +19,7 @@
 LIBDNET_CONF_OPT += --with-python
 LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
-LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endif
 
 # Needed for autoreconf to work properly
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -13,7 +13,7 @@
 
 LIBGLIB2_AUTORECONF = YES
 LIBGLIB2_INSTALL_STAGING = YES
-LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 LIBGLIB2_CONF_ENV = \
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -14,7 +14,7 @@
 LIBSECCOMP_CONF_ENV            = SYSROOT=$(STAGING_DIR)
 LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
 LIBSECCOMP_MAKE_OPTS            = SUBDIRS_BUILD=src
-LIBSECCOMP_INSTALL_STAGING_OPT = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
+LIBSECCOMP_INSTALL_STAGING_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
 LIBSECCOMP_INSTALL_TARGET_OPTS  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
 
 # Not a real autotools package, but works quite OK nonetheless
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -8,7 +8,7 @@
 LITE_SOURCE = LiTE-$(LITE_VERSION).tar.gz
 LITE_SITE = http://www.directfb.org/downloads/Libs
 LITE_INSTALL_STAGING = YES
-LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+LITE_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
 LITE_DEPENDENCIES = directfb
 LITE_LICENSE = LGPLv2.1+
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -33,7 +33,7 @@
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
 LVM2_MAKE_OPTS = device-mapper
-LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
+LVM2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install_device-mapper
 LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install_device-mapper
 endif
 
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -10,7 +10,7 @@
 MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
 
-MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
+MXML_INSTALL_STAGING_OPTS = DSTROOT=$(STAGING_DIR) install
 MXML_INSTALL_TARGET_OPTS = DSTROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -24,7 +24,7 @@
 		--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
 		--with-out-transports="Unix" \
 		--disable-manuals
-NETSNMP_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
+NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
diff --git a/package/php/php.mk b/package/php/php.mk
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -8,7 +8,7 @@
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
+PHP_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_DEPENDENCIES = host-pkgconf
 PHP_LICENSE = PHP
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -108,7 +108,7 @@
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS                ?= install
-$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
 
 
@@ -309,7 +309,7 @@
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_SRCDIR)
 	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -42,7 +42,7 @@
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_HOST_OPT		?= install
-$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 
 $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
@@ -134,7 +134,7 @@
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -38,7 +38,7 @@
 PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
 	--prefix=$(TARGET_DIR)/usr
 
-PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT = \
+PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 	--prefix=$(STAGING_DIR)/usr
 
 # Host distutils-based packages
@@ -62,7 +62,7 @@
 	--single-version-externally-managed \
 	--root=/
 
-PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT = \
+PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 	--prefix=$(STAGING_DIR)/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
@@ -113,7 +113,7 @@
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPT)
 $(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_OPT = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT)
+$(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
@@ -127,7 +127,7 @@
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
 $(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_OPT = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT)
+$(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
@@ -268,8 +268,8 @@
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$($(2)_PYTHON_INTERPRETER) setup.py install \
-		$$($$(PKG)_BASE_INSTALL_STAGING_OPT) \
-		$$($$(PKG)_INSTALL_STAGING_OPT))
+		$$($$(PKG)_BASE_INSTALL_STAGING_OPTS) \
+		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
 endif
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -11,6 +11,6 @@
 
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
-TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 $(eval $(autotools-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -139,6 +139,6 @@
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
 # one, so it disappears
-UTIL_LINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+UTIL_LINUX_INSTALL_STAGING_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
 UTIL_LINUX_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
 HOST_UTIL_LINUX_INSTALL_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -20,7 +20,7 @@
 WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
 
 # parallel make install deadlocks with make 3.81
-WEBKIT_INSTALL_STAGING_OPT = -j1 DESTDIR=$(STAGING_DIR) install
+WEBKIT_INSTALL_STAGING_OPTS = -j1 DESTDIR=$(STAGING_DIR) install
 WEBKIT_INSTALL_TARGET_OPTS = -j1 DESTDIR=$(TARGET_DIR) install
 
 # Does not build and it's disabled by default
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ADOBE_100DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ADOBE_75DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ALIAS_LICENSE = MIT
 XFONT_FONT_ALIAS_LICENSE_FILES = COPYING
 
-XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ALIAS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ALIAS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ARABIC_MISC_LICENSE = MIT
 XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BH_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BH_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BH_TTF_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TTF_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_TTF_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_TTF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BH_TYPE1_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BITSTREAM_100DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BITSTREAM_75DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE = MIT
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE = MIT
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_CURSOR_MISC_LICENSE = unencumbered
 XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -9,7 +9,7 @@
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_DEC_MISC_LICENSE = MIT
 XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_IBM_TYPE1_LICENSE = IBM/MIT X Consortium Courier Typefont agreement (no modification)
 XFONT_FONT_IBM_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_ISAS_MISC_LICENSE = MIT
 XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -9,7 +9,7 @@
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_MICRO_MISC_LICENSE = Public Domain
 XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_MISC_CYRILLIC_LICENSE = MIT / Public Domain
 XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_MISC_ETHIOPIC_LICENSE = MIT
 XFONT_FONT_MISC_ETHIOPIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_MISC_MELTHO_LICENSE = Meltho License
 XFONT_FONT_MISC_MELTHO_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_MISC_MISC_LICENSE = Public Domain
 XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_MUTT_MISC_LICENSE = MIT
 XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_SCHUMACHER_MISC_LICENSE = MIT
 XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE = MIT
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_SONY_MISC_LICENSE = MIT
 XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_SUN_MISC_LICENSE = MIT
 XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
 
-XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE = Public Domain
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
 
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -10,7 +10,7 @@
 XFONT_FONT_XFREE86_TYPE1_LICENSE = MIT
 XFONT_FONT_XFREE86_TYPE1_LICENSE_FILES = COPYING
 
-XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
 XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -17,7 +17,7 @@
 
 XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
-XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
+XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
 
