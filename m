From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 12:46:42 +0200
Subject: [Buildroot] [git commit] package: Remove trailing slash from all
	package site URLs
Message-ID: <20150930104702.45C1681D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b0e757fb85fd88a76fb4528926914288eb2e477
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recommended form is without the trailing slash, and will become
mandatory in a coming commit.

This avoids the need for the $$($(2)_SITE:/=) magic in package/pkg-generic.mk
to avoid double slashes in download URLs, like
"https://mosh.mit.edu//mosh-1.2.5.tar.gz".
                     ^^

Note: this work has already been done in b0b9606530dfc6de4030 a few
months ago and earlier in c7f4b964718bc5a3329b and 4a9eb20de817fa64,
but no check has been added at that time to avoid new slashes to slip
in, and so they did. This time a patch will follow immediately to
prevent future mistakes from being unnoticed.

Mass-replaced with the following command:

  git grep -l '_SITE.*/$' | xargs sed -i '/_SITE.*=/s|/$||'

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/angularjs/angularjs.mk                   |    2 +-
 package/audit/audit.mk                           |    2 +-
 package/c-icap-modules/c-icap-modules.mk         |    2 +-
 package/c-icap/c-icap.mk                         |    2 +-
 package/doxygen/doxygen.mk                       |    2 +-
 package/drbd-utils/drbd-utils.mk                 |    2 +-
 package/ebtables/ebtables.mk                     |    2 +-
 package/ibrcommon/ibrcommon.mk                   |    2 +-
 package/ibrdtn-tools/ibrdtn-tools.mk             |    2 +-
 package/ibrdtn/ibrdtn.mk                         |    2 +-
 package/ibrdtnd/ibrdtnd.mk                       |    2 +-
 package/ipmiutil/ipmiutil.mk                     |    2 +-
 package/libcddb/libcddb.mk                       |    2 +-
 package/libftdi1/libftdi1.mk                     |    2 +-
 package/libpam-radius-auth/libpam-radius-auth.mk |    2 +-
 package/lirc-tools/lirc-tools.mk                 |    2 +-
 package/monkey/monkey.mk                         |    2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk         |    2 +-
 package/mosh/mosh.mk                             |    2 +-
 package/openipmi/openipmi.mk                     |    2 +-
 package/powertop/powertop.mk                     |    2 +-
 package/python-can/python-can.mk                 |    2 +-
 package/python-pycli/python-pycli.mk             |    2 +-
 package/python-pyxml/python-pyxml.mk             |    2 +-
 package/python-pyyaml/python-pyyaml.mk           |    2 +-
 package/quazip/quazip.mk                         |    2 +-
 package/rapidxml/rapidxml.mk                     |    2 +-
 package/setools/setools.mk                       |    2 +-
 package/sp-oops-extract/sp-oops-extract.mk       |    2 +-
 package/stress-ng/stress-ng.mk                   |    2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 1dbd7a7..60dbdb6 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -6,7 +6,7 @@
 
 ANGULARJS_VERSION = 1.4.3
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
-ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)/
+ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
 # There's no separate license file in the archive, so use angular.js instead.
 ANGULARJS_LICENSE_FILES = angular.js
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 61e876b..6ff0986 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AUDIT_VERSION = 2.4.3
-AUDIT_SITE = http://people.redhat.com/sgrubb/audit/
+AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
 
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index aeab580..5252a81 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -6,7 +6,7 @@
 
 C_ICAP_MODULES_VERSION = 0.3.2
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
-C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPLv2+
 C_ICAP_MODULES_LICENSE_FILES = COPYING
 C_ICAP_MODULES_DEPENDENCIES = c-icap
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 0e27cc4..b4defb8 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -6,7 +6,7 @@
 
 C_ICAP_VERSION = 0.3.5
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
-C_ICAP_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPLv2.1+
 C_ICAP_LICENSE_FILES = COPYING
 C_ICAP_INSTALL_STAGING = YES
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 6f81a56..14dd090 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -6,7 +6,7 @@
 
 DOXYGEN_VERSION = 1.8.9.1
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
-DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri/
+DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
 DOXYGEN_LICENSE = GPLv2
 DOXYGEN_LICENSE_FILES = LICENSE
 DOXYGEN_DEPENDENCIES = host-flex host-bison
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 75bc854..88d2729 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DRBD_UTILS_VERSION = 8.9.4
-DRBD_UTILS_SITE = http://oss.linbit.com/drbd/
+DRBD_UTILS_SITE = http://oss.linbit.com/drbd
 DRBD_UTILS_LICENSE = GPLv2+
 DRBD_UTILS_LICENSE_FILES = COPYING
 DRBD_UTILS_DEPENDENCIES = host-flex
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index e6cdd26..6395930 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -6,7 +6,7 @@
 
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
-EBTABLES_SITE = http://ftp.netfilter.org/pub/ebtables/
+EBTABLES_SITE = http://ftp.netfilter.org/pub/ebtables
 EBTABLES_LICENSE = GPLv2+
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_STATIC_LIBS),static)
diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
index 97eced3..5fa2cb5 100644
--- a/package/ibrcommon/ibrcommon.mk
+++ b/package/ibrcommon/ibrcommon.mk
@@ -6,7 +6,7 @@
 
 IBRCOMMON_VERSION = 1.0.1
 IBRCOMMON_SOURCE = ibrcommon-$(IBRCOMMON_VERSION).tar.gz
-IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRCOMMON_INSTALL_STAGING = YES
 IBRCOMMON_LICENSE = Apache-2.0
 IBRCOMMON_LICENSE_FILES = COPYING README
diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
index c9a585d..34f05a6 100644
--- a/package/ibrdtn-tools/ibrdtn-tools.mk
+++ b/package/ibrdtn-tools/ibrdtn-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IBRDTN_TOOLS_VERSION = 1.0.1
-IBRDTN_TOOLS_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTN_TOOLS_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTN_TOOLS_LICENSE = Apache-2.0
 IBRDTN_TOOLS_LICENSE_FILES = COPYING
 IBRDTN_TOOLS_DEPENDENCIES = ibrcommon ibrdtn host-pkgconf
diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
index f899843..7bd9b9b 100644
--- a/package/ibrdtn/ibrdtn.mk
+++ b/package/ibrdtn/ibrdtn.mk
@@ -6,7 +6,7 @@
 
 IBRDTN_VERSION = 1.0.1
 IBRDTN_SOURCE = ibrdtn-$(IBRDTN_VERSION).tar.gz
-IBRDTN_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTN_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTN_INSTALL_STAGING = YES
 IBRDTN_LICENSE = Apache-2.0
 IBRDTN_LICENSE_FILES = COPYING
diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index 8a37fa3..e9fa43d 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -6,7 +6,7 @@
 
 IBRDTND_VERSION = 1.0.1
 IBRDTND_SOURCE = ibrdtnd-$(IBRDTND_VERSION).tar.gz
-IBRDTND_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTND_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTND_LICENSE = Apache-2.0
 IBRDTND_LICENSE_FILES = COPYING
 IBRDTND_DEPENDENCIES = ibrdtn ibrcommon
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 6f462b9..4861c81 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPMIUTIL_VERSION = 2.9.5
-IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files/
+IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac , lib/Makefile.am and lib/lanplus/Makefile.am
diff --git a/package/libcddb/libcddb.mk b/package/libcddb/libcddb.mk
index 7ddb1e7..96b265a 100644
--- a/package/libcddb/libcddb.mk
+++ b/package/libcddb/libcddb.mk
@@ -6,7 +6,7 @@
 
 LIBCDDB_VERSION = 1.3.2
 LIBCDDB_SOURCE = libcddb-$(LIBCDDB_VERSION).tar.bz2
-LIBCDDB_SITE = http://downloads.sourceforge.net/libcddb/
+LIBCDDB_SITE = http://downloads.sourceforge.net/libcddb
 LIBCDDB_LICENSE = LGPLv2+
 LIBCDDB_LICENSE_FILES = COPYING
 LIBCDDB_INSTALL_STAGING = YES
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 201feb7..e77f37b 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -6,7 +6,7 @@
 
 LIBFTDI1_VERSION = 1.2
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
-LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download/
+LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = libusb
 LIBFTDI1_LICENSE = LGPLv2 (libftdi1), GPLv2 with exception (ftdipp1)
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
index 42acffd..5ed5953 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.mk
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBPAM_RADIUS_AUTH_VERSION = 1.4.0
-LIBPAM_RADIUS_AUTH_SITE = ftp://ftp.freeradius.org/pub/radius/
+LIBPAM_RADIUS_AUTH_SITE = ftp://ftp.freeradius.org/pub/radius
 LIBPAM_RADIUS_AUTH_SOURCE = pam_radius-$(LIBPAM_RADIUS_AUTH_VERSION).tar.gz
 LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
 LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 6837042..2052b72 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -6,7 +6,7 @@
 
 LIRC_TOOLS_VERSION = 0.9.2
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
-LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)/
+LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-pkgconf
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 73fbd62..67c8f35 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -6,7 +6,7 @@
 
 MONKEY_VERSION_MAJOR = 1.5
 MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
-MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)/
+MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)
 MONKEY_LICENSE = Apache-2.0
 MONKEY_LICENSE_FILES = LICENSE
 
diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
index fa63d66..cccfcde 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -6,7 +6,7 @@
 
 MONO_GTKSHARP3_VERSION_MAJOR = 2.99
 MONO_GTKSHARP3_VERSION = $(MONO_GTKSHARP3_VERSION_MAJOR).3
-MONO_GTKSHARP3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)/
+MONO_GTKSHARP3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
 MONO_GTKSHARP3_SOURCE = gtk-sharp-$(MONO_GTKSHARP3_VERSION).tar.xz
 MONO_GTKSHARP3_LICENSE = LGPLv2, MIT (cairo)
 MONO_GTKSHARP3_LICENSE_FILES = COPYING
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 02954f9..f8c45e8 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOSH_VERSION = 1.2.5
-MOSH_SITE = https://mosh.mit.edu/
+MOSH_SITE = https://mosh.mit.edu
 MOSH_DEPENDENCIES = zlib ncurses protobuf openssl host-pkgconf
 MOSH_LICENSE = GPLv3+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 4a813ad..85bd6b4 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENIPMI_VERSION = 2.0.21
-OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
+OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
 OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 87da5a4..53be483 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POWERTOP_VERSION = 2.7
-POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop/
+POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop
 POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
 POWERTOP_LICENSE = GPLv2
 POWERTOP_LICENSE_FILES = COPYING
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 53d5e0f..c7b06a5 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_CAN_VERSION = ae5b6cf
-PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get/
+PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get
 PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
 PYTHON_CAN_LICENSE = LGPLv3
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
index 2d83acd..8e48a06 100644
--- a/package/python-pycli/python-pycli.mk
+++ b/package/python-pycli/python-pycli.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYCLI_VERSION = devel
 PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
-PYTHON_PYCLI_SITE = https://pypi.python.org/packages/source/p/pyCLI/
+PYTHON_PYCLI_SITE = https://pypi.python.org/packages/source/p/pyCLI
 PYTHON_PYCLI_LICENSE = ISC-like
 PYTHON_PYCLI_LICENSE_FILES = lib/cli/__init__.py
 PYTHON_PYCLI_SETUP_TYPE = setuptools
diff --git a/package/python-pyxml/python-pyxml.mk b/package/python-pyxml/python-pyxml.mk
index 40435f4..7ccce8e 100644
--- a/package/python-pyxml/python-pyxml.mk
+++ b/package/python-pyxml/python-pyxml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYXML_VERSION = 0.8.4
 PYTHON_PYXML_SOURCE = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
-PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/$(PYTHON_PYXML_VERSION)/
+PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/$(PYTHON_PYXML_VERSION)
 PYTHON_PYXML_LICENSE = BSD-3c
 PYTHON_PYXML_LICENSE_FILES = LICENCE
 PYTHON_PYXML_SETUP_TYPE = distutils
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index ef10dac..f3d7283 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYYAML_VERSION = 3.11
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://pypi.python.org/packages/source/P/PyYAML/
+PYTHON_PYYAML_SITE = https://pypi.python.org/packages/source/P/PyYAML
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = Python software foundation license v2
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 178a531..adccf90 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QUAZIP_VERSION = 0.7.1
-QUAZIP_SITE = http://sourceforge.net/projects/quazip/files/quazip/$(QUAZIP_VERSION)/
+QUAZIP_SITE = http://sourceforge.net/projects/quazip/files/quazip/$(QUAZIP_VERSION)
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
 	zlib \
diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
index 4356d8d..a76a21b 100644
--- a/package/rapidxml/rapidxml.mk
+++ b/package/rapidxml/rapidxml.mk
@@ -6,7 +6,7 @@
 
 RAPIDXML_VERSION = 1.13
 RAPIDXML_SOURCE = rapidxml-$(RAPIDXML_VERSION).zip
-RAPIDXML_SITE = http://downloads.sourceforge.net/project/rapidxml/rapidxml/rapidxml%20$(RAPIDXML_VERSION)/
+RAPIDXML_SITE = http://downloads.sourceforge.net/project/rapidxml/rapidxml/rapidxml%20$(RAPIDXML_VERSION)
 RAPIDXML_LICENSE = Boost Software License 1.0 or MIT
 RAPIDXML_LICENSE_FILES = license.txt
 
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 612ab89..f575f86 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -6,7 +6,7 @@
 
 SETOOLS_VERSION = 3.3.8
 SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
-SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)/
+SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)
 SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison host-flex
 SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
diff --git a/package/sp-oops-extract/sp-oops-extract.mk b/package/sp-oops-extract/sp-oops-extract.mk
index 5882431..9919807 100644
--- a/package/sp-oops-extract/sp-oops-extract.mk
+++ b/package/sp-oops-extract/sp-oops-extract.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SP_OOPS_EXTRACT_VERSION = 0.0.7-1
-SP_OOPS_EXTRACT_SITE = http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract/
+SP_OOPS_EXTRACT_SITE = http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract
 SP_OOPS_EXTRACT_SOURCE = sp-oops-extract_$(SP_OOPS_EXTRACT_VERSION).tar.gz
 SP_OOPS_EXTRACT_LICENSE = GPLv2
 SP_OOPS_EXTRACT_LICENSE_FILES = COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 7169c2b..114c427 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STRESS_NG_VERSION = 0.04.16
-STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng/
+STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPLv2+
 STRESS_NG_LICENSE_FILES = COPYING
 
