From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 09:29:28 +0200
Subject: [Buildroot] [git commit] libftdi1: fix typos in config options and
	comments
Message-ID: <20150516073216.C7D1180097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=142311fe33886dc96e27404938749824e2a998f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is ftdi1, not tfdi1.

As this is a new package for 2015.05 no legacy handling has been added.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi1/Config.in   |   10 +++++-----
 package/libftdi1/libftdi1.mk |    6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index e41dd91..4a490a5 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -9,8 +9,8 @@ config BR2_PACKAGE_LIBFTDI1
 
 if BR2_PACKAGE_LIBFTDI1
 
-config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
-	bool "libfdtipp1"
+config BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
+	bool "libftdipp1"
 	select BR2_PACKAGE_BOOST
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
@@ -18,17 +18,17 @@ config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
 	help
 	  C++ bindings for libftdi
 
-comment "libfdtipp1 needs a toolchain w/ C++"
+comment "libftdipp1 needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
-config BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS
+config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
 	bool "python bindings"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Python bindings for libftdi
 
-config BR2_PACKAGE_LIBTFDI1_FDTI_EEPROM
+config BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM
 	select BR2_PACKAGE_LIBCONFUSE
 	bool "ftdi_eeprom tool"
 
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 45bb4a5..201feb7 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -13,21 +13,21 @@ LIBFTDI1_LICENSE = LGPLv2 (libftdi1), GPLv2 with exception (ftdipp1)
 LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
-ifeq ($(BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
 LIBFTDI1_DEPENDENCIES += boost
 LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
 else
 LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS),y)
 LIBFTDI1_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3) host-swig
 LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
 LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBTFDI1_FDTI_EEPROM),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM),y)
 # ftdi_eeprom optionally depends on libintl, so make sure gettext is built
 # _before_ libfitdi1 when gettext is enbaled.
 LIBFTDI1_DEPENDENCIES += libconfuse $(if $(BR2_PACKAGE_GETTEXT),gettext)
