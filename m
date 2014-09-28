From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 14:10:13 +0200
Subject: [Buildroot] [PATCH 14 of 15] .mk files: remove alignment of
 line continuation characters
In-Reply-To: <1e8a3e7359ae146acec9.1411846371@localhost>
References: <patchbomb.1411846357@localhost>
 <1e8a3e7359ae146acec9.1411846371@localhost>
Message-ID: <20140928121013.GC3994@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-27 21:32 +0200, Thomas De Schampheleire spake thusly:
> The Buildroot coding style does not align assignments nor line continuation
> characters (\). This patch updates the .mk files to reflect this.
> 
> Command used:
>     find * -name "*.mk" | xargs sed -i 's/\s\+\\\s*$/ \\/g'
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Casual visual inspection, plus:
    git difftool -y -x 'diff -dub' CSET^..CSET

Regards,
Yann E. MORIN.

> ---
> v2: new patch
> 
>  boot/lpc32xxcdl/lpc32xxcdl.mk                            |    8 +-
>  boot/uboot/uboot.mk                                      |    8 +-
>  linux/linux-ext-rtai.mk                                  |   10 +-
>  linux/linux-ext-xenomai.mk                               |    6 +-
>  linux/linux.mk                                           |   14 +-
>  package/acl/acl.mk                                       |   14 +-
>  package/attr/attr.mk                                     |   14 +-
>  package/bluez5_utils/bluez5_utils.mk                     |    6 +-
>  package/bluez_utils/bluez_utils.mk                       |   24 +-
>  package/boost/boost.mk                                   |   14 +-
>  package/cegui06/cegui06.mk                               |   32 +-
>  package/celt051/celt051.mk                               |   14 +-
>  package/connman/connman.mk                               |   10 +-
>  package/dhcpcd/dhcpcd.mk                                 |    8 +-
>  package/directfb/directfb.mk                             |    2 +-
>  package/dtc/dtc.mk                                       |    4 +-
>  package/duma/duma.mk                                     |    4 +-
>  package/efl/libecore/libecore.mk                         |   12 +-
>  package/enlightenment/enlightenment.mk                   |   24 +-
>  package/eudev/eudev.mk                                   |   16 +-
>  package/ffmpeg/ffmpeg.mk                                 |    4 +-
>  package/freetype/freetype.mk                             |    2 +-
>  package/glibc/glibc.mk                                   |    4 +-
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk               |   40 +-
>  package/gstreamer1/gst1-libav/gst1-libav.mk              |   44 +-
>  package/gvfs/gvfs.mk                                     |   16 +-
>  package/jack2/jack2.mk                                   |    6 +-
>  package/keyutils/keyutils.mk                             |   10 +-
>  package/lesstif/lesstif.mk                               |    2 +-
>  package/libungif/libungif.mk                             |    6 +-
>  package/linux-firmware/linux-firmware.mk                 |   62 ++--
>  package/midori/midori.mk                                 |    6 +-
>  package/mplayer/mplayer.mk                               |    6 +-
>  package/ngrep/ngrep.mk                                   |    2 +-
>  package/opencv/opencv.mk                                 |  116 +++++-----
>  package/openocd/openocd.mk                               |    8 +-
>  package/pkg-generic.mk                                   |    4 +-
>  package/poco/poco.mk                                     |   40 +-
>  package/python/python.mk                                 |   52 ++--
>  package/python3/python3.mk                               |   42 +-
>  package/qemu/qemu.mk                                     |   16 +-
>  package/rt-tests/rt-tests.mk                             |   12 +-
>  package/rtai/rtai.mk                                     |    6 +-
>  package/samba/samba.mk                                   |    8 +-
>  package/spice/spice.mk                                   |   24 +-
>  package/squashfs/squashfs.mk                             |   16 +-
>  package/strongswan/strongswan.mk                         |   86 +++---
>  package/systemd/systemd.mk                               |   12 +-
>  package/tvheadend/tvheadend.mk                           |   20 +-
>  package/tz/tz.mk                                         |   18 +-
>  package/tzdata/tzdata.mk                                 |   18 +-
>  package/uboot-tools/uboot-tools.mk                       |   26 +-
>  package/udisks/udisks.mk                                 |   18 +-
>  package/usbmount/usbmount.mk                             |    4 +-
>  package/vde2/vde2.mk                                     |   12 +-
>  package/wpa_supplicant/wpa_supplicant.mk                 |   10 +-
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |   84 +++---
>  package/xbmc/xbmc.mk                                     |    2 +-
>  58 files changed, 554 insertions(+), 554 deletions(-)
> 
> diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
> --- a/boot/lpc32xxcdl/lpc32xxcdl.mk
> +++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
> @@ -33,10 +33,10 @@
>  endif
>  
>  LPC32XXCDL_BUILD_FLAGS = \
> -	CROSS_COMPILE=$(TARGET_CROSS)           \
> -	NXPMCU_WINBASE=$(@D)                    \
> -	NXPMCU_SOFTWARE=$(@D)                   \
> -	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME)  \
> +	CROSS_COMPILE=$(TARGET_CROSS) \
> +	NXPMCU_WINBASE=$(@D) \
> +	NXPMCU_SOFTWARE=$(@D) \
> +	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) \
>  	CSP=lpc32xx TOOL=gnu GEN=lpc
>  
>  LPC32XXCDL_BOARD_STARTUP_DIR = \
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -95,8 +95,8 @@
>  endif
>  
>  define UBOOT_CONFIGURE_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
> -		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
> +	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) \
> +		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
>  		$(UBOOT_BOARD_NAME)_config
>  	@echo >> $(@D)/include/config.h
>  	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
> @@ -114,8 +114,8 @@
>  endef
>  
>  define UBOOT_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
> -		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
> +	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) \
> +		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
>  		$(UBOOT_MAKE_TARGET)
>  endef
>  
> diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
> --- a/linux/linux-ext-rtai.mk
> +++ b/linux/linux-ext-rtai.mk
> @@ -25,8 +25,8 @@
>  define RTAI_PREPARE_KERNEL
>  	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
>  	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
> -		support/scripts/apply-patches.sh $(LINUX_DIR) 		\
> -			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
> +		support/scripts/apply-patches.sh $(LINUX_DIR) \
> +			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ \
>  			hal-linux-$${kver}-*patch ; \
>  	else \
>  		echo "No RTAI patch for your kernel version" ; \
> @@ -35,9 +35,9 @@
>  endef
>  else
>  define RTAI_PREPARE_KERNEL
> -	support/scripts/apply-patches.sh 	\
> -		$(LINUX_DIR)			\
> -		$(dir $(RTAI_PATCH))		\
> +	support/scripts/apply-patches.sh \
> +		$(LINUX_DIR) \
> +		$(dir $(RTAI_PATCH)) \
>  		$(notdir $(RTAI_PATCH))
>  endef
>  endif
> diff --git a/linux/linux.mk b/linux/linux.mk
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -266,8 +266,8 @@
>  	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
>  		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
>  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> -	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
> -		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
> +	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
> +		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
>  	fi
>  	$(LINUX_BUILD_DTB)
>  	$(LINUX_APPEND_DTB)
> @@ -284,8 +284,8 @@
>  
>  define LINUX_INSTALL_HOST_TOOLS
>  	# Installing dtc (device tree compiler) as host tool, if selected
> -	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
> -		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
> +	if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
> +		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ; \
>  	fi
>  endef
>  
> @@ -299,10 +299,10 @@
>  	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
>  	# Install modules and remove symbolic links pointing to build
>  	# directories, not relevant on the target
> -	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
> +	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
>  		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
> -		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
> -		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
> +		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
> +		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
>  	fi
>  	$(LINUX_INSTALL_HOST_TOOLS)
>  endef
> diff --git a/package/acl/acl.mk b/package/acl/acl.mk
> --- a/package/acl/acl.mk
> +++ b/package/acl/acl.mk
> @@ -16,15 +16,15 @@
>  # While the configuration system uses autoconf, the Makefiles are
>  # hand-written and do not use automake. Therefore, we have to hack
>  # around their deficiencies by passing installation paths.
> -ACL_INSTALL_STAGING_OPTS = 			\
> -	prefix=$(STAGING_DIR)/usr 		\
> -	exec_prefix=$(STAGING_DIR)/usr 		\
> -	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
> +ACL_INSTALL_STAGING_OPTS = \
> +	prefix=$(STAGING_DIR)/usr \
> +	exec_prefix=$(STAGING_DIR)/usr \
> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
>  	install-dev install-lib
>  
> -ACL_INSTALL_TARGET_OPTS = 			\
> -	prefix=$(TARGET_DIR)/usr 		\
> -	exec_prefix=$(TARGET_DIR)/usr 		\
> +ACL_INSTALL_TARGET_OPTS = \
> +	prefix=$(TARGET_DIR)/usr \
> +	exec_prefix=$(TARGET_DIR)/usr \
>  	install install-lib
>  
>  $(eval $(autotools-package))
> diff --git a/package/attr/attr.mk b/package/attr/attr.mk
> --- a/package/attr/attr.mk
> +++ b/package/attr/attr.mk
> @@ -15,15 +15,15 @@
>  # While the configuration system uses autoconf, the Makefiles are
>  # hand-written and do not use automake. Therefore, we have to hack
>  # around their deficiencies by passing installation paths.
> -ATTR_INSTALL_STAGING_OPTS = 			\
> -	prefix=$(STAGING_DIR)/usr 		\
> -	exec_prefix=$(STAGING_DIR)/usr 		\
> -	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
> +ATTR_INSTALL_STAGING_OPTS = \
> +	prefix=$(STAGING_DIR)/usr \
> +	exec_prefix=$(STAGING_DIR)/usr \
> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
>  	install-dev install-lib
>  
> -ATTR_INSTALL_TARGET_OPTS = 			\
> -	prefix=$(TARGET_DIR)/usr 		\
> -	exec_prefix=$(TARGET_DIR)/usr 		\
> +ATTR_INSTALL_TARGET_OPTS = \
> +	prefix=$(TARGET_DIR)/usr \
> +	exec_prefix=$(TARGET_DIR)/usr \
>  	install install-lib
>  
>  $(eval $(autotools-package))
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -12,9 +12,9 @@
>  BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
>  BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
>  
> -BLUEZ5_UTILS_CONF_OPTS = 	\
> -	--enable-tools 		\
> -	--enable-library 	\
> +BLUEZ5_UTILS_CONF_OPTS = \
> +	--enable-tools \
> +	--enable-library \
>  	--disable-cups
>  
>  ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
> diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
> --- a/package/bluez_utils/bluez_utils.mk
> +++ b/package/bluez_utils/bluez_utils.mk
> @@ -16,24 +16,24 @@
>  
>  # BlueZ 3.x compatibility
>  ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
> -BLUEZ_UTILS_CONF_OPTS +=	\
> -	--enable-hidd	\
> -	--enable-pand	\
> -	--enable-sdp	\
> +BLUEZ_UTILS_CONF_OPTS += \
> +	--enable-hidd \
> +	--enable-pand \
> +	--enable-sdp \
>  	--enable-dund
>  endif
>  
>  # audio support
>  ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_AUDIO),y)
> -BLUEZ_UTILS_DEPENDENCIES +=	\
> -	alsa-lib		\
> +BLUEZ_UTILS_DEPENDENCIES += \
> +	alsa-lib \
>  	libsndfile
> -BLUEZ_UTILS_CONF_OPTS +=	\
> -	--enable-alsa	\
> +BLUEZ_UTILS_CONF_OPTS += \
> +	--enable-alsa \
>  	--enable-audio
>  else
> -BLUEZ_UTILS_CONF_OPTS +=	\
> -	--disable-alsa	\
> +BLUEZ_UTILS_CONF_OPTS += \
> +	--disable-alsa \
>  	--disable-audio
>  endif
>  
> @@ -47,10 +47,10 @@
>  # USB support
>  ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
>  BLUEZ_UTILS_DEPENDENCIES += libusb
> -BLUEZ_UTILS_CONF_OPTS +=	\
> +BLUEZ_UTILS_CONF_OPTS += \
>  	--enable-usb
>  else
> -BLUEZ_UTILS_CONF_OPTS +=	\
> +BLUEZ_UTILS_CONF_OPTS += \
>  	--disable-usb
>  endif
>  
> diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
> --- a/package/cegui06/cegui06.mk
> +++ b/package/cegui06/cegui06.mk
> @@ -13,24 +13,24 @@
>  CEGUI06_LICENSE_FILES   = COPYING
>  CEGUI06_INSTALL_STAGING = YES
>  
> -CEGUI06_DEPENDENCIES    =       \
> -    expat                       \
> -    freetype                    \
> -    pcre                        \
> +CEGUI06_DEPENDENCIES    = \
> +    expat \
> +    freetype \
> +    pcre \
>  
> -CEGUI06_CONF_OPTS =              \
> -    --enable-expat              \
> -    --disable-external-tinyxml  \
> -    --disable-xerces-c          \
> -    --disable-libxml            \
> -    --disable-tinyxml           \
> -    --disable-opengl-renderer   \
> -    --disable-external-glew     \
> +CEGUI06_CONF_OPTS = \
> +    --enable-expat \
> +    --disable-external-tinyxml \
> +    --disable-xerces-c \
> +    --disable-libxml \
> +    --disable-tinyxml \
> +    --disable-opengl-renderer \
> +    --disable-external-glew \
>      --disable-irrlicht-renderer \
>      --disable-directfb-renderer \
> -    --disable-samples           \
> -    --disable-lua-module        \
> -    --disable-toluacegui        \
> -    --disable-external-toluapp  \
> +    --disable-samples \
> +    --disable-lua-module \
> +    --disable-toluacegui \
> +    --disable-external-toluapp \
>  
>  $(eval $(autotools-package))
> diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
> --- a/package/celt051/celt051.mk
> +++ b/package/celt051/celt051.mk
> @@ -18,13 +18,13 @@
>  # if target is the same kind as host (ie. same arch, same bitness,
>  # same endianness, so that /usr/lib contains libraries linkable by
>  # our cross-compiler)
> -CELT051_CONF_OPTS =                  \
> -  --enable-fixed-point              \
> -  --disable-fixed-point-debug       \
> +CELT051_CONF_OPTS = \
> +  --enable-fixed-point \
> +  --disable-fixed-point-debug \
>    --disable-experimental-postfilter \
> -  --disable-static-modes            \
> -  --disable-assertions              \
> -  --disable-oggtest                 \
> -  --with-ogg=$(STAGING_DIR)/usr     \
> +  --disable-static-modes \
> +  --disable-assertions \
> +  --disable-oggtest \
> +  --with-ogg=$(STAGING_DIR)/usr \
>  
>  $(eval $(autotools-package))
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -12,12 +12,12 @@
>  CONNMAN_LICENSE = GPLv2
>  CONNMAN_LICENSE_FILES = COPYING
>  CONNMAN_CONF_OPTS += --localstatedir=/var \
> -	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
> -	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
> -	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
> +	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
> +	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
> +	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
>  	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
> -	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
> -	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
> +	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
> +	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) \
>  	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
>  	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono) \
>  	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -67,7 +67,7 @@
>  	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
>  	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
>  	$(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
> -	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)	\
> +	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830) \
>  	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
>  
>  ifeq ($(strip $(DIRECTFB_GFX)),)
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -34,8 +34,8 @@
>  endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
>  
>  define DTC_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS)    \
> -	CFLAGS="$(TARGET_CFLAGS)"   \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS)" \
>  	$(MAKE) -C $(@D) PREFIX=/usr $(DTC_BUILD_GOAL)
>  endef
>  
> diff --git a/package/duma/duma.mk b/package/duma/duma.mk
> --- a/package/duma/duma.mk
> +++ b/package/duma/duma.mk
> @@ -18,9 +18,9 @@
>  # The dependency of some source files in duma_config.h, which is generated at
>  # build time, is not specified in the Makefile. Force non-parallel build.
>  define DUMA_BUILD_CMDS
> -	$(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
> +	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
>  		OS=linux \
> -		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
> +		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
>  		$(DUMA_CPP) -C $(@D)
>  endef
>  
> diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
> --- a/package/efl/libecore/libecore.mk
> +++ b/package/efl/libecore/libecore.mk
> @@ -15,12 +15,12 @@
>  LIBECORE_DEPENDENCIES = host-pkgconf libeina
>  
>  HOST_LIBECORE_DEPENDENCIES = host-pkgconf host-libeina host-libevas
> -HOST_LIBECORE_CONF_OPTS += 		\
> -	--enable-ecore-evas 		\
> -	--disable-simple-x11 		\
> -	--disable-ecore-directfb 	\
> -	--disable-ecore-x 		\
> -	--disable-ecore-x-xcb 		\
> +HOST_LIBECORE_CONF_OPTS += \
> +	--enable-ecore-evas \
> +	--disable-simple-x11 \
> +	--disable-ecore-directfb \
> +	--disable-ecore-x \
> +	--disable-ecore-x-xcb \
>  	--disable-ecore-imf-xim
>  
>  # default options
> diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
> --- a/package/enlightenment/enlightenment.mk
> +++ b/package/enlightenment/enlightenment.mk
> @@ -9,19 +9,19 @@
>  ENLIGHTENMENT_LICENSE = BSD-2c
>  ENLIGHTENMENT_LICENSE_FILES = COPYING
>  
> -ENLIGHTENMENT_DEPENDENCIES = 	\
> -	host-pkgconf 		\
> -	libecore 		\
> -	libeet 			\
> -	libeina 		\
> -	libevas 		\
> +ENLIGHTENMENT_DEPENDENCIES = \
> +	host-pkgconf \
> +	libecore \
> +	libeet \
> +	libeina \
> +	libevas \
>  	libevas-generic-loaders \
> -	libedje 		\
> -	libefreet 		\
> -	libedbus 		\
> -	libeio 			\
> -	host-libedje 		\
> -	host-libeet		\
> +	libedje \
> +	libefreet \
> +	libedbus \
> +	libeio \
> +	host-libedje \
> +	host-libeet \
>  	xcb-util-keysyms
>  
>  ENLIGHTENMENT_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -14,14 +14,14 @@
>  # mq_getattr is in librt
>  EUDEV_CONF_ENV += LIBS=-lrt
>  
> -EUDEV_CONF_OPTS =		\
> -	--disable-manpages	\
> -	--sbindir=/sbin		\
> -	--with-rootlibdir=/lib	\
> -	--libexecdir=/lib	\
> -	--with-firmware-path=/lib/firmware	\
> -	--disable-introspection			\
> -	--enable-split-usr			\
> +EUDEV_CONF_OPTS = \
> +	--disable-manpages \
> +	--sbindir=/sbin \
> +	--with-rootlibdir=/lib \
> +	--libexecdir=/lib \
> +	--with-firmware-path=/lib/firmware \
> +	--disable-introspection \
> +	--enable-split-usr \
>  	--enable-libkmod
>  
>  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -17,7 +17,7 @@
>  endif
>  
>  FFMPEG_CONF_OPTS = \
> -	--prefix=/usr		\
> +	--prefix=/usr \
>  	--enable-avfilter \
>  	--disable-version3 \
>  	--enable-logging \
> @@ -326,7 +326,7 @@
>  	$(TARGET_CONFIGURE_ARGS) \
>  	$(FFMPEG_CONF_ENV) \
>  	./configure \
> -		--enable-cross-compile	\
> +		--enable-cross-compile \
>  		--cross-prefix=$(TARGET_CROSS) \
>  		--sysroot=$(STAGING_DIR) \
>  		--host-cc="$(HOSTCC)" \
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -102,8 +102,8 @@
>  #
>  
>  GLIBC_LIBS_LIB = \
> -	ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.*        \
> -	libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* libutil.so.*   \
> +	ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* \
> +	libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* libutil.so.* \
>  	libnss_files.so.* libnss_dns.so.*
>  
>  ifeq ($(BR2_PACKAGE_GDB),y)
> diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
> --- a/package/gvfs/gvfs.mk
> +++ b/package/gvfs/gvfs.mk
> @@ -18,12 +18,12 @@
>  GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>  
>  GVFS_CONF_OPTS = \
> -	--disable-gconf			\
> -	--disable-cdda			\
> -	--disable-obexftp		\
> -	--disable-gphoto2		\
> -	--disable-keyring		\
> -	--disable-bash-completion	\
> +	--disable-gconf \
> +	--disable-cdda \
> +	--disable-obexftp \
> +	--disable-gphoto2 \
> +	--disable-keyring \
> +	--disable-bash-completion \
>  	--disable-hal
>  
>  ifeq ($(BR2_PACKAGE_AVAHI),y)
> @@ -82,8 +82,8 @@
>  endef
>  
>  GVFS_POST_INSTALL_TARGET_HOOKS += \
> -	GVFS_REMOVE_USELESS_BINARY	\
> -	GVFS_REMOVE_TARGET_SCHEMAS	\
> +	GVFS_REMOVE_USELESS_BINARY \
> +	GVFS_REMOVE_TARGET_SCHEMAS \
>  	GVFS_COMPILE_SCHEMAS
>  
>  $(eval $(autotools-package))
> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> --- a/package/jack2/jack2.mk
> +++ b/package/jack2/jack2.mk
> @@ -12,10 +12,10 @@
>  
>  define JACK2_CONFIGURE_CMDS
>  	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS)	\
> +		$(TARGET_CONFIGURE_OPTS) \
>  		$(HOST_DIR)/usr/bin/python2 ./waf configure \
> -		--prefix=/usr			\
> -		--alsa				\
> +		--prefix=/usr \
> +		--alsa \
>  	)
>  endef
>  
> diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
> --- a/package/keyutils/keyutils.mk
> +++ b/package/keyutils/keyutils.mk
> @@ -11,11 +11,11 @@
>  KEYUTILS_LICENSE_FILES   = LICENCE.GPL LICENCE.LGPL
>  KEYUTILS_INSTALL_STAGING = YES
>  
> -KEYUTILS_MAKE_ENV =     \
> -    INSTALL=$(INSTALL)  \
> -    LIBDIR=/usr/lib     \
> -    USRLIBDIR=/usr/lib  \
> -    LN=$(HOSTLN)        \
> +KEYUTILS_MAKE_ENV = \
> +    INSTALL=$(INSTALL) \
> +    LIBDIR=/usr/lib \
> +    USRLIBDIR=/usr/lib \
> +    LN=$(HOSTLN) \
>  
>  define KEYUTILS_BUILD_CMDS
>  	$(KEYUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
> --- a/package/lesstif/lesstif.mk
> +++ b/package/lesstif/lesstif.mk
> @@ -17,7 +17,7 @@
>  	--with-gnu-ld \
>  	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
>  	--enable-debug=no \
> -	--enable-production=yes	\
> +	--enable-production=yes \
>  	--enable-build-tests=no \
>  	--no-recursion
>  
> diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
> --- a/package/libungif/libungif.mk
> +++ b/package/libungif/libungif.mk
> @@ -13,9 +13,9 @@
>  LIBUNGIF_LICENSE_FILES = COPYING
>  
>  LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
> -		gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
> -		gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
> -		gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif   \
> +		gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip \
> +		gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat \
> +		gifrsize gifspnge giftext gifwedge icon2gif raw2gif rgb2gif \
>  		text2gif
>  
>  define LIBUNGIF_BINS_CLEANUP
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -37,17 +37,17 @@
>  # rtl81xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX),y)
>  LINUX_FIRMWARE_FILES += \
> -	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
> -	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
> -	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
> -	rtlwifi/rtl8188efw.bin rtlwifi/rtl8192cufw_A.bin	\
> +	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin \
> +	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin \
> +	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin \
> +	rtlwifi/rtl8188efw.bin rtlwifi/rtl8192cufw_A.bin \
>  	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
>  endif
>  
>  # rtl87xx
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX),y)
> -LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
> +LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin \
>  	rtlwifi/rtl8723fw_B.bin rtlwifi/rtl8723befw.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
>  endif
> @@ -107,19 +107,19 @@
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
>  # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
>  LINUX_FIRMWARE_FILES += \
> -	ti-connectivity/wl1271-fw-2.bin				\
> -	ti-connectivity/wl1271-fw-ap.bin			\
> -	ti-connectivity/wl1271-fw.bin				\
> -	ti-connectivity/wl1271-nvs.bin				\
> -	ti-connectivity/wl127x-fw-3.bin				\
> -	ti-connectivity/wl127x-fw-plt-3.bin			\
> -	ti-connectivity/wl127x-nvs.bin				\
> -	ti-connectivity/wl127x-fw-4-mr.bin			\
> -	ti-connectivity/wl127x-fw-4-plt.bin			\
> -	ti-connectivity/wl127x-fw-4-sr.bin			\
> -	ti-connectivity/wl127x-fw-5-mr.bin			\
> -	ti-connectivity/wl127x-fw-5-plt.bin			\
> -	ti-connectivity/wl127x-fw-5-sr.bin			\
> +	ti-connectivity/wl1271-fw-2.bin \
> +	ti-connectivity/wl1271-fw-ap.bin \
> +	ti-connectivity/wl1271-fw.bin \
> +	ti-connectivity/wl1271-nvs.bin \
> +	ti-connectivity/wl127x-fw-3.bin \
> +	ti-connectivity/wl127x-fw-plt-3.bin \
> +	ti-connectivity/wl127x-nvs.bin \
> +	ti-connectivity/wl127x-fw-4-mr.bin \
> +	ti-connectivity/wl127x-fw-4-plt.bin \
> +	ti-connectivity/wl127x-fw-4-sr.bin \
> +	ti-connectivity/wl127x-fw-5-mr.bin \
> +	ti-connectivity/wl127x-fw-5-plt.bin \
> +	ti-connectivity/wl127x-fw-5-sr.bin \
>  	ti-connectivity/TIInit_7.2.31.bts
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
>  endif
> @@ -127,19 +127,19 @@
>  # wl128x
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
>  LINUX_FIRMWARE_FILES += \
> -	ti-connectivity/wl128x-fw-3.bin				\
> -	ti-connectivity/wl128x-fw-ap.bin			\
> -	ti-connectivity/wl128x-fw-plt-3.bin			\
> -	ti-connectivity/wl128x-fw.bin				\
> -	ti-connectivity/wl1271-nvs.bin				\
> -	ti-connectivity/wl128x-nvs.bin				\
> -	ti-connectivity/wl12xx-nvs.bin				\
> -	ti-connectivity/wl128x-fw-4-mr.bin			\
> -	ti-connectivity/wl128x-fw-4-plt.bin			\
> -	ti-connectivity/wl128x-fw-4-sr.bin			\
> -	ti-connectivity/wl128x-fw-5-mr.bin			\
> -	ti-connectivity/wl128x-fw-5-plt.bin			\
> -	ti-connectivity/wl128x-fw-5-sr.bin			\
> +	ti-connectivity/wl128x-fw-3.bin \
> +	ti-connectivity/wl128x-fw-ap.bin \
> +	ti-connectivity/wl128x-fw-plt-3.bin \
> +	ti-connectivity/wl128x-fw.bin \
> +	ti-connectivity/wl1271-nvs.bin \
> +	ti-connectivity/wl128x-nvs.bin \
> +	ti-connectivity/wl12xx-nvs.bin \
> +	ti-connectivity/wl128x-fw-4-mr.bin \
> +	ti-connectivity/wl128x-fw-4-plt.bin \
> +	ti-connectivity/wl128x-fw-4-sr.bin \
> +	ti-connectivity/wl128x-fw-5-mr.bin \
> +	ti-connectivity/wl128x-fw-5-plt.bin \
> +	ti-connectivity/wl128x-fw-5-sr.bin \
>  	ti-connectivity/TIInit_7.2.31.bts
>  # wl12xx-nvs.bin (above) is a symlink to:
>  LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin
> diff --git a/package/midori/midori.mk b/package/midori/midori.mk
> --- a/package/midori/midori.mk
> +++ b/package/midori/midori.mk
> @@ -30,10 +30,10 @@
>  define MIDORI_CONFIGURE_CMDS
>  	$(MIDORI_WITHOUT_X11)
>  	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS)	\
> +		$(TARGET_CONFIGURE_OPTS) \
>  		$(HOST_DIR)/usr/bin/python2 ./waf configure \
> -		--prefix=/usr			\
> -		--disable-libnotify		\
> +		--prefix=/usr \
> +		--disable-libnotify \
>         )
>  endef
>  
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -35,7 +35,7 @@
>  endif
>  
>  ifeq ($(BR2_PACKAGE_FREETYPE),y)
> -MPLAYER_CONF_OPTS +=  \
> +MPLAYER_CONF_OPTS += \
>  	--enable-freetype \
>  	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
>  MPLAYER_DEPENDENCIES += freetype
> @@ -44,7 +44,7 @@
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
> -MPLAYER_CONF_OPTS +=  \
> +MPLAYER_CONF_OPTS += \
>  	--enable-dvdread \
>  	--disable-dvdread-internal \
>  	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
> @@ -52,7 +52,7 @@
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
> -MPLAYER_CONF_OPTS +=  \
> +MPLAYER_CONF_OPTS += \
>  	--enable-dvdnav \
>  	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
>  MPLAYER_DEPENDENCIES += libdvdnav
> diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
> --- a/package/ngrep/ngrep.mk
> +++ b/package/ngrep/ngrep.mk
> @@ -17,7 +17,7 @@
>  endif
>  NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
>  
> -NGREP_CONF_OPTS =  \
> +NGREP_CONF_OPTS = \
>  	--with-pcap-includes=$(STAGING_DIR)/usr/include \
>  	--enable-pcre \
>  	--with-pcre=$(STAGING_DIR)/usr \
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -13,58 +13,58 @@
>  # OpenCV component options
>  OPENCV_CONF_OPTS += \
>  	-DBUILD_WITH_DEBUG_INFO=OFF \
> -	-DBUILD_DOCS=OFF            \
> -	-DBUILD_EXAMPLES=OFF        \
> +	-DBUILD_DOCS=OFF \
> +	-DBUILD_EXAMPLES=OFF \
>  	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
>  	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
>  
>  # OpenCV build options
>  OPENCV_CONF_OPTS += \
> -	-DBUILD_WITH_STATIC_CRT=OFF      \
> -	-DENABLE_FAST_MATH=ON            \
> -	-DENABLE_NOISY_WARNINGS=OFF      \
> -	-DENABLE_OMIT_FRAME_POINTER=ON   \
> +	-DBUILD_WITH_STATIC_CRT=OFF \
> +	-DENABLE_FAST_MATH=ON \
> +	-DENABLE_NOISY_WARNINGS=OFF \
> +	-DENABLE_OMIT_FRAME_POINTER=ON \
>  	-DENABLE_PRECOMPILED_HEADERS=OFF \
> -	-DENABLE_PROFILING=OFF           \
> +	-DENABLE_PROFILING=OFF \
>  	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
>  
>  # OpenCV link options
>  OPENCV_CONF_OPTS += \
>  	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
> -	-DCMAKE_SKIP_RPATH=OFF                  \
> +	-DCMAKE_SKIP_RPATH=OFF \
>  	-DCMAKE_USE_RELATIVE_PATHS=OFF
>  
>  # OpenCV packaging options:
>  OPENCV_CONF_OPTS += \
> -	-DBUILD_PACKAGE=OFF           \
> +	-DBUILD_PACKAGE=OFF \
>  	-DENABLE_SOLUTION_FOLDERS=OFF \
>  	-DINSTALL_CREATE_DISTRIB=OFF
>  
>  # OpenCV module selection
>  OPENCV_CONF_OPTS += \
> -	-DBUILD_opencv_androidcamera=OFF                                        \
> -	-DBUILD_opencv_apps=OFF                                                 \
> -	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
> -	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
> -	-DBUILD_opencv_core=ON                                                  \
> -	-DBUILD_opencv_dynamicuda=OFF                                           \
> +	-DBUILD_opencv_androidcamera=OFF \
> +	-DBUILD_opencv_apps=OFF \
> +	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
> +	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
> +	-DBUILD_opencv_core=ON \
> +	-DBUILD_opencv_dynamicuda=OFF \
>  	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
> -	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
> -	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
> -	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF)   \
> -	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF)   \
> -	-DBUILD_opencv_java=OFF                                                 \
> -	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF)     \
> -	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
> -	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
> +	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
> +	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
> +	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
> +	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
> +	-DBUILD_opencv_java=OFF \
> +	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
> +	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
> +	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
>  	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
> -	-DBUILD_opencv_ocl=OFF                                                  \
> -	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
> -	-DBUILD_opencv_python=OFF                                               \
> +	-DBUILD_opencv_ocl=OFF \
> +	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
> +	-DBUILD_opencv_python=OFF \
>  	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
>  	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
> -	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
> -	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
> +	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
> +	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
>  	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
>  	-DBUILD_opencv_world=OFF
>  
> @@ -74,17 +74,17 @@
>  #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
>  OPENCV_CONF_OPTS += \
>  	-DENABLE_POWERPC=OFF \
> -	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
> -	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
> -	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
> -	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)  \
> +	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
> +	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
> +	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
> +	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
>  	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
>  	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
>  
>  # Cuda stuff
>  OPENCV_CONF_OPTS += \
>  	-DWITH_CUBLAS=OFF \
> -	-DWITH_CUDA=OFF   \
> +	-DWITH_CUDA=OFF \
>  	-DWITH_CUFFT=OFF
>  
>  # NVidia stuff
> @@ -98,7 +98,7 @@
>  # Intel stuff
>  OPENCV_CONF_OPTS += \
>  	-DWITH_INTELPERC=OFF \
> -	-DWITH_IPP=OFF       \
> +	-DWITH_IPP=OFF \
>  	-DWITH_TBB=OFF
>  
>  # Smartek stuff
> @@ -112,53 +112,53 @@
>  
>  # Non-Linux support (Android options) must remain OFF:
>  OPENCV_CONF_OPTS += \
> -	-DWITH_ANDROID_CAMERA=OFF          \
> +	-DWITH_ANDROID_CAMERA=OFF \
>  	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
> -	-DBUILD_ANDROID_EXAMPLES=OFF	   \
> -	-DINSTALL_ANDROID_EXAMPLES=OFF     \
> -	-DBUILD_FAT_JAVA_LIB=OFF           \
> +	-DBUILD_ANDROID_EXAMPLES=OFF \
> +	-DINSTALL_ANDROID_EXAMPLES=OFF \
> +	-DBUILD_FAT_JAVA_LIB=OFF \
>  	-DBUILD_JAVA_SUPPORT=OFF
>  
>  # Non-Linux support (Mac OSX options) must remain OFF:
>  OPENCV_CONF_OPTS += \
> -	-DWITH_AVFOUNDATION=OFF	\
> -	-DWITH_CARBON=OFF       \
> +	-DWITH_AVFOUNDATION=OFF \
> +	-DWITH_CARBON=OFF \
>  	-DWITH_QUICKTIME=OFF
>  
>  # Non-Linux support (Windows options) must remain OFF:
>  OPENCV_CONF_OPTS += \
> -	-DWITH_VFW=OFF      \
> -	-DWITH_WIN32UI=OFF  \
> +	-DWITH_VFW=OFF \
> +	-DWITH_WIN32UI=OFF \
>  	-DWITH_CSTRIPES=OFF \
> -	-DWITH_DSHOW=OFF    \
> -	-DWITH_MSMF=OFF     \
> +	-DWITH_DSHOW=OFF \
> +	-DWITH_MSMF=OFF \
>  	-DWITH_VIDEOINPUT=OFF
>  
>  # Software/3rd-party support options.
>  OPENCV_CONF_OPTS += \
> -	-DBUILD_JASPER=OFF  \
> -	-DBUILD_JPEG=OFF    \
> +	-DBUILD_JASPER=OFF \
> +	-DBUILD_JPEG=OFF \
>  	-DBUILD_OPENEXR=OFF \
> -	-DBUILD_PNG=OFF	    \
> -	-DBUILD_TIFF=OFF    \
> -	-DBUILD_ZLIB=OFF    \
> +	-DBUILD_PNG=OFF \
> +	-DBUILD_TIFF=OFF \
> +	-DBUILD_ZLIB=OFF \
>  	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
> -	-DINSTALL_C_EXAMPLES=OFF       \
> -	-DINSTALL_PYTHON_EXAMPLES=OFF  \
> +	-DINSTALL_C_EXAMPLES=OFF \
> +	-DINSTALL_PYTHON_EXAMPLES=OFF \
>  	-DINSTALL_TO_MANGLED_PATHS=OFF
>  
>  # Disabled features (mostly because they are not available in Buildroot), but
>  # - eigen: OpenCV does not use it, not take any benefit from it.
>  OPENCV_CONF_OPTS += \
> -	-DWITH_1394=OFF    \
> -	-DWITH_EIGEN=OFF   \
> +	-DWITH_1394=OFF \
> +	-DWITH_EIGEN=OFF \
>  	-DWITH_IMAGEIO=OFF \
> -	-DWITH_OPENCL=OFF  \
> +	-DWITH_OPENCL=OFF \
>  	-DWITH_OPENEXR=OFF \
> -	-DWITH_OPENGL=OFF  \
> -	-DWITH_OPENMP=OFF  \
> -	-DWITH_OPENNI=OFF  \
> -	-DWITH_UNICAP=OFF  \
> +	-DWITH_OPENGL=OFF \
> +	-DWITH_OPENMP=OFF \
> +	-DWITH_OPENNI=OFF \
> +	-DWITH_UNICAP=OFF \
>  	-DWITH_XINE=OFF
>  
>  OPENCV_DEPENDENCIES += zlib
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -35,11 +35,11 @@
>  
>  HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
>  
> -HOST_OPENOCD_CONF_OPTS = 	\
> -	--disable-doxygen-html 	\
> -	--enable-dummy 		\
> +HOST_OPENOCD_CONF_OPTS = \
> +	--disable-doxygen-html \
> +	--enable-dummy \
>  	--enable-ft2232_libftdi \
> -	--enable-jlink 		\
> +	--enable-jlink \
>  	--enable-vsllink
>  
>  $(eval $(autotools-package))
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -49,8 +49,8 @@
>  
>  # Time steps
>  define step_time
> -	printf "%s:%-5.5s:%-20.20s: %s\n"           \
> -	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
> +	printf "%s:%-5.5s:%-20.20s: %s\n" \
> +	       "$$(date +%s)" "$(1)" "$(2)" "$(3)" \
>  	       >>"$(BUILD_DIR)/build-time.log"
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -12,22 +12,22 @@
>  POCO_LICENSE_FILES = LICENSE
>  POCO_INSTALL_STAGING = YES
>  
> -POCO_DEPENDENCIES = zlib pcre					\
> -	$(if $(BR2_PACKAGE_POCO_XML),expat)			\
> -	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl)		\
> -	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl)	\
> -	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite)		\
> +POCO_DEPENDENCIES = zlib pcre \
> +	$(if $(BR2_PACKAGE_POCO_XML),expat) \
> +	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
> +	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
> +	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
>  	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
>  
> -POCO_OMIT = Data/ODBC PageCompiler					\
> -	$(if $(BR2_PACKAGE_POCO_XML),,XML)				\
> -	$(if $(BR2_PACKAGE_POCO_UTIL),,Util)				\
> -	$(if $(BR2_PACKAGE_POCO_NET),,Net)				\
> -	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL)	\
> -	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto)			\
> -	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)				\
> -	$(if $(BR2_PACKAGE_POCO_DATA),,Data)				\
> -	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL)		\
> +POCO_OMIT = Data/ODBC PageCompiler \
> +	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
> +	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
> +	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
> +	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
> +	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
> +	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip) \
> +	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
> +	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
>  	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
>  
>  ifeq ($(LIBC),uclibc)
> @@ -41,12 +41,12 @@
>  
>  define POCO_CONFIGURE_CMDS
>  	(cd $(@D); ./configure \
> -		--config=Linux-CrossEnv	\
> -		--prefix=/usr		\
> -		--omit="$(POCO_OMIT)"	\
> -		$(POCO_CONF_OPTS)	\
> -		--unbundled		\
> -		--no-tests		\
> +		--config=Linux-CrossEnv \
> +		--prefix=/usr \
> +		--omit="$(POCO_OMIT)" \
> +		$(POCO_CONF_OPTS) \
> +		--unbundled \
> +		--no-tests \
>  		--no-samples)
>  endef
>  
> diff --git a/package/python/python.mk b/package/python/python.mk
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -16,22 +16,22 @@
>  # also installed in $(HOST_DIR), as it is needed when cross-compiling
>  # third-party Python modules.
>  
> -HOST_PYTHON_CONF_OPTS += 	\
> -	--enable-static		\
> -	--without-cxx-main 	\
> -	--disable-sqlite3	\
> -	--disable-tk		\
> -	--with-expat=system	\
> -	--disable-curses	\
> -	--disable-codecs-cjk	\
> -	--disable-nis		\
> -	--enable-unicodedata	\
> -	--disable-dbm		\
> -	--disable-gdbm		\
> -	--disable-bsddb		\
> -	--disable-test-modules	\
> -	--disable-bz2		\
> -	--disable-ssl		\
> +HOST_PYTHON_CONF_OPTS += \
> +	--enable-static \
> +	--without-cxx-main \
> +	--disable-sqlite3 \
> +	--disable-tk \
> +	--with-expat=system \
> +	--disable-curses \
> +	--disable-codecs-cjk \
> +	--disable-nis \
> +	--enable-unicodedata \
> +	--disable-dbm \
> +	--disable-gdbm \
> +	--disable-bsddb \
> +	--disable-test-modules \
> +	--disable-bz2 \
> +	--disable-ssl \
>  	--disable-pyo-build
>  
>  # Make sure that LD_LIBRARY_PATH overrides -rpath.
> @@ -125,16 +125,16 @@
>  	ac_cv_working_tzset=yes
>  
>  PYTHON_CONF_OPTS += \
> -	--without-cxx-main 	\
> -	--without-doc-strings	\
> -	--with-system-ffi	\
> -	--disable-pydoc		\
> -	--disable-test-modules	\
> -	--disable-lib2to3	\
> -	--disable-gdbm		\
> -	--disable-tk		\
> -	--disable-nis		\
> -	--disable-dbm		\
> +	--without-cxx-main \
> +	--without-doc-strings \
> +	--with-system-ffi \
> +	--disable-pydoc \
> +	--disable-test-modules \
> +	--disable-lib2to3 \
> +	--disable-gdbm \
> +	--disable-tk \
> +	--disable-nis \
> +	--disable-dbm \
>  	--disable-pyo-build
>  
>  # This is needed to make sure the Python build process doesn't try to
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -17,18 +17,18 @@
>  # installed in $(HOST_DIR), as it is needed when cross-compiling
>  # third-party Python modules.
>  
> -HOST_PYTHON3_CONF_OPTS += 	\
> -	--without-ensurepip	\
> -	--without-cxx-main 	\
> -	--disable-sqlite3	\
> -	--disable-tk		\
> -	--with-expat=system	\
> -	--disable-curses	\
> -	--disable-codecs-cjk	\
> -	--disable-nis		\
> -	--enable-unicodedata	\
> -	--disable-test-modules	\
> -	--disable-idle3		\
> +HOST_PYTHON3_CONF_OPTS += \
> +	--without-ensurepip \
> +	--without-cxx-main \
> +	--disable-sqlite3 \
> +	--disable-tk \
> +	--with-expat=system \
> +	--disable-curses \
> +	--disable-codecs-cjk \
> +	--disable-nis \
> +	--enable-unicodedata \
> +	--disable-test-modules \
> +	--disable-idle3 \
>  	--disable-pyo-build
>  
>  # Make sure that LD_LIBRARY_PATH overrides -rpath.
> @@ -108,15 +108,15 @@
>  	ac_cv_working_tzset=yes
>  
>  PYTHON3_CONF_OPTS += \
> -	--without-ensurepip	\
> -	--without-cxx-main 	\
> -	--with-system-ffi	\
> -	--disable-pydoc		\
> -	--disable-test-modules	\
> -	--disable-lib2to3	\
> -	--disable-tk		\
> -	--disable-nis		\
> -	--disable-idle3		\
> +	--without-ensurepip \
> +	--without-cxx-main \
> +	--with-system-ffi \
> +	--disable-pydoc \
> +	--disable-test-modules \
> +	--disable-lib2to3 \
> +	--disable-tk \
> +	--disable-nis \
> +	--disable-idle3 \
>  	--disable-pyo-build
>  
>  # This is needed to make sure the Python build process doesn't try to
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -63,14 +63,14 @@
>  # package, and ./configure chokes on options such as --host or --target.
>  # So, provide out own _CONFIGURE_CMDS to override the defaults.
>  define HOST_QEMU_CONFIGURE_CMDS
> -	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure   \
> -		--target-list="$(HOST_QEMU_TARGETS)"    \
> -		--prefix="$(HOST_DIR)/usr"              \
> -		--interp-prefix=$(STAGING_DIR)          \
> -		--cc="$(HOSTCC)"                        \
> -		--host-cc="$(HOSTCC)"                   \
> -		--extra-cflags="$(HOST_CFLAGS)"         \
> -		--extra-ldflags="$(HOST_LDFLAGS)"       \
> +	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure \
> +		--target-list="$(HOST_QEMU_TARGETS)" \
> +		--prefix="$(HOST_DIR)/usr" \
> +		--interp-prefix=$(STAGING_DIR) \
> +		--cc="$(HOSTCC)" \
> +		--host-cc="$(HOSTCC)" \
> +		--extra-cflags="$(HOST_CFLAGS)" \
> +		--extra-ldflags="$(HOST_LDFLAGS)" \
>  	)
>  endef
>  
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -15,16 +15,16 @@
>  endif
>  
>  define RT_TESTS_BUILD_CMDS
> -	$(MAKE) -C $(@D) 			\
> -		CC="$(TARGET_CC)" 		\
> -		CFLAGS="$(TARGET_CFLAGS)"	\
> +	$(MAKE) -C $(@D) \
> +		CC="$(TARGET_CC)" \
> +		CFLAGS="$(TARGET_CFLAGS)" \
>  		prefix=/usr
>  endef
>  
>  define RT_TESTS_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) 				\
> -		DESTDIR="$(TARGET_DIR)" 		\
> -		prefix=/usr 				\
> +	$(MAKE) -C $(@D) \
> +		DESTDIR="$(TARGET_DIR)" \
> +		prefix=/usr \
>  		$(if $(BR2_PACKAGE_PYTHON),HASPYTHON=1 PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/) \
>  		install
>  endef
> diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> --- a/package/rtai/rtai.mk
> +++ b/package/rtai/rtai.mk
> @@ -20,9 +20,9 @@
>  
>  RTAI_CONF_OPTS = \
>  	--includedir=/usr/include/rtai \
> -	--with-linux-dir=$(LINUX_DIR) 	\
> -	--disable-leds		      	\
> -	--disable-rtailab		\
> +	--with-linux-dir=$(LINUX_DIR) \
> +	--disable-leds \
> +	--disable-rtailab \
>  	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
>  
>  RTAI_MAKE = $(MAKE1)
> diff --git a/package/samba/samba.mk b/package/samba/samba.mk
> --- a/package/samba/samba.mk
> +++ b/package/samba/samba.mk
> @@ -38,24 +38,24 @@
>  	--with-logfilebase=/var/log \
>  	--with-configdir=/etc/samba \
>  	--with-privatedir=/etc/samba \
> -	\
> + \
>  	--disable-cups \
>  	--enable-shared-libs \
>  	--disable-pie \
>  	--disable-relro \
>  	--disable-dnssd \
> -	\
> + \
>  	$(if $(BR2_PACKAGE_SAMBA_AVAHI),--enable-avahi,--disable-avahi) \
>  	$(if $(BR2_PACKAGE_SAMBA_GAMIN),--enable-fam,--disable-fam) \
>  	$(if $(BR2_PACKAGE_SAMBA_SWAT),--enable-swat,--disable-swat) \
> -	\
> + \
>  	--without-cluster-support \
>  	--without-dnsupdate \
>  	--with-sys-quotas \
>  	--without-ads \
>  	--without-ldap \
>  	--with-included-iniparser \
> -	\
> + \
>  	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR)) \
>  	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR)) \
>  	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
> diff --git a/package/spice/spice.mk b/package/spice/spice.mk
> --- a/package/spice/spice.mk
> +++ b/package/spice/spice.mk
> @@ -11,21 +11,21 @@
>  SPICE_LICENSE_FILES   = COPYING
>  SPICE_INSTALL_STAGING = YES
>  SPICE_DEPENDENCIES    = \
> -    alsa-lib            \
> -    celt051             \
> -    jpeg                \
> -    openssl             \
> -    pixman              \
> -    python-pyparsing    \
> -    spice-protocol      \
> +    alsa-lib \
> +    celt051 \
> +    jpeg \
> +    openssl \
> +    pixman \
> +    python-pyparsing \
> +    spice-protocol \
>  
>  # We disable everything for now, because the dependency tree can become
>  # quite deep if we try to enable some features, and I have not tested that.
> -SPICE_CONF_OPTS =            \
> -  --disable-opengl          \
> -  --disable-smartcard       \
> +SPICE_CONF_OPTS = \
> +  --disable-opengl \
> +  --disable-smartcard \
>    --disable-automated-tests \
> -  --without-sasl            \
> +  --without-sasl \
>  
>  SPICE_DEPENDENCIES += host-pkgconf
>  
> @@ -57,7 +57,7 @@
>  # it should link against libz and libjpeg. libz is pkg-config-aware, while
>  # libjpeg isn't, hence the two-line tweak
>  define SPICE_POST_INSTALL_STAGING_FIX_PC
> -	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;'    \
> +	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;' \
>  	       "$(STAGING_DIR)/usr/lib/pkgconfig/spice-server.pc"
>  endef
>  SPICE_POST_INSTALL_STAGING_HOOKS += SPICE_POST_INSTALL_STAGING_FIX_PC
> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -53,16 +53,16 @@
>  # no libattr/xz in BR
>  HOST_SQUASHFS_MAKE_ARGS = \
>  	XATTR_SUPPORT=0 \
> -	XZ_SUPPORT=1    \
> -	GZIP_SUPPORT=1  \
> -	LZ4_SUPPORT=1	\
> -	LZO_SUPPORT=1	\
> +	XZ_SUPPORT=1 \
> +	GZIP_SUPPORT=1 \
> +	LZ4_SUPPORT=1 \
> +	LZO_SUPPORT=1 \
>  	LZMA_XZ_SUPPORT=1
>  
>  define SQUASHFS_BUILD_CMDS
> - $(TARGET_MAKE_ENV) $(MAKE)    \
> -   CC="$(TARGET_CC)"           \
> -   EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
> + $(TARGET_MAKE_ENV) $(MAKE) \
> +   CC="$(TARGET_CC)" \
> +   EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
>     EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
>     $(SQUASHFS_MAKE_ARGS) \
>     -C $(@D)/squashfs-tools/
> @@ -76,7 +76,7 @@
>  define HOST_SQUASHFS_BUILD_CMDS
>   $(HOST_MAKE_ENV) $(MAKE) \
>     CC="$(HOSTCC)" \
> -   EXTRA_CFLAGS="$(HOST_CFLAGS)"   \
> +   EXTRA_CFLAGS="$(HOST_CFLAGS)" \
>     EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
>     $(HOST_SQUASHFS_MAKE_ARGS) \
>     -C $(@D)/squashfs-tools/
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -10,60 +10,60 @@
>  STRONGSWAN_LICENSE = GPLv2+
>  STRONGSWAN_LICENSE_FILES = COPYING LICENSE
>  STRONGSWAN_DEPENDENCIES = host-pkgconf
> -STRONGSWAN_CONF_OPTS +=                                                             \
> -      --without-lib-prefix                                                         \
> -      --enable-pkcs11=yes                                                          \
> -      --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
> -      --enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
> -      --enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no)              \
> -      --enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no)                \
> -      --enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no)                      \
> -      --enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no)                \
> -      --enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no)                    \
> -      --enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no)                \
> -      --enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no)            \
> -      --enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no)            \
> -      --enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no)  \
> -      --enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no)    \
> -      --enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no)                  \
> -      --enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no)                \
> -      --enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no)                      \
> -      --enable-tools=$(if $(BR2_PACKAGE_STRONGSWAN_TOOLS),yes,no)                  \
> +STRONGSWAN_CONF_OPTS += \
> +      --without-lib-prefix \
> +      --enable-pkcs11=yes \
> +      --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no) \
> +      --enable-socket-default=$(if $(BR2_INET_IPV6),yes,no) \
> +      --enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
> +      --enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no) \
> +      --enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no) \
> +      --enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no) \
> +      --enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no) \
> +      --enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no) \
> +      --enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no) \
> +      --enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no) \
> +      --enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no) \
> +      --enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no) \
> +      --enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no) \
> +      --enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no) \
> +      --enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no) \
> +      --enable-tools=$(if $(BR2_PACKAGE_STRONGSWAN_TOOLS),yes,no) \
>        --enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)
>  
>  ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
> -STRONGSWAN_CONF_OPTS +=              \
> -      --enable-eap-sim              \
> -      --enable-eap-sim-file         \
> -      --enable-eap-aka              \
> -      --enable-eap-aka-3gpp2        \
> -      --enable-eap-simaka-sql       \
> +STRONGSWAN_CONF_OPTS += \
> +      --enable-eap-sim \
> +      --enable-eap-sim-file \
> +      --enable-eap-aka \
> +      --enable-eap-aka-3gpp2 \
> +      --enable-eap-simaka-sql \
>        --enable-eap-simaka-pseudonym \
> -      --enable-eap-simaka-reauth    \
> -      --enable-eap-identity         \
> -      --enable-eap-md5              \
> -      --enable-eap-gtc              \
> -      --enable-eap-mschapv2         \
> -      --enable-eap-tls              \
> -      --enable-eap-ttls             \
> -      --enable-eap-peap             \
> -      --enable-eap-tnc              \
> -      --enable-eap-dynamic          \
> +      --enable-eap-simaka-reauth \
> +      --enable-eap-identity \
> +      --enable-eap-md5 \
> +      --enable-eap-gtc \
> +      --enable-eap-mschapv2 \
> +      --enable-eap-tls \
> +      --enable-eap-ttls \
> +      --enable-eap-peap \
> +      --enable-eap-tnc \
> +      --enable-eap-dynamic \
>        --enable-eap-radius
>  STRONGSWAN_DEPENDENCIES += gmp
>  endif
>  
> -STRONGSWAN_DEPENDENCIES +=                               \
> -      $(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl)    \
> -      $(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt)   \
> -      $(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp)            \
> -      $(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl)       \
> -      $(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2)   \
> +STRONGSWAN_DEPENDENCIES += \
> +      $(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
> +      $(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
> +      $(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
> +      $(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
> +      $(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
>        $(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite)
>  
>  ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
> -STRONGSWAN_DEPENDENCIES +=                               \
> -      $(if $(BR2_PACKAGE_SQLITE),sqlite)                 \
> +STRONGSWAN_DEPENDENCIES += \
> +      $(if $(BR2_PACKAGE_SQLITE),sqlite) \
>        $(if $(BR2_PACKAGE_MYSQL),mysql)
>  endif
>  
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -85,15 +85,15 @@
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
>  SYSTEMD_DEPENDENCIES += \
> -	xz 		\
> +	xz \
>  	libgcrypt
> -SYSTEMD_CONF_OPTS += 	\
> -	--enable-xz 	\
> -	--enable-gcrypt	\
> +SYSTEMD_CONF_OPTS += \
> +	--enable-xz \
> +	--enable-gcrypt \
>  	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
>  else
> -SYSTEMD_CONF_OPTS += 	\
> -	--disable-xz 	\
> +SYSTEMD_CONF_OPTS += \
> +	--disable-xz \
>  	--disable-gcrypt
>  endif
>  
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -21,15 +21,15 @@
>  TVHEADEND_DEPENDENCIES += dtv-scan-tables
>  
>  define TVHEADEND_CONFIGURE_CMDS
> -	(cd $(@D);				\
> -	 $(TARGET_CONFIGURE_OPTS)		\
> -	 $(TARGET_CONFIGURE_ARGS)		\
> -	 ./configure				\
> -	 --prefix=/usr				\
> -	 --arch="$(ARCH)"			\
> -	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
> -	 --python="$(HOST_DIR)/usr/bin/python"	\
> -	 --disable-dvbscan			\
> +	(cd $(@D); \
> +	 $(TARGET_CONFIGURE_OPTS) \
> +	 $(TARGET_CONFIGURE_ARGS) \
> +	 ./configure \
> +	 --prefix=/usr \
> +	 --arch="$(ARCH)" \
> +	 --cpu="$(BR2_GCC_TARGET_CPU)" \
> +	 --python="$(HOST_DIR)/usr/bin/python" \
> +	 --disable-dvbscan \
>  	)
>  endef
>  
> @@ -47,7 +47,7 @@
>  #  - a default DB with a tvheadend admin
>  #  - a non-root user to run as
>  define TVHEADEND_INSTALL_DB
> -	$(INSTALL) -D -m 0600 package/tvheadend/accesscontrol.1     \
> +	$(INSTALL) -D -m 0600 package/tvheadend/accesscontrol.1 \
>  	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
>  	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
>  endef
> diff --git a/package/tz/tz.mk b/package/tz/tz.mk
> --- a/package/tz/tz.mk
> +++ b/package/tz/tz.mk
> @@ -11,11 +11,11 @@
>  TZ_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
>  
>  define TZ_BUILD_CMDS
> -	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
> -		for i in $$(find . -type f); do                    \
> -			mkdir -p $(@D)/output/$$(dirname $$i);         \
> +	(cd $(HOST_DIR)/usr/share/zoneinfo/posix/; \
> +		for i in $$(find . -type f); do \
> +			mkdir -p $(@D)/output/$$(dirname $$i); \
>  			$(TZDUMP) -p . -q $${i#./} > $(@D)/output/$$i; \
> -		done                                               \
> +		done \
>  	)
>  endef
>  
> @@ -26,13 +26,13 @@
>  			      $(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
>  	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
>  	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
> -	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
> +	if [ -n "$(TZ_LOCALTIME)" ]; then \
>  	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
>  	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
> -	               "$(TZDATA_LOCALTIME)";                           \
> -	        exit 1;                                                 \
> -	    fi;                                                         \
> -	    cd $(TARGET_DIR)/etc;                                       \
> +	               "$(TZDATA_LOCALTIME)"; \
> +	        exit 1; \
> +	    fi; \
> +	    cd $(TARGET_DIR)/etc; \
>  	    ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
>  	fi
>  endef
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -28,19 +28,19 @@
>  define TZDATA_INSTALL_TARGET_CMDS
>  	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share
>  	cp -a $(HOST_DIR)/usr/share/zoneinfo $(TARGET_DIR)/usr/share/zoneinfo
> -	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
> -	for zone in posix/*; do                 \
> -	    ln -sfn "$${zone}" "$${zone##*/}";  \
> +	cd $(TARGET_DIR)/usr/share/zoneinfo; \
> +	for zone in posix/*; do \
> +	    ln -sfn "$${zone}" "$${zone##*/}"; \
>  	done
> -	if [ -n "$(TZDATA_LOCALTIME)" ]; then                           \
> +	if [ -n "$(TZDATA_LOCALTIME)" ]; then \
>  	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/$(TZDATA_LOCALTIME) ]; then \
>  	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
> -	               "$(TZDATA_LOCALTIME)";                           \
> -	        exit 1;                                                 \
> -	    fi;                                                         \
> -	    cd $(TARGET_DIR)/etc;                                       \
> +	               "$(TZDATA_LOCALTIME)"; \
> +	        exit 1; \
> +	    fi; \
> +	    cd $(TARGET_DIR)/etc; \
>  	    ln -sf ../usr/share/zoneinfo/$(TZDATA_LOCALTIME) localtime; \
> -	    echo "$(TZDATA_LOCALTIME)" >timezone;                       \
> +	    echo "$(TZDATA_LOCALTIME)" >timezone; \
>  	fi
>  endef
>  
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -11,16 +11,16 @@
>  UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
>  
>  define UBOOT_TOOLS_BUILD_CMDS
> -	$(MAKE) -C $(@D) 			\
> -		CROSS_COMPILE="$(TARGET_CROSS)"	\
> -		CFLAGS="$(TARGET_CFLAGS)"	\
> -		LDFLAGS="$(TARGET_LDFLAGS)"	\
> -		CROSS_BUILD_TOOLS=y		\
> +	$(MAKE) -C $(@D) \
> +		CROSS_COMPILE="$(TARGET_CROSS)" \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		CROSS_BUILD_TOOLS=y \
>  		tools-only
> -	$(MAKE) -C $(@D) 			\
> -		CROSS_COMPILE="$(TARGET_CROSS)"	\
> -		CFLAGS="$(TARGET_CFLAGS)"	\
> -		LDFLAGS="$(TARGET_LDFLAGS)"	\
> +	$(MAKE) -C $(@D) \
> +		CROSS_COMPILE="$(TARGET_CROSS)" \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		env no-dot-config-targets=env
>  endef
>  
> @@ -50,10 +50,10 @@
>  endef
>  
>  define HOST_UBOOT_TOOLS_BUILD_CMDS
> -	$(MAKE1) -C $(@D) 			\
> -		HOSTCC="$(HOSTCC)"		\
> -		HOSTCFLAGS="$(HOST_CFLAGS)"	\
> -		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
> +	$(MAKE1) -C $(@D) \
> +		HOSTCC="$(HOSTCC)" \
> +		HOSTCFLAGS="$(HOST_CFLAGS)" \
> +		HOSTLDFLAGS="$(HOST_LDFLAGS)" \
>  		tools-only
>  endef
>  
> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
> --- a/package/udisks/udisks.mk
> +++ b/package/udisks/udisks.mk
> @@ -9,15 +9,15 @@
>  UDISKS_LICENSE = GPLv2+
>  UDISKS_LICENSE_FILES = COPYING
>  
> -UDISKS_DEPENDENCIES = 	\
> -	sg3_utils	\
> -	host-pkgconf	\
> -	udev		\
> -	dbus		\
> -	dbus-glib	\
> -	polkit		\
> -	parted		\
> -	lvm2		\
> +UDISKS_DEPENDENCIES = \
> +	sg3_utils \
> +	host-pkgconf \
> +	udev \
> +	dbus \
> +	dbus-glib \
> +	polkit \
> +	parted \
> +	lvm2 \
>  	libatasmart
>  
>  UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
> diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
> --- a/package/usbmount/usbmount.mk
> +++ b/package/usbmount/usbmount.mk
> @@ -14,9 +14,9 @@
>  define USBMOUNT_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
>  
> -	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink 	\
> +	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink \
>  		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_create_model_symlink
> -	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
> +	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink \
>  		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
>  
>  	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
> diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
> --- a/package/vde2/vde2.mk
> +++ b/package/vde2/vde2.mk
> @@ -25,13 +25,13 @@
>  #
>  # Note: disabled features can be added with corresponding dependencies
>  #       in future commits.
> -VDE2_CONF_OPTS = --disable-experimental  \
> -                --disable-cryptcab      \
> -                --disable-pcap          \
> -                --disable-python        \
> -                --disable-profile       \
> +VDE2_CONF_OPTS = --disable-experimental \
> +                --disable-cryptcab \
> +                --disable-pcap \
> +                --disable-python \
> +                --disable-profile \
>                  --disable-kernel-switch \
> -                --enable-tuntap         \
> +                --enable-tuntap \
>  
>  #?Package does not build in parallel due to improper make rules
>  VDE2_MAKE = $(MAKE1)
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -20,10 +20,10 @@
>  WPA_SUPPLICANT_CONFIG_SET =
>  
>  WPA_SUPPLICANT_CONFIG_ENABLE = \
> -	CONFIG_ELOOP_EPOLL	\
> -	CONFIG_IEEE80211AC	\
> -	CONFIG_IEEE80211N	\
> -	CONFIG_IEEE80211R	\
> +	CONFIG_ELOOP_EPOLL \
> +	CONFIG_IEEE80211AC \
> +	CONFIG_IEEE80211N \
> +	CONFIG_IEEE80211R \
>  	CONFIG_INTERNAL_LIBTOMMATH
>  
>  WPA_SUPPLICANT_CONFIG_DISABLE = \
> @@ -77,7 +77,7 @@
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
>  	WPA_SUPPLICANT_MAKE_ENV = \
> -		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
> +		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>  		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>  
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -10,48 +10,48 @@
>  XSERVER_XORG_SERVER_LICENSE = MIT
>  XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
>  XSERVER_XORG_SERVER_INSTALL_STAGING = YES
> -XSERVER_XORG_SERVER_DEPENDENCIES = 	\
> -	xutil_util-macros 		\
> -	xlib_libXfont 			\
> -	xlib_libX11 			\
> -	xlib_libXau 			\
> -	xlib_libXdmcp 			\
> -	xlib_libXext 			\
> -	xlib_libXfixes 			\
> -	xlib_libXi 			\
> -	xlib_libXrender 		\
> -	xlib_libXres 			\
> -	xlib_libXft 			\
> -	xlib_libXcursor 		\
> -	xlib_libXinerama 		\
> -	xlib_libXrandr 			\
> -	xlib_libXdamage 		\
> -	xlib_libXxf86vm 		\
> -	xlib_libxkbfile 		\
> -	xlib_xtrans 			\
> -	xdata_xbitmaps 			\
> -	xproto_bigreqsproto 		\
> -	xproto_compositeproto 		\
> -	xproto_damageproto 		\
> -	xproto_fixesproto 		\
> -	xproto_fontsproto 		\
> -	xproto_glproto 			\
> -	xproto_inputproto 		\
> -	xproto_kbproto 			\
> -	xproto_presentproto 		\
> -	xproto_randrproto 		\
> -	xproto_renderproto 		\
> -	xproto_resourceproto 		\
> -	xproto_videoproto 		\
> -	xproto_xcmiscproto 		\
> -	xproto_xextproto 		\
> -	xproto_xf86bigfontproto 	\
> -	xproto_xf86dgaproto 		\
> -	xproto_xf86vidmodeproto 	\
> -	xproto_xproto 			\
> -	xkeyboard-config		\
> -	pixman 				\
> -	mcookie 			\
> +XSERVER_XORG_SERVER_DEPENDENCIES = \
> +	xutil_util-macros \
> +	xlib_libXfont \
> +	xlib_libX11 \
> +	xlib_libXau \
> +	xlib_libXdmcp \
> +	xlib_libXext \
> +	xlib_libXfixes \
> +	xlib_libXi \
> +	xlib_libXrender \
> +	xlib_libXres \
> +	xlib_libXft \
> +	xlib_libXcursor \
> +	xlib_libXinerama \
> +	xlib_libXrandr \
> +	xlib_libXdamage \
> +	xlib_libXxf86vm \
> +	xlib_libxkbfile \
> +	xlib_xtrans \
> +	xdata_xbitmaps \
> +	xproto_bigreqsproto \
> +	xproto_compositeproto \
> +	xproto_damageproto \
> +	xproto_fixesproto \
> +	xproto_fontsproto \
> +	xproto_glproto \
> +	xproto_inputproto \
> +	xproto_kbproto \
> +	xproto_presentproto \
> +	xproto_randrproto \
> +	xproto_renderproto \
> +	xproto_resourceproto \
> +	xproto_videoproto \
> +	xproto_xcmiscproto \
> +	xproto_xextproto \
> +	xproto_xf86bigfontproto \
> +	xproto_xf86dgaproto \
> +	xproto_xf86vidmodeproto \
> +	xproto_xproto \
> +	xkeyboard-config \
> +	pixman \
> +	mcookie \
>  	host-pkgconf
>  
>  XSERVER_XORG_SERVER_CONF_OPTS = --disable-config-hal \
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -39,7 +39,7 @@
>  	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
>  	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>  
> -XBMC_CONF_OPTS +=  \
> +XBMC_CONF_OPTS += \
>  	--with-arch=$(BR2_ARCH) \
>  	--disable-crystalhd \
>  	--disable-debug \

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
