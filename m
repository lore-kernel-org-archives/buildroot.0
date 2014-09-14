From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:08:39 +0200
Subject: [Buildroot] [PATCH 02 of 20] packages: rename FOO_MAKE_OPT into
	FOO_MAKE_OPTS
In-Reply-To: <7372c704f6a92f9ac9ec.1406668349@localhost>
References: <patchbomb.1406668347@localhost>
 <7372c704f6a92f9ac9ec.1406668349@localhost>
Message-ID: <20140914140839.GD3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> While the autotools infrastructure was using FOO_MAKE_OPT, generic packages
> were typically using FOO_MAKE_OPTS. This inconsistency becomes a problem
> when a new infrastructure is introduced that wants to make use of
> FOO_MAKE_OPT(S), and can live alongside either generic-package or
> autotools-package. The new infrastructure will have to choose between either
> OPT or OPTS, and thus rule out transparent usage by respectively generic
> packages or generic packages. An example of such an infrastructure is
> kconfig-package, which provides kconfig-related make targets.
> 
> The OPTS variant is more logical, as there are typically multiple options.
> 
> This patch renames all occurrences of FOO_MAKE_OPT in FOO_MAKE_OPTS.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Pfeww... That's not easy to review... :-p

Regards,
Yann E. MORIN.

> ---
>  boot/at91bootstrap3/at91bootstrap3.mk            |   4 ++--
>  docs/manual/adding-packages-autotools.txt        |   2 +-
>  docs/manual/adding-packages-cmake.txt            |   2 +-
>  package/avahi/avahi.mk                           |   2 +-
>  package/dnsmasq/dnsmasq.mk                       |  12 ++++++------
>  package/e2fsprogs/e2fsprogs.mk                   |   2 +-
>  package/faifa/faifa.mk                           |   2 +-
>  package/freetype/freetype.mk                     |   2 +-
>  package/gcc/gcc-initial/gcc-initial.mk           |   2 +-
>  package/gcc/gcc-intermediate/gcc-intermediate.mk |   4 ++--
>  package/httping/httping.mk                       |   6 +++---
>  package/ipsec-tools/ipsec-tools.mk               |   2 +-
>  package/iputils/iputils.mk                       |   6 +++---
>  package/iw/iw.mk                                 |   6 +++---
>  package/libdnet/libdnet.mk                       |   6 +++---
>  package/libjson/libjson.mk                       |  12 ++++++------
>  package/libseccomp/libseccomp.mk                 |   2 +-
>  package/linux-pam/linux-pam.mk                   |   2 +-
>  package/lm-sensors/lm-sensors.mk                 |  12 ++++++------
>  package/lshw/lshw.mk                             |   6 +++---
>  package/lvm2/lvm2.mk                             |   2 +-
>  package/mdadm/mdadm.mk                           |   2 +-
>  package/mii-diag/mii-diag.mk                     |   4 ++--
>  package/mpfr/mpfr.mk                             |   2 +-
>  package/openswan/openswan.mk                     |  12 ++++++------
>  package/pkg-autotools.mk                         |   6 +++---
>  package/pkg-cmake.mk                             |  12 ++++++------
>  package/pppd/pppd.mk                             |   8 ++++----
>  package/pv/pv.mk                                 |   2 +-
>  package/quota/quota.mk                           |   2 +-
>  package/rp-pppoe/rp-pppoe.mk                     |   2 +-
>  package/rubix/rubix.mk                           |   2 +-
>  package/schifra/schifra.mk                       |   4 ++--
>  package/sdl_ttf/sdl_ttf.mk                       |   2 +-
>  package/speex/speex.mk                           |   2 +-
>  package/sysstat/sysstat.mk                       |   2 +-
>  package/systemd/systemd.mk                       |   4 ++--
>  package/tn5250/tn5250.mk                         |   2 +-
>  package/util-linux/util-linux.mk                 |   2 +-
>  package/whois/whois.mk                           |   6 +++---
>  package/xinetd/xinetd.mk                         |   2 +-
>  package/zmqpp/zmqpp.mk                           |   8 ++++----
>  package/zxing/zxing.mk                           |   4 ++--
>  43 files changed, 94 insertions(+), 94 deletions(-)
> 
> diff -r 677354152366 -r 7372c704f6a9 boot/at91bootstrap3/at91bootstrap3.mk
> --- a/boot/at91bootstrap3/at91bootstrap3.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -17,7 +17,7 @@
>  AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
>  	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
>  
> -AT91BOOTSTRAP3_MAKE_OPT = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
> +AT91BOOTSTRAP3_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
>  
>  ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
>  define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
> @@ -41,7 +41,7 @@
>  endef
>  
>  define AT91BOOTSTRAP3_BUILD_CMDS
> -	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPT) -C $(@D) boot
> +	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) boot
>  endef
>  
>  define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> diff -r 677354152366 -r 7372c704f6a9 docs/manual/adding-packages-autotools.txt
> --- a/docs/manual/adding-packages-autotools.txt	Mon Jul 28 21:39:53 2014 +0200
> +++ b/docs/manual/adding-packages-autotools.txt	Mon Jul 28 21:19:08 2014 +0200
> @@ -111,7 +111,7 @@
>    variables to pass to make in the build step. These are passed before
>    the +make+ command. By default, empty.
>  
> -* +LIBFOO_MAKE_OPT+, to specify additional variables to
> +* +LIBFOO_MAKE_OPTS+, to specify additional variables to
>    pass to make in the build step. These are passed after the
>    +make+ command. By default, empty.
>  
> diff -r 677354152366 -r 7372c704f6a9 docs/manual/adding-packages-cmake.txt
> --- a/docs/manual/adding-packages-cmake.txt	Mon Jul 28 21:39:53 2014 +0200
> +++ b/docs/manual/adding-packages-cmake.txt	Mon Jul 28 21:19:08 2014 +0200
> @@ -108,7 +108,7 @@
>    pass to make in the build step. These are passed before the +make+
>    command. By default, empty.
>  
> -* +LIBFOO_MAKE_OPT+, to specify additional variables to pass to make
> +* +LIBFOO_MAKE_OPTS+, to specify additional variables to pass to make
>    in the build step. These are passed after the +make+ command. By
>    default, empty.
>  
> diff -r 677354152366 -r 7372c704f6a9 package/avahi/avahi.mk
> --- a/package/avahi/avahi.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/avahi/avahi.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -134,7 +134,7 @@
>  AVAHI_CONF_OPT += --disable-python
>  endif
>  
> -AVAHI_MAKE_OPT += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
> +AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
>  
>  define AVAHI_USERS
>  	avahi -1 avahi -1 * - - -
> diff -r 677354152366 -r 7372c704f6a9 package/dnsmasq/dnsmasq.mk
> --- a/package/dnsmasq/dnsmasq.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/dnsmasq/dnsmasq.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -8,8 +8,8 @@
>  DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
>  DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
>  DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
> -DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
> -DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
> +DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
> +DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
>  DNSMASQ_DEPENDENCIES = host-pkgconf
>  DNSMASQ_LICENSE = Dual GPLv2/GPLv3
>  DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
> @@ -37,7 +37,7 @@
>  # NLS requires IDN so only enable it (i18n) when IDN is true
>  ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
>  	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
> -	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
> +	DNSMASQ_MAKE_OPTS += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
>  	DNSMASQ_COPTS += -DHAVE_IDN
>  	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
>  endif
> @@ -58,7 +58,7 @@
>  
>  # liblua uses dlopen when dynamically linked
>  ifneq ($(BR2_PREFER_STATIC_LIB),y)
> -	DNSMASQ_MAKE_OPT += LIBS="-ldl"
> +	DNSMASQ_MAKE_OPTS += LIBS="-ldl"
>  endif
>  
>  define DNSMASQ_ENABLE_LUA
> @@ -98,11 +98,11 @@
>  	$(DNSMASQ_ENABLE_DBUS)
>  	$(DNSMASQ_ENABLE_LUA)
>  	$(DNSMASQ_ENABLE_CONNTRACK)
> -	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPT) all$(DNSMASQ_I18N)
> +	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
>  endef
>  
>  define DNSMASQ_INSTALL_TARGET_CMDS
> -	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install$(DNSMASQ_I18N)
> +	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) install$(DNSMASQ_I18N)
>  	mkdir -p $(TARGET_DIR)/var/lib/misc/
>  endef
>  
> diff -r 677354152366 -r 7372c704f6a9 package/e2fsprogs/e2fsprogs.mk
> --- a/package/e2fsprogs/e2fsprogs.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/e2fsprogs/e2fsprogs.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -31,7 +31,7 @@
>  
>  E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
>  
> -E2FSPROGS_MAKE_OPT = \
> +E2FSPROGS_MAKE_OPTS = \
>  	LDCONFIG=true
>  
>  define HOST_E2FSPROGS_INSTALL_CMDS
> diff -r 677354152366 -r 7372c704f6a9 package/faifa/faifa.mk
> --- a/package/faifa/faifa.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/faifa/faifa.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,7 +11,7 @@
>  FAIFA_LICENSE = BSD-3c
>  FAIFA_LICENSE_FILES = COPYING
>  
> -FAIFA_MAKE_OPT += GIT_REV=$(FAIFA_VERSION)
> +FAIFA_MAKE_OPTS += GIT_REV=$(FAIFA_VERSION)
>  
>  # This package uses autoconf, but not automake, so we need to call
>  # their special autogen.sh script, and have custom target and staging
> diff -r 677354152366 -r 7372c704f6a9 package/freetype/freetype.mk
> --- a/package/freetype/freetype.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/freetype/freetype.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -8,7 +8,7 @@
>  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
>  FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
>  FREETYPE_INSTALL_STAGING = YES
> -FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
> +FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
>  FREETYPE_LICENSE = Dual FTL/GPLv2+
>  FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
>  FREETYPE_DEPENDENCIES = host-pkgconf
> diff -r 677354152366 -r 7372c704f6a9 package/gcc/gcc-initial/gcc-initial.mk
> --- a/package/gcc/gcc-initial/gcc-initial.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/gcc/gcc-initial/gcc-initial.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -37,7 +37,7 @@
>  HOST_GCC_INITIAL_CONF_ENV = \
>  	$(HOST_GCC_COMMON_CONF_ENV)
>  
> -HOST_GCC_INITIAL_MAKE_OPT = all-gcc
> +HOST_GCC_INITIAL_MAKE_OPTS = all-gcc
>  HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
>  
>  $(eval $(host-autotools-package))
> diff -r 677354152366 -r 7372c704f6a9 package/gcc/gcc-intermediate/gcc-intermediate.mk
> --- a/package/gcc/gcc-intermediate/gcc-intermediate.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -36,9 +36,9 @@
>  HOST_GCC_INTERMEDIATE_CONF_ENV = \
>  	$(HOST_GCC_COMMON_CONF_ENV)
>  
> -HOST_GCC_INTERMEDIATE_MAKE_OPT = all-gcc
> +HOST_GCC_INTERMEDIATE_MAKE_OPTS = all-gcc
>  ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
> -HOST_GCC_INTERMEDIATE_MAKE_OPT += all-target-libgcc
> +HOST_GCC_INTERMEDIATE_MAKE_OPTS += all-target-libgcc
>  endif
>  
>  HOST_GCC_INTERMEDIATE_INSTALL_OPT = install-gcc
> diff -r 677354152366 -r 7372c704f6a9 package/httping/httping.mk
> --- a/package/httping/httping.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/httping/httping.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -17,19 +17,19 @@
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
>  	$(if $(BR2_PACKAGE_FFTW),fftw)
> -HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
> +HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
>  	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
>  	NC=no \
>  	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
>  	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
>  
>  define HTTPING_BUILD_CMDS
> -	$(HTTPING_MAKE_OPT) LDFLAGS="$(HTTPING_LDFLAGS)" \
> +	$(HTTPING_MAKE_OPTS) LDFLAGS="$(HTTPING_LDFLAGS)" \
>  		$(MAKE) DEBUG=no -C $(@D)
>  endef
>  
>  define HTTPING_INSTALL_TARGET_CMDS
> -	$(HTTPING_MAKE_OPT) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +	$(HTTPING_MAKE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
>  endef
>  
>  $(eval $(generic-package))
> diff -r 677354152366 -r 7372c704f6a9 package/ipsec-tools/ipsec-tools.mk
> --- a/package/ipsec-tools/ipsec-tools.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/ipsec-tools/ipsec-tools.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -13,7 +13,7 @@
>  IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
>  
>  # configure hardcodes -Werror, so override CFLAGS on make invocation
> -IPSEC_TOOLS_MAKE_OPT = CFLAGS='$(TARGET_CFLAGS)'
> +IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
>  
>  # openssl uses zlib, so we need to explicitly link with it when static
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> diff -r 677354152366 -r 7372c704f6a9 package/iputils/iputils.mk
> --- a/package/iputils/iputils.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/iputils/iputils.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -18,7 +18,7 @@
>  endif
>  
>  # Disabling CAP_SETPCAP (file capabilities)
> -IPUTILS_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
> +IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
>  	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
>  	arping clockdiff ping rarpd rdisc tftpd tracepath
>  
> @@ -26,7 +26,7 @@
>  # To support md5 for ping6
>  IPUTILS_DEPENDENCIES += openssl
>  
> -IPUTILS_MAKE_OPT += ping6 tracepath6 traceroute6
> +IPUTILS_MAKE_OPTS += ping6 tracepath6 traceroute6
>  
>  define IPUTILS_IPV6_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
> @@ -36,7 +36,7 @@
>  endif
>  
>  define IPUTILS_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPT)
> +	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
>  endef
>  
>  define IPUTILS_INSTALL_TARGET_CMDS
> diff -r 677354152366 -r 7372c704f6a9 package/iw/iw.mk
> --- a/package/iw/iw.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/iw/iw.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -10,18 +10,18 @@
>  IW_LICENSE = iw license
>  IW_LICENSE_FILES = COPYING
>  IW_DEPENDENCIES = host-pkgconf libnl
> -IW_MAKE_OPT = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
> +IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
>  IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
>  	GIT_DIR=$(IW_DIR)
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  # libnl needs pthread/m, so we need to explicitly with them when static
>  # these need to added AFTER libnl, so we have to override LIBS completely
> -IW_MAKE_OPT += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
> +IW_MAKE_OPTS += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
>  endif
>  
>  define IW_BUILD_CMDS
> -	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPT) -C $(@D)
> +	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define IW_INSTALL_TARGET_CMDS
> diff -r 677354152366 -r 7372c704f6a9 package/libdnet/libdnet.mk
> --- a/package/libdnet/libdnet.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/libdnet/libdnet.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -17,9 +17,9 @@
>  ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
>  LIBDNET_DEPENDENCIES = python
>  LIBDNET_CONF_OPT += --with-python
> -LIBDNET_MAKE_OPT = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
> -LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
> -LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
> +LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
> +LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
> +LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>  endif
>  
>  # Needed for autoreconf to work properly
> diff -r 677354152366 -r 7372c704f6a9 package/libjson/libjson.mk
> --- a/package/libjson/libjson.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/libjson/libjson.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -14,13 +14,13 @@
>  LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> -LIBJSON_MAKE_OPT += SHARED=0
> +LIBJSON_MAKE_OPTS += SHARED=0
>  else
> -LIBJSON_MAKE_OPT += SHARED=1
> +LIBJSON_MAKE_OPTS += SHARED=1
>  LIBJSON_CXXFLAGS += -fPIC
>  endif
>  
> -LIBJSON_MAKE_OPT += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
> +LIBJSON_MAKE_OPTS += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
>  
>  define LIBJSON_EXTRACT_CMDS
>  	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
> @@ -33,17 +33,17 @@
>  	mkdir -p $(@D)/Objects_$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
>  		$(@D)/_internal/Source/Dependencies
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(LIBJSON_MAKE_OPT) -C $(@D)
> +		$(LIBJSON_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define LIBJSON_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr install -C $(@D)
> +		$(LIBJSON_MAKE_OPTS) prefix=$(TARGET_DIR)/usr install -C $(@D)
>  endef
>  
>  define LIBJSON_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr install -C $(@D)
> +		$(LIBJSON_MAKE_OPTS) prefix=$(STAGING_DIR)/usr install -C $(@D)
>  endef
>  
>  $(eval $(generic-package))
> diff -r 677354152366 -r 7372c704f6a9 package/libseccomp/libseccomp.mk
> --- a/package/libseccomp/libseccomp.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/libseccomp/libseccomp.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -13,7 +13,7 @@
>  # Needed for configure to find our system headers:
>  LIBSECCOMP_CONF_ENV            = SYSROOT=$(STAGING_DIR)
>  LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
> -LIBSECCOMP_MAKE_OPT            = SUBDIRS_BUILD=src
> +LIBSECCOMP_MAKE_OPTS            = SUBDIRS_BUILD=src
>  LIBSECCOMP_INSTALL_STAGING_OPT = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
>  LIBSECCOMP_INSTALL_TARGET_OPT  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
>  
> diff -r 677354152366 -r 7372c704f6a9 package/linux-pam/linux-pam.mk
> --- a/package/linux-pam/linux-pam.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/linux-pam/linux-pam.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -23,7 +23,7 @@
>  
>  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  	LINUX_PAM_DEPENDENCIES += gettext
> -	LINUX_PAM_MAKE_OPT += LIBS=-lintl
> +	LINUX_PAM_MAKE_OPTS += LIBS=-lintl
>  endif
>  
>  # Install default pam config (deny everything)
> diff -r 677354152366 -r 7372c704f6a9 package/lm-sensors/lm-sensors.mk
> --- a/package/lm-sensors/lm-sensors.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/lm-sensors/lm-sensors.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -20,28 +20,28 @@
>  LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
>  LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
>  
> -LM_SENSORS_MAKE_OPT = \
> +LM_SENSORS_MAKE_OPTS = \
>  	BUILD_STATIC_LIB=1 \
>  	MACHINE=$(KERNEL_ARCH) \
>  	PREFIX=/usr
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> -LM_SENSORS_MAKE_OPT += BUILD_SHARED_LIB=0
> +LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0
>  else
> -LM_SENSORS_MAKE_OPT += BUILD_SHARED_LIB=1
> +LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
>  endif
>  
>  define LM_SENSORS_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPT) -C $(@D)
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define LM_SENSORS_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
> +	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>  	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
>  endef
>  
>  define LM_SENSORS_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
> +	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>  	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
>  endef
>  
> diff -r 677354152366 -r 7372c704f6a9 package/lshw/lshw.mk
> --- a/package/lshw/lshw.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/lshw/lshw.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -14,18 +14,18 @@
>  LSHW_CFLAGS += -DNONLS
>  endif
>  
> -LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
> +LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
>  	RPM_OPT_FLAGS="$(LSHW_CFLAGS)" all
>  LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
>  LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
>  
>  define LSHW_BUILD_CMDS
> -	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
> +	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPTS)
>  endef
>  
>  define LSHW_INSTALL_TARGET_CMDS
>  	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
> -		$(LSHW_MAKE_OPT) install
> +		$(LSHW_MAKE_OPTS) install
>  endef
>  
>  $(eval $(generic-package))
> diff -r 677354152366 -r 7372c704f6a9 package/lvm2/lvm2.mk
> --- a/package/lvm2/lvm2.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/lvm2/lvm2.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -32,7 +32,7 @@
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
> -LVM2_MAKE_OPT = device-mapper
> +LVM2_MAKE_OPTS = device-mapper
>  LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
>  LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
>  endif
> diff -r 677354152366 -r 7372c704f6a9 package/mdadm/mdadm.mk
> --- a/package/mdadm/mdadm.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/mdadm/mdadm.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -10,7 +10,7 @@
>  MDADM_LICENSE = GPLv2+
>  MDADM_LICENSE_FILES = COPYING
>  
> -MDADM_MAKE_OPT = \
> +MDADM_MAKE_OPTS = \
>  	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
>  
>  MDADM_INSTALL_TARGET_OPT = \
> diff -r 677354152366 -r 7372c704f6a9 package/mii-diag/mii-diag.mk
> --- a/package/mii-diag/mii-diag.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/mii-diag/mii-diag.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,7 +11,7 @@
>  MII_DIAG_LICENSE = GPL # No version specified
>  MII_DIAG_LICENSE_FILES = mii-diag.c
>  
> -MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
> +MII_DIAG_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
>  
>  define MII_DIAG_DEBIAN_PATCHES
>  	if [ -d $(@D)/debian/patches ]; then \
> @@ -22,7 +22,7 @@
>  MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
>  
>  define MII_DIAG_BUILD_CMDS
> -	$(MAKE) $(MII_DIAG_MAKE_OPT) -C $(@D) mii-diag
> +	$(MAKE) $(MII_DIAG_MAKE_OPTS) -C $(@D) mii-diag
>  endef
>  
>  define MII_DIAG_INSTALL_TARGET_CMDS
> diff -r 677354152366 -r 7372c704f6a9 package/mpfr/mpfr.mk
> --- a/package/mpfr/mpfr.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/mpfr/mpfr.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,7 +11,7 @@
>  MPFR_LICENSE_FILES = COPYING.LESSER
>  MPFR_INSTALL_STAGING = YES
>  MPFR_DEPENDENCIES = gmp
> -MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
> +MPFR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> diff -r 677354152366 -r 7372c704f6a9 package/openswan/openswan.mk
> --- a/package/openswan/openswan.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/openswan/openswan.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -10,31 +10,31 @@
>  OPENSWAN_LICENSE_FILES = COPYING LICENSE
>  
>  OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
> -OPENSWAN_MAKE_OPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
> +OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
>  	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
>  	USE_KLIPS=false USE_MAST=false USE_NM=false
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  	OPENSWAN_DEPENDENCIES += libcurl
> -	OPENSWAN_MAKE_OPT += USE_LIBCURL=true
> +	OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  	OPENSWAN_DEPENDENCIES += openssl
> -	OPENSWAN_MAKE_OPT += HAVE_OPENSSL=true
> +	OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
>  ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
> -	OPENSWAN_MAKE_OPT += HAVE_OCF=true
> +	OPENSWAN_MAKE_OPTS += HAVE_OCF=true
>  endif
>  endif
>  
>  define OPENSWAN_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		$(OPENSWAN_MAKE_OPT) programs
> +		$(OPENSWAN_MAKE_OPTS) programs
>  endef
>  
>  define OPENSWAN_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		$(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
> +		$(OPENSWAN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
>  endef
>  
>  $(eval $(generic-package))
> diff -r 677354152366 -r 7372c704f6a9 package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/pkg-autotools.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -106,7 +106,7 @@
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPT			?=
>  $(2)_MAKE_ENV			?=
> -$(2)_MAKE_OPT			?=
> +$(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_OPT                ?= install
>  $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
> @@ -266,11 +266,11 @@
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
>  endef
>  else
>  define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
>  endef
>  endif
>  endif
> diff -r 677354152366 -r 7372c704f6a9 package/pkg-cmake.mk
> --- a/package/pkg-cmake.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/pkg-cmake.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -40,7 +40,7 @@
>  $(2)_CONF_OPT			?=
>  $(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
> -$(2)_MAKE_OPT			?=
> +$(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_HOST_OPT		?= install
>  $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
> @@ -109,11 +109,11 @@
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  else
>  define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  endif
> @@ -124,7 +124,7 @@
>  #
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> @@ -134,7 +134,7 @@
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> @@ -144,7 +144,7 @@
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  
> diff -r 677354152366 -r 7372c704f6a9 package/pppd/pppd.mk
> --- a/package/pppd/pppd.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/pppd/pppd.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -19,11 +19,11 @@
>  
>  ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
>  	PPPD_DEPENDENCIES += libpcap
> -	PPPD_MAKE_OPT += FILTER=y
> +	PPPD_MAKE_OPTS += FILTER=y
>  endif
>  
>  ifeq ($(BR2_INET_IPV6),y)
> -	PPPD_MAKE_OPT += HAVE_INET6=y
> +	PPPD_MAKE_OPTS += HAVE_INET6=y
>  endif
>  
>  # pppd bundles some but not all of the needed kernel headers. The embedded
> @@ -43,7 +43,7 @@
>  
>  define PPPD_BUILD_CMDS
>  	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
> -		-C $(@D) $(PPPD_MAKE_OPT)
> +		-C $(@D) $(PPPD_MAKE_OPTS)
>  endef
>  
>  ifeq ($(BR2_PACKAGE_PPPD_RADIUS),y)
> @@ -94,7 +94,7 @@
>  endef
>  
>  define PPPD_INSTALL_STAGING_CMDS
> -	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPT) install-devel
> +	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
>  endef
>  
>  $(eval $(generic-package))
> diff -r 677354152366 -r 7372c704f6a9 package/pv/pv.mk
> --- a/package/pv/pv.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/pv/pv.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -23,7 +23,7 @@
>  # configuration, as the ld default emulation may not necessarily be
>  # the correct one. By passing the below values for LD and LDFLAGS, we
>  # ensure that 'gcc' is used to do these partial linking steps.
> -PV_MAKE_OPT = \
> +PV_MAKE_OPTS = \
>  	LD="$(TARGET_CC)" \
>  	LDFLAGS="-Wl,-r -nostdlib"
>  
> diff -r 677354152366 -r 7372c704f6a9 package/quota/quota.mk
> --- a/package/quota/quota.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/quota/quota.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -24,7 +24,7 @@
>  QUOTA_LDFLAGS += -ltirpc
>  endif
>  
> -QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
> +QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
>  QUOTA_CONF_ENV = \
>  	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
>  
> diff -r 677354152366 -r 7372c704f6a9 package/rp-pppoe/rp-pppoe.mk
> --- a/package/rp-pppoe/rp-pppoe.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/rp-pppoe/rp-pppoe.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,7 +11,7 @@
>  RP_PPPOE_DEPENDENCIES = pppd
>  RP_PPPOE_SUBDIR = src
>  RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
> -RP_PPPOE_MAKE_OPT = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
> +RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
>  RP_PPPOE_CONF_OPT = --disable-debugging
>  RP_PPPOE_CONF_ENV = \
>  	rpppoe_cv_pack_bitfields=normal \
> diff -r 677354152366 -r 7372c704f6a9 package/rubix/rubix.mk
> --- a/package/rubix/rubix.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/rubix/rubix.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,7 +11,7 @@
>  RUBIX_LICENSE = Public Domain
>  RUBIX_LICENSE_FILES = LICENCE
>  
> -RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
> +RUBIX_MAKE_OPTS = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
>  
>  RUBIX_DEPENDENCIES = xlib_libX11
>  
> diff -r 677354152366 -r 7372c704f6a9 package/schifra/schifra.mk
> --- a/package/schifra/schifra.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/schifra/schifra.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,13 +11,13 @@
>  SCHIFRA_LICENSE = schifra license
>  SCHIFRA_LICENSE_FILES = schifra_license.txt
>  
> -SCHIFRA_MAKE_OPT = COMPILER="$(TARGET_CXX)" \
> +SCHIFRA_MAKE_OPTS = COMPILER="$(TARGET_CXX)" \
>  		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o"
>  
>  # The examples are the only buildable artefacts.
>  ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
>  define SCHIFRA_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) all
> +	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPTS) all
>  endef
>  
>  define SCHIFRA_INSTALL_EXAMPLES
> diff -r 677354152366 -r 7372c704f6a9 package/sdl_ttf/sdl_ttf.mk
> --- a/package/sdl_ttf/sdl_ttf.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/sdl_ttf/sdl_ttf.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -16,5 +16,5 @@
>  		--with-freetype-prefix=$(STAGING_DIR)/usr \
>  		--with-sdl-prefix=$(STAGING_DIR)/usr
>  
> -SDL_TTF_MAKE_OPT = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
> +SDL_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
>  $(eval $(autotools-package))
> diff -r 677354152366 -r 7372c704f6a9 package/speex/speex.mk
> --- a/package/speex/speex.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/speex/speex.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -31,7 +31,7 @@
>  SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
>  
>  define SPEEX_BUILD_CMDS
> -	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
> +	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPTS) -C $(@D)/$($(PKG)_SUBDIR)
>  endef
>  
>  $(eval $(autotools-package))
> diff -r 677354152366 -r 7372c704f6a9 package/sysstat/sysstat.mk
> --- a/package/sysstat/sysstat.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/sysstat/sysstat.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -14,7 +14,7 @@
>  
>  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  SYSSTAT_DEPENDENCIES += gettext
> -SYSSTAT_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -lintl"
> +SYSSTAT_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -lintl"
>  endif
>  
>  # The isag tool is a post processing script that depends on tcl/tk
> diff -r 677354152366 -r 7372c704f6a9 package/systemd/systemd.mk
> --- a/package/systemd/systemd.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/systemd/systemd.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -128,8 +128,8 @@
>  endif
>  
>  # mq_getattr needs -lrt
> -SYSTEMD_MAKE_OPT += LIBS=-lrt
> -SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
> +SYSTEMD_MAKE_OPTS += LIBS=-lrt
> +SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
>  
>  define SYSTEMD_INSTALL_INIT_HOOK
>  	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
> diff -r 677354152366 -r 7372c704f6a9 package/tn5250/tn5250.mk
> --- a/package/tn5250/tn5250.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/tn5250/tn5250.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -6,7 +6,7 @@
>  
>  TN5250_VERSION = 0.17.4
>  TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
> -TN5250_MAKE_OPT = CPPFLAGS=""
> +TN5250_MAKE_OPTS = CPPFLAGS=""
>  TN5250_DEPENDENCIES = ncurses
>  TN5250_LICENSE = LGPLv2.1+
>  TN5250_LICENSE_FILES = COPYING
> diff -r 677354152366 -r 7372c704f6a9 package/util-linux/util-linux.mk
> --- a/package/util-linux/util-linux.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/util-linux/util-linux.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -40,7 +40,7 @@
>  
>  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  UTIL_LINUX_DEPENDENCIES += gettext
> -UTIL_LINUX_MAKE_OPT += LIBS=-lintl
> +UTIL_LINUX_MAKE_OPTS += LIBS=-lintl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> diff -r 677354152366 -r 7372c704f6a9 package/whois/whois.mk
> --- a/package/whois/whois.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/whois/whois.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -10,7 +10,7 @@
>  # take precedence over busybox implementation
>  WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
> -WHOIS_MAKE_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
>  	LIBS="$(WHOIS_EXTRA_LIBS)"
>  WHOIS_LICENSE = GPLv2+
>  WHOIS_LICENSE_FILES = COPYING
> @@ -32,11 +32,11 @@
>  endif
>  
>  define WHOIS_BUILD_CMDS
> -	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) -C $(@D)
> +	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define WHOIS_INSTALL_TARGET_CMDS
> -	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) \
> +	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) \
>  		BASEDIR="$(TARGET_DIR)" install -C $(@D)
>  endef
>  
> diff -r 677354152366 -r 7372c704f6a9 package/xinetd/xinetd.mk
> --- a/package/xinetd/xinetd.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/xinetd/xinetd.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -28,6 +28,6 @@
>  	CFLAGS="$(XINETD_CFLAGS)" \
>  	LIBS="$(XINETD_LIBS)"
>  
> -XINETD_MAKE_OPT = AR="$(TARGET_AR)"
> +XINETD_MAKE_OPTS = AR="$(TARGET_AR)"
>  
>  $(eval $(autotools-package))
> diff -r 677354152366 -r 7372c704f6a9 package/zmqpp/zmqpp.mk
> --- a/package/zmqpp/zmqpp.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/zmqpp/zmqpp.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -11,7 +11,7 @@
>  ZMQPP_LICENSE = LGPLv3+ with exceptions
>  ZMQPP_LICENSE_FILES = COPYING COPYING.LESSER
>  
> -ZMQPP_MAKE_OPT = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
> +ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
>  ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
>  
>  ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
> @@ -21,19 +21,19 @@
>  define ZMQPP_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		LDFLAGS="$(ZMQPP_LDFLAGS)" \
> -		$(ZMQPP_MAKE_OPT) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
> +		$(ZMQPP_MAKE_OPTS) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
>  endef
>  
>  define ZMQPP_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/include/zmqpp
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(ZMQPP_MAKE_OPT) DESTDIR=$(TARGET_DIR) install -C $(@D)
> +		$(ZMQPP_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install -C $(@D)
>  endef
>  
>  define ZMQPP_INSTALL_STAGING_CMDS
>  	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/zmqpp
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) install -C $(@D)
> +		$(ZMQPP_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install -C $(@D)
>  endef
>  
>  $(eval $(generic-package))
> diff -r 677354152366 -r 7372c704f6a9 package/zxing/zxing.mk
> --- a/package/zxing/zxing.mk	Mon Jul 28 21:39:53 2014 +0200
> +++ b/package/zxing/zxing.mk	Mon Jul 28 21:19:08 2014 +0200
> @@ -17,7 +17,7 @@
>  else
>  # There is no locale support in the toolchain and libiconv
>  # is not available so disable iconv support in zxing
> -ZING_MAKE_OPT=CXXFLAGS+="-DNO_ICONV"
> +ZING_MAKE_OPTS=CXXFLAGS+="-DNO_ICONV"
>  endif
>  endif
>  
> @@ -26,7 +26,7 @@
>  endef
>  
>  define ZXING_BUILD_CMDS
> -	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPT)
> +	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPTS)
>  endef
>  
>  define ZXING_INSTALL_STAGING_CMDS

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
