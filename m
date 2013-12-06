From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 22:38:26 +0100
Subject: [Buildroot] [git commit] packages: convert Github http:// users to
	the github helper
Message-ID: <20131206215055.AA1139BF53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5c392830ed3976269282c4f173d11f64a380e3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: taken from Mischa original github patch.]

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/a10disp/a10disp.mk                       |    2 +-
 package/civetweb/civetweb.mk                     |    2 +-
 package/cpuload/cpuload.mk                       |    2 +-
 package/fb-test-app/fb-test-app.mk               |    2 +-
 package/input-event-daemon/input-event-daemon.mk |    2 +-
 package/jsmin/jsmin.mk                           |    2 +-
 package/knock/knock.mk                           |    2 +-
 package/libcec/libcec.mk                         |    2 +-
 package/libcofi/libcofi.mk                       |    2 +-
 package/libiqrf/libiqrf.mk                       |    2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk |    2 +-
 package/libsha1/libsha1.mk                       |    2 +-
 package/libsoc/libsoc.mk                         |    2 +-
 package/libtpl/libtpl.mk                         |    2 +-
 package/linenoise/linenoise.mk                   |    2 +-
 package/lua-ev/lua-ev.mk                         |    2 +-
 package/luacrypto/luacrypto.mk                   |    2 +-
 package/luaexpatutils/luaexpatutils.mk           |    2 +-
 package/luasql/luasql.mk                         |    2 +-
 package/mongrel2/mongrel2.mk                     |    2 +-
 package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
 package/neardal/neardal.mk                       |    2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
 package/on2-8170-modules/on2-8170-modules.mk     |    2 +-
 package/python-ipy/python-ipy.mk                 |    2 +-
 package/qjson/qjson.mk                           |    2 +-
 package/rpi-firmware/rpi-firmware.mk             |    2 +-
 package/rpi-userland/rpi-userland.mk             |    2 +-
 package/socketcand/socketcand.mk                 |    2 +-
 package/sqlcipher/sqlcipher.mk                   |    2 +-
 package/sunxi-boards/sunxi-boards.mk             |    2 +-
 package/sunxi-cedarx/sunxi-cedarx.mk             |    2 +-
 package/sunxi-mali-prop/sunxi-mali-prop.mk       |    2 +-
 package/sunxi-mali/sunxi-mali.mk                 |    2 +-
 package/sunxi-tools/sunxi-tools.mk               |    2 +-
 package/tinymembench/tinymembench.mk             |    2 +-
 package/tslib/tslib.mk                           |    2 +-
 package/xl2tp/xl2tp.mk                           |    2 +-
 package/yajl/yajl.mk                             |    2 +-
 39 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index 486db44..066e988 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 A10DISP_VERSION = a899cc6dcf909360aac00482ede5369f3656f226
-A10DISP_SITE = http://github.com/hglm/a10disp/tarball/$(A10DISP_VERSION)
+A10DISP_SITE = $(call github,hglm,a10disp,$(A10DISP_VERSION))
 A10DISP_LICENSE = MIT
 
 A10DISP_DEPENDENCIES = linux
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index dd74d97..4c8f4e8 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CIVETWEB_VERSION = v1.3
-CIVETWEB_SITE = http://github.com/sunsetbrew/civetweb/tarball/$(CIVETWEB_VERSION)
+CIVETWEB_SITE = $(call github,sunsetbrew,civetweb,$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index e0b8ccf..30c3db6 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CPULOAD_VERSION = v0.3
-CPULOAD_SITE = http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
+CPULOAD_SITE = $(call github,kelvincheung,cpuload,$(CPULOAD_VERSION))
 CPULOAD_LICENSE = GPLv2
 CPULOAD_LICENSE_FILES = COPYING
 
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index ad2c2b4..6db3a2d 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FB_TEST_APP_VERSION = v1.0.0
-FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
+FB_TEST_APP_SITE = $(call github,prpplague,fb-test-app,$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPLv2
 FB_TEST_APP_LICENSE_FILES = COPYING
 
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 35ec51e..bd11064 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
-INPUT_EVENT_DAEMON_SITE = http://github.com/gandro/input-event-daemon/tarball/$(INPUT_EVENT_DAEMON_VERSION)
+INPUT_EVENT_DAEMON_SITE = $(call github,gandro,input-event-daemon,$(INPUT_EVENT_DAEMON_VERSION))
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index d43dcdc..3ef3047 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
-JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/$(JSMIN_VERSION)
+JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 5fcf414..41fc0fb 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KNOCK_VERSION = 7666f2e86e18d482eaad5fe1fea46d87d80b0555
-KNOCK_SITE = https://github.com/jvinet/knock/tarball/master
+KNOCK_SITE = $(call github,jvinet,knock,master)
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_AUTORECONF = YES
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8a58e1e..910f319 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCEC_VERSION = libcec-2.1.1
-LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
+LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index 88d51d3..dcfc641 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
-LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/$(LIBCOFI_VERSION)
+LIBCOFI_SITE = $(call github,simonjhall,copies-and-fills,$(LIBCOFI_VERSION))
 LIBCOFI_LICENSE = LGPLv2.1
 LIBCOFI_LICENSE_FILES = README.md
 
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 6c33654..ec0d599 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBIQRF_VERSION = v0.1.2
-LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
+LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
 LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 474bd95..f2b851d 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBLOG4C_LOCALTIME_VERSION = v1.0
-LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/$(LIBLOG4C_LOCALTIME_VERSION)
+LIBLOG4C_LOCALTIME_SITE    = $(call github,rcmadruga,log4c-localtime,$(LIBLOG4C_LOCALTIME_VERSION))
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index 6976a8f..2fd7705 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSHA1_VERSION = 0.3
-LIBSHA1_SITE = http://github.com/dottedmag/libsha1/tarball/$(LIBSHA1_VERSION)
+LIBSHA1_SITE = $(call github,dottedmag,libsha1,$(LIBSHA1_VERSION))
 LIBSHA1_LICENSE = BSD-3c or GPL
 LIBSHA1_LICENSE_FILES = COPYING
 
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 79c7e90..eca3e84 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOC_VERSION = 0.4
-LIBSOC_SITE = http://github.com/jackmitch/libsoc/tarball/$(LIBSOC_VERSION)
+LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
 LIBSOC_AUTORECONF = YES
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 478b298..0a0fe8b 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBTPL_VERSION = 445b4e9f236a48e274eaace31acf56d700da142a
-LIBTPL_SITE = http://github.com/troydhanson/tpl/tarball/$(LIBTPL_VERSION)
+LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 896a74c..d99e8d2 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LINENOISE_VERSION = 27a3b4d5205a5fb3e2101128edd6653bd0c92189
-LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/$(LINENOISE_VERSION)
+LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
 
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 0beece4..173cf0b 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_EV_VERSION = 458165bdfe0c6eadc788813925f11a0e6a823845
-LUA_EV_SITE = http://github.com/brimworks/lua-ev/tarball/$(LUA_EV_VERSION)
+LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = lua libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index f6fcc78..54ab388 100644
--- a/package/luacrypto/luacrypto.mk
+++ b/package/luacrypto/luacrypto.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUACRYPTO_VERSION = 0.3.2
-LUACRYPTO_SITE = http://github.com/mkottman/luacrypto/tarball/$(LUACRYPTO_VERSION)
+LUACRYPTO_SITE = $(call github,mkottman,luacrypto,$(LUACRYPTO_VERSION))
 LUACRYPTO_LICENSE = MIT
 LUACRYPTO_LICENSE_FILES = COPYING
 LUACRYPTO_DEPENDENCIES = lua openssl host-pkgconf
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
index 695a3b9..bdbbdd2 100644
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUAEXPATUTILS_VERSION = 88c228365b084224c911d34aff06002634b38b50
-LUAEXPATUTILS_SITE = http://github.com/stevedonovan/LuaExpatUtils/tarball/$(LUAEXPATUTILS_VERSION)
+LUAEXPATUTILS_SITE = $(call github,stevedonovan,LuaExpatUtils,$(LUAEXPATUTILS_VERSION))
 LUAEXPATUTILS_LICENSE = Public Domain
 LUAEXPATUTILS_DEPENDENCIES = luaexpat
 
diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
index 9ca68e5..44ad90d 100644
--- a/package/luasql/luasql.mk
+++ b/package/luasql/luasql.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUASQL_VERSION = v2.3.0
-LUASQL_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_VERSION)
+LUASQL_SITE = $(call github,keplerproject,luasql,$(LUASQL_VERSION))
 LUASQL_LICENSE = MIT
 LUASQL_LICENSE_FILES = README
 LUASQL_DEPENDENCIES = lua
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index dfb9cd0..e6a7be3 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONGREL2_VERSION = v1.8.0
-MONGREL2_SITE = https://github.com/zedshaw/mongrel2/tarball/$(MONGREL2_VERSION)
+MONGREL2_SITE = $(call github,zedshaw,mongrel2,$(MONGREL2_VERSION))
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
 MONGREL2_DEPENDENCIES = sqlite zeromq
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index ff56ee7..3116f39 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MTDEV2TUIO_VERSION = e1e7378d86abe751158e743586133022f32fa4d1
-MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/$(MTDEV2TUIO_VERSION)
+MTDEV2TUIO_SITE = $(call github,olivopaolo,mtdev2tuio,$(MTDEV2TUIO_VERSION))
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 7e085e4..c07ae5f 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEARDAL_VERSION = 0.8
-NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
+NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
 NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = GPLv2
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 8e03718..10c7a07 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OMAP_U_BOOT_UTILS_VERSION = 8aff852322c6f52bd09568bef7725ab509d81725
-OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/$(OMAP_U_BOOT_UTILS_VERSION)
+OMAP_U_BOOT_UTILS_SITE = $(call github,nmenon,omap-u-boot-utils,$(OMAP_U_BOOT_UTILS_VERSION))
 OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
index d332885..f779eda 100644
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
-ON2_8170_MODULES_SITE    = http://github.com/alexandrebelloni/on2-8170-modules/tarball/$(ON2_8170_MODULES_VERSION)
+ON2_8170_MODULES_SITE    = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
 
 ON2_8170_MODULES_DEPENDENCIES = linux
 
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index baac094..c03f91f 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_IPY_VERSION = IPy-0.75
-PYTHON_IPY_SITE    = https://github.com/haypo/python-ipy/tarball/$(PYTHON_IPY_VERSION)
+PYTHON_IPY_SITE    = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
 PYTHON_IPY_DEPENDENCIES = host-python python
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index 29b8c31..dcd53bc 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -6,7 +6,7 @@
 
 QJSON_VERSION = 0.8.1
 
-QJSON_SITE = http://github.com/flavio/qjson/tarball/$(QJSON_VERSION)
+QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
 QJSON_DEPENDENCIES =  qt
 QJSON_LICENSE = LGPLv2.1
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 25eab69..838952b 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPI_FIRMWARE_VERSION = f7e9bcd25c9b01521fdf88aac2740b6cfc887dfb
-RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
+RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index b17a5f4..8911ae0 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPI_USERLAND_VERSION = d2c9f912da389c23ed27e81e940be3540f64fc59
-RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
+RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 1a19c92..1a2c9fc 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SOCKETCAND_VERSION = dc3437abf17359fa8cb16567415b47e7ef8568d0
-SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/$(SOCKETCAND_VERSION)
+SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 53b1ec8..6130870 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQLCIPHER_VERSION = v1.1.9
-SQLCIPHER_SITE = http://github.com/sqlcipher/sqlcipher/archive/$(SQLCIPHER_VERSION)
+SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index ef5b34d..932b625 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_BOARDS_VERSION = 25a868189dbaa40872b2ac7d8a941dd73972eb08
-SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/$(SUNXI_BOARDS_VERSION)
+SUNXI_BOARDS_SITE = $(call github,linux-sunxi,sunxi-boards,$(SUNXI_BOARDS_VERSION))
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
 SUNXI_BOARDS_INSTALL_TARGET = NO
diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index 5e1c820..54d081e 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_CEDARX_VERSION = 74923e55fc3ef512d4cd2462da58ae5331611f37
-SUNXI_CEDARX_SITE = http://github.com/linux-sunxi/cedarx-libs/tarball/$(SUNXI_CEDARX_VERSION)
+SUNXI_CEDARX_SITE = $(call github,linux-sunxi,cedarx-libs,$(SUNXI_CEDARX_VERSION))
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
 
diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
index f04b0b0..0cb2d93 100644
--- a/package/sunxi-mali-prop/sunxi-mali-prop.mk
+++ b/package/sunxi-mali-prop/sunxi-mali-prop.mk
@@ -5,6 +5,6 @@
 ################################################################################
 
 SUNXI_MALI_PROP_VERSION = e4ced471d576708ac9aa093e41a0f91cf429862b
-SUNXI_MALI_PROP_SITE = http://github.com/linux-sunxi/sunxi-mali-proprietary/tarball/$(SUNXI_MALI_PROP_VERSION)
+SUNXI_MALI_PROP_SITE = $(call github,linux-sunxi,sunxi-mali-proprietary,$(SUNXI_MALI_PROP_VERSION))
 
 $(eval $(generic-package))
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index dec211f..d9fd8be 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_MALI_VERSION = c2491fe952354ba44538064e534ed7c731cedb1e
-SUNXI_MALI_SITE = http://github.com/linux-sunxi/sunxi-mali/tarball/$(SUNXI_MALI_VERSION)
+SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
 
 SUNXI_MALI_INSTALL_STAGING = YES
 SUNXI_MALI_DEPENDENCIES = sunxi-mali-prop
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index d47574c..a6c38d9 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
-SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/$(SUNXI_TOOLS_VERSION)
+SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index 732616f..8bb01d5 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TINYMEMBENCH_VERSION = v0.2
-TINYMEMBENCH_SITE = http://github.com/ssvb/tinymembench/tarball/$(TINYMEMBENCH_VERSION)
+TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,$(TINYMEMBENCH_VERSION))
 TINYMEMBENCH_LICENSE = MIT
 TINYMEMBENCH_LICENSE_FILES = main.c
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 751d01e..9524965 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TSLIB_VERSION = 1.1
-TSLIB_SITE = http://github.com/kergoth/tslib/tarball/$(TSLIB_VERSION)
+TSLIB_SITE = $(call github,kergoth,tslib,$(TSLIB_VERSION))
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 7b0a228..cf496fe 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XL2TP_VERSION = v1.3.1
-XL2TP_SITE = http://github.com/xelerance/xl2tpd/tarball/$(XL2TP_VERSION)
+XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 
 define XL2TP_BUILD_CMDS
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 6f9c640..ff64123 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 YAJL_VERSION = 2.0.4
-YAJL_SITE = http://github.com/lloyd/yajl/tarball/$(YAJL_VERSION)
+YAJL_SITE = $(call github,lloyd,yajl,$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
