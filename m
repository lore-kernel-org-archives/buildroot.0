From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 11:41:05 +0100
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20141224104110.5696780779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38f09d6873436cfe4606ae32adbe4ac99bb8ad61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk                       |   34 ++++++----
 package/blackbox/blackbox.mk                       |    5 +-
 package/cups/cups.mk                               |   22 ++++---
 package/dbus/dbus.mk                               |   23 ++++---
 package/ed/ed.mk                                   |    5 +-
 package/fontconfig/fontconfig.mk                   |    7 +-
 package/gnuplot/gnuplot.mk                         |   25 ++++----
 package/icu/icu.mk                                 |    6 +-
 package/imagemagick/imagemagick.mk                 |   27 ++++----
 package/libao/libao.mk                             |    9 ++-
 package/libargtable2/libargtable2.mk               |    9 ++-
 package/libxslt/libxslt.mk                         |    7 ++-
 package/metacity/metacity.mk                       |   11 ++-
 package/netsnmp/netsnmp.mk                         |   34 ++++++----
 package/ntp/ntp.mk                                 |   11 ++--
 package/openssh/openssh.mk                         |   10 ++-
 package/php/php.mk                                 |   68 ++++++++++----------
 package/proftpd/proftpd.mk                         |   22 ++++---
 package/rrdtool/rrdtool.mk                         |   16 +++--
 package/sdl_image/sdl_image.mk                     |   50 ++++++++-------
 package/sdl_ttf/sdl_ttf.mk                         |    7 +-
 package/sed/sed.mk                                 |   17 +++--
 package/squid/squid.mk                             |   41 +++++++-----
 package/tcpdump/tcpdump.mk                         |   12 ++-
 package/vde2/vde2.mk                               |   15 ++--
 .../xserver_xorg-server/xserver_xorg-server.mk     |   23 ++++--
 26 files changed, 296 insertions(+), 220 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9a9bb94..1ff7fba 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -42,15 +42,18 @@ endif
 # they also contain the gdb sources, but gdb shouldn't be built, so we
 # disable it.
 BINUTILS_DISABLE_GDB_CONF_OPTS = \
-	--disable-sim --disable-gdb
+	--disable-sim \
+	--disable-gdb
 
 # We need to specify host & target to avoid breaking ARM EABI
-BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--enable-install-libiberty \
-		$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
-		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+BINUTILS_CONF_OPTS = \
+	--disable-multilib \
+	--disable-werror \
+	--host=$(GNU_TARGET_NAME) \
+	--target=$(GNU_TARGET_NAME) \
+	--enable-install-libiberty \
+	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
+	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
@@ -64,13 +67,16 @@ endif
 
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
-HOST_BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
-			--target=$(GNU_TARGET_NAME) \
-			--disable-shared --enable-static \
-			--with-sysroot=$(STAGING_DIR) \
-			--enable-poison-system-directories \
-			$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
-			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+HOST_BINUTILS_CONF_OPTS = \
+	--disable-multilib \
+	--disable-werror \
+	--target=$(GNU_TARGET_NAME) \
+	--disable-shared \
+	--enable-static \
+	--with-sysroot=$(STAGING_DIR) \
+	--enable-poison-system-directories \
+	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
+	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # We just want libbfd and libiberty, not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 254d46f..a73bc5b 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,8 +7,9 @@
 BLACKBOX_VERSION = 0.70.1
 BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE = http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
-BLACKBOX_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib
+BLACKBOX_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
 BLACKBOX_DEPENDENCIES = xlib_libX11
 BLACKBOX_LICENSE = MIT
 BLACKBOX_LICENSE_FILES = LICENSE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 318571d..cc87574 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -12,18 +12,20 @@ CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
-CUPS_CONF_OPTS = --without-perl \
-		--without-java \
-		--without-php \
-		--disable-gnutls \
-		--disable-gssapi \
-		--libdir=/usr/lib
+CUPS_CONF_OPTS = \
+	--without-perl \
+	--without-java \
+	--without-php \
+	--disable-gnutls \
+	--disable-gssapi \
+	--libdir=/usr/lib
 CUPS_CONFIG_SCRIPTS = cups-config
 
-CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
-		    $(if $(BR2_PACKAGE_LIBPNG),libpng) \
-		    $(if $(BR2_PACKAGE_JPEG),jpeg) \
-		    $(if $(BR2_PACKAGE_TIFF),tiff)
+CUPS_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_ZLIB),zlib) \
+	$(if $(BR2_PACKAGE_LIBPNG),libpng) \
+	$(if $(BR2_PACKAGE_JPEG),jpeg) \
+	$(if $(BR2_PACKAGE_TIFF),tiff)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	CUPS_CONF_OPTS += --enable-dbus
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 77ea502..5e4fd19 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -22,17 +22,18 @@ endef
 DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
-DBUS_CONF_OPTS = --with-dbus-user=dbus \
-		--disable-tests \
-		--disable-asserts \
-		--enable-abstract-sockets \
-		--disable-selinux \
-		--disable-xml-docs \
-		--disable-doxygen-docs \
-		--disable-dnotify \
-		--with-xml=expat \
-		--with-system-socket=/var/run/dbus/system_bus_socket \
-		--with-system-pid-file=/var/run/messagebus.pid
+DBUS_CONF_OPTS = \
+	--with-dbus-user=dbus \
+	--disable-tests \
+	--disable-asserts \
+	--enable-abstract-sockets \
+	--disable-selinux \
+	--disable-xml-docs \
+	--disable-doxygen-docs \
+	--disable-dnotify \
+	--with-xml=expat \
+	--with-system-socket=/var/run/dbus/system_bus_socket \
+	--with-system-pid-file=/var/run/messagebus.pid
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DBUS_CONF_OPTS += LIBS='-pthread'
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 1fca2fd..f3bcb74 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -6,8 +6,9 @@
 
 ED_VERSION = 1.9
 ED_SITE = $(BR2_GNU_MIRROR)/ed
-ED_CONF_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+ED_CONF_OPTS = \
+	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)"
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 863fa26..caf997b 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -11,9 +11,10 @@ FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
-FONTCONFIG_CONF_OPTS = --with-arch=$(GNU_TARGET_NAME) \
-		--with-cache-dir=/var/cache/fontconfig \
-		--disable-docs
+FONTCONFIG_CONF_OPTS = \
+	--with-arch=$(GNU_TARGET_NAME) \
+	--with-cache-dir=/var/cache/fontconfig \
+	--disable-docs
 
 HOST_FONTCONFIG_CONF_OPTS = \
 	--disable-static
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 238da68..4408ece 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -11,18 +11,19 @@ GNUPLOT_LICENSE_FILES = Copyright
 
 GNUPLOT_AUTORECONF = YES
 
-GNUPLOT_CONF_OPTS = --without-x \
-		--disable-raise-console \
-		--disable-mouse \
-	        --without-tutorial \
-		--disable-demo \
-	        --without-row-help \
-		--disable-history-file \
-	        --without-lisp-files \
-	        --disable-wxwidgets \
-	        --without-lua \
-		--without-latex \
-	        --without-cairo
+GNUPLOT_CONF_OPTS = \
+	--without-x \
+	--disable-raise-console \
+	--disable-mouse \
+	--without-tutorial \
+	--disable-demo \
+	--without-row-help \
+	--disable-history-file \
+	--without-lisp-files \
+	--disable-wxwidgets \
+	--without-lua \
+	--without-latex \
+	--without-cairo
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 GNUPLOT_CONF_OPTS += --with-gd
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 0c554ca..c5460b2 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -13,8 +13,10 @@ ICU_LICENSE_FILES = license.html
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
-ICU_CONF_OPTS = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
-		--disable-tests
+ICU_CONF_OPTS = \
+	--with-cross-build=$(HOST_ICU_DIR)/source \
+	--disable-samples \
+	--disable-tests
 HOST_ICU_CONF_OPTS = \
 	--disable-samples \
 	--disable-tests \
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b8e5155..db3b563 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -27,19 +27,20 @@ else
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=32
 endif
 
-IMAGEMAGICK_CONF_OPTS = --program-transform-name='s,,,' \
-		--disable-openmp \
-		--without-perl \
-		--without-wmf \
-		--without-openexr \
-		--without-jp2 \
-		--without-jbig \
-		--without-gvc \
-		--without-djvu \
-		--without-dps \
-		--without-gslib \
-		--without-fpx \
-		--without-x
+IMAGEMAGICK_CONF_OPTS = \
+	--program-transform-name='s,,,' \
+	--disable-openmp \
+	--without-perl \
+	--without-wmf \
+	--without-openexr \
+	--without-jp2 \
+	--without-jbig \
+	--without-gvc \
+	--without-djvu \
+	--without-dps \
+	--without-gslib \
+	--without-fpx \
+	--without-x
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 9dfdb96..a314c08 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -10,8 +10,13 @@ LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPLv2+
 LIBAO_LICENSE_FILES = COPYING
-LIBAO_CONF_OPTS = --disable-esd --disable-wmm --disable-arts \
-			--disable-nas --disable-pulse --disable-broken-oss
+LIBAO_CONF_OPTS = \
+	--disable-esd \
+	--disable-wmm \
+	--disable-arts \
+	--disable-nas \
+	--disable-pulse \
+	--disable-broken-oss
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBAO_DEPENDENCIES += alsa-lib
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 583b0b4..6b42cc0 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -8,10 +8,11 @@ LIBARGTABLE2_VERSION = 13
 LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
 LIBARGTABLE2_INSTALL_STAGING = YES
-LIBARGTABLE2_CONF_OPTS = --disable-example \
-		--disable-kernel-module \
-		--enable-lib \
-		--enable-util
+LIBARGTABLE2_CONF_OPTS = \
+	--disable-example \
+	--disable-kernel-module \
+	--enable-lib \
+	--enable-util
 LIBARGTABLE2_LICENSE = LGPLv2+
 LIBARGTABLE2_LICENSE_FILES = COPYING
 
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 20aba08..2e5cc14 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -10,8 +10,11 @@ LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
 
-LIBXSLT_CONF_OPTS = --with-gnu-ld --without-debug \
-		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
+LIBXSLT_CONF_OPTS = \
+	--with-gnu-ld \
+	--without-debug \
+	--without-python \
+	--with-libxml-prefix=$(STAGING_DIR)/usr/
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
 
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 1d3e143..d889779 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -12,10 +12,13 @@ METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSI
 METACITY_LICENSE = GPLv2+
 METACITY_LICENSE_FILES = COPYING
 
-METACITY_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib \
-		--disable-glibtest --disable-gconf \
-		--disable-sm --disable-startup-notification
+METACITY_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--disable-glibtest \
+	--disable-gconf \
+	--disable-sm \
+	--disable-startup-notification
 
 METACITY_DEPENDENCIES = libgtk2 \
 	xlib_libX11 \
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 91afffe..bfc2a74 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,19 +11,27 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
-NETSNMP_CONF_OPTS = --with-persistent-directory=/var/lib/snmp \
-		--with-defaults --enable-mini-agent --without-rpm \
-		--with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
-		--enable-as-needed --without-perl-modules \
-		--disable-embedded-perl --disable-perl-cc-checks \
-		--disable-scripts --with-default-snmp-version="1" \
-		--enable-silent-libtool --enable-mfd-rewrites \
-		--with-sys-contact="root at localhost" \
-		--with-sys-location="Unknown" \
-		--with-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES))" \
-		--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
-		--with-out-transports="Unix" \
-		--disable-manuals
+NETSNMP_CONF_OPTS = \
+	--with-persistent-directory=/var/lib/snmp \
+	--with-defaults \
+	--enable-mini-agent \
+	--without-rpm \
+	--with-logfile=none \
+	--without-kmem-usage $(DISABLE_IPV6) \
+	--enable-as-needed \
+	--without-perl-modules \
+	--disable-embedded-perl \
+	--disable-perl-cc-checks \
+	--disable-scripts \
+	--with-default-snmp-version="1" \
+	--enable-silent-libtool \
+	--enable-mfd-rewrites \
+	--with-sys-contact="root at localhost" \
+	--with-sys-location="Unknown" \
+	--with-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES))" \
+	--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
+	--with-out-transports="Unix" \
+	--disable-manuals
 NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 1708978..a30adc2 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -13,11 +13,12 @@ NTP_AUTORECONF = YES
 NTP_LICENSE = ntp license
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
-NTP_CONF_OPTS = --with-shared \
-		--program-transform-name=s,,, \
-		--disable-tickadj \
-		--with-yielding-select=yes \
-		--disable-local-libevent
+NTP_CONF_OPTS = \
+	--with-shared \
+	--program-transform-name=s,,, \
+	--disable-tickadj \
+	--with-yielding-select=yes \
+	--disable-local-libevent
 
 ifneq ($(BR2_INET_IPV6),y)
 	NTP_CONF_ENV += isc_cv_have_in6addr_any=no
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d08b468..be471b6 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -9,8 +9,14 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
-OPENSSH_CONF_OPTS = --sysconfdir=/etc/ssh --disable-lastlog --disable-utmp \
-		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
+OPENSSH_CONF_OPTS = \
+	--sysconfdir=/etc/ssh \
+	--disable-lastlog \
+	--disable-utmp \
+	--disable-utmpx \
+	--disable-wtmp \
+	--disable-wtmpx \
+	--disable-strip
 
 define OPENSSH_USERS
 	sshd -1 sshd -1 * - - - SSH drop priv user
diff --git a/package/php/php.mk b/package/php/php.mk
index 8c322ec..a5f4574 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -13,12 +13,13 @@ PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_DEPENDENCIES = host-pkgconf
 PHP_LICENSE = PHP
 PHP_LICENSE_FILES = LICENSE
-PHP_CONF_OPTS = --mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--disable-all \
-		--without-pear \
-		--with-config-file-path=/etc \
-		--disable-rpath
+PHP_CONF_OPTS = \
+	--mandir=/usr/share/man \
+	--infodir=/usr/share/info \
+	--disable-all \
+	--without-pear \
+	--with-config-file-path=/etc \
+	--disable-rpath
 PHP_CONF_ENV = EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -50,33 +51,34 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
 
 ### Extensions
-PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
-		$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SESSION),--enable-session) \
-		$(if $(BR2_PACKAGE_PHP_EXT_HASH),--enable-hash) \
-		$(if $(BR2_PACKAGE_PHP_EXT_DOM),--enable-dom) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SIMPLEXML),--enable-simplexml) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SOAP),--enable-soap) \
-		$(if $(BR2_PACKAGE_PHP_EXT_XML),--enable-xml) \
-		$(if $(BR2_PACKAGE_PHP_EXT_XMLREADER),--enable-xmlreader) \
-		$(if $(BR2_PACKAGE_PHP_EXT_XMLWRITER),--enable-xmlwriter) \
-		$(if $(BR2_PACKAGE_PHP_EXT_EXIF),--enable-exif) \
-		$(if $(BR2_PACKAGE_PHP_EXT_FTP),--enable-ftp) \
-		$(if $(BR2_PACKAGE_PHP_EXT_JSON),--enable-json) \
-		$(if $(BR2_PACKAGE_PHP_EXT_TOKENIZER),--enable-tokenizer) \
-		$(if $(BR2_PACKAGE_PHP_EXT_PCNTL),--enable-pcntl) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SHMOP),--enable-shmop) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SYSVMSG),--enable-sysvmsg) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SYSVSEM),--enable-sysvsem) \
-		$(if $(BR2_PACKAGE_PHP_EXT_SYSVSHM),--enable-sysvshm) \
-		$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--enable-zip) \
-		$(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
-		$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
-		$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
-		$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
-		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
-		$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
-		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
+PHP_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
+	$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SESSION),--enable-session) \
+	$(if $(BR2_PACKAGE_PHP_EXT_HASH),--enable-hash) \
+	$(if $(BR2_PACKAGE_PHP_EXT_DOM),--enable-dom) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SIMPLEXML),--enable-simplexml) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SOAP),--enable-soap) \
+	$(if $(BR2_PACKAGE_PHP_EXT_XML),--enable-xml) \
+	$(if $(BR2_PACKAGE_PHP_EXT_XMLREADER),--enable-xmlreader) \
+	$(if $(BR2_PACKAGE_PHP_EXT_XMLWRITER),--enable-xmlwriter) \
+	$(if $(BR2_PACKAGE_PHP_EXT_EXIF),--enable-exif) \
+	$(if $(BR2_PACKAGE_PHP_EXT_FTP),--enable-ftp) \
+	$(if $(BR2_PACKAGE_PHP_EXT_JSON),--enable-json) \
+	$(if $(BR2_PACKAGE_PHP_EXT_TOKENIZER),--enable-tokenizer) \
+	$(if $(BR2_PACKAGE_PHP_EXT_PCNTL),--enable-pcntl) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SHMOP),--enable-shmop) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SYSVMSG),--enable-sysvmsg) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SYSVSEM),--enable-sysvsem) \
+	$(if $(BR2_PACKAGE_PHP_EXT_SYSVSHM),--enable-sysvshm) \
+	$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--enable-zip) \
+	$(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
+	$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
+	$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
+	$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
+	$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
+	$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
+	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
 	PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index b79abe4..59ce844 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -10,17 +10,19 @@ PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
 PROFTPD_LICENSE_FILES = COPYING
 
-PROFTPD_CONF_ENV = ac_cv_func_setpgrp_void=yes \
-		ac_cv_func_setgrent_void=yes
-
-PROFTPD_CONF_OPTS = --localstatedir=/var/run \
-		--disable-static \
-		--disable-curses \
-		--disable-ncurses \
-		--disable-facl \
-		--disable-dso \
-		--enable-shadow \
-		--with-gnu-ld
+PROFTPD_CONF_ENV = \
+	ac_cv_func_setpgrp_void=yes \
+	ac_cv_func_setgrent_void=yes
+
+PROFTPD_CONF_OPTS = \
+	--localstatedir=/var/run \
+	--disable-static \
+	--disable-curses \
+	--disable-ncurses \
+	--disable-facl \
+	--disable-dso \
+	--enable-shadow \
+	--with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 6d5c887..e422694 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -12,11 +12,17 @@ RRDTOOL_LICENSE_FILES = COPYING COPYRIGHT
 RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
-RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
-			ac_cv_func_mmap_fixed_mapped=yes
-RRDTOOL_CONF_OPTS = --disable-perl --disable-python --disable-ruby \
-			--disable-tcl --program-transform-name='' \
-			$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
+RRDTOOL_CONF_ENV = \
+	rd_cv_ieee_works=yes \
+	rd_cv_null_realloc=nope \
+	ac_cv_func_mmap_fixed_mapped=yes
+RRDTOOL_CONF_OPTS = \
+	--disable-perl \
+	--disable-python \
+	--disable-ruby \
+	--disable-tcl \
+	--program-transform-name='' \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
 RRDTOOL_MAKE = $(MAKE1)
 
 define RRDTOOL_REMOVE_EXAMPLES
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 951ea45..b46fc64 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -11,23 +11,24 @@ SDL_IMAGE_INSTALL_STAGING = YES
 SDL_IMAGE_LICENSE = zlib
 SDL_IMAGE_LICENSE_FILES = COPYING
 
-SDL_IMAGE_CONF_OPTS = --with-sdl-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-		--disable-sdltest \
-		--disable-static \
-		--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
-		--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
-		--enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
-		--enable-lbm=$(if $(BR2_PACKAGE_SDL_IMAGE_LBM),yes,no) \
-		--enable-pcx=$(if $(BR2_PACKAGE_SDL_IMAGE_PCX),yes,no) \
-		--enable-png=$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),yes,no) \
-		--enable-pnm=$(if $(BR2_PACKAGE_SDL_IMAGE_PNM),yes,no) \
-		--enable-tga=$(if $(BR2_PACKAGE_SDL_IMAGE_TARGA),yes,no) \
-		--enable-tif=$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),yes,no) \
-		--enable-webp=$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),yes,no) \
-		--enable-xcf=$(if $(BR2_PACKAGE_SDL_IMAGE_XCF),yes,no) \
-		--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
-		--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no) \
+SDL_IMAGE_CONF_OPTS = \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-sdltest \
+	--disable-static \
+	--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
+	--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
+	--enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
+	--enable-lbm=$(if $(BR2_PACKAGE_SDL_IMAGE_LBM),yes,no) \
+	--enable-pcx=$(if $(BR2_PACKAGE_SDL_IMAGE_PCX),yes,no) \
+	--enable-png=$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),yes,no) \
+	--enable-pnm=$(if $(BR2_PACKAGE_SDL_IMAGE_PNM),yes,no) \
+	--enable-tga=$(if $(BR2_PACKAGE_SDL_IMAGE_TARGA),yes,no) \
+	--enable-tif=$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),yes,no) \
+	--enable-webp=$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),yes,no) \
+	--enable-xcf=$(if $(BR2_PACKAGE_SDL_IMAGE_XCF),yes,no) \
+	--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
+	--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no) \
 
 SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),jpeg) \
@@ -35,13 +36,14 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
-HOST_SDL_IMAGE_CONF_OPTS = --with-sdl-prefix=$(HOST_DIR)/usr \
-		--with-sdl-exec-prefix=$(HOST_DIR)/usr \
-		--disable-sdltest \
-		--disable-static \
-		--disable-jpg-shared \
-		--disable-png-shared \
-		--disable-tif-shared \
+HOST_SDL_IMAGE_CONF_OPTS = \
+	--with-sdl-prefix=$(HOST_DIR)/usr \
+	--with-sdl-exec-prefix=$(HOST_DIR)/usr \
+	--disable-sdltest \
+	--disable-static \
+	--disable-jpg-shared \
+	--disable-png-shared \
+	--disable-tif-shared \
 
 HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl
 
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index f316a46..3e494b4 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -12,9 +12,10 @@ SDL_TTF_LICENSE_FILES = COPYING
 
 SDL_TTF_INSTALL_STAGING = YES
 SDL_TTF_DEPENDENCIES = sdl freetype
-SDL_TTF_CONF_OPTS = --without-x \
-		--with-freetype-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-prefix=$(STAGING_DIR)/usr
+SDL_TTF_CONF_OPTS = \
+	--without-x \
+	--with-freetype-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-prefix=$(STAGING_DIR)/usr
 
 SDL_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
 $(eval $(autotools-package))
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index f72b8b1..b819300 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -9,14 +9,15 @@ SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPLv3
 SED_LICENSE_FILES = COPYING
 
-SED_CONF_OPTS = --bindir=/usr/bin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--include=$(STAGING_DIR)/usr/include
+SED_CONF_OPTS = \
+	--bindir=/usr/bin \
+	--libdir=/lib \
+	--libexecdir=/usr/lib \
+	--sysconfdir=/etc \
+	--datadir=/usr/share \
+	--mandir=/usr/share/man \
+	--infodir=/usr/share/info \
+	--include=$(STAGING_DIR)/usr/include
 
 define SED_MOVE_BINARY
 	mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 1224369..e9e821d 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -14,23 +14,30 @@ SQUID_LICENSE_FILES = COPYING
 SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
-SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
-			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
-			ac_cv_func_strnstr=no ac_cv_have_squid=yes
-SQUID_CONF_OPTS =	--enable-async-io=8 --enable-linux-netfilter \
-			--enable-removal-policies="lru,heap" \
-			--with-filedescriptors=1024 --disable-ident-lookups \
-			--with-krb5-config=no \
-			--enable-auth-basic="fake getpwnam" \
-			--enable-auth-digest="file" \
-			--enable-auth-negotiate="wrapper" \
-			--enable-auth-ntlm="fake" \
-			--disable-strict-error-checking \
-			--enable-external-acl-helpers="file_userip" \
-			--with-logdir=/var/log/squid/ \
-			--with-pidfile=/var/run/squid.pid \
-			--with-swapdir=/var/cache/squid/ \
-			--enable-icap-client
+SQUID_CONF_ENV = \
+	ac_cv_epoll_works=yes \
+	ac_cv_func_setresuid=yes \
+	ac_cv_func_va_copy=yes \
+	ac_cv_func___va_copy=yes \
+	ac_cv_func_strnstr=no \
+	ac_cv_have_squid=yes
+SQUID_CONF_OPTS = \
+	--enable-async-io=8 \
+	--enable-linux-netfilter \
+	--enable-removal-policies="lru,heap" \
+	--with-filedescriptors=1024 \
+	--disable-ident-lookups \
+	--with-krb5-config=no \
+	--enable-auth-basic="fake getpwnam" \
+	--enable-auth-digest="file" \
+	--enable-auth-negotiate="wrapper" \
+	--enable-auth-ntlm="fake" \
+	--disable-strict-error-checking \
+	--enable-external-acl-helpers="file_userip" \
+	--with-logdir=/var/log/squid/ \
+	--with-pidfile=/var/run/squid.pid \
+	--with-swapdir=/var/cache/squid/ \
+	--enable-icap-client
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index dedeb70..69eb717 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -8,10 +8,14 @@ TCPDUMP_VERSION = 4.6.2
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no \
-		PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
-TCPDUMP_CONF_OPTS = --without-crypto --with-system-libpcap \
-		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
+TCPDUMP_CONF_ENV = \
+	ac_cv_linux_vers=2 \
+	td_cv_buggygetaddrinfo=no \
+	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+TCPDUMP_CONF_OPTS = \
+	--without-crypto \
+	--with-system-libpcap \
+	$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES = zlib libpcap
 # Patching aclocal.m4
 TCPDUMP_AUTORECONF = YES
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index c8bcfae..f4a8c84 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -25,13 +25,14 @@ VDE2_AUTORECONF = YES
 #
 # Note: disabled features can be added with corresponding dependencies
 #       in future commits.
-VDE2_CONF_OPTS = --disable-experimental  \
-		--disable-cryptcab      \
-		--disable-pcap          \
-		--disable-python        \
-		--disable-profile       \
-		--disable-kernel-switch \
-		--enable-tuntap         \
+VDE2_CONF_OPTS = \
+	--disable-experimental  \
+	--disable-cryptcab      \
+	--disable-pcap          \
+	--disable-python        \
+	--disable-profile       \
+	--disable-kernel-switch \
+	--enable-tuntap         \
 
 #??Package does not build in parallel due to improper make rules
 VDE2_MAKE = $(MAKE1)
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 3b69141..5baa515 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -54,12 +54,15 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	mcookie 			\
 	host-pkgconf
 
-XSERVER_XORG_SERVER_CONF_OPTS = --disable-config-hal \
-		--disable-xnest --disable-xephyr --disable-dmx \
-		--with-builder-addr=buildroot at buildroot.org \
-		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
-		--with-fontrootdir=/usr/share/fonts/X11/ \
-		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
+XSERVER_XORG_SERVER_CONF_OPTS = \
+	--disable-config-hal \
+	--disable-xnest \
+	--disable-xephyr \
+	--disable-dmx \
+	--with-builder-addr=buildroot at buildroot.org \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
+	--with-fontrootdir=/usr/share/fonts/X11/ \
+	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
@@ -69,8 +72,12 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-xorg
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive --enable-xfbdev \
-		--disable-glx --disable-dri --disable-xsdl
+XSERVER_XORG_SERVER_CONF_OPTS += \
+	--enable-kdrive \
+	--enable-xfbdev \
+	--disable-glx \
+	--disable-dri \
+	--disable-xsdl
 define XSERVER_CREATE_X_SYMLINK
 	ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
 endef
