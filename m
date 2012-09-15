From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sat, 15 Sep 2012 15:07:03 +0200
Subject: [Buildroot] [PATCH] Download packages from github in tar.gz format
	instead git format.
Message-ID: <1347714423-13242-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/cpuload/cpuload.mk                       |    2 +-
 package/input-event-daemon/input-event-daemon.mk |    2 +-
 package/jsmin/jsmin.mk                           |    2 +-
 package/libiqrf/libiqrf.mk                       |    2 +-
 package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
 package/socketcand/socketcand.mk                 |    2 +-
 package/ti-utils/ti-utils.mk                     |    2 +-
 package/tslib/tslib.mk                           |    2 +-
 package/yajl/yajl.mk                             |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index d25c504..6bbe969 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 CPULOAD_VERSION = v0.3
-CPULOAD_SITE = git://github.com/kelvincheung/cpuload.git
+CPULOAD_SITE = http://github.com/downloads/kelvincheung/cpuload
 CPULOAD_LICENSE = GPLv2
 CPULOAD_LICENSE_FILES = COPYING
 
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index f99bfbe..c1be637 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
-INPUT_EVENT_DAEMON_SITE = git://github.com/gandro/input-event-daemon.git
+INPUT_EVENT_DAEMON_SITE = http://github.com/downloads/gandro/input-event-daemon
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index fb8c214..d7a9f76 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -1,5 +1,5 @@
 JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
-JSMIN_SITE = git://github.com/douglascrockford/JSMin.git
+JSMIN_SITE = http://github.com/downloads/douglascrockford/JSMin
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 4cf1541..59dffa2 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LIBIQRF_VERSION = v0.1.0
-LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
+LIBIQRF_SITE = http://github.com/downloads/nandra/libiqrf
 LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index a86c0bf..e93e3fc 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 MTDEV2TUIO_VERSION = e1e7378d86
-MTDEV2TUIO_SITE = git://github.com/olivopaolo/mtdev2tuio.git
+MTDEV2TUIO_SITE = http://github.com/downloads/olivopaolo/mtdev2tuio
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 8405f62..51508de 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 OMAP_U_BOOT_UTILS_VERSION = 8aff852322
-OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils.git
+OMAP_U_BOOT_UTILS_SITE = http://github.com/downloads/nmenon/omap-u-boot-utils
 OMAP_U_BOOT_UTILS_SITE_METHOD = git
 
 define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index a1e672f..ff65d85 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 SOCKETCAND_VERSION = 7d06986fa4b5fd2c210ec4e248dab41107be1ccd
-SOCKETCAND_SITE = git://github.com/dschanoeh/socketcand.git
+SOCKETCAND_SITE = http://github.com/downloads/dschanoeh/socketcand
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
 
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index ac54370..4f8b320 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
-TI_UTILS_SITE = git://github.com/gxk/ti-utils.git
+TI_UTILS_SITE = http://github.com/downloads/gxk/ti-utils
 TI_UTILS_DEPENDENCIES = libnl
 
 define TI_UTILS_BUILD_CMDS
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 8f30c25..1650bd7 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 TSLIB_VERSION = 412d99d8b92c
-TSLIB_SITE = git://github.com/kergoth/tslib.git
+TSLIB_SITE = http://github.com/downloads/kergoth/tslib
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 9cebeb7..b1d7fca 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 YAJL_VERSION = 2.0.4
-YAJL_SITE = git://github.com/lloyd/yajl.git
+YAJL_SITE = http://github.com/downloads/lloyd/yaju
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
-- 
1.7.9.5
