From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 00:57:54 +0200
Subject: [Buildroot] [PATCH 09/11] toolchain/common: rename BR2_NEEDS_GETTEXT
In-Reply-To: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347836276-24262-10-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the BR2_NEEDS_GETTEXT variable to a more explanatory name,
BR2_NEEDS_EXTERNAL_GETTEXT.

Update manual and all packages accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-gettext.txt     |   12 ++++++------
 package/avahi/Config.in                     |    2 +-
 package/avahi/avahi.mk                      |    2 +-
 package/axel/Config.in                      |    2 +-
 package/axel/axel.mk                        |    2 +-
 package/binutils/Config.in                  |    2 +-
 package/binutils/binutils.mk                |    2 +-
 package/dnsmasq/Config.in                   |    2 +-
 package/dnsmasq/dnsmasq.mk                  |    4 ++--
 package/gdk-pixbuf/Config.in                |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk            |    2 +-
 package/gettext/Config.in                   |    4 ++--
 package/glib-networking/Config.in           |    2 +-
 package/glib-networking/glib-networking.mk  |    2 +-
 package/gmpc/Config.in                      |    2 +-
 package/gmpc/gmpc.mk                        |    2 +-
 package/grep/Config.in                      |    2 +-
 package/grep/grep.mk                        |    2 +-
 package/kbd/Config.in                       |    2 +-
 package/kbd/kbd.mk                          |    2 +-
 package/libglib2/Config.in                  |    2 +-
 package/libglib2/libglib2.mk                |    2 +-
 package/libidn/Config.in                    |    2 +-
 package/libidn/libidn.mk                    |    2 +-
 package/libsoup/Config.in                   |    2 +-
 package/libsoup/libsoup.mk                  |    2 +-
 package/linux-pam/Config.in                 |    2 +-
 package/linux-pam/linux-pam.mk              |    2 +-
 package/lshw/Config.in                      |    2 +-
 package/lshw/lshw.mk                        |    4 ++--
 package/make/Config.in                      |    2 +-
 package/make/make.mk                        |    2 +-
 package/midori/Config.in                    |    2 +-
 package/midori/midori.mk                    |    2 +-
 package/multimedia/pulseaudio/Config.in     |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 package/pango/Config.in                     |    2 +-
 package/pango/pango.mk                      |    2 +-
 package/php/Config.ext                      |    2 +-
 package/php/php.mk                          |    2 +-
 package/psmisc/Config.in                    |    2 +-
 package/psmisc/psmisc.mk                    |    2 +-
 package/quota/Config.in                     |    2 +-
 package/quota/quota.mk                      |    2 +-
 package/sshfs/Config.in                     |    2 +-
 package/sshfs/sshfs.mk                      |    2 +-
 package/sysstat/Config.in                   |    2 +-
 package/sysstat/sysstat.mk                  |    2 +-
 package/ushare/Config.in                    |    2 +-
 package/ushare/ushare.mk                    |    2 +-
 package/vala/Config.in                      |    2 +-
 package/vala/vala.mk                        |    2 +-
 toolchain/toolchain-common.in               |    6 +++---
 53 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index e0df1a4..71da62a 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -18,23 +18,23 @@ is enabled.
 
 Therefore, Buildroot defines two configuration options:
 
-* +BR2_NEEDS_GETTEXT+, which is true as soon as the toolchain doesn't
+* +BR2_NEEDS_EXTERNAL_GETTEXT+, which is true as soon as the toolchain doesn't
   provide its own gettext implementation
 
-* +BR2_NEEDS_GETTEXT_IF_LOCALE+, which is true if the toolchain
+* +BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE+, which is true if the toolchain
   doesn't provide its own gettext implementation and if locale support
   is enabled
 
 Therefore, packages that unconditionally need gettext should:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+
+* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT+
 
-* Use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
+* Use +$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)+ in the package
   +DEPENDENCIES+ variable
 
 Packages that need gettext only when locale support is enabled should:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+
+* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE+
 
-* Use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
+* Use +$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)+ in the package
   +DEPENDENCIES+ variable
diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 8ba33d5..982966d 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
 	  discovery on a local network.
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 03dc368..67b357e 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -85,7 +85,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkg-config
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkg-config
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
diff --git a/package/axel/Config.in b/package/axel/Config.in
index d823272..4c22286 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  HTTP/FTP download accelerator.
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 0ed8ad2..cfec43d 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -9,7 +9,7 @@ AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
 
 AXEL_LDFLAGS = -lpthread
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
 AXEL_DEPENDENCIES += gettext
 AXEL_LDFLAGS += -lintl
 endif
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 6480370..159bee1 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d41cac4..27cdfd2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -23,7 +23,7 @@ BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index b76ddb2..7b55a20 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBIDN
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Enable IDN support in dnsmasq.
 	  This option is a big space taker since it pulls in many libraries.
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e92a554..8ef4cd3 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -24,8 +24,8 @@ endif
 
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
+	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),-lintl)"
 	DNSMASQ_COPTS += -DHAVE_IDN
 	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
 endif
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 33b5f7c..e50ecbc 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 92a34bf..1df409e 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -40,7 +40,7 @@ GDK_PIXBUF_DEPENDENCIES += xlib_libX11
 endif
 
 GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkg-config libglib2
 
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index ee7d8cb..56a8fe7 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
-	depends on BR2_NEEDS_GETTEXT
+	depends on BR2_NEEDS_EXTERNAL_GETTEXT
 	depends on BR2_USE_WCHAR
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
@@ -22,4 +22,4 @@ config BR2_PACKAGE_GETTEXT_TOOLS
 	  correct operation of programs.
 
 comment "gettext requires a toolchain with WCHAR support"
-	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
+	depends on BR2_NEEDS_EXTERNAL_GETTEXT && !BR2_USE_WCHAR
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index dab35ea..6ed312b 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 823ba39..9f74c35 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -13,7 +13,7 @@ GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
 
 GLIB_NETWORKING_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	host-pkg-config \
 	host-intltool \
 	libglib2
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 9b38d1a..45b08d4 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GMPC
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBMPD
 	select BR2_PACKAGE_LIBSOUP
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index a136cf4..bdc10c5 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -11,6 +11,6 @@ GMPC_CONF_OPT = --disable-mmkeys --disable-unique
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(autotools-package))
diff --git a/package/grep/Config.in b/package/grep/Config.in
index 5906e69..fc4e5b9 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  The GNU regular expression matcher.
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 2636c83..6c37847 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,7 +10,7 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
 GREP_LICENSE_FILES = COPYING
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
-GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+GREP_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 44c3163..939565f 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KBD
 	bool "kbd"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 325978e..69a22c1 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -2,6 +2,6 @@ KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+KBD_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(autotools-package))
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 5282885..50e95d5 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 030cecb..7df1cd0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,7 +55,7 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
 
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index dcf9724..9ef7a64 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Libidn's purpose is to encode and decode internationalized
 	  domain names.
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index c55f2c5..3219dae 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -9,7 +9,7 @@ LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
-LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 57b425f..5a4061a 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_WCHAR # glib2 and gnutls
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 30655ba..c14771d 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) host-pkg-config host-libglib2 libglib2 libxml2
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 7cfd814..1b0bc6e 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 1a2e7f6..9bd1b1b 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -15,7 +15,7 @@ LINUX_PAM_CONF_OPT = \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) flex
+LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) flex
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 98beacd..45ca2b2 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 68daa0d..5bdffc9 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -8,8 +8,8 @@ LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
 LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
-LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT),-lintl)"
-LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext)
+LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),-lintl)"
+LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)
 
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
diff --git a/package/make/Config.in b/package/make/Config.in
index ea2ae1b..d650649 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/make/make.mk b/package/make/make.mk
index 02b2741..b8fe323 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,7 +7,7 @@ MAKE_VERSION:=3.81
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 41f4515..5933699 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 33f94cf..f98bd91 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -14,7 +14,7 @@ MIDORI_DEPENDENCIES = \
 	libgtk2 \
 	libsexy \
 	webkit \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifneq ($(BR2_PACKAGE_XORG7),y)
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6c767bb..927d347 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 406dd8f..439cb17 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -16,7 +16,7 @@ PULSEAUDIO_CONF_OPT = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_NEEDS_GETTEXT),gettext) \
+	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 60e9931..07ca298 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Pango is a library for laying out and rendering of text, with an
 	  emphasis on internationalization. Pango can be used anywhere that
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 86ab474..ed2e313 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,7 +41,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) host-pkg-config libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 2cf71d3..33d64ec 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -146,7 +146,7 @@ comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "Gettext"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
 	depends on BR2_USE_WCHAR
 	help
 	  Gettext support
diff --git a/package/php/php.mk b/package/php/php.mk
index 2f8e99e..38aebdd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -87,7 +87,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
 	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
+	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index cc8420b..4832956 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 5d2333f..aaf08d1 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -8,7 +8,7 @@ PSMISC_VERSION = 22.16
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_LICENSE = GPLv2
 PSMISC_LICENSE_FILES = COPYING
-PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
 # Don't force -fstack-protector
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 3ad0b8c..17f2278 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  Implementation of the disk quota system.
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index abe3675..2be3fa4 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -10,7 +10,7 @@ QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(Q
 
 QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
 QUOTA_DEPENDENCIES = gettext
 QUOTA_MAKE_OPT += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 37188ba..1416393 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index e72db0a..23e62e0 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -9,7 +9,7 @@ SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VE
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(autotools-package))
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index ceba503..834e99b 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 83609a0..794d70b 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -13,7 +13,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
 SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
 endif
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index f7b2124..eb1d2b2 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_USHARE
 	bool "ushare"
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBUPNP
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 78cbcda..aa47618 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -9,7 +9,7 @@ USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
 USHARE_DEPENDENCIES = host-pkg-config libupnp
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
 USHARE_DEPENDENCIES += gettext
 USHARE_LDFLAGS += -lintl
 endif
diff --git a/package/vala/Config.in b/package/vala/Config.in
index e0d665c..0021895 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_VALA
 	bool "vala"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Compiler for the GObject type system.
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 3ce8610..fef51da 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -10,7 +10,7 @@ VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_DEPENDENCIES = host-flex libglib2 \
-		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+		$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
 $(eval $(autotools-package))
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 6e0d159..091aaa1 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -82,15 +82,15 @@ config BR2_GENERATE_LOCALE
 # locale support is enabled. See the documentation for how packages
 # should rely on the following two options.
 
-config BR2_NEEDS_GETTEXT
+config BR2_NEEDS_EXTERNAL_GETTEXT
 	bool
 	default y if BR2_TOOLCHAIN_BUILDROOT
 	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	default y if BR2_TOOLCHAIN_CTNG_uClibc
 
-config BR2_NEEDS_GETTEXT_IF_LOCALE
+config BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	bool
-	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
+	default y if (BR2_NEEDS_EXTERNAL_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
 	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
-- 
1.7.2.5
