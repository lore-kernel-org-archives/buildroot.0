From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 May 2013 12:34:21 +0100
Subject: [Buildroot] [PATCH] various packages: fix license information
Message-ID: <1368012861-25468-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/directfb-examples/directfb-examples.mk | 2 +-
 package/divine/divine.mk                       | 2 +-
 package/fb-test-app/fb-test-app.mk             | 2 +-
 package/fxload/fxload.mk                       | 2 +-
 package/libatasmart/libatasmart.mk             | 2 +-
 package/libxmlpp/libxmlpp.mk                   | 2 +-
 package/rpi-firmware/rpi-firmware.mk           | 2 +-
 package/rpi-userland/rpi-userland.mk           | 2 +-
 package/tcl/tcl.mk                             | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 14e544c..bcd3c1c 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -8,7 +8,7 @@ DIRECTFB_EXAMPLES_VERSION = 1.6.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
-DIRECTFB_EXAMPLES_LICENSE_FILE = COPYING
+DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 596debf..adbef37 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -8,7 +8,7 @@
 DIVINE_VERSION = 83cafc257a42b9465cd9d6185bf66b8c1b7ed704
 DIVINE_SITE = git://git.directfb.org/git/directfb/extras/DiVine.git
 DIVINE_LICENSE = LGPLv2.1+
-DIVINE_LICENSE_FILE = COPYING
+DIVINE_LICENSE_FILES = COPYING
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 DIVINE_CONFIG_SCRIPTS = divine-config
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 35e210b..7f17512 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -7,7 +7,7 @@
 FB_TEST_APP_VERSION = v1.0.0
 FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
 FB_TEST_APP_LICENSE = GPLv2
-FB_TEST_APP_LICENSE_FILE = COPYING
+FB_TEST_APP_LICENSE_FILES = COPYING
 
 define FB_TEST_APP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 1b5e8c7..8508084 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -6,7 +6,7 @@
 FXLOAD_VERSION = 2008_10_13
 FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FXLOAD_VERSION)
 FXLOAD_LICENSE = GPLv2+
-FXLOAD_LICENSE_FILE = COPYING
+FXLOAD_LICENSE_FILES = COPYING
 
 define FXLOAD_BUILD_CMDS
     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
index 5dbdcc4..1d96ac7 100644
--- a/package/libatasmart/libatasmart.mk
+++ b/package/libatasmart/libatasmart.mk
@@ -7,7 +7,7 @@ LIBATASMART_VERSION = 0.19
 LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
 LIBATASMART_SITE    = http://0pointer.de/public
 LIBATASMART_LICENSE = LGPLv2.1
-LIBATASMART_LICENSE_FILE = LGPL
+LIBATASMART_LICENSE_FILES = LGPL
 LIBATASMART_INSTALL_STAGING = YES
 
 # package doesn't include configure script
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 1ed60de..41ae7f0 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -8,7 +8,7 @@ LIBXMLPP_VERSION_MAJOR = 2.34
 LIBXMLPP_VERSION_MINOR = 2
 LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).$(LIBXMLPP_VERSION_MINOR)
 LIBXMLPP_LICENSE = LGPLv2.1 (library), LGPLv2+ (examples)
-LIBXMLPP_LICENSE_FILE = COPYING
+LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
 LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
 LIBXMLPP_INSTALL_STAGING = YES
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 5a65e34..dcda6b0 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -7,7 +7,7 @@
 RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
 RPI_FIRMWARE_LICENSE = BSD-3c
-RPI_FIRMWARE_LICENSE_FILE = boot/LICENCE.broadcom
+RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 522a97f..6198671 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -7,7 +7,7 @@
 RPI_USERLAND_VERSION = 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
 RPI_USERLAND_LICENSE = BSD-3c
-RPI_USERLAND_LICENSE_FILE = LICENCE
+RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index ec089ee..144fefe 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -9,7 +9,7 @@ TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_LICENSE = tcl license
-TCL_LICENSE_FILE = license.terms
+TCL_LICENSE_FILES = license.terms
 TCL_SUBDIR = unix
 TCL_CONF_OPT = \
 		--disable-symbols \
-- 
1.8.1.2
