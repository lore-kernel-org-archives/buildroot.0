From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:38:25 +0200
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20141025083901.95C4EB0EA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df2857de491448311a7e1f78e3492f697a0be0cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cegui06/cegui06.mk       |   36 ++++++++++++++++++------------------
 package/dmraid/dmraid.mk         |    6 +++---
 package/fxload/fxload.mk         |    4 ++--
 package/gptfdisk/gptfdisk.mk     |    8 ++++----
 package/keyutils/keyutils.mk     |   14 +++++++-------
 package/libcofi/libcofi.mk       |    4 ++--
 package/luaposix/luaposix.mk     |    2 +-
 package/netcat-openbsd/Config.in |    4 ++--
 package/nodejs/nodejs.mk         |    2 +-
 package/perl/perl.mk             |   10 +++++-----
 package/qemu/Config.in           |    4 ++--
 package/qemu/qemu.mk             |   12 ++++++------
 package/redis/redis.mk           |    2 +-
 package/rtmpdump/rtmpdump.mk     |   20 ++++++++++----------
 package/spice/spice.mk           |   16 ++++++++--------
 15 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
index ee74363..43d3b09 100644
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -13,24 +13,24 @@ CEGUI06_LICENSE = MIT
 CEGUI06_LICENSE_FILES = COPYING
 CEGUI06_INSTALL_STAGING = YES
 
-CEGUI06_DEPENDENCIES =          \
-    expat                       \
-    freetype                    \
-    pcre                        \
+CEGUI06_DEPENDENCIES =              \
+	expat                       \
+	freetype                    \
+	pcre                        \
 
-CEGUI06_CONF_OPTS =             \
-    --enable-expat              \
-    --disable-external-tinyxml  \
-    --disable-xerces-c          \
-    --disable-libxml            \
-    --disable-tinyxml           \
-    --disable-opengl-renderer   \
-    --disable-external-glew     \
-    --disable-irrlicht-renderer \
-    --disable-directfb-renderer \
-    --disable-samples           \
-    --disable-lua-module        \
-    --disable-toluacegui        \
-    --disable-external-toluapp  \
+CEGUI06_CONF_OPTS =                 \
+	--enable-expat              \
+	--disable-external-tinyxml  \
+	--disable-xerces-c          \
+	--disable-libxml            \
+	--disable-tinyxml           \
+	--disable-opengl-renderer   \
+	--disable-external-glew     \
+	--disable-irrlicht-renderer \
+	--disable-directfb-renderer \
+	--disable-samples           \
+	--disable-lua-module        \
+	--disable-toluacegui        \
+	--disable-external-toluapp  \
 
 $(eval $(autotools-package))
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 9699ead..024b9b5 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -18,9 +18,9 @@ DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
 DMRAID_DEPENDENCIES = lvm2
 
 define DMRAID_INSTALL_INIT_SYSV
-    [ -f $(TARGET_DIR)/etc/init.d/S20dmraid ] || \
-        $(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
-            $(TARGET_DIR)/etc/init.d/S20dmraid
+	[ -f $(TARGET_DIR)/etc/init.d/S20dmraid ] || \
+		$(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
+			$(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
 $(eval $(autotools-package))
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 26feec3..b34dccd 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -10,11 +10,11 @@ FXLOAD_LICENSE = GPLv2+
 FXLOAD_LICENSE_FILES = COPYING
 
 define FXLOAD_BUILD_CMDS
-    $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
 endef
 
 define FXLOAD_INSTALL_TARGET_CMDS
-    $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) prefix=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) prefix=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 6835f40..f6e9ecd 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -15,15 +15,15 @@ GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_CGDISK) += cgdisk
 
 GPTFDISK_DEPENDENCIES += util-linux
 ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
-    GPTFDISK_DEPENDENCIES += popt
+GPTFDISK_DEPENDENCIES += popt
 endif
 ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
-    GPTFDISK_DEPENDENCIES += ncurses
+GPTFDISK_DEPENDENCIES += ncurses
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-    GPTFDISK_DEPENDENCIES += icu
-    GPTFDISK_MAKE_OPTS += USE_UTF16=y
+GPTFDISK_DEPENDENCIES += icu
+GPTFDISK_MAKE_OPTS += USE_UTF16=y
 endif
 
 define GPTFDISK_BUILD_CMDS
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 241536f..27cd4ae 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -11,13 +11,13 @@ KEYUTILS_LICENSE = GPLv2+ LGPLv2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
-KEYUTILS_MAKE_PARAMS =                \
-    INSTALL=$(INSTALL)                \
-    LIBDIR=/usr/lib                   \
-    USRLIBDIR=/usr/lib                \
-    CFLAGS="$(TARGET_CFLAGS)"         \
-    CPPFLAGS="$(TARGET_CPPFLAGS) -I." \
-    LNS="$(HOSTLN) -sf"
+KEYUTILS_MAKE_PARAMS =                    \
+	INSTALL=$(INSTALL)                \
+	LIBDIR=/usr/lib                   \
+	USRLIBDIR=/usr/lib                \
+	CFLAGS="$(TARGET_CFLAGS)"         \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -I." \
+	LNS="$(HOSTLN) -sf"
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 KEYUTILS_MAKE_PARAMS += NO_SOLIB=1
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index dcfc641..90daff2 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -10,11 +10,11 @@ LIBCOFI_LICENSE = LGPLv2.1
 LIBCOFI_LICENSE_FILES = README.md
 
 define LIBCOFI_BUILD_CMDS
-    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define LIBCOFI_INSTALL_TARGET_CMDS
-    $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so $(TARGET_DIR)/usr/lib/libcofi_rpi.so
+	$(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so $(TARGET_DIR)/usr/lib/libcofi_rpi.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 13fc266..a723a50 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -12,7 +12,7 @@ LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
 LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-    LUAPOSIX_DEPENDENCIES += ncurses
+LUAPOSIX_DEPENDENCIES += ncurses
 endif
 
 $(eval $(autotools-package))
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 16be610..47dfe5f 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -19,6 +19,6 @@ config BR2_PACKAGE_NETCAT_OPENBSD
           https://packages.debian.org/sid/netcat-openbsd
 
 comment "netcat-openbsd needs an (e)glibc toolchain w/ threads"
-    depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-    depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
 ~
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e73e080..8832ce3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,7 @@ NODEJS_VERSION = 0.10.32
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
+	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a8ed49f..9684668 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -42,10 +42,10 @@ endef
 PERL_POST_PATCH_HOOKS += PERL_CROSS_SET_POD
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-    PERL_DEPENDENCIES += berkeleydb
+PERL_DEPENDENCIES += berkeleydb
 endif
 ifeq ($(BR2_PACKAGE_GDBM),y)
-    PERL_DEPENDENCIES += gdbm
+PERL_DEPENDENCIES += gdbm
 endif
 
 # We have to override LD, because an external multilib toolchain ld is not
@@ -66,15 +66,15 @@ PERL_CONF_OPTS = \
 	-Dperladmin=root
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
-    PERL_CONF_OPTS += -Dusedevel
+PERL_CONF_OPTS += -Dusedevel
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-    PERL_CONF_OPTS += --all-static --no-dynaloader
+PERL_CONF_OPTS += --all-static --no-dynaloader
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-    PERL_CONF_OPTS += -Uuselargefiles
+PERL_CONF_OPTS += -Uuselargefiles
 endif
 
 PERL_MODULES = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index cd7fed7..e8d03da 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -65,8 +65,8 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
 config BR2_PACKAGE_QEMU_HAS_EMULS
-    def_bool y
-    depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+	def_bool y
+	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
 
 if BR2_PACKAGE_QEMU_HAS_EMULS
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 8735b46..2495674 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -46,16 +46,16 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 
 HOST_QEMU_ARCH = $(ARCH)
 ifeq ($(HOST_QEMU_ARCH),i486)
-    HOST_QEMU_ARCH = i386
+HOST_QEMU_ARCH = i386
 endif
 ifeq ($(HOST_QEMU_ARCH),i586)
-    HOST_QEMU_ARCH = i386
+HOST_QEMU_ARCH = i386
 endif
 ifeq ($(HOST_QEMU_ARCH),i686)
-    HOST_QEMU_ARCH = i386
+HOST_QEMU_ARCH = i386
 endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
-    HOST_QEMU_ARCH = ppc
+HOST_QEMU_ARCH = ppc
 endif
 HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
 
@@ -96,8 +96,8 @@ QEMU_OPTS =
 
 QEMU_VARS = \
 	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
-    PYTHON=$(HOST_DIR)/usr/bin/python \
-    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+	PYTHON=$(HOST_DIR)/usr/bin/python \
+	PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c41469e..f3f9acb 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -13,7 +13,7 @@ REDIS_LICENSE_FILES = COPYING
 # https://github.com/antirez/redis/pull/609).  We set PREFIX
 # instead.
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
-    PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
+	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
 
 define REDIS_BUILD_CMDS
         $(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 684e0cf..e8fd0b8 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -14,25 +14,25 @@ RTMPDUMP_LICENSE_FILES = librtmp/COPYING
 RTMPDUMP_DEPENDENCIES = zlib
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-    RTMPDUMP_DEPENDENCIES += gnutls
-    RTMPDUMP_CRYPTO = GNUTLS
+RTMPDUMP_DEPENDENCIES += gnutls
+RTMPDUMP_CRYPTO = GNUTLS
 else ifeq ($(BR2_PACKAGE_POLARSSL),y)
-    RTMPDUMP_DEPENDENCIES += polarssl
-    RTMPDUMP_CRYPTO = POLARSSL
+RTMPDUMP_DEPENDENCIES += polarssl
+RTMPDUMP_CRYPTO = POLARSSL
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-    RTMPDUMP_DEPENDENCIES += openssl
-    RTMPDUMP_CRYPTO = OPENSSL
+RTMPDUMP_DEPENDENCIES += openssl
+RTMPDUMP_CRYPTO = OPENSSL
 else
-    # no crypto
-    RTMPDUMP_CRYPTO =
+# no crypto
+RTMPDUMP_CRYPTO =
 endif
 
 RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-    RTMPDUMP_CFLAGS += -fPIC
+RTMPDUMP_CFLAGS += -fPIC
 else
-    RTMPDUMP_SHARED = "SHARED="
+RTMPDUMP_SHARED = "SHARED="
 endif
 
 define RTMPDUMP_BUILD_CMDS
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 52a265e..be46493 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -10,14 +10,14 @@ SPICE_SITE = http://www.spice-space.org/download/releases
 SPICE_LICENSE = LGPLv2.1+
 SPICE_LICENSE_FILES = COPYING
 SPICE_INSTALL_STAGING = YES
-SPICE_DEPENDENCIES =    \
-    alsa-lib            \
-    celt051             \
-    jpeg                \
-    openssl             \
-    pixman              \
-    python-pyparsing    \
-    spice-protocol      \
+SPICE_DEPENDENCIES =        \
+	alsa-lib            \
+	celt051             \
+	jpeg                \
+	openssl             \
+	pixman              \
+	python-pyparsing    \
+	spice-protocol      \
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
