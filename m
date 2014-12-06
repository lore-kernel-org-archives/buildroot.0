From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:57 +0100
Subject: [Buildroot] [PATCH 7/9 v2] packages: switch to using the github
	forge
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <fc6f9c376310ea4c8c585f3426ed5654a3069550.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch generated with:
    sed -r -i -e '/^([^[:space:]]+)_SITE[[:space:]]*=[[:space:]]*\$\(call github,([^,]+),([^,]+),.*$/s//\1_FORGE = github\n\1_FORGE_PATH = \2\/\3/' $( git grep -l -E '_SITE = \$\(call github,' boot package )

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - convert packages added after v1
---
 boot/at91bootstrap3/at91bootstrap3.mk                  | 3 ++-
 package/a10disp/a10disp.mk                             | 3 ++-
 package/am335x-pru-package/am335x-pru-package.mk       | 3 ++-
 package/apitrace/apitrace.mk                           | 3 ++-
 package/avrdude/avrdude.mk                             | 3 ++-
 package/bandwidthd/bandwidthd.mk                       | 3 ++-
 package/bcache-tools/bcache-tools.mk                   | 3 ++-
 package/binutils/binutils.mk                           | 3 ++-
 package/civetweb/civetweb.mk                           | 3 ++-
 package/cppzmq/cppzmq.mk                               | 3 ++-
 package/cpuload/cpuload.mk                             | 3 ++-
 package/czmq/czmq.mk                                   | 3 ++-
 package/e2tools/e2tools.mk                             | 3 ++-
 package/faifa/faifa.mk                                 | 3 ++-
 package/fb-test-app/fb-test-app.mk                     | 3 ++-
 package/filemq/filemq.mk                               | 3 ++-
 package/flann/flann.mk                                 | 3 ++-
 package/freerdp/freerdp.mk                             | 3 ++-
 package/gcc/gcc.mk                                     | 3 ++-
 package/gdb/gdb.mk                                     | 6 ++++--
 package/glm/glm.mk                                     | 3 ++-
 package/inotify-tools/inotify-tools.mk                 | 3 ++-
 package/input-event-daemon/input-event-daemon.mk       | 3 ++-
 package/jack2/jack2.mk                                 | 3 ++-
 package/jquery-keyboard/jquery-keyboard.mk             | 3 ++-
 package/jsmin/jsmin.mk                                 | 3 ++-
 package/json-javascript/json-javascript.mk             | 3 ++-
 package/kexec-lite/kexec-lite.mk                       | 3 ++-
 package/ktap/ktap.mk                                   | 3 ++-
 package/lcdapi/lcdapi.mk                               | 3 ++-
 package/libatomic_ops/libatomic_ops.mk                 | 3 ++-
 package/libcec/libcec.mk                               | 3 ++-
 package/libcofi/libcofi.mk                             | 3 ++-
 package/libconfuse/libconfuse.mk                       | 3 ++-
 package/libenca/libenca.mk                             | 3 ++-
 package/libevent/libevent.mk                           | 3 ++-
 package/libiqrf/libiqrf.mk                             | 3 ++-
 package/liblog4c-localtime/liblog4c-localtime.mk       | 3 ++-
 package/libndp/libndp.mk                               | 3 ++-
 package/libnfs/libnfs.mk                               | 3 ++-
 package/librtlsdr/librtlsdr.mk                         | 3 ++-
 package/libsha1/libsha1.mk                             | 3 ++-
 package/libshairplay/libshairplay.mk                   | 3 ++-
 package/libsoc/libsoc.mk                               | 3 ++-
 package/libstrophe/libstrophe.mk                       | 3 ++-
 package/libtpl/libtpl.mk                               | 3 ++-
 package/libuv/libuv.mk                                 | 3 ++-
 package/linenoise/linenoise.mk                         | 3 ++-
 package/ljsyscall/ljsyscall.mk                         | 3 ++-
 package/lua-ev/lua-ev.mk                               | 3 ++-
 package/lua-msgpack-native/lua-msgpack-native.mk       | 3 ++-
 package/luaexpatutils/luaexpatutils.mk                 | 3 ++-
 package/luaposix/luaposix.mk                           | 3 ++-
 package/lz4/lz4.mk                                     | 3 ++-
 package/mongoose/mongoose.mk                           | 3 ++-
 package/mrouted/mrouted.mk                             | 3 ++-
 package/mtdev2tuio/mtdev2tuio.mk                       | 3 ++-
 package/ne10/ne10.mk                                   | 3 ++-
 package/neardal/neardal.mk                             | 3 ++-
 package/omap-u-boot-utils/omap-u-boot-utils.mk         | 3 ++-
 package/on2-8170-modules/on2-8170-modules.mk           | 3 ++-
 package/opencv/opencv.mk                               | 3 ++-
 package/pifmrds/pifmrds.mk                             | 3 ++-
 package/pps-tools/pps-tools.mk                         | 3 ++-
 package/protobuf-c/protobuf-c.mk                       | 3 ++-
 package/python-configshell-fb/python-configshell-fb.mk | 3 ++-
 package/python-ipy/python-ipy.mk                       | 3 ++-
 package/python-itsdangerous/python-itsdangerous.mk     | 3 ++-
 package/python-libconfig/python-libconfig.mk           | 3 ++-
 package/python-pyusb/python-pyusb.mk                   | 3 ++-
 package/python-rtslib-fb/python-rtslib-fb.mk           | 3 ++-
 package/python-webpy/python-webpy.mk                   | 3 ++-
 package/qdecoder/qdecoder.mk                           | 3 ++-
 package/qjson/qjson.mk                                 | 3 ++-
 package/qlibc/qlibc.mk                                 | 3 ++-
 package/qtuio/qtuio.mk                                 | 3 ++-
 package/rapidjson/rapidjson.mk                         | 3 ++-
 package/rpi-firmware/rpi-firmware.mk                   | 3 ++-
 package/rpi-userland/rpi-userland.mk                   | 3 ++-
 package/sconeserver/sconeserver.mk                     | 3 ++-
 package/shairport-sync/shairport-sync.mk               | 3 ++-
 package/smack/smack.mk                                 | 3 ++-
 package/snappy/snappy.mk                               | 3 ++-
 package/snowball-hdmiservice/snowball-hdmiservice.mk   | 3 ++-
 package/socketcand/socketcand.mk                       | 3 ++-
 package/sqlcipher/sqlcipher.mk                         | 3 ++-
 package/sunxi-boards/sunxi-boards.mk                   | 3 ++-
 package/sunxi-cedarx/sunxi-cedarx.mk                   | 3 ++-
 package/sunxi-mali-prop/sunxi-mali-prop.mk             | 3 ++-
 package/sunxi-mali/sunxi-mali.mk                       | 3 ++-
 package/sunxi-tools/sunxi-tools.mk                     | 3 ++-
 package/targetcli-fb/targetcli-fb.mk                   | 3 ++-
 package/ti-utils/ti-utils.mk                           | 3 ++-
 package/tinyalsa/tinyalsa.mk                           | 3 ++-
 package/tinymembench/tinymembench.mk                   | 3 ++-
 package/trinity/trinity.mk                             | 3 ++-
 package/tslib/tslib.mk                                 | 3 ++-
 package/tvheadend/tvheadend.mk                         | 3 ++-
 package/tzdump/tzdump.mk                               | 3 ++-
 package/uclibc/uclibc.mk                               | 3 ++-
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk             | 3 ++-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk             | 3 ++-
 package/xinetd/xinetd.mk                               | 3 ++-
 package/xl2tp/xl2tp.mk                                 | 3 ++-
 package/yajl/yajl.mk                                   | 3 ++-
 package/ympd/ympd.mk                                   | 3 ++-
 package/zlog/zlog.mk                                   | 3 ++-
 package/zmqpp/zmqpp.mk                                 | 3 ++-
 package/znc/znc.mk                                     | 3 ++-
 package/zyre/zyre.mk                                   | 3 ++-
 110 files changed, 222 insertions(+), 111 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index bc8d912..fda67f6 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AT91BOOTSTRAP3_VERSION = v3.6.2
-AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
+AT91BOOTSTRAP3_FORGE = github
+AT91BOOTSTRAP3_FORGE_PATH = linux4sam/at91bootstrap
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index 066e988..e499882 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 A10DISP_VERSION = a899cc6dcf909360aac00482ede5369f3656f226
-A10DISP_SITE = $(call github,hglm,a10disp,$(A10DISP_VERSION))
+A10DISP_FORGE = github
+A10DISP_FORGE_PATH = hglm/a10disp
 A10DISP_LICENSE = MIT
 
 A10DISP_DEPENDENCIES = linux
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index 1e4fc0d..805ad2d 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AM335X_PRU_PACKAGE_VERSION = 506e074859891a2b350eb4f5fcb451c4961410ea
-AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
+AM335X_PRU_PACKAGE_FORGE = github
+AM335X_PRU_PACKAGE_FORGE_PATH = beagleboard/am335x_pru_package
 AM335X_PRU_PACKAGE_LICENSE = BSD-3c
 AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
 AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index b164367..565f053 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 APITRACE_VERSION = c181b7fbf4b1c3912424761fec8ac7124640543a
-APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
+APITRACE_FORGE = github
+APITRACE_FORGE_PATH = apitrace/apitrace
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
 
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 03d6490..b40132f 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
-AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
+AVRDUDE_FORGE = github
+AVRDUDE_FORGE_PATH = kcuzner/avrdude
 AVRDUDE_LICENSE = GPLv2+
 AVRDUDR_LICENSE_FILES = avrdude/COPYING
 AVRDUDE_SUBDIR = avrdude
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index ca991f9..d5ee492 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 BANDWIDTHD_VERSION = v2.0.1-auto-r11
-BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
+BANDWIDTHD_FORGE = github
+BANDWIDTHD_FORGE_PATH = nroach44/bandwidthd
 
 # Specified as "any version of the GPL that is current as of your
 # download" by upstream.
diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
index 666a02f..cb5f68d 100644
--- a/package/bcache-tools/bcache-tools.mk
+++ b/package/bcache-tools/bcache-tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 BCACHE_TOOLS_VERSION = v1.0.7
-BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
+BCACHE_TOOLS_FORGE = github
+BCACHE_TOOLS_FORGE_PATH = g2p/bcache-tools
 BCACHE_TOOLS_LICENSE = GPLv2
 BCACHE_TOOLS_LICENSE_FILES = COPYING
 BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b8dab5d..565780a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -20,7 +20,8 @@ ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 ifeq ($(BR2_arc),y)
-BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
+BINUTILS_FORGE = github
+BINUTILS_FORGE_PATH = foss-for-synopsys-dwc-arc-processors/binutils-gdb
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 2940a7a..f261387 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CIVETWEB_VERSION = v1.5
-CIVETWEB_SITE = $(call github,sunsetbrew,civetweb,$(CIVETWEB_VERSION))
+CIVETWEB_FORGE = github
+CIVETWEB_FORGE_PATH = sunsetbrew/civetweb
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 5446de8..9c197ed 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CPPZMQ_VERSION = 1f05e0d111197c64be32ad5aecd59f4d1b05a819
-CPPZMQ_SITE = $(call github,zeromq,cppzmq,$(CPPZMQ_VERSION))
+CPPZMQ_FORGE = github
+CPPZMQ_FORGE_PATH = zeromq/cppzmq
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = zeromq
 CPPZMQ_LICENSE = MIT
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index 30c3db6..e9a7593 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CPULOAD_VERSION = v0.3
-CPULOAD_SITE = $(call github,kelvincheung,cpuload,$(CPULOAD_VERSION))
+CPULOAD_FORGE = github
+CPULOAD_FORGE_PATH = kelvincheung/cpuload
 CPULOAD_LICENSE = GPLv2
 CPULOAD_LICENSE_FILES = COPYING
 
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 25f67d5..7769f75 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CZMQ_VERSION = v3.0.0
-CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
+CZMQ_FORGE = github
+CZMQ_FORGE_PATH = zeromq/czmq
 
 # Autoreconf required as we use the git tree
 CZMQ_AUTORECONF = YES
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 789519f..0242d64 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 E2TOOLS_VERSION = 3158ef18a903ca4a98b8fa220c9fc5c133d8bdf6
-E2TOOLS_SITE = $(call github,ndim,e2tools,$(E2TOOLS_VERSION))
+E2TOOLS_FORGE = github
+E2TOOLS_FORGE_PATH = ndim/e2tools
 
 # Source coming from GitHub, no configure included.
 E2TOOLS_AUTORECONF = YES
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index a56a8c0..758b166 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FAIFA_VERSION = v0.1
-FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
+FAIFA_FORGE = github
+FAIFA_FORGE_PATH = ffainelli/faifa
 FAIFA_INSTALL_STAGING = YES
 FAIFA_DEPENDENCIES = libpcap host-autoconf
 FAIFA_LICENSE = BSD-3c
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 9cd0aec..2a05a23 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FB_TEST_APP_VERSION = rosetta-1.1.0
-FB_TEST_APP_SITE = $(call github,prpplague,fb-test-app,$(FB_TEST_APP_VERSION))
+FB_TEST_APP_FORGE = github
+FB_TEST_APP_FORGE_PATH = prpplague/fb-test-app
 FB_TEST_APP_LICENSE = GPLv2
 FB_TEST_APP_LICENSE_FILES = COPYING
 
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index d3dc6da..223360d 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FILEMQ_VERSION = 482797b8aa30fcc9ea1377aabdf2b0769f9f698e
-FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
+FILEMQ_FORGE = github
+FILEMQ_FORGE_PATH = zeromq/filemq
 
 FILEMQ_AUTORECONF = YES
 FILEMQ_CONF_ENV = fmq_have_asciidoc=no
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 8af58e3..b9d927d 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FLANN_VERSION = 04b4a56533faf8c8228d011d05ba376038364b49
-FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
+FLANN_FORGE = github
+FLANN_FORGE_PATH = mariusmuja/flann
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3c
 FLANN_LICENSE_FILES = COPYING
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index cb745ec..5f601c5 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -6,7 +6,8 @@
 
 # Changeset on the stable-1.1 branch
 FREERDP_VERSION = 440916eae2e07463912d5fe507677e67096eb083
-FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
+FREERDP_FORGE = github
+FREERDP_FORGE_PATH = FreeRDP/FreeRDP
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
 FREERDP_LICENSE = Apache-2.0
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cdd71aa..b1a62e0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -13,7 +13,8 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot
 else ifeq ($(BR2_arc),y)
-GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
+GCC_FORGE = github
+GCC_FORGE_PATH = foss-for-synopsys-dwc-arc-processors/gcc
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index dbec760..75db9f5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,13 +8,15 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 
 ifeq ($(BR2_arc),y)
-GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
+GDB_FORGE = github
+GDB_FORGE_PATH = foss-for-synopsys-dwc-arc-processors/binutils-gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
 ifeq ($(BR2_microblaze),y)
-GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
+GDB_FORGE = github
+GDB_FORGE_PATH = Xilinx/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ff9423d..d04502a 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GLM_VERSION = 0.9.5.4
-GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
+GLM_FORGE = github
+GLM_FORGE_PATH = g-truc/glm
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = copying.txt
 
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 3502525..d581e05 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 INOTIFY_TOOLS_VERSION = 06007d350faa8731c67e186923ab417486104719
-INOTIFY_TOOLS_SITE = $(call github,rvoicilas,inotify-tools,$(INOTIFY_TOOLS_VERSION))
+INOTIFY_TOOLS_FORGE = github
+INOTIFY_TOOLS_FORGE_PATH = rvoicilas/inotify-tools
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 67b8cc4..6a16d5b 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
-INPUT_EVENT_DAEMON_SITE = $(call github,gandro,input-event-daemon,$(INPUT_EVENT_DAEMON_VERSION))
+INPUT_EVENT_DAEMON_FORGE = github
+INPUT_EVENT_DAEMON_FORGE_PATH = gandro/input-event-daemon
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 3f52ff4..3de23fe 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 JACK2_VERSION = ab409a65df95bc261ff72b52d6b3f4a65cf3266a
-JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
+JACK2_FORGE = github
+JACK2_FORGE_PATH = jackaudio/jack2
 JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index a1320dc..c3f7932 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 JQUERY_KEYBOARD_VERSION = v1.18.12
-JQUERY_KEYBOARD_SITE = $(call github,Mottie,Keyboard,$(JQUERY_KEYBOARD_VERSION))
+JQUERY_KEYBOARD_FORGE = github
+JQUERY_KEYBOARD_FORGE_PATH = Mottie/Keyboard
 JQUERY_KEYBOARD_LICENSE = MIT WTFPL
 JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
 
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index a66ba71..90c312a 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 JSMIN_VERSION = 1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b
-JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
+JSMIN_FORGE = github
+JSMIN_FORGE_PATH = douglascrockford/JSMin
 JSMIN_LICENSE = MIT
 JSMIN_LICENSE_FILES = jsmin.c
 
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
index c15b531..b4c4497 100644
--- a/package/json-javascript/json-javascript.mk
+++ b/package/json-javascript/json-javascript.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 JSON_JAVASCRIPT_VERSION = 3d7767b6b1f3da363c625ff54e63bbf20e9e83ac
-JSON_JAVASCRIPT_SITE = $(call github,douglascrockford,JSON-js,$(JSON_JAVASCRIPT_VERSION))
+JSON_JAVASCRIPT_FORGE = github
+JSON_JAVASCRIPT_FORGE_PATH = douglascrockford/JSON-js
 JSON_JAVASCRIPT_LICENSE = Public Domain
 JSON_JAVASCRIPT_LICENSE_FILES = json2.js
 
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 7e3c8d3..575fe4f 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
-KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
+KEXEC_LITE_FORGE = github
+KEXEC_LITE_FORGE_PATH = antonblanchard/kexec-lite
 KEXEC_LITE_LICENSE = GPLv2+
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
 
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 50ad222..08a19a4 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 KTAP_VERSION = 5b16b61deb6c8a99d71e5167706a5f5566135828
-KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
+KTAP_FORGE = github
+KTAP_FORGE_PATH = ktap/ktap
 KTAP_LICENSE = GPLv2
 KTAP_LICENSE_FILES = LICENSE-GPL
 
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index bcf5c47..56b187a 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LCDAPI_VERSION = dbbdca06f271b8cf81b4817a9da3d558cfe59905
-LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
+LCDAPI_FORGE = github
+LCDAPI_FORGE_PATH = spdawson/lcdapi
 LCDAPI_LICENSE = LGPLv2.1+
 LCDAPI_LICENSE_FILES = COPYING
 LCDAPI_AUTORECONF = YES
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 6a26775..f82d520 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_0
-LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
+LIBATOMIC_OPS_FORGE = github
+LIBATOMIC_OPS_FORGE_PATH = ivmai/libatomic_ops
 LIBATOMIC_OPS_AUTORECONF = YES
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 5a889b9..4f6b6c8 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBCEC_VERSION = libcec-2.1.4-repack
-LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
+LIBCEC_FORGE = github
+LIBCEC_FORGE_PATH = Pulse-Eight/libcec
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index 90daff2..917bd73 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
-LIBCOFI_SITE = $(call github,simonjhall,copies-and-fills,$(LIBCOFI_VERSION))
+LIBCOFI_FORGE = github
+LIBCOFI_FORGE_PATH = simonjhall/copies-and-fills
 LIBCOFI_LICENSE = LGPLv2.1
 LIBCOFI_LICENSE_FILES = README.md
 
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index b3dcceb..783b572 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBCONFUSE_VERSION = 9413a82f9cb56a94f71fa420f146e841c5372ed8
-LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
+LIBCONFUSE_FORGE = github
+LIBCONFUSE_FORGE_PATH = martinh/libconfuse
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_DEPENDENCIES = host-flex
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 7ab95f5..c1c675a 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBENCA_VERSION = 1.16
-LIBENCA_SITE = $(call github,nijel,enca,$(LIBENCA_VERSION))
+LIBENCA_FORGE = github
+LIBENCA_FORGE_PATH = nijel/enca
 LIBENCA_INSTALL_STAGING = YES
 LIBENCA_LICENSE = GPLv2
 LIBENCA_LICENSE_FILES = COPYING
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 607b7b2..8c4c4c1 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBEVENT_VERSION = release-2.0.21-stable
-LIBEVENT_SITE = $(call github,libevent,libevent,$(LIBEVENT_VERSION))
+LIBEVENT_FORGE = github
+LIBEVENT_FORGE_PATH = libevent/libevent
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3c, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 0531602..00c0c55 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBIQRF_VERSION = v0.1.2
-LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
+LIBIQRF_FORGE = github
+LIBIQRF_FORGE_PATH = nandra/libiqrf
 LIBIQRF_INSTALL_STAGING = YES
 LIBIQRF_DEPENDENCIES = libusb
 LIBIQRF_LICENSE = LGPLv2.1+
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index bc6d1ab..90211d1 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBLOG4C_LOCALTIME_VERSION = v1.0
-LIBLOG4C_LOCALTIME_SITE = $(call github,rcmadruga,log4c-localtime,$(LIBLOG4C_LOCALTIME_VERSION))
+LIBLOG4C_LOCALTIME_FORGE = github
+LIBLOG4C_LOCALTIME_FORGE_PATH = rcmadruga/log4c-localtime
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 LIBLOG4C_LOCALTIME_CONF_OPTS = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index c40a017..1ed4d90 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBNDP_VERSION = v1.4
-LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
+LIBNDP_FORGE = github
+LIBNDP_FORGE_PATH = jpirko/libndp
 LIBNDP_LICENSE = LGPLv2.1+
 LIBNDP_LICENSE_FILES = COPYING
 LIBNDP_AUTORECONF = YES
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 0c8c4f5..93e4afa 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBNFS_VERSION = libnfs-1.9.5
-LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
+LIBNFS_FORGE = github
+LIBNFS_FORGE_PATH = sahlberg/libnfs
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
 LIBNFS_MAKE = $(MAKE1)
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 2c5cf1f..0da5dc3 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBRTLSDR_VERSION = v0.5.3
-LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
+LIBRTLSDR_FORGE = github
+LIBRTLSDR_FORGE_PATH = steve-m/librtlsdr
 LIBRTLSDR_LICENSE = GPLv2+
 LIBRTLSDR_LICENSE_FILES = COPYING
 LIBRTLSDR_INSTALL_STAGING = YES
diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index 647f986..8cc9746 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBSHA1_VERSION = 0.3
-LIBSHA1_SITE = $(call github,dottedmag,libsha1,$(LIBSHA1_VERSION))
+LIBSHA1_FORGE = github
+LIBSHA1_FORGE_PATH = dottedmag/libsha1
 LIBSHA1_LICENSE = BSD-3c or GPL
 LIBSHA1_LICENSE_FILES = COPYING
 
diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index 35bbeac..b874820 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBSHAIRPLAY_VERSION = 64d59e3087f829006d091fa0d114efb50972a2bf
-LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
+LIBSHAIRPLAY_FORGE = github
+LIBSHAIRPLAY_FORGE_PATH = juhovh/shairplay
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
 LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPLv2.1+
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 3253c50..f4122fc 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBSOC_VERSION = 0.6.3
-LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
+LIBSOC_FORGE = github
+LIBSOC_FORGE_PATH = jackmitch/libsoc
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
 LIBSOC_AUTORECONF = YES
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index d7202d7..7c5bcdb 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBSTROPHE_VERSION = 0.8.6
-LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
+LIBSTROPHE_FORGE = github
+LIBSTROPHE_FORGE_PATH = strophe/libstrophe
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 LIBSTROPHE_AUTORECONF = YES
 LIBSTROPHE_LICENSE = MIT or GPLv3
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index ed3bfb5..a4fe310 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBTPL_VERSION = v1.6.1
-LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
+LIBTPL_FORGE = github
+LIBTPL_FORGE_PATH = troydhanson/tpl
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 08bf8c5..ff1f464 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBUV_VERSION = v0.11.29
-LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
+LIBUV_FORGE = github
+LIBUV_FORGE_PATH = joyent/libuv
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 7321564..bef6ccd 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LINENOISE_VERSION = cf1bdf5f89e10b504a0bec3efc8a8587eadecd2c
-LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
+LINENOISE_FORGE = github
+LINENOISE_FORGE_PATH = antirez/linenoise
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_LICENSE_FILES = LICENSE
 LINENOISE_INSTALL_STAGING = YES
diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index a17da3f..35d8cc4 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LJSYSCALL_VERSION = v0.10
-LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
+LJSYSCALL_FORGE = github
+LJSYSCALL_FORGE_PATH = justincormack/ljsyscall
 LJSYSCALL_LICENSE = MIT
 LJSYSCALL_LICENSE_FILES = COPYRIGHT
 
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 745d6ed..27d6d4a 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LUA_EV_VERSION = 458165bdfe0c6eadc788813925f11a0e6a823845
-LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
+LUA_EV_FORGE = github
+LUA_EV_FORGE_PATH = brimworks/lua-ev
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index acd3a0e..d101e98 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LUA_MSGPACK_NATIVE_VERSION = 41a91b994c70389dc9daa1a15678741d8ec41749
-LUA_MSGPACK_NATIVE_SITE = $(call github,kengonakajima,lua-msgpack-native,$(LUA_MSGPACK_NATIVE_VERSION))
+LUA_MSGPACK_NATIVE_FORGE = github
+LUA_MSGPACK_NATIVE_FORGE_PATH = kengonakajima/lua-msgpack-native
 LUA_MSGPACK_NATIVE_DEPENDENCIES = luainterpreter
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
index 9bfc654..fcf4879 100644
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LUAEXPATUTILS_VERSION = 88c228365b084224c911d34aff06002634b38b50
-LUAEXPATUTILS_SITE = $(call github,stevedonovan,LuaExpatUtils,$(LUAEXPATUTILS_VERSION))
+LUAEXPATUTILS_FORGE = github
+LUAEXPATUTILS_FORGE_PATH = stevedonovan/LuaExpatUtils
 LUAEXPATUTILS_LICENSE = Public Domain
 LUAEXPATUTILS_DEPENDENCIES = luaexpat
 
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index a723a50..103a3b6 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LUAPOSIX_VERSION = 32
-LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
+LUAPOSIX_FORGE = github
+LUAPOSIX_FORGE_PATH = luaposix/luaposix
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 761ce4d..7a5e4cc 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LZ4_VERSION = r123
-LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
+LZ4_FORGE = github
+LZ4_FORGE_PATH = Cyan4973/lz4
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c
 LZ4_LICENSE_FILES = LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 7a5d356..ccb6272 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MONGOOSE_VERSION = 5.5
-MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
+MONGOOSE_FORGE = github
+MONGOOSE_FORGE_PATH = cesanta/mongoose
 MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 78fe98a..2999f83 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MROUTED_VERSION = 3.9.6
-MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
+MROUTED_FORGE = github
+MROUTED_FORGE_PATH = troglobit/mrouted
 MROUTED_DEPENDENCIES = host-bison
 
 define MROUTED_BUILD_CMDS
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 7b00221..ccc8891 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MTDEV2TUIO_VERSION = e1e7378d86abe751158e743586133022f32fa4d1
-MTDEV2TUIO_SITE = $(call github,olivopaolo,mtdev2tuio,$(MTDEV2TUIO_VERSION))
+MTDEV2TUIO_FORGE = github
+MTDEV2TUIO_FORGE_PATH = olivopaolo/mtdev2tuio
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index cb635e4..5585c99 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 NE10_VERSION = v1.0.0
-NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
+NE10_FORGE = github
+NE10_FORGE_PATH = projectNe10/Ne10
 NE10_LICENSE = BSD-3c or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 0720fe8..b970cce 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 NEARDAL_VERSION = da8e06d3884d214bb19b894d2b8fdc9c7ca8575f
-NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
+NEARDAL_FORGE = github
+NEARDAL_FORGE_PATH = connectivity/neardal
 NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = GPLv2
 NEARDAL_LICENSE_FILES = COPYING
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 7cfed65..7d630a1 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 OMAP_U_BOOT_UTILS_VERSION = 3f07426cddc0be9e24702e7aacc7574ddd7fba28
-OMAP_U_BOOT_UTILS_SITE = $(call github,nmenon,omap-u-boot-utils,$(OMAP_U_BOOT_UTILS_VERSION))
+OMAP_U_BOOT_UTILS_FORGE = github
+OMAP_U_BOOT_UTILS_FORGE_PATH = nmenon/omap-u-boot-utils
 OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
index 209bcb5..23a5c8c 100644
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
-ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
+ON2_8170_MODULES_FORGE = github
+ON2_8170_MODULES_FORGE_PATH = alexandrebelloni/on2-8170-modules
 
 ON2_8170_MODULES_DEPENDENCIES = linux
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 61f529e..e20e120 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 OPENCV_VERSION = 2.4.10
-OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
+OPENCV_FORGE = github
+OPENCV_FORGE_PATH = itseez/opencv
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
 OPENCV_LICENSE_FILES = LICENSE
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 5179715..0d76361 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PIFMRDS_VERSION = 0bf57f9ce0d954365a38d8af8e7be6f28521c3f2
-PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
+PIFMRDS_FORGE = github
+PIFMRDS_FORGE_PATH = ChristopheJacquet/PiFmRds
 PIFMRDS_DEPENDENCIES = libsndfile
 PIFMRDS_LICENSE = GPLv3+
 PIFMRDS_LICENSE_FILES = LICENSE
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index 7876403..eb310bd 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
-PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
+PPS_TOOLS_FORGE = github
+PPS_TOOLS_FORGE_PATH = ago/pps-tools
 PPS_TOOLS_INSTALL_STAGING = YES
 PPS_TOOLS_LICENSE = GPLv2+
 PPS_TOOLS_LICENSE_FILES = COPYING
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index d73eb25..d3b6d01 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PROTOBUF_C_VERSION = v1.0.0-rc1
-PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
+PROTOBUF_C_FORGE = github
+PROTOBUF_C_FORGE_PATH = protobuf-c/protobuf-c
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 76ef48d..919430a 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb15
-PYTHON_CONFIGSHELL_FB_SITE = $(call github,agrover,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
+PYTHON_CONFIGSHELL_FB_FORGE = github
+PYTHON_CONFIGSHELL_FB_FORGE_PATH = agrover/configshell-fb
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
 PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 6773aaf..05ea0db 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_IPY_VERSION = IPy-0.82a
-PYTHON_IPY_SITE = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
+PYTHON_IPY_FORGE = github
+PYTHON_IPY_FORGE_PATH = haypo/python-ipy
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index 8b055d6..dec8487 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_ITSDANGEROUS_VERSION = 0.24
-PYTHON_ITSDANGEROUS_SITE = $(call github,mitsuhiko,itsdangerous,$(PYTHON_ITSDANGEROUS_VERSION))
+PYTHON_ITSDANGEROUS_FORGE = github
+PYTHON_ITSDANGEROUS_FORGE_PATH = mitsuhiko/itsdangerous
 PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3c
 PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE
diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
index 3f5984b..6091834 100644
--- a/package/python-libconfig/python-libconfig.mk
+++ b/package/python-libconfig/python-libconfig.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
-PYTHON_LIBCONFIG_SITE = $(call github,cnangel,python-libconfig,$(PYTHON_LIBCONFIG_VERSION))
+PYTHON_LIBCONFIG_FORGE = github
+PYTHON_LIBCONFIG_FORGE_PATH = cnangel/python-libconfig
 
 PYTHON_LIBCONFIG_LICENSE = BSD
 PYTHON_LIBCONFIG_LICENSE_FILES = README
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index ae69026..740da7b 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYUSB_VERSION = 1.0.0b2
-PYTHON_PYUSB_SITE = $(call github,walac,pyusb,$(PYTHON_PYUSB_VERSION))
+PYTHON_PYUSB_FORGE = github
+PYTHON_PYUSB_FORGE_PATH = walac/pyusb
 PYTHON_PYUSB_LICENSE = BSD-3c
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = distutils
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index d45c261..0fb4358 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_RTSLIB_FB_VERSION = v2.1.fb50
-PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
+PYTHON_RTSLIB_FB_FORGE = github
+PYTHON_RTSLIB_FB_FORGE_PATH = agrover/rtslib-fb
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
 PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index ef5b6b3..33e3a77 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_WEBPY_VERSION = 0.37
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_FORGE = github
+PYTHON_WEBPY_FORGE_PATH = webpy/webpy
 PYTHON_WEBPY_SETUP_TYPE = distutils
 PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
 PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index bbbf42a..c4e9ff5 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QDECODER_VERSION = r12.0.5
-QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
+QDECODER_FORGE = github
+QDECODER_FORGE_PATH = wolkykim/qdecoder
 QDECODER_LICENSE = BSD-2
 QDECODER_LICENSE_FILES = COPYING
 # we patch configure.ac
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index 6a16617..555adb5 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QJSON_VERSION = ba273682a9d33a7b3090e74f4742b5f3bf6c9b02
-QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
+QJSON_FORGE = github
+QJSON_FORGE_PATH = flavio/qjson
 QJSON_INSTALL_STAGING = YES
 QJSON_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_QT),qt) \
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 6a747e4..a7f7bc5 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QLIBC_VERSION = v2.1.6
-QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
+QLIBC_FORGE = github
+QLIBC_FORGE_PATH = wolkykim/qlibc
 QLIBC_LICENSE = BSD-2c
 QLIBC_LICENSE_FILES = COPYING
 
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 9925f84..70301b3 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QTUIO_VERSION = abe4973ff60654aad9df7037c4ca15c45f811d24
-QTUIO_SITE = $(call github,x29a,qTUIO,$(QTUIO_VERSION))
+QTUIO_FORGE = github
+QTUIO_FORGE_PATH = x29a/qTUIO
 QTUIO_INSTALL_STAGING = YES
 QTUIO_DEPENDENCIES = qt
 
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 6658da2..8a60201 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RAPIDJSON_VERSION = 39f5eeb764c6d1e1cbff1717410d9710bf943009
-RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
+RAPIDJSON_FORGE = github
+RAPIDJSON_FORGE_PATH = miloyip/rapidjson
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
 RAPIDJSON_INSTALL_TARGET = NO
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 033ff33..2bd0e07 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RPI_FIRMWARE_VERSION = 53162d55fa557e60453c0652aa00fa3daf4ed618
-RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
+RPI_FIRMWARE_FORGE = github
+RPI_FIRMWARE_FORGE_PATH = raspberrypi/firmware
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3f92950..3cba481 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RPI_USERLAND_VERSION = ba753c1a7f68d7a2e00edaf03364eef001e233ef
-RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
+RPI_USERLAND_FORGE = github
+RPI_USERLAND_FORGE_PATH = raspberrypi/userland
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index fd2123d..d5172d7 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -7,7 +7,8 @@
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Git commit.
 SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
-SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
+SCONESERVER_FORGE = github
+SCONESERVER_FORGE_PATH = sconemad/sconeserver
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 39017a0..1ffdf28 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SHAIRPORT_SYNC_VERSION = 2.1.11
-SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
+SHAIRPORT_SYNC_FORGE = github
+SHAIRPORT_SYNC_FORGE_PATH = mikebrady/shairport-sync
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 7e0a362..82e4d05 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SMACK_VERSION = v1.0.4
-SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
+SMACK_FORGE = github
+SMACK_FORGE_PATH = smack-team/smack
 SMACK_LICENSE = LGPLv2.1
 SMACK_LICENSE_FILES = COPYING
 SMACK_INSTALL_STAGING = YES
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index fd89325..c0713ab 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
-SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
+SNAPPY_FORGE = github
+SNAPPY_FORGE_PATH = google/snappy
 SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
 # from git
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index 267b5ad..9e241db 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
-SNOWBALL_HDMISERVICE_SITE = $(call github,igloocommunity,hdmiservice,$(SNOWBALL_HDMISERVICE_VERSION))
+SNOWBALL_HDMISERVICE_FORGE = github
+SNOWBALL_HDMISERVICE_FORGE_PATH = igloocommunity/hdmiservice
 SNOWBALL_HDMISERVICE_LICENSE = MIT
 SNOWBALL_HDMISERVICE_LICENSE_FILES = debian/copyright
 SNOWBALL_HDMISERVICE_INSTALL_STAGING = YES
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 90d7540..a7b8157 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
-SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
+SOCKETCAND_FORGE = github
+SOCKETCAND_FORGE_PATH = dschanoeh/socketcand
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3c or GPLv2
 SOCKETCAND_LICENSE_FILES = socketcand.c
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 9b4446c..b703b97 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SQLCIPHER_VERSION = v3.2.0
-SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
+SQLCIPHER_FORGE = github
+SQLCIPHER_FORGE_PATH = sqlcipher/sqlcipher
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index 1a2bb4c..7157f2a 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SUNXI_BOARDS_VERSION = 68acb3b1610a44b9402560623f7e35b7882585e9
-SUNXI_BOARDS_SITE = $(call github,linux-sunxi,sunxi-boards,$(SUNXI_BOARDS_VERSION))
+SUNXI_BOARDS_FORGE = github
+SUNXI_BOARDS_FORGE_PATH = linux-sunxi/sunxi-boards
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
 SUNXI_BOARDS_INSTALL_TARGET = NO
diff --git a/package/sunxi-cedarx/sunxi-cedarx.mk b/package/sunxi-cedarx/sunxi-cedarx.mk
index 219f1bc..97986dd 100644
--- a/package/sunxi-cedarx/sunxi-cedarx.mk
+++ b/package/sunxi-cedarx/sunxi-cedarx.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SUNXI_CEDARX_VERSION = b8f52d913f73720e50d8f1b2f8610467b575dc45
-SUNXI_CEDARX_SITE = $(call github,linux-sunxi,cedarx-libs,$(SUNXI_CEDARX_VERSION))
+SUNXI_CEDARX_FORGE = github
+SUNXI_CEDARX_FORGE_PATH = linux-sunxi/cedarx-libs
 
 SUNXI_CEDARX_INSTALL_STAGING = YES
 
diff --git a/package/sunxi-mali-prop/sunxi-mali-prop.mk b/package/sunxi-mali-prop/sunxi-mali-prop.mk
index 0cb2d93..5505967 100644
--- a/package/sunxi-mali-prop/sunxi-mali-prop.mk
+++ b/package/sunxi-mali-prop/sunxi-mali-prop.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 SUNXI_MALI_PROP_VERSION = e4ced471d576708ac9aa093e41a0f91cf429862b
-SUNXI_MALI_PROP_SITE = $(call github,linux-sunxi,sunxi-mali-proprietary,$(SUNXI_MALI_PROP_VERSION))
+SUNXI_MALI_PROP_FORGE = github
+SUNXI_MALI_PROP_FORGE_PATH = linux-sunxi/sunxi-mali-proprietary
 
 $(eval $(generic-package))
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index c6900c8..ea9f37c 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SUNXI_MALI_VERSION = c2491fe952354ba44538064e534ed7c731cedb1e
-SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
+SUNXI_MALI_FORGE = github
+SUNXI_MALI_FORGE_PATH = linux-sunxi/sunxi-mali
 
 SUNXI_MALI_INSTALL_STAGING = YES
 SUNXI_MALI_DEPENDENCIES = sunxi-mali-prop
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index f84b286..062ec84 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SUNXI_TOOLS_VERSION = ed6f7969d80b91048b0ed95ccb61cc98f46fead7
-SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
+SUNXI_TOOLS_FORGE = github
+SUNXI_TOOLS_FORGE_PATH = linux-sunxi/sunxi-tools
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index b5f2fbe..8532977 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TARGETCLI_FB_VERSION = v2.1.fb37
-TARGETCLI_FB_SITE = $(call github,agrover,targetcli-fb,$(TARGETCLI_FB_VERSION))
+TARGETCLI_FB_FORGE = github
+TARGETCLI_FB_FORGE_PATH = agrover/targetcli-fb
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_SETUP_TYPE = setuptools
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 7ee7afa..8f74449 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
-TI_UTILS_SITE = $(call github,gxk,ti-utils,$(TI_UTILS_VERSION))
+TI_UTILS_FORGE = github
+TI_UTILS_FORGE_PATH = gxk/ti-utils
 TI_UTILS_DEPENDENCIES = libnl
 TI_UTILS_LICENSE = BSD-3c
 TI_UTILS_LICENSE_FILES = COPYING
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index a3dcc9a..b5ab7e2 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -5,7 +5,8 @@
 #############################################################
 
 TINYALSA_VERSION = f2a7b6d3d81bd337a540d56704b4aaa7bdb046fe
-TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
+TINYALSA_FORGE = github
+TINYALSA_FORGE_PATH = tinyalsa/tinyalsa
 TINYALSA_LICENSE = BSD-3c
 TINYALSA_INSTALL_STAGING = YES
 
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index ab479d6..f10e1ac 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TINYMEMBENCH_VERSION = v0.3
-TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,$(TINYMEMBENCH_VERSION))
+TINYMEMBENCH_FORGE = github
+TINYMEMBENCH_FORGE_PATH = ssvb/tinymembench
 TINYMEMBENCH_LICENSE = MIT
 TINYMEMBENCH_LICENSE_FILES = main.c
 
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 52805e0..c17699a 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TRINITY_VERSION = 5d2dfe9727eb9c8dc44c31e95968e8d85284ffcc
-TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
+TRINITY_FORGE = github
+TRINITY_FORGE_PATH = kernelslacker/trinity
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 51aaf23..fd4770b 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TSLIB_VERSION = 1.1
-TSLIB_SITE = $(call github,kergoth,tslib,$(TSLIB_VERSION))
+TSLIB_FORGE = github
+TSLIB_FORGE_PATH = kergoth/tslib
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index f593b3f..2c48c4d 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TVHEADEND_VERSION = fcd16fa0d835d7fd4f57c350ed8b76350440c68c
-TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
+TVHEADEND_FORGE = github
+TVHEADEND_FORGE_PATH = tvheadend/tvheadend
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
 TVHEADEND_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) openssl
diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
index 3f035a5..bc136b6 100644
--- a/package/tzdump/tzdump.mk
+++ b/package/tzdump/tzdump.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TZDUMP_VERSION = 65a10105564801094b18c3fcacf4dde4c44e4ab8
-TZDUMP_SITE = $(call github,alexandrebelloni,tzdump,$(TZDUMP_VERSION))
+TZDUMP_FORGE = github
+TZDUMP_FORGE_PATH = alexandrebelloni/tzdump
 HOST_TZDUMP_DEPENDENCIES = host-zic
 
 define HOST_TZDUMP_BUILD_CMDS
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 2d95ce1..753853c 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -12,7 +12,8 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
 else ifeq ($(BR2_arc),y)
-UCLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,uClibc,$(UCLIBC_VERSION))
+UCLIBC_FORGE = github
+UCLIBC_FORGE_PATH = foss-for-synopsys-dwc-arc-processors/uClibc
 UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
 else ifeq ($(BR2_UCLIBC_VERSION_XTENSA_GIT),y)
 UCLIBC_SITE = git://git.busybox.net/uClibc
diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
index a4d9624..87d5100 100644
--- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
+++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
@@ -8,7 +8,8 @@
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
 XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
-XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
+XBMC_ADDON_XVDR_FORGE = github
+XBMC_ADDON_XVDR_FORGE_PATH = pipelka/xbmc-addon-xvdr
 XBMC_ADDON_XVDR_LICENSE = GPLv2+
 XBMC_ADDON_XVDR_LICENSE_FILES = COPYING
 
diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
index bfcb7ed..b16124f 100644
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -7,7 +7,8 @@
 # This cset is on the branch 'gotham'
 # When XBMC is updated, then this should be updated to the corresponding branch
 XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
-XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
+XBMC_PVR_ADDONS_FORGE = github
+XBMC_PVR_ADDONS_FORGE_PATH = opdenkamp/xbmc-pvr-addons
 XBMC_PVR_ADDONS_LICENSE = GPLv3+
 XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
 
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 92d0d53..33bad4a 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 XINETD_VERSION = xinetd-2-3-15
-XINETD_SITE = $(call github,xinetd-org,xinetd,$(XINETD_VERSION))
+XINETD_FORGE = github
+XINETD_FORGE_PATH = xinetd-org/xinetd
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index abed7e8..d0f1214 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 XL2TP_VERSION = v1.3.6
-XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
+XL2TP_FORGE = github
+XL2TP_FORGE_PATH = xelerance/xl2tpd
 XL2TP_DEPENDENCIES = libpcap openssl
 XL2TP_LICENSE = GPLv2
 XL2TP_LICENSE_FILES = LICENSE
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index ff64123..5b4d6c1 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 YAJL_VERSION = 2.0.4
-YAJL_SITE = $(call github,lloyd,yajl,$(YAJL_VERSION))
+YAJL_FORGE = github
+YAJL_FORGE_PATH = lloyd/yajl
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index 2898c9d..fb56b52 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
-YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
+YMPD_FORGE = github
+YMPD_FORGE_PATH = notandy/ympd
 YMPD_LICENSE = GPLv2
 YMPD_LICENSE_FILE = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index fb8762c..1a8ce2c 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 ZLOG_VERSION = ca6162be1608839e99c6388c28488c51ccf98e4a
-ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
+ZLOG_FORGE = github
+ZLOG_FORGE_PATH = HardySimpson/zlog
 ZLOG_LICENSE = LGPLv2.1
 ZLOG_LICENSE_FILES = COPYING
 ZLOG_INSTALL_STAGING = YES
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index fbb0260..8bede6c 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 ZMQPP_VERSION = 36413487f05b165dfc82ad307a5a1c36a795e607
-ZMQPP_SITE = $(call github,benjamg,zmqpp,$(ZMQPP_VERSION))
+ZMQPP_FORGE = github
+ZMQPP_FORGE_PATH = benjamg/zmqpp
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
 ZMQPP_LICENSE = LGPLv3+ with exceptions
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 779a7b1..f559731 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 ZNC_VERSION = b396cafdb249544164ed02942a5babba59e519a3
-ZNC_SITE = $(call github,znc,znc,$(ZNC_VERSION))
+ZNC_FORGE = github
+ZNC_FORGE_PATH = znc/znc
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_DEPENDENCIES = host-pkgconf host-autoconf host-automake
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 661dddc..c66c357 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 ZYRE_VERSION = v1.0.0
-ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
+ZYRE_FORGE = github
+ZYRE_FORGE_PATH = zeromq/zyre
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
-- 
1.9.1
