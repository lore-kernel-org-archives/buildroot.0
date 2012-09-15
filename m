From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sat, 15 Sep 2012 23:57:26 +0200
Subject: [Buildroot] [PATCH v2 1/2] Download packages from github in tar.gz
	format instead git format.
Message-ID: <1347746247-12033-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Verified way how to get packages from github by version or sha1
(it's enough to use first 7 characters from SHA1):
1. by sha1
FOO_VERSION = 1234567
FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
FOO_SITE = http://github.com/user/package/tarball/master

2. by version
FOO_VERSION = v1.0
FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
FOO_SITE = http://github.com/user/package/tarball/$(FOO_VERSION)

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/cpuload/cpuload.mk                       |    3 ++-
 package/input-event-daemon/input-event-daemon.mk |    3 ++-
 package/jsmin/jsmin.mk                           |    5 +++--
 package/libiqrf/libiqrf.mk                       |    3 ++-
 package/mtdev2tuio/mtdev2tuio.mk                 |    5 +++--
 package/omap-u-boot-utils/omap-u-boot-utils.mk   |    6 +++---
 package/socketcand/socketcand.mk                 |    5 +++--
 package/ti-utils/ti-utils.mk                     |    5 +++--
 package/tslib/tslib.mk                           |    5 +++--
 package/yajl/yajl.mk                             |    3 ++-
 10 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index d25c504..a333df2 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -5,7 +5,8 @@
 #############################################################
 
 CPULOAD_VERSION = v0.3
-CPULOAD_SITE = git://github.com/kelvincheung/cpuload.git
+CPULOAD_SOURCE = kelvincheung-cpuload-$(CPULOAD_VERSION).tar.gz
+CPULOAD_SITE = http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
 CPULOAD_LICENSE = GPLv2
 CPULOAD_LICENSE_FILES = COPYING
 
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index f99bfbe..dc36224 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -5,7 +5,8 @@
 #############################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
-INPUT_EVENT_DAEMON_SITE = git://github.com/gandro/input-event-daemon.git
+INPUT_EVENT_DAEMON_SOURCE = gandro-input-event-daemon-$(INPUT_EVENT_DAEMON_VERSION).tar.gz
+INPUT_EVENT_DAEMON_SITE = http://github.com/gandro/input-event-daemon/tarball/$(INPUT_EVENT_DAEMON_VERSION)
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index fb8c214..8eaee48 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -1,5 +1,6 @@
-JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
-JSMIN_SITE = git://github.com/douglascrockford/JSMin.git
+JSMIN_VERSION = a9b4755
+JSMIN_SOURCE = douglascrockford-JSMin-$(JSMIN_VERSION).tar.gz
+JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/master
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 4cf1541..7f27015 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -5,7 +5,8 @@
 #############################################################
 
 LIBIQRF_VERSION = v0.1.0
-LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
+LIBIQRF_SOURCE = nandra-libiqrf-$(LIBIQRF_VERSION).tar.gz
+LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
 LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index a86c0bf..627089d 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -3,8 +3,9 @@
 # mtdev2tuio
 #
 #############################################################
-MTDEV2TUIO_VERSION = e1e7378d86
-MTDEV2TUIO_SITE = git://github.com/olivopaolo/mtdev2tuio.git
+MTDEV2TUIO_VERSION = e1e7378
+MTDEV2TUIO_SOURCE = olivopaolo-mtdev2tuio-$(MTDEV2TUIO_VERSION).tar.gz
+MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/master
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 8405f62..43feb12 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-OMAP_U_BOOT_UTILS_VERSION = 8aff852322
-OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils.git
-OMAP_U_BOOT_UTILS_SITE_METHOD = git
+OMAP_U_BOOT_UTILS_VERSION = 8aff852
+OMAP_U_BOOT_UTILS_SOURCE = nmenon-omap-u-boot-utils-$(OMAP_U_BOOT_UTILS_VERSION).tar.gz
+OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/master
 
 define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D)
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index a1e672f..916d523 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -3,8 +3,9 @@
 # socketcand
 #
 #############################################################
-SOCKETCAND_VERSION = 7d06986fa4b5fd2c210ec4e248dab41107be1ccd
-SOCKETCAND_SITE = git://github.com/dschanoeh/socketcand.git
+SOCKETCAND_VERSION = 7d06986
+SOCKETCAND_SOURCE = dschanoeh-socketcand-$(SOCKETCAND_VERSION).tar.gz
+SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/master
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
 
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index ac54370..6a2ac2a 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -4,8 +4,9 @@
 #
 #############################################################
 
-TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
-TI_UTILS_SITE = git://github.com/gxk/ti-utils.git
+TI_UTILS_VERSION = 06dbdb2
+TI_UTILS_SOURCE = gxk-ti-utils-$(TI_UTILS_VERSION).tar.gz
+TI_UTILS_SITE = http://github.com/gxk/ti-utils/tarball/master
 TI_UTILS_DEPENDENCIES = libnl
 
 define TI_UTILS_BUILD_CMDS
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 8f30c25..5699038 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -3,8 +3,9 @@
 # tslib
 #
 #############################################################
-TSLIB_VERSION = 412d99d8b92c
-TSLIB_SITE = git://github.com/kergoth/tslib.git
+TSLIB_VERSION = 412d99d
+TSLIB_SOURCE = kergoth-tslib-$(TSLIB_VERSION).tar.gz
+TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 9cebeb7..3cf0cf7 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 YAJL_VERSION = 2.0.4
-YAJL_SITE = git://github.com/lloyd/yajl.git
+YAJL_SOURCE = lloyd-yajl-$(YAJL_VERSION).tar.gz
+YAJL_SITE = http://github.com/lloyd/yajl/tarball/$(YAJL_VERSION)
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
-- 
1.7.9.5
