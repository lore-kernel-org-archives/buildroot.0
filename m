From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  9 Mar 2015 23:14:51 +0100
Subject: [Buildroot] [PATCH 2/3] Remove trailing slash from all package site
	URLs
In-Reply-To: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
References: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1425939292-14719-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recommended form is without the trailing slash. Buildroot will add a slash
between FOO_SITE and FOO_SOURCE as appropriate.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 linux/linux.mk                                     |  2 +-
 package/autoconf-archive/autoconf-archive.mk       |  2 +-
 package/bmon/bmon.mk                               |  2 +-
 package/dos2unix/dos2unix.mk                       |  2 +-
 package/freeradius-client/freeradius-client.mk     |  2 +-
 package/gengetopt/gengetopt.mk                     |  2 +-
 package/geoip/geoip.mk                             |  2 +-
 package/hicolor-icon-theme/hicolor-icon-theme.mk   |  2 +-
 package/libevdev/libevdev.mk                       |  2 +-
 package/libiscsi/libiscsi.mk                       |  2 +-
 package/libnice/libnice.mk                         |  2 +-
 package/libphidget/libphidget.mk                   |  2 +-
 package/libseccomp/libseccomp.mk                   |  2 +-
 package/libzip/libzip.mk                           |  2 +-
 package/lightning/lightning.mk                     |  2 +-
 package/lxc/lxc.mk                                 |  2 +-
 package/mono/mono.mk                               |  2 +-
 package/monolite/monolite.mk                       |  2 +-
 package/mpdecimal/mpdecimal.mk                     |  2 +-
 package/patchelf/patchelf.mk                       |  2 +-
 package/phidgetwebservice/phidgetwebservice.mk     |  2 +-
 package/python-django/python-django.mk             |  2 +-
 package/python-netifaces/python-netifaces.mk       |  2 +-
 package/python-pam/python-pam.mk                   |  2 +-
 package/python-six/python-six.mk                   |  2 +-
 package/python-twisted/python-twisted.mk           |  2 +-
 .../python-zope-interface/python-zope-interface.mk |  2 +-
 package/qt5cinex/qt5cinex.mk                       |  2 +-
 package/slang/slang.mk                             |  2 +-
 package/smcroute/smcroute.mk                       |  2 +-
 package/tslib/tslib.mk                             |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 package/ustr/ustr.mk                               |  2 +-
 package/wine/wine.mk                               |  2 +-
 toolchain/toolchain-external/toolchain-external.mk | 60 +++++++++++-----------
 35 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 672ce48..5afcd4e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -36,7 +36,7 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
-LINUX_SITE := $(LINUX_SITE)/testing/
+LINUX_SITE := $(LINUX_SITE)/testing
 endif # -rc
 endif
 
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 78cb6a8..4479348 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -6,7 +6,7 @@
 
 AUTOCONF_ARCHIVE_VERSION = 2015.02.04
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
-AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive/
+AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
 AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
 
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 95168f6..9a4312f 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BMON_VERSION = 3.6
-BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)/
+BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c
 BMON_LICENSE_FILES = LICENSE
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index fd531d4..2d7fcbb 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOS2UNIX_VERSION = 7.0
-DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix/
+DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_DEPENDENCIES = host-gettext
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
index 00913c7..0ed7fbe 100644
--- a/package/freeradius-client/freeradius-client.mk
+++ b/package/freeradius-client/freeradius-client.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FREERADIUS_CLIENT_VERSION = 1.1.7
-FREERADIUS_CLIENT_SITE = ftp://ftp.freeradius.org/pub/freeradius/
+FREERADIUS_CLIENT_SITE = ftp://ftp.freeradius.org/pub/freeradius
 FREERADIUS_CLIENT_LICENSE = BSD-2c
 FREERADIUS_CLIENT_LICENSE_FILES = COPYRIGHT
 FREERADIUS_CLIENT_INSTALL_STAGING = YES
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
index 7477d53..b7cbc7f 100644
--- a/package/gengetopt/gengetopt.mk
+++ b/package/gengetopt/gengetopt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GENGETOPT_VERSION = 2.22.6
-GENGETOPT_SITE = $(BR2_GNU_MIRROR)/gengetopt/
+GENGETOPT_SITE = $(BR2_GNU_MIRROR)/gengetopt
 GENGETOPT_LICENSE = GPLv3+
 GENGETOPT_LICENSE_FILES = COPYING LICENSE
 
diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
index 0afb4e2..ac88a3b 100644
--- a/package/geoip/geoip.mk
+++ b/package/geoip/geoip.mk
@@ -6,7 +6,7 @@
 
 GEOIP_VERSION = 1.6.4
 GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
-GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)/
+GEOIP_SITE = https://github.com/maxmind/geoip-api-c/releases/download/v$(GEOIP_VERSION)
 GEOIP_INSTALL_STAGING = YES
 GEOIP_LICENSE = LGPLv2.1+
 GEOIP_LICENSE_FILES = COPYING
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
index 768aec8..cf4578e 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.mk
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HICOLOR_ICON_THEME_VERSION = 0.13
-HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases/
+HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases
 HICOLOR_ICON_THEME_LICENSE = GPLv2
 HICOLOR_ICON_THEME_LICENSE_FILES = COPYING
 
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 56247be..45bde9f 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEVDEV_VERSION = 1.3.2
-LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
+LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
 LIBEVDEV_LICENSE_FILES = COPYING
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index a52211b..c244830 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBISCSI_VERSION = 1.12.0
-LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs/
+LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs
 LIBISCSI_LICENSE = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 10abe86..68f5eae 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBNICE_VERSION = 0.1.8
-LIBNICE_SITE = http://nice.freedesktop.org/releases/
+LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPLv1.1 or LGPLv2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index cb151a1..1b2557d 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -6,7 +6,7 @@
 
 LIBPHIDGET_VERSION = 2.1.8.20140319
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries/
+LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries
 LIBPHIDGET_DEPENDENCIES = libusb
 LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 44dec3f..fbc4f90 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSECCOMP_VERSION = 2.1.1
-LIBSECCOMP_SITE = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)/
+LIBSECCOMP_SITE = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index e5d8e26..a419db7 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBZIP_VERSION = 0.11.2
-LIBZIP_SITE = http://www.nih.at/libzip/
+LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3c
 LIBZIP_LICENSE_FILES = LICENSE
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 594ba0c..9095cba 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTNING_VERSION = 2.0.5
-LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning/
+LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning
 LIGHTNING_LICENSE = LGPLv3+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 69c2fb9..11a89f2 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LXC_VERSION = 1.0.6
-LXC_SITE = https://linuxcontainers.org/downloads/
+LXC_SITE = https://linuxcontainers.org/downloads
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 9ec3c24..65cd973 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 MONO_VERSION = 3.12.0
-MONO_SITE = http://download.mono-project.com/sources/mono/
+MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
 MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING.LIB mcs/COPYING \
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index b759c13..ddc2e92 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 MONOLITE_VERSION = 111
-MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest/
+MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
 
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 060750c..07a7564 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -7,7 +7,7 @@
 # Official site currently down
 # MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
 
-MPDECIMAL_SITE = https://launchpad.net/ubuntu/+archive/primary/+files/
+MPDECIMAL_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
 MPDECIMAL_VERSION = 2.4.1
 MPDECIMAL_SOURCE = mpdecimal_$(MPDECIMAL_VERSION).orig.tar.gz
 MPDECIMAL_INSTALL_STAGING = YES
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index b6b9e05..043224d 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PATCHELF_VERSION = 0.8
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8/
+PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8
 PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
index 64dfca4..f7d1b48 100644
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ b/package/phidgetwebservice/phidgetwebservice.mk
@@ -6,7 +6,7 @@
 
 PHIDGETWEBSERVICE_VERSION = 2.1.8.20140319
 PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
-PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries/
+PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries
 PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
 PHIDGETWEBSERVICE_LICENSE = LGPLv3
 PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 28f25bd..b67bce4 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -7,7 +7,7 @@
 PYTHON_DJANGO_VERSION = 1.7.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://pypi.python.org/packages/source/D/Django/
+PYTHON_DJANGO_SITE = https://pypi.python.org/packages/source/D/Django
 PYTHON_DJANGO_LICENSE = BSD-3c
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 4aa53e6..f748bc1 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -6,7 +6,7 @@
 
 PYTHON_NETIFACES_VERSION = 0.10.4
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/source/n/netifaces/
+PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/source/n/netifaces
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = README
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
diff --git a/package/python-pam/python-pam.mk b/package/python-pam/python-pam.mk
index 1e8a593..d737291 100644
--- a/package/python-pam/python-pam.mk
+++ b/package/python-pam/python-pam.mk
@@ -7,7 +7,7 @@
 PYTHON_PAM_VERSION = 0.5.0
 PYTHON_PAM_SOURCE = PyPAM-$(PYTHON_PAM_VERSION).tar.gz
 # pangalactic.org gone
-PYTHON_PAM_SITE = http://pkgs.fedoraproject.org/repo/pkgs/PyPAM/PyPAM-0.5.0.tar.gz/f1e7c2c56421dda28a75ace59a3c8871/
+PYTHON_PAM_SITE = http://pkgs.fedoraproject.org/repo/pkgs/PyPAM/PyPAM-0.5.0.tar.gz/f1e7c2c56421dda28a75ace59a3c8871
 PYTHON_PAM_SETUP_TYPE = distutils
 PYTHON_PAM_LICENSE = LGPLv2.1
 PYTHON_PAM_LICENSE_FILES = COPYING
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 08fe5de..24fd976 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SIX_VERSION = 1.9.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://pypi.python.org/packages/source/s/six/
+PYTHON_SIX_SITE = https://pypi.python.org/packages/source/s/six
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 792bb05..a2e2486 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -6,7 +6,7 @@
 
 PYTHON_TWISTED_VERSION = 14.0.2
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted/
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index a271f77..dea6203 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -6,7 +6,7 @@
 
 PYTHON_ZOPE_INTERFACE_VERSION = 4.1.2
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/source/z/zope.interface/
+PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/source/z/zope.interface
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPLv2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index ac7c379..a79df7b 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5CINEX_VERSION = 1.0
-QT5CINEX_SITE = http://quitcoding.com/download/
+QT5CINEX_SITE = http://quitcoding.com/download
 
 ifeq ($(BR2_PACKAGE_QT5CINEX_HD),y)
 QT5CINEX_HD = "rpi_"
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 025c34a..c458fe7 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SLANG_VERSION = 2.3.0
-SLANG_SITE = http://www.jedsoft.org/releases/slang/
+SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPLv2+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 9de65f8..77e7e63 100755
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -6,7 +6,7 @@
 
 SMCROUTE_VERSION = 2.0.0
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
-SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)/
+SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPLv2+
 SMCROUTE_LICENSE_FILES = COPYING
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 3f93149..1100247 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TSLIB_VERSION = 1.1
-TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)/
+TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 7fe50a3..feca77b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -12,7 +12,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
 else ifeq ($(BR2_UCLIBC_NG_VERSION_1_0_0),y)
-UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)/
+UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 else ifeq ($(BR2_UCLIBC_VERSION_ARC_GIT),y)
 UCLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,uClibc,$(UCLIBC_VERSION))
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index ac1fa05..e4b2fa2 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -6,7 +6,7 @@
 
 USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
-USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
+USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
 USTR_LICENSE = BSD-2c MIT LGPLv2+
 USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 571606d..aa474f9 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -6,7 +6,7 @@
 
 WINE_VERSION = 1.6.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
-WINE_SITE = http://downloads.sourceforge.net/project/wine/Source/
+WINE_SITE = http://downloads.sourceforge.net/project/wine/Source
 WINE_LICENSE = LGPLv2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 612c49d..44b8c83 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -249,110 +249,110 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 endef
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.11-33-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv7a/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2014.05-47-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu/
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.1
-TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)/
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
 ifeq ($(BR2_arm),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_armeb),y)
-- 
1.9.1
