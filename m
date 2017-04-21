From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 21 Apr 2017 11:24:48 -0400
Subject: [Buildroot] [PATCH 3/7] package makefiles: clean up backslash
	spacing.
In-Reply-To: <20170421152452.11236-1-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
Message-ID: <20170421152452.11236-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gave warnings on only using
one space before backslashes on all of these makefiles.
This patch cleans up all warnings related to the one space before
backslashes rule in the make files in the package directory.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/amd-catalyst/amd-catalyst.mk     |  2 +-
 package/bluez5_utils/bluez5_utils.mk     |  6 +--
 package/bluez_utils/bluez_utils.mk       | 24 +++++------
 package/cegui06/cegui06.mk               | 28 ++++++-------
 package/celt051/celt051.mk               | 12 +++---
 package/connman/connman.mk               | 10 ++---
 package/directfb/directfb.mk             |  2 +-
 package/duma/duma.mk                     |  4 +-
 package/efibootmgr/efibootmgr.mk         |  4 +-
 package/giflib/giflib.mk                 |  4 +-
 package/git/git.mk                       |  2 +-
 package/gvfs/gvfs.mk                     |  4 +-
 package/i2c-tools/i2c-tools.mk           |  2 +-
 package/keyutils/keyutils.mk             | 10 ++---
 package/kodi/kodi.mk                     |  2 +-
 package/lesstif/lesstif.mk               |  2 +-
 package/linux-firmware/linux-firmware.mk | 64 ++++++++++++++--------------
 package/mplayer/mplayer.mk               |  6 +--
 package/ngrep/ngrep.mk                   |  2 +-
 package/ola/ola.mk                       |  2 +-
 package/poco/poco.mk                     | 40 +++++++++---------
 package/python-pyqt/python-pyqt.mk       |  2 +-
 package/python-sip/python-sip.mk         |  2 +-
 package/python/python.mk                 | 56 ++++++++++++-------------
 package/python3/python3.mk               | 44 +++++++++----------
 package/qemu/qemu.mk                     | 72 ++++++++++++++++----------------
 package/rt-tests/rt-tests.mk             | 12 +++---
 package/rtai/rtai.mk                     | 10 ++---
 package/sdl2/sdl2.mk                     |  2 +-
 package/skeleton/skeleton.mk             | 16 +++----
 package/spice/spice.mk                   | 24 +++++------
 package/squashfs/squashfs.mk             | 16 +++----
 package/systemd/systemd.mk               |  2 +-
 package/tvheadend/tvheadend.mk           | 32 +++++++-------
 package/tz/tz.mk                         | 18 ++++----
 package/tzdata/tzdata.mk                 | 18 ++++----
 package/udisks/udisks.mk                 | 20 ++++-----
 package/usbmount/usbmount.mk             |  4 +-
 package/wpa_supplicant/wpa_supplicant.mk |  8 ++--
 39 files changed, 295 insertions(+), 295 deletions(-)

diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index d4f5d1c..b9396e1 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -23,7 +23,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_AMD_CATALYST_MODULE),y)
 AMD_CATALYST_MODULE_SUBDIRS = common/lib/modules/fglrx/build_mod/2.6.x
-AMD_CATALYST_MODULE_MAKE_OPTS =  \
+AMD_CATALYST_MODULE_MAKE_OPTS = \
 	CFLAGS_MODULE="-DCOMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space"
 
 define AMD_CATALYST_PREPARE_MODULE
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index d19afc3..aaefcb6 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -12,9 +12,9 @@ BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
-BLUEZ5_UTILS_CONF_OPTS =	\
-	--enable-tools		\
-	--enable-library	\
+BLUEZ5_UTILS_CONF_OPTS = \
+	--enable-tools \
+	--enable-library \
 	--disable-cups
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 8425921..b396886 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -16,24 +16,24 @@ BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # BlueZ 3.x compatibility
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
-BLUEZ_UTILS_CONF_OPTS +=	\
-	--enable-hidd	\
-	--enable-pand	\
-	--enable-sdp	\
+BLUEZ_UTILS_CONF_OPTS += \
+	--enable-hidd \
+	--enable-pand \
+	--enable-sdp \
 	--enable-dund
 endif
 
 # audio support
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_AUDIO),y)
-BLUEZ_UTILS_DEPENDENCIES +=	\
-	alsa-lib		\
+BLUEZ_UTILS_DEPENDENCIES += \
+	alsa-lib \
 	libsndfile
-BLUEZ_UTILS_CONF_OPTS +=	\
-	--enable-alsa	\
+BLUEZ_UTILS_CONF_OPTS += \
+	--enable-alsa \
 	--enable-audio
 else
-BLUEZ_UTILS_CONF_OPTS +=	\
-	--disable-alsa	\
+BLUEZ_UTILS_CONF_OPTS += \
+	--disable-alsa \
 	--disable-audio
 endif
 
@@ -47,10 +47,10 @@ endif
 # USB support
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
 BLUEZ_UTILS_DEPENDENCIES += libusb
-BLUEZ_UTILS_CONF_OPTS +=	\
+BLUEZ_UTILS_CONF_OPTS += \
 	--enable-usb
 else
-BLUEZ_UTILS_CONF_OPTS +=	\
+BLUEZ_UTILS_CONF_OPTS += \
 	--disable-usb
 endif
 
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
index 8b2c886..d3da3eb 100644
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -13,24 +13,24 @@ CEGUI06_LICENSE = MIT
 CEGUI06_LICENSE_FILES = COPYING
 CEGUI06_INSTALL_STAGING = YES
 
-CEGUI06_DEPENDENCIES =              \
-	expat                       \
-	freetype                    \
+CEGUI06_DEPENDENCIES = \
+	expat \
+	freetype \
 	pcre
 
-CEGUI06_CONF_OPTS =                 \
-	--enable-expat              \
-	--disable-external-tinyxml  \
-	--disable-xerces-c          \
-	--disable-libxml            \
-	--disable-tinyxml           \
-	--disable-opengl-renderer   \
-	--disable-external-glew     \
+CEGUI06_CONF_OPTS = \
+	--enable-expat \
+	--disable-external-tinyxml \
+	--disable-xerces-c \
+	--disable-libxml \
+	--disable-tinyxml \
+	--disable-opengl-renderer \
+	--disable-external-glew \
 	--disable-irrlicht-renderer \
 	--disable-directfb-renderer \
-	--disable-samples           \
-	--disable-lua-module        \
-	--disable-toluacegui        \
+	--disable-samples \
+	--disable-lua-module \
+	--disable-toluacegui \
 	--disable-external-toluapp
 
 $(eval $(autotools-package))
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
index a5b6f47..01da5c9 100644
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -18,13 +18,13 @@ CELT051_DEPENDENCIES = libogg
 # if target is the same kind as host (ie. same arch, same bitness,
 # same endianness, so that /usr/lib contains libraries linkable by
 # our cross-compiler)
-CELT051_CONF_OPTS =                       \
-	--enable-fixed-point              \
-	--disable-fixed-point-debug       \
+CELT051_CONF_OPTS = \
+	--enable-fixed-point \
+	--disable-fixed-point-debug \
 	--disable-experimental-postfilter \
-	--disable-static-modes            \
-	--disable-assertions              \
-	--disable-oggtest                 \
+	--disable-static-modes \
+	--disable-assertions \
+	--disable-oggtest \
 	--with-ogg=$(STAGING_DIR)/usr
 
 $(eval $(autotools-package))
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 5c9a05f..0a56568 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -13,12 +13,12 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
 	--with-dbusconfdir=/etc \
-	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
-	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
-	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
+	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
+	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
+	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
 	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
-	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
-	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
+	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
+	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono) \
 	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index a27d6a7..0e3bd1f 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -70,7 +70,7 @@ DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_CYBER5K),cyber5k) \
 	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
-	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)	\
+	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830) \
 	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 6299691..0e8a623 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -18,9 +18,9 @@ DUMA_OPTIONS = \
 # The dependency of some source files in duma_config.h, which is generated at
 # build time, is not specified in the Makefile. Force non-parallel build.
 define DUMA_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		OS=linux \
-		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
+		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
 		$(DUMA_CPP) -C $(@D)
 endef
 
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index b9b520a..094dd28 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -18,12 +18,12 @@ endef
 EFIBOOTMGR_POST_PATCH_HOOKS += EFIBOOTMSR_PATCH_HEADER_PATH
 
 define EFIBOOTMGR_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)			\
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D)
 endef
 
 define EFIBOOTMGR_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)	\
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install
 endef
 
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 799ae73..c1471de 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -13,8 +13,8 @@ GIFLIB_LICENSE_FILES = COPYING
 
 GIFLIB_BINS = \
 	gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifbuild gifburst gifclip \
-	gifclrmp gifcolor gifcomb gifcompose gifecho giffiltr giffix gifflip  \
-	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
+	gifclrmp gifcolor gifcomb gifcompose gifecho giffiltr giffix gifflip \
+	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat \
 	gifrsize gifspnge giftext giftool gifwedge icon2gif raw2gif rgb2gif \
 	text2gif
 
diff --git a/package/git/git.mk b/package/git/git.mk
index d0e9f3b..c2e4b8d 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -33,7 +33,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 GIT_DEPENDENCIES += libcurl
 GIT_CONF_OPTS += --with-curl
-GIT_CONF_ENV +=	\
+GIT_CONF_ENV += \
 	ac_cv_prog_curl_config=$(STAGING_DIR)/usr/bin/$(LIBCURL_CONFIG_SCRIPTS)
 else
 GIT_CONF_OPTS += --without-curl
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index d6211fd..ce182a7 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -132,8 +132,8 @@ define GVFS_COMPILE_SCHEMAS
 endef
 
 GVFS_POST_INSTALL_TARGET_HOOKS += \
-	GVFS_REMOVE_USELESS_BINARY	\
-	GVFS_REMOVE_TARGET_SCHEMAS	\
+	GVFS_REMOVE_USELESS_BINARY \
+	GVFS_REMOVE_TARGET_SCHEMAS \
 	GVFS_COMPILE_SCHEMAS
 
 $(eval $(autotools-package))
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 1995ca2..fccce9a 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -30,7 +30,7 @@ I2C_TOOLS_PYTHON_BASE_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -I../include"
 
 define I2C_TOOLS_BUILD_PYSMBUS
-	(cd $(@D)/py-smbus;  \
+	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
 		$(HOST_DIR)/usr/bin/python setup.py build \
 		$(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 81006ac..0e725d1 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -11,11 +11,11 @@ KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
-KEYUTILS_MAKE_PARAMS =                    \
-	INSTALL=$(INSTALL)                \
-	LIBDIR=/usr/lib                   \
-	USRLIBDIR=/usr/lib                \
-	CFLAGS="$(TARGET_CFLAGS)"         \
+KEYUTILS_MAKE_PARAMS = \
+	INSTALL=$(INSTALL) \
+	LIBDIR=/usr/lib \
+	USRLIBDIR=/usr/lib \
+	CFLAGS="$(TARGET_CFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -I." \
 	LNS="$(HOSTLN) -sf"
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ebce84d..ed0cec8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -69,7 +69,7 @@ KODI_CONF_ENV = \
 	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
-KODI_CONF_OPTS +=  \
+KODI_CONF_OPTS += \
 	--with-ffmpeg=shared \
 	--disable-joystick \
 	--disable-openmax \
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 933dd13..35d2c6d 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -17,7 +17,7 @@ LESSTIF_LICENSE_FILES = COPYING.LIB
 LESSTIF_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
-	--enable-production=yes	\
+	--enable-production=yes \
 	--enable-build-tests=no \
 	--no-recursion
 
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 33bc0cf..2611941 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -53,11 +53,11 @@ endif
 # rtl81xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX),y)
 LINUX_FIRMWARE_FILES += \
-	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin		\
-	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
-	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
-	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin		\
-	rtlwifi/rtl8192cufw_A.bin				\
+	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin \
+	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin \
+	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin \
+	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin \
+	rtlwifi/rtl8192cufw_A.bin \
 	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
@@ -192,19 +192,19 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
 LINUX_FIRMWARE_FILES += \
-	ti-connectivity/wl1271-fw-2.bin				\
-	ti-connectivity/wl1271-fw-ap.bin			\
-	ti-connectivity/wl1271-fw.bin				\
-	ti-connectivity/wl1271-nvs.bin				\
-	ti-connectivity/wl127x-fw-3.bin				\
-	ti-connectivity/wl127x-fw-plt-3.bin			\
-	ti-connectivity/wl127x-nvs.bin				\
-	ti-connectivity/wl127x-fw-4-mr.bin			\
-	ti-connectivity/wl127x-fw-4-plt.bin			\
-	ti-connectivity/wl127x-fw-4-sr.bin			\
-	ti-connectivity/wl127x-fw-5-mr.bin			\
-	ti-connectivity/wl127x-fw-5-plt.bin			\
-	ti-connectivity/wl127x-fw-5-sr.bin			\
+	ti-connectivity/wl1271-fw-2.bin \
+	ti-connectivity/wl1271-fw-ap.bin \
+	ti-connectivity/wl1271-fw.bin \
+	ti-connectivity/wl1271-nvs.bin \
+	ti-connectivity/wl127x-fw-3.bin \
+	ti-connectivity/wl127x-fw-plt-3.bin \
+	ti-connectivity/wl127x-nvs.bin \
+	ti-connectivity/wl127x-fw-4-mr.bin \
+	ti-connectivity/wl127x-fw-4-plt.bin \
+	ti-connectivity/wl127x-fw-4-sr.bin \
+	ti-connectivity/wl127x-fw-5-mr.bin \
+	ti-connectivity/wl127x-fw-5-plt.bin \
+	ti-connectivity/wl127x-fw-5-sr.bin \
 	ti-connectivity/TIInit_7.2.31.bts
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
@@ -213,20 +213,20 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
 # wl1271-nvs.bin and wl12xx-nvs.bin are symlinks to wl127x-nvs.bin
 LINUX_FIRMWARE_FILES += \
-	ti-connectivity/wl128x-fw-3.bin				\
-	ti-connectivity/wl128x-fw-ap.bin			\
-	ti-connectivity/wl128x-fw-plt-3.bin			\
-	ti-connectivity/wl128x-fw.bin				\
-	ti-connectivity/wl1271-nvs.bin				\
-	ti-connectivity/wl128x-nvs.bin				\
-	ti-connectivity/wl12xx-nvs.bin				\
-	ti-connectivity/wl127x-nvs.bin				\
-	ti-connectivity/wl128x-fw-4-mr.bin			\
-	ti-connectivity/wl128x-fw-4-plt.bin			\
-	ti-connectivity/wl128x-fw-4-sr.bin			\
-	ti-connectivity/wl128x-fw-5-mr.bin			\
-	ti-connectivity/wl128x-fw-5-plt.bin			\
-	ti-connectivity/wl128x-fw-5-sr.bin			\
+	ti-connectivity/wl128x-fw-3.bin \
+	ti-connectivity/wl128x-fw-ap.bin \
+	ti-connectivity/wl128x-fw-plt-3.bin \
+	ti-connectivity/wl128x-fw.bin \
+	ti-connectivity/wl1271-nvs.bin \
+	ti-connectivity/wl128x-nvs.bin \
+	ti-connectivity/wl12xx-nvs.bin \
+	ti-connectivity/wl127x-nvs.bin \
+	ti-connectivity/wl128x-fw-4-mr.bin \
+	ti-connectivity/wl128x-fw-4-plt.bin \
+	ti-connectivity/wl128x-fw-4-sr.bin \
+	ti-connectivity/wl128x-fw-5-mr.bin \
+	ti-connectivity/wl128x-fw-5-plt.bin \
+	ti-connectivity/wl128x-fw-5-sr.bin \
 	ti-connectivity/TIInit_7.2.31.bts
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 88f2fb4..f43ec5d 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -56,7 +56,7 @@ MPLAYER_CONF_OPTS += --disable-sdl
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-MPLAYER_CONF_OPTS +=  \
+MPLAYER_CONF_OPTS += \
 	--enable-freetype \
 	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 MPLAYER_DEPENDENCIES += freetype
@@ -128,7 +128,7 @@ MPLAYER_CONF_OPTS += --disable-libcdio
 # We intentionally don't pass --enable-dvdread, to let the
 # autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
-MPLAYER_CONF_OPTS +=  \
+MPLAYER_CONF_OPTS += \
 	--with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 MPLAYER_DEPENDENCIES += libdvdread
 endif
@@ -136,7 +136,7 @@ endif
 # We intentionally don't pass --enable-dvdnav to let the autodetection
 # find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
-MPLAYER_CONF_OPTS +=  \
+MPLAYER_CONF_OPTS += \
 	--with-dvdnav-config="$(PKG_CONFIG_HOST_BINARY) dvdnav"
 MPLAYER_DEPENDENCIES += libdvdnav
 endif
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index f6238e6..3f56937 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -17,7 +17,7 @@ NGREP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
 
-NGREP_CONF_OPTS =  \
+NGREP_CONF_OPTS = \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--enable-pcre \
 	--with-pcre=$(STAGING_DIR)/usr \
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 251dda3..9348d70 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -35,7 +35,7 @@ HOST_OLA_CONF_OPTS = \
 	--disable-uart \
 	--disable-libusb \
 	--disable-libftdi \
-	--disable-http  \
+	--disable-http \
 	--disable-examples \
 	--disable-unittests \
 	--disable-doxygen-html \
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index efb78be..3b27ddb 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,22 +11,22 @@ POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
 POCO_PATCH = https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
 
-POCO_DEPENDENCIES = zlib pcre					\
-	$(if $(BR2_PACKAGE_POCO_XML),expat)			\
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl)		\
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl)	\
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite)		\
+POCO_DEPENDENCIES = zlib pcre \
+	$(if $(BR2_PACKAGE_POCO_XML),expat) \
+	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
+	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
 
-POCO_OMIT = Data/ODBC PageCompiler					\
-	$(if $(BR2_PACKAGE_POCO_XML),,XML)				\
-	$(if $(BR2_PACKAGE_POCO_UTIL),,Util)				\
-	$(if $(BR2_PACKAGE_POCO_NET),,Net)				\
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL)	\
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto)			\
-	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)				\
-	$(if $(BR2_PACKAGE_POCO_DATA),,Data)				\
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL)		\
+POCO_OMIT = Data/ODBC PageCompiler \
+	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
+	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
+	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
+	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
+	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
+	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip) \
+	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
 
 ifeq ($(LIBC),uclibc)
@@ -48,12 +48,12 @@ endif
 
 define POCO_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
-		--config=Linux		\
-		--prefix=/usr		\
-		--omit="$(POCO_OMIT)"	\
-		$(POCO_CONF_OPTS)	\
-		--unbundled		\
-		--no-tests		\
+		--config=Linux \
+		--prefix=/usr \
+		--omit="$(POCO_OMIT)" \
+		$(POCO_CONF_OPTS) \
+		--unbundled \
+		--no-tests \
 		--no-samples)
 endef
 
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index ab658e9..9b05f0b 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -84,7 +84,7 @@ PYTHON_PYQT_CONF_OPTS = \
 # Python 3.x.
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_PYQT_CONF_OPTS += \
-	--vendorid-incdir $(STAGING_DIR)/usr/include/$(PYTHON_PYQT_PYTHON_DIR)  \
+	--vendorid-incdir $(STAGING_DIR)/usr/include/$(PYTHON_PYQT_PYTHON_DIR) \
 	--vendorid-libdir $(STAGING_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/config
 endif
 
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 1d84e83..1bba269 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -46,7 +46,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
 			--destdir $(TARGET_DIR)/$(PYTHON_SIP_LIB_DIR) \
-			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR)  \
+			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR) \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
diff --git a/package/python/python.mk b/package/python/python.mk
index 7ba5e37..d3f7b31 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -17,23 +17,23 @@ PYTHON_LIBTOOL_PATCH = NO
 # also installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
-HOST_PYTHON_CONF_OPTS +=	\
-	--enable-static		\
-	--without-cxx-main	\
-	--disable-sqlite3	\
-	--disable-tk		\
-	--with-expat=system	\
-	--disable-curses	\
-	--disable-codecs-cjk	\
-	--disable-nis		\
-	--enable-unicodedata	\
-	--disable-dbm		\
-	--disable-gdbm		\
-	--disable-bsddb		\
-	--disable-test-modules	\
-	--disable-bz2		\
-	--disable-ssl		\
-	--disable-ossaudiodev	\
+HOST_PYTHON_CONF_OPTS += \
+	--enable-static \
+	--without-cxx-main \
+	--disable-sqlite3 \
+	--disable-tk \
+	--with-expat=system \
+	--disable-curses \
+	--disable-codecs-cjk \
+	--disable-nis \
+	--enable-unicodedata \
+	--disable-dbm \
+	--disable-gdbm \
+	--disable-bsddb \
+	--disable-test-modules \
+	--disable-bz2 \
+	--disable-ssl \
+	--disable-ossaudiodev \
 	--disable-pyo-build
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
@@ -159,17 +159,17 @@ PYTHON_CONF_ENV += ac_cv_big_endian_double=yes
 endif
 
 PYTHON_CONF_OPTS += \
-	--without-cxx-main	\
-	--without-doc-strings	\
-	--with-system-ffi	\
-	--disable-pydoc		\
-	--disable-test-modules	\
-	--disable-lib2to3	\
-	--disable-gdbm		\
-	--disable-tk		\
-	--disable-nis		\
-	--disable-dbm		\
-	--disable-pyo-build	\
+	--without-cxx-main \
+	--without-doc-strings \
+	--with-system-ffi \
+	--disable-pydoc \
+	--disable-test-modules \
+	--disable-lib2to3 \
+	--disable-gdbm \
+	--disable-tk \
+	--disable-nis \
+	--disable-dbm \
+	--disable-pyo-build \
 	--disable-pyc-build
 
 # This is needed to make sure the Python build process doesn't try to
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2532dee..60a15f8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -24,19 +24,19 @@ PYTHON3_LIBTOOL_PATCH = NO
 # installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
-HOST_PYTHON3_CONF_OPTS +=	\
-	--without-ensurepip	\
-	--without-cxx-main	\
-	--disable-sqlite3	\
-	--disable-tk		\
-	--with-expat=system	\
-	--disable-curses	\
-	--disable-codecs-cjk	\
-	--disable-nis		\
-	--enable-unicodedata	\
-	--disable-test-modules	\
-	--disable-idle3		\
-	--disable-ossaudiodev	\
+HOST_PYTHON3_CONF_OPTS += \
+	--without-ensurepip \
+	--without-cxx-main \
+	--disable-sqlite3 \
+	--disable-tk \
+	--with-expat=system \
+	--disable-curses \
+	--disable-codecs-cjk \
+	--disable-nis \
+	--enable-unicodedata \
+	--disable-test-modules \
+	--disable-idle3 \
+	--disable-ossaudiodev \
 	--disable-openssl
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
@@ -151,15 +151,15 @@ PYTHON3_CONF_ENV += ac_cv_func_wcsftime=no
 endif
 
 PYTHON3_CONF_OPTS += \
-	--without-ensurepip	\
-	--without-cxx-main	\
-	--with-system-ffi	\
-	--disable-pydoc		\
-	--disable-test-modules	\
-	--disable-lib2to3	\
-	--disable-tk		\
-	--disable-nis		\
-	--disable-idle3		\
+	--without-ensurepip \
+	--without-cxx-main \
+	--with-system-ffi \
+	--disable-pydoc \
+	--disable-test-modules \
+	--disable-lib2to3 \
+	--disable-tk \
+	--disable-nis \
+	--disable-idle3 \
 	--disable-pyc-build
 
 # Python builds two tools to generate code: 'pgen' and
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2b6aafb..9335467 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -215,42 +215,42 @@ endif
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
-	( cd $(@D);                                     \
-		LIBS='$(QEMU_LIBS)'                     \
-		$(TARGET_CONFIGURE_OPTS)                \
-		$(TARGET_CONFIGURE_ARGS)                \
-		CPP="$(TARGET_CC) -E"			\
-		$(QEMU_VARS)                            \
-		./configure                             \
-			--prefix=/usr                   \
-			--cross-prefix=$(TARGET_CROSS)  \
-			--with-system-pixman            \
-			--audio-drv-list=               \
-			--enable-kvm                    \
-			--enable-attr                   \
-			--enable-vhost-net              \
-			--disable-bsd-user              \
-			--disable-xen                   \
-			--disable-slirp                 \
-			--disable-vnc                   \
-			--disable-virtfs                \
-			--disable-brlapi                \
-			--disable-curses                \
-			--disable-curl                  \
-			--disable-bluez                 \
-			--disable-uuid                  \
-			--disable-vde                   \
-			--disable-linux-aio             \
-			--disable-cap-ng                \
-			--disable-docs                  \
-			--disable-spice                 \
-			--disable-rbd                   \
-			--disable-libiscsi              \
-			--disable-usb-redir             \
-			--disable-strip                 \
-			--disable-seccomp               \
-			--disable-sparse                \
-			$(QEMU_OPTS)                    \
+	( cd $(@D); \
+		LIBS='$(QEMU_LIBS)' \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CPP="$(TARGET_CC) -E" \
+		$(QEMU_VARS) \
+		./configure \
+			--prefix=/usr \
+			--cross-prefix=$(TARGET_CROSS) \
+			--with-system-pixman \
+			--audio-drv-list= \
+			--enable-kvm \
+			--enable-attr \
+			--enable-vhost-net \
+			--disable-bsd-user \
+			--disable-xen \
+			--disable-slirp \
+			--disable-vnc \
+			--disable-virtfs \
+			--disable-brlapi \
+			--disable-curses \
+			--disable-curl \
+			--disable-bluez \
+			--disable-uuid \
+			--disable-vde \
+			--disable-linux-aio \
+			--disable-cap-ng \
+			--disable-docs \
+			--disable-spice \
+			--disable-rbd \
+			--disable-libiscsi \
+			--disable-usb-redir \
+			--disable-strip \
+			--disable-seccomp \
+			--disable-sparse \
+			$(QEMU_OPTS) \
 	)
 endef
 
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index fb0ce5d..273949a 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -15,16 +15,16 @@ RT_TESTS_DEPENDENCIES = python
 endif
 
 define RT_TESTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)	\
-		CC="$(TARGET_CC)"		\
-		CFLAGS="$(TARGET_CFLAGS)"	\
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		prefix=/usr
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)		\
-		DESTDIR="$(TARGET_DIR)"			\
-		prefix=/usr				\
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" \
+		prefix=/usr \
 		$(if $(BR2_PACKAGE_PYTHON),PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/,PYLIB="") \
 		install
 endef
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 35e8fc1..90f2cc4 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -20,11 +20,11 @@ RTAI_DEPENDENCIES = linux
 
 RTAI_CONF_OPTS = \
 	--includedir=/usr/include/rtai \
-	--with-linux-dir=$(LINUX_DIR)	\
-	--disable-leds			\
-	--enable-usi			\
-	--enable-align-priority		\
-	--disable-rtailab		\
+	--with-linux-dir=$(LINUX_DIR) \
+	--disable-leds \
+	--enable-usi \
+	--enable-align-priority \
+	--disable-rtailab \
 	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
 
 RTAI_MAKE = $(MAKE1)
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index f8a3196..a0a4489 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -48,7 +48,7 @@ SDL2_DEPENDENCIES += xlib_libX11 xlib_libXext
 SDL2_CONF_OPTS += --enable-video-x11 \
 	--with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib  \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
 	--enable-video-x11-xshape
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 9940944..1321eb6 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -148,9 +148,9 @@ endif
 define SKELETON_SET_NETWORK_LOCALHOST
 	( \
 		echo "# interface file auto-generated by buildroot"; \
-		echo ;                                               \
-		echo "auto lo";                                      \
-		echo "iface lo inet loopback";                       \
+		echo ; \
+		echo "auto lo"; \
+		echo "iface lo inet loopback"; \
 	) > $(TARGET_DIR)/etc/network/interfaces
 endef
 
@@ -159,11 +159,11 @@ SKELETON_NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SKELETON_NETWORK_DHCP_IFACE),)
 define SKELETON_SET_NETWORK_DHCP
 	( \
-		echo ;                                               \
-		echo "auto $(SKELETON_NETWORK_DHCP_IFACE)";                   \
-		echo "iface $(SKELETON_NETWORK_DHCP_IFACE) inet dhcp";        \
-		echo "	pre-up /etc/network/nfs_check";              \
-		echo "	wait-delay 15";                              \
+		echo ; \
+		echo "auto $(SKELETON_NETWORK_DHCP_IFACE)"; \
+		echo "iface $(SKELETON_NETWORK_DHCP_IFACE) inet dhcp"; \
+		echo "	pre-up /etc/network/nfs_check"; \
+		echo "	wait-delay 15"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 	$(INSTALL) -m 0755 -D $(SKELETON_PKGDIR)/nfs_check \
 		$(TARGET_DIR)/etc/network/nfs_check
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 086f5d6..1d26ddc 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -10,21 +10,21 @@ SPICE_SITE = http://www.spice-space.org/download/releases
 SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
 SPICE_INSTALL_STAGING = YES
-SPICE_DEPENDENCIES =        \
-	alsa-lib            \
-	celt051             \
-	jpeg                \
-	libglib2            \
-	openssl             \
-	pixman              \
-	python-pyparsing    \
+SPICE_DEPENDENCIES = \
+	alsa-lib \
+	celt051 \
+	jpeg \
+	libglib2 \
+	openssl \
+	pixman \
+	python-pyparsing \
 	spice-protocol
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
-SPICE_CONF_OPTS =                 \
-	--disable-opengl          \
-	--disable-smartcard       \
+SPICE_CONF_OPTS = \
+	--disable-opengl \
+	--disable-smartcard \
 	--disable-automated-tests \
 	--without-sasl
 
@@ -58,7 +58,7 @@ SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
 # it should link against libz and libjpeg. libz is pkg-config-aware, while
 # libjpeg isn't, hence the two-line tweak
 define SPICE_POST_INSTALL_STAGING_FIX_PC
-	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;'    \
+	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;' \
 		"$(STAGING_DIR)/usr/lib/pkgconfig/spice-server.pc"
 endef
 SPICE_POST_INSTALL_STAGING_HOOKS += SPICE_POST_INSTALL_STAGING_FIX_PC
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 65c39c1..7e1d9cc 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -50,16 +50,16 @@ HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
 
 HOST_SQUASHFS_MAKE_ARGS = \
 	XATTR_SUPPORT=1 \
-	XZ_SUPPORT=1    \
-	GZIP_SUPPORT=1  \
-	LZ4_SUPPORT=1	\
-	LZO_SUPPORT=1	\
+	XZ_SUPPORT=1 \
+	GZIP_SUPPORT=1 \
+	LZ4_SUPPORT=1 \
+	LZO_SUPPORT=1 \
 	LZMA_XZ_SUPPORT=1
 
 define SQUASHFS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE)    \
-		CC="$(TARGET_CC)"           \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		CC="$(TARGET_CC)" \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(SQUASHFS_MAKE_ARGS) \
 		-C $(@D)/squashfs-tools/
@@ -73,7 +73,7 @@ endef
 define HOST_SQUASHFS_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) \
 		CC="$(HOSTCC)" \
-		EXTRA_CFLAGS="$(HOST_CFLAGS)"   \
+		EXTRA_CFLAGS="$(HOST_CFLAGS)" \
 		EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
 		$(HOST_SQUASHFS_MAKE_ARGS) \
 		-C $(@D)/squashfs-tools/
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d8872c4..5112d53 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -132,7 +132,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
-	--enable-gcrypt	\
+	--enable-gcrypt \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr
 else
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0336019..5ac44da 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -70,22 +70,22 @@ endef
 TVHEADEND_PRE_CONFIGURE_HOOKS += TVHEADEND_INSTALL_DTV_SCAN_TABLES
 
 define TVHEADEND_CONFIGURE_CMDS
-	(cd $(@D);						\
-		$(TARGET_CONFIGURE_OPTS)			\
-		$(TARGET_CONFIGURE_ARGS)			\
-		CFLAGS="$(TVHEADEND_CFLAGS)"			\
-		./configure					\
-			--prefix=/usr				\
-			--arch="$(ARCH)"			\
-			--cpu="$(BR2_GCC_TARGET_CPU)"		\
-			--nowerror				\
-			--python="$(HOST_DIR)/usr/bin/python"	\
-			--enable-dvbscan			\
-			--enable-bundle				\
-			--enable-pngquant			\
-			--disable-ffmpeg_static			\
-			--disable-hdhomerun_static		\
-			$(TVHEADEND_CONF_OPTS)			\
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CFLAGS="$(TVHEADEND_CFLAGS)" \
+		./configure \
+			--prefix=/usr \
+			--arch="$(ARCH)" \
+			--cpu="$(BR2_GCC_TARGET_CPU)" \
+			--nowerror \
+			--python="$(HOST_DIR)/usr/bin/python" \
+			--enable-dvbscan \
+			--enable-bundle \
+			--enable-pngquant \
+			--disable-ffmpeg_static \
+			--disable-hdhomerun_static \
+			$(TVHEADEND_CONF_OPTS) \
 	)
 endef
 
diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index f0daf46..4d1c8c4 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -10,11 +10,11 @@ TZ_LICENSE = Public domain
 TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
 
 define TZ_BUILD_CMDS
-	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
-		for i in $$(find . -type f); do                    \
-			mkdir -p $(@D)/output/$$(dirname $$i);         \
+	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/; \
+		for i in $$(find . -type f); do \
+			mkdir -p $(@D)/output/$$(dirname $$i); \
 			$(TZDUMP) -p . -q $${i#./} | sed '1d' > $(@D)/output/$$i; \
-		done                                               \
+		done \
 	)
 endef
 
@@ -25,13 +25,13 @@ define TZ_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
-	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
+	if [ -n "$(TZ_LOCALTIME)" ]; then \
 		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
 			printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-			"$(TZDATA_LOCALTIME)";                              \
-			exit 1;                                             \
-		fi;                                                         \
-		cd $(TARGET_DIR)/etc;                                       \
+			"$(TZDATA_LOCALTIME)"; \
+			exit 1; \
+		fi; \
+		cd $(TARGET_DIR)/etc; \
 		ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
 	fi
 endef
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 68a0484..802d847 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -32,19 +32,19 @@ TZDATA_EXTRACT_CMDS =
 define TZDATA_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
 	cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo
-	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
-	for zone in posix/*; do                 \
-	    ln -sfn "$${zone}" "$${zone##*/}";  \
+	cd $(TARGET_DIR)/usr/share/zoneinfo; \
+	for zone in posix/*; do \
+	    ln -sfn "$${zone}" "$${zone##*/}"; \
 	done
-	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
+	if [ -n "$(TZDATA_LOCALTIME)" ]; then \
 	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
 	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-	               "$(TZDATA_LOCALTIME)";                           \
-	        exit 1;                                                 \
-	    fi;                                                         \
-	    cd $(TARGET_DIR)/etc;                                       \
+	               "$(TZDATA_LOCALTIME)"; \
+	        exit 1; \
+	    fi; \
+	    cd $(TARGET_DIR)/etc; \
 	    ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) localtime; \
-	    echo "$(TZDATA_LOCALTIME)" >timezone;                       \
+	    echo "$(TZDATA_LOCALTIME)" >timezone; \
 	fi
 endef
 
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 119bcc6..fe8932a 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -11,16 +11,16 @@ UDISKS_LICENSE_FILES = COPYING
 # For 0002-Fix-systemd-service-file.patch
 UDISKS_AUTORECONF = YES
 
-UDISKS_DEPENDENCIES =	\
-	sg3_utils	\
-	host-pkgconf	\
-	udev		\
-	dbus		\
-	dbus-glib	\
-	polkit		\
-	parted		\
-	lvm2		\
-	libatasmart	\
+UDISKS_DEPENDENCIES = \
+	sg3_utils \
+	host-pkgconf \
+	udev \
+	dbus \
+	dbus-glib \
+	polkit \
+	parted \
+	lvm2 \
+	libatasmart \
 	libgudev
 
 UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 9007175..538602f 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -14,9 +14,9 @@ USBMOUNT_LICENSE_FILES = debian/copyright
 define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
 
-	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink	\
+	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink \
 		$(TARGET_DIR)/etc/usbmount/mount.d/00_create_model_symlink
-	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink	\
+	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink \
 		$(TARGET_DIR)/etc/usbmount/umount.d/00_remove_model_symlink
 
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 6658662..2e8b82c 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -24,9 +24,9 @@ WPA_SUPPLICANT_CONFIG_EDITS =
 WPA_SUPPLICANT_CONFIG_SET = CONFIG_BGSCAN_SIMPLE
 
 WPA_SUPPLICANT_CONFIG_ENABLE = \
-	CONFIG_IEEE80211AC	\
-	CONFIG_IEEE80211N	\
-	CONFIG_IEEE80211R	\
+	CONFIG_IEEE80211AC \
+	CONFIG_IEEE80211N \
+	CONFIG_IEEE80211R \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_DEBUG_FILE \
 	CONFIG_MATCH_IFACE
@@ -101,7 +101,7 @@ endif
 ifeq ($(BR2_PACKAGE_DBUS),y)
 WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
 WPA_SUPPLICANT_MAKE_ENV = \
-	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
+	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
-- 
2.9.3
