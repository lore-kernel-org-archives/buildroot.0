From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:50 -0300
Subject: [Buildroot] [PATCH 25/36] Config.in*: re-wrap help text
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-26-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 Config.in        |  27 +++---
 Config.in.legacy | 289 +++++++++++++++++++++++++++++++------------------------
 2 files changed, 176 insertions(+), 140 deletions(-)

diff --git a/Config.in b/Config.in
index ca6010fd30..71b9f60e5b 100644
--- a/Config.in
+++ b/Config.in
@@ -175,8 +175,8 @@ config BR2_TAR_OPTIONS
 	default ""
 	help
 	  Options to pass to tar when extracting the sources.
-	  E.g. " -v --exclude='*.svn*'" to exclude all .svn internal files
-	  and to be verbose.
+	  E.g. " -v --exclude='*.svn*'" to exclude all .svn internal
+	  files and to be verbose.
 
 endmenu
 
@@ -667,7 +667,8 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 
 	  Note that this mechanism is available for both the internal
 	  toolchain (through the toolchain wrapper and binutils patches)
-	  and external toolchain backends (through the toolchain wrapper).
+	  and external toolchain backends (through the toolchain
+	  wrapper).
 
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
@@ -751,9 +752,9 @@ choice
 	bool "RELRO Protection"
 	depends on BR2_SHARED_LIBS
 	help
-	  Enable a link-time protection know as RELRO (RELocation Read Only)
-	  which helps to protect from certain type of exploitation techniques
-	  altering the content of some ELF sections.
+	  Enable a link-time protection know as RELRO (RELocation Read
+	  Only) which helps to protect from certain type of exploitation
+	  techniques altering the content of some ELF sections.
 
 config BR2_RELRO_NONE
 	bool "None"
@@ -769,9 +770,9 @@ config BR2_RELRO_PARTIAL
 config BR2_RELRO_FULL
 	bool "Full"
 	help
-	  This option includes the partial configuration, but also
-	  marks the GOT as read-only at the cost of initialization time
-	  during program loading, i.e every time an executable is started.
+	  This option includes the partial configuration, but also marks
+	  the GOT as read-only at the cost of initialization time during
+	  program loading, i.e every time an executable is started.
 
 endchoice
 
@@ -784,10 +785,10 @@ choice
 	depends on !BR2_OPTIMIZE_0
 	help
 	  Enable the _FORTIFY_SOURCE macro which introduces additional
-	  checks to detect buffer-overflows in the following standard library
-	  functions: memcpy, mempcpy, memmove, memset, strcpy, stpcpy,
-	  strncpy, strcat, strncat, sprintf, vsprintf, snprintf, vsnprintf,
-	  gets.
+	  checks to detect buffer-overflows in the following standard
+	  library functions: memcpy, mempcpy, memmove, memset, strcpy,
+	  stpcpy, strncpy, strcat, strncat, sprintf, vsprintf, snprintf,
+	  vsnprintf, gets.
 
 	  NOTE: This feature requires an optimization level of s/1/2/3/g
 
diff --git a/Config.in.legacy b/Config.in.legacy
index 08a129106c..fa083eaf79 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,11 +99,11 @@ if !BR2_SKIP_LEGACY
 config BR2_LEGACY
 	bool
 	help
-	  This option is selected automatically when your old .config uses an
-	  option that no longer exists in current buildroot. In that case, the
-	  build will fail. Look for config options which are selected in the
-	  menu below: they no longer exist and should be replaced by something
-	  else.
+	  This option is selected automatically when your old .config
+	  uses an option that no longer exists in current buildroot. In
+	  that case, the build will fail. Look for config options which
+	  are selected in the menu below: they no longer exist and
+	  should be replaced by something else.
 
 # This comment fits exactly in a 80-column display
 comment "Legacy detected: check the content of the menu below"
@@ -566,18 +566,18 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	select BR2_LEGACY
 	help
 	  The Sourcery CodeBench toolchain for the sh architecture has
-	  been removed, since it uses glibc older than 2.17 that requires
-	  -lrt to link executables using clock_* system calls. This makes
-	  this toolchain difficult to maintain over time.
+	  been removed, since it uses glibc older than 2.17 that
+	  requires -lrt to link executables using clock_* system calls.
+	  This makes this toolchain difficult to maintain over time.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	bool "x86 Sourcery toolchain has been removed"
 	select BR2_LEGACY
 	help
 	  The Sourcery CodeBench toolchain for the x86 architecture has
-	  been removed, since it uses glibc older than 2.17 that requires
-	  -lrt to link executables using clock_* system calls. This makes
-	  this toolchain difficult to maintain over time.
+	  been removed, since it uses glibc older than 2.17 that
+	  requires -lrt to link executables using clock_* system calls.
+	  This makes this toolchain difficult to maintain over time.
 
 config BR2_GCC_VERSION_4_8_X
 	bool "gcc 4.8.x support removed"
@@ -672,10 +672,10 @@ config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
 	int "extra size in blocks has been removed"
 	default 0
 	help
-	  Since the support for auto calculation of the filesystem size has been
-	  removed, this option is now useless and must be 0.
-	  You may want to check that BR2_TARGET_ROOTFS_EXT2_BLOCKS matchs
-	  your needs.
+	  Since the support for auto calculation of the filesystem size
+	  has been removed, this option is now useless and must be 0.
+	  You may want to check that BR2_TARGET_ROOTFS_EXT2_BLOCKS
+	  matchs your needs.
 
 config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS_WRAP
 	bool
@@ -703,14 +703,16 @@ config BR2_NBD_CLIENT
 	select BR2_LEGACY
 	select BR2_PACKAGE_NBD_CLIENT
 	help
-	  The nbd client option has been renamed to BR2_PACKAGE_NBD_CLIENT.
+	  The nbd client option has been renamed to
+	  BR2_PACKAGE_NBD_CLIENT.
 
 config BR2_NBD_SERVER
 	bool "nbd server option was renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_NBD_SERVER
 	help
-	  The nbd server option has been renamed to BR2_PACKAGE_NBD_SERVER.
+	  The nbd server option has been renamed to
+	  BR2_PACKAGE_NBD_SERVER.
 
 config BR2_PACKAGE_GMOCK
 	bool "gmock merged into gtest package"
@@ -805,8 +807,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	help
 	  The support for the prebuilt toolchain based on the Musl C
 	  library provided by the musl-cross project has been removed.
-	  Upstream doesn't provide any prebuilt toolchain anymore, use the
-	  Buildroot toolchain instead.
+	  Upstream doesn't provide any prebuilt toolchain anymore, use
+	  the Buildroot toolchain instead.
 
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "uClibc tests now in uclibc-ng-test"
@@ -957,8 +959,8 @@ config BR2_PACKAGE_IPKG
 	select BR2_LEGACY
 	help
 	  ipkg dates back to the early 2000s when Compaq started the
-	  handhelds.org project and it hasn't seen development since 2006.
-	  Use opkg as a replacement.
+	  handhelds.org project and it hasn't seen development since
+	  2006. Use opkg as a replacement.
 
 config BR2_GCC_VERSION_4_7_X
 	bool "gcc 4.7.x support removed"
@@ -1030,8 +1032,9 @@ config BR2_KERNEL_HEADERS_3_19
 	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
-	  Version 3.19.x of the Linux kernel headers have been deprecated
-	  for more than four buildroot releases and are now removed.
+	  Version 3.19.x of the Linux kernel headers have been
+	  deprecated for more than four buildroot releases and are now
+	  removed.
 	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
@@ -1040,8 +1043,8 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_LEGACY
 	select BR2_PACKAGE_EFL
 	help
-	  With EFL 1.18, libevas-generic-loaders is now provided by the efl
-	  package.
+	  With EFL 1.18, libevas-generic-loaders is now provided by the
+	  efl package.
 
 config BR2_PACKAGE_ELEMENTARY
 	bool "elementary package removed"
@@ -1053,8 +1056,9 @@ config BR2_PACKAGE_ELEMENTARY
 config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	bool "Linux kernel local directory option removed"
 	help
-	  The option to select a local directory as the source of the Linux
-	  kernel has been removed. It hurts reproducibility of builds.
+	  The option to select a local directory as the source of the
+	  Linux kernel has been removed. It hurts reproducibility of
+	  builds.
 
 	  In case you were using this option during development of your
 	  Linux kernel, use the override mechanism instead.
@@ -1092,14 +1096,16 @@ config BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_LEGACY
 	select BR2_PACKAGE_IMX_VPUWRAP
 	help
-	  The libfslvpuwrap has been renamed to match the renamed package.
+	  The libfslvpuwrap has been renamed to match the renamed
+	  package.
 
 config BR2_PACKAGE_LIBFSLPARSER
 	bool "libfslparser has been renamed to imx-parser"
 	select BR2_LEGACY
 	select BR2_PACKAGE_IMX_PARSER
 	help
-	  The libfslparser has been renamed to match the renamed package.
+	  The libfslparser has been renamed to match the renamed
+	  package.
 
 config BR2_PACKAGE_LIBFSLCODEC
 	bool "libfslcodec has been renamed to imx-codec"
@@ -1246,8 +1252,9 @@ config BR2_KERNEL_HEADERS_3_17
 	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
-	  Version 3.17.x of the Linux kernel headers have been deprecated
-	  for more than four buildroot releases and are now removed.
+	  Version 3.17.x of the Linux kernel headers have been
+	  deprecated for more than four buildroot releases and are now
+	  removed.
 	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
@@ -1350,8 +1357,8 @@ config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
 	select BR2_LEGACY
 	help
-	  This option depends on BR2_ENABLE_DEBUG which should not be used
-	  by packages anymore.
+	  This option depends on BR2_ENABLE_DEBUG which should not be
+	  used by packages anymore.
 
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
 	bool "openpowerlink package has been updated"
@@ -1393,10 +1400,11 @@ config BR2_KERNEL_HEADERS_3_16
 	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
-	Version 3.16.x of the Linux kernel headers have been deprecated
-	for more than four buildroot releases and are now removed.
-	As an alternative, version 3.12.x of the headers have been
-	automatically selected in your configuration.
+	  Version 3.16.x of the Linux kernel headers have been
+	  deprecated for more than four buildroot releases and are now
+	  removed.
+	  As an alternative, version 3.12.x of the headers have been
+	  automatically selected in your configuration.
 
 config BR2_PACKAGE_PYTHON_PYXML
 	bool "python-pyxml package has been removed"
@@ -1409,9 +1417,9 @@ config BR2_PACKAGE_PYTHON_PYXML
 config BR2_ENABLE_SSP
 	bool "Stack Smashing protection now has different levels"
 	help
-	  The protection offered by SSP can now be selected from different
-	  protection levels. Be sure to review the SSP level in the build
-	  options menu.
+	  The protection offered by SSP can now be selected from
+	  different protection levels. Be sure to review the SSP level
+	  in the build options menu.
 
 config BR2_PACKAGE_DIRECTFB_CLE266
 	bool "cle266 driver for directfb removed"
@@ -1434,8 +1442,8 @@ config BR2_PACKAGE_LIBELEMENTARY
 	select BR2_LEGACY
 	select BR2_PACKAGE_ELEMENTARY
 	help
-	  The libelementary package has been renamed to match the upstream
-	  name.
+	  The libelementary package has been renamed to match the
+	  upstream name.
 
 config BR2_PACKAGE_LIBEINA
 	bool "libeina package has been removed"
@@ -1513,8 +1521,8 @@ config BR2_PACKAGE_INFOZIP
 	select BR2_PACKAGE_ZIP
 	help
 	  Info-Zip's Zip package has been renamed from infozip to zip,
-	  to avoid ambiguities with Info-Zip's UnZip which has been added
-	  in the unzip package.
+	  to avoid ambiguities with Info-Zip's UnZip which has been
+	  added in the unzip package.
 
 config BR2_BR2_PACKAGE_NODEJS_0_10_X
 	bool "nodejs 0.10.x option removed"
@@ -1522,9 +1530,10 @@ config BR2_BR2_PACKAGE_NODEJS_0_10_X
 	select BR2_PACKAGE_NODEJS
 	help
 	  nodejs 0.10.x option has been removed.  0.10.x is now
-	  automatically chosen for ARMv5 architectures only and the latest
-	  nodejs for all other supported architectures. The correct nodejs
-	  version has been automatically selected in your configuration.
+	  automatically chosen for ARMv5 architectures only and the
+	  latest nodejs for all other supported architectures. The
+	  correct nodejs version has been automatically selected in your
+	  configuration.
 
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "nodejs version 0.12.x has been removed"
@@ -1560,24 +1569,24 @@ config BR2_PACKAGE_MEDIA_CTL
 	select BR2_PACKAGE_LIBV4L
 	select BR2_PACKAGE_LIBV4L_UTILS
 	help
-	  media-ctl source and developement have been moved to
-	  v4l-utils since June 2014. For an up-to-date media-ctl
-	  version select BR2_PACKAGE_LIBV4L and BR2_PACKAGE_LIBV4L_UTILS.
+	  media-ctl source and developement have been moved to v4l-utils
+	  since June 2014. For an up-to-date media-ctl version select
+	  BR2_PACKAGE_LIBV4L and BR2_PACKAGE_LIBV4L_UTILS.
 
 config BR2_PACKAGE_SCHIFRA
 	bool "schifra package has been removed"
 	select BR2_LEGACY
 	help
-	  Schifra package has been maked broken since 2014.11 release and
-	  haven't been fixed since then.
+	  Schifra package has been maked broken since 2014.11 release
+	  and haven't been fixed since then.
 
 config BR2_PACKAGE_ZXING
 	bool "zxing option has been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_ZXING_CPP
 	help
-	  ZXing no longer provides the cpp bindings, it has been renamed to
-	  BR2_PACKAGE_ZXING_CPP which uses a new upstream.
+	  ZXing no longer provides the cpp bindings, it has been renamed
+	  to BR2_PACKAGE_ZXING_CPP which uses a new upstream.
 
 # Since FreeRDP has new dependencies, protect this legacy to avoid the
 # infamous "unmet direct dependencies" kconfig error.
@@ -1609,8 +1618,9 @@ config BR2_KERNEL_HEADERS_3_11
 	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
-	  Version 3.11.x of the Linux kernel headers have been deprecated
-	  for more than four buildroot releases and are now removed.
+	  Version 3.11.x of the Linux kernel headers have been
+	  deprecated for more than four buildroot releases and are now
+	  removed.
 	  As an alternative, version 3.10.x of the headers have been
 	  automatically selected in your configuration.
 
@@ -1619,8 +1629,9 @@ config BR2_KERNEL_HEADERS_3_13
 	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
-	  Version 3.13.x of the Linux kernel headers have been deprecated
-	  for more than four buildroot releases and are now removed.
+	  Version 3.13.x of the Linux kernel headers have been
+	  deprecated for more than four buildroot releases and are now
+	  removed.
 	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
@@ -1629,8 +1640,9 @@ config BR2_KERNEL_HEADERS_3_15
 	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
-	  Version 3.15.x of the Linux kernel headers have been deprecated
-	  for more than four buildroot releases and are now removed.
+	  Version 3.15.x of the Linux kernel headers have been
+	  deprecated for more than four buildroot releases and are now
+	  removed.
 	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
@@ -2058,8 +2070,9 @@ config BR2_TARGET_GENERIC_PASSWD_DES
 	bool "Encoding passwords with DES has been removed"
 	select BR2_LEGACY
 	help
-	  Paswords can now only be encoded with either of md5, sha256 or sha512.
-	  The default is md5, which is stronger that DES (but still pretty weak).
+	  Paswords can now only be encoded with either of md5, sha256 or
+	  sha512. The default is md5, which is stronger that DES (but
+	  still pretty weak).
 
 config BR2_PACKAGE_GTK2_THEME_HICOLOR
 	bool "hicolor (default theme) is a duplicate"
@@ -2083,16 +2096,17 @@ config BR2_PACKAGE_LIBGC
 	select BR2_LEGACY
 	select BR2_PACKAGE_BDWGC
 	help
-	  libgc has been removed because we have the same package under a
-	  different name, bdwgc.
+	  libgc has been removed because we have the same package under
+	  a different name, bdwgc.
 
 config BR2_PACKAGE_WDCTL
 	bool "util-linux' wdctl option has been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_UTIL_LINUX_WDCTL
 	help
-	  util-linux' wdctl option has been renamed to BR2_PACKAGE_UTIL_LINUX_WDCTL
-	  to be aligned with how the other options are named.
+	  util-linux' wdctl option has been renamed to
+	  BR2_PACKAGE_UTIL_LINUX_WDCTL to be aligned with how the other
+	  options are named.
 
 config BR2_PACKAGE_UTIL_LINUX_ARCH
 	bool "util-linux' arch option has been removed"
@@ -2112,16 +2126,17 @@ config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 	select BR2_LEGACY
 	select BR2_PACKAGE_BZIP2
 	help
-	  The bzip2 payloads option rely entirely on the dependant package bzip2.
-	  So, you need to select it to enable this feature.
+	  The bzip2 payloads option rely entirely on the dependant
+	  package bzip2. So, you need to select it to enable this
+	  feature.
 
 config BR2_PACKAGE_RPM_XZ_PAYLOADS
 	bool "rpm's xz payloads option has been removed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_XZ
 	help
-	  The xz payloads option rely entirely on the dependant package xz.
-	  So, you need to select it to enable this feature.
+	  The xz payloads option rely entirely on the dependant package
+	  xz. So, you need to select it to enable this feature.
 
 config BR2_PACKAGE_M4
 	bool "m4 target package removed"
@@ -2176,9 +2191,9 @@ config BR2_PACKAGE_STRONGSWAN_TOOLS
 	select BR2_PACKAGE_STRONGSWAN_PKI
 	select BR2_PACKAGE_STRONGSWAN_SCEP
 	help
-	  The tools option has been removed upstream and the different tools
-	  have been split between the pki and scep options, with others
-	  deprecated.
+	  The tools option has been removed upstream and the different
+	  tools have been split between the pki and scep options, with
+	  others deprecated.
 
 config BR2_PACKAGE_XBMC_ADDON_XVDR
 	bool "xbmc-addon-xvdr removed"
@@ -2193,126 +2208,144 @@ config BR2_PACKAGE_XBMC_PVR_ADDONS
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_PVR_ADDONS
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_ALSA_LIB
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_ALSA_LIB
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_AVAHI
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_AVAHI
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_DBUS
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_DBUS
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBBLURAY
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBBLURAY
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_GOOM
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_GOOM
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_RSXS
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_RSXS
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBCEC
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBMICROHTTPD
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBNFS
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBNFS
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_RTMPDUMP
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_RTMPDUMP
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBSMBCLIENT
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBSMBCLIENT
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBTHEORA
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBTHEORA
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBUSB
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBUSB
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_LIBVA
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_LIBVA
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PACKAGE_XBMC_WAVPACK
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_WAVPACK
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  The XBMC media center project was renamed to Kodi
+	  entertainment center
 
 config BR2_PREFER_STATIC_LIB
 	bool "static library option renamed"
@@ -2390,8 +2423,8 @@ config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 	select BR2_PACKAGE_LINUX_FIRMWARE_XCx000
 	help
 	  The Xceive xc5000 option now also handles older firmwares from
-	  Xceive (the xc4000 series), as well as new firmwares (the xc5000c)
-	  from Cresta, who bought Xceive.
+	  Xceive (the xc4000 series), as well as new firmwares (the
+	  xc5000c) from Cresta, who bought Xceive.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
 	bool "Chelsio T4 option has been renamed"
@@ -2432,9 +2465,9 @@ config BR2_PACKAGE_LIBELF
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_LEGACY
 	help
-	  The libelf package provided an old version of the libelf library
-	  and is deprecated. The libelf library is now provided by the
-	  elfutils package.
+	  The libelf package provided an old version of the libelf
+	  library and is deprecated. The libelf library is now provided
+	  by the elfutils package.
 
 config BR2_KERNEL_HEADERS_3_8
 	bool "kernel headers version 3.8.x are no longer supported"
@@ -2461,7 +2494,8 @@ config BR2_PACKAGE_PROCPS
 	select BR2_PACKAGE_PROCPS_NG
 	select BR2_LEGACY
 	help
-	  The procps package has been replaced by the equivalent procps-ng.
+	  The procps package has been replaced by the equivalent
+	  procps-ng.
 
 config BR2_BINUTILS_VERSION_2_20_1
 	bool "binutils 2.20.1 has been removed"
@@ -2548,40 +2582,40 @@ config BR2_PACKAGE_LIBV4L_DECODE_TM6000
 	select BR2_PACKAGE_LIBV4L_UTILS
 	select BR2_LEGACY
 	help
-	  This libv4l option has been deprecated and replaced by a single
-	  option to build all the libv4l utilities.
+	  This libv4l option has been deprecated and replaced by a
+	  single option to build all the libv4l utilities.
 
 config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
 	bool "ir-keytable"
 	select BR2_PACKAGE_LIBV4L_UTILS
 	select BR2_LEGACY
 	help
-	  This libv4l option has been deprecated and replaced by a single
-	  option to build all the libv4l utilities.
+	  This libv4l option has been deprecated and replaced by a
+	  single option to build all the libv4l utilities.
 
 config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
 	bool "v4l2-compliance"
 	select BR2_PACKAGE_LIBV4L_UTILS
 	select BR2_LEGACY
 	help
-	  This libv4l option has been deprecated and replaced by a single
-	  option to build all the libv4l utilities.
+	  This libv4l option has been deprecated and replaced by a
+	  single option to build all the libv4l utilities.
 
 config BR2_PACKAGE_LIBV4L_V4L2_CTL
 	bool "v4l2-ctl"
 	select BR2_PACKAGE_LIBV4L_UTILS
 	select BR2_LEGACY
 	help
-	  This libv4l option has been deprecated and replaced by a single
-	  option to build all the libv4l utilities.
+	  This libv4l option has been deprecated and replaced by a
+	  single option to build all the libv4l utilities.
 
 config BR2_PACKAGE_LIBV4L_V4L2_DBG
 	bool "v4l2-dbg"
 	select BR2_PACKAGE_LIBV4L_UTILS
 	select BR2_LEGACY
 	help
-	  This libv4l option has been deprecated and replaced by a single
-	  option to build all the libv4l utilities.
+	  This libv4l option has been deprecated and replaced by a
+	  single option to build all the libv4l utilities.
 
 ###############################################################################
 comment "Legacy options removed in 2014.05"
@@ -2629,8 +2663,8 @@ config BR2_PACKAGE_TZDATA_ZONELIST
 	string "tzdata: the timezone list option has been renamed"
 	help
 	  The option BR2_PACKAGE_TZDATA_ZONELIST has been renamed to
-	  BR2_TARGET_TZ_ZONELIST, and moved to the "System configuration"
-	  menu. You'll need to select BR2_TARGET_TZ_INFO.
+	  BR2_TARGET_TZ_ZONELIST, and moved to the "System
+	  configuration" menu. You'll need to select BR2_TARGET_TZ_INFO.
 
 config BR2_PACKAGE_TZDATA_ZONELIST_WRAP
 	bool
@@ -2642,8 +2676,8 @@ config BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE
 	select BR2_LEGACY
 	help
 	  The BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE option has been
-	  renamed to BR2_PACKAGE_LUA_EDITING_NONE. You will have to select
-	  it in the corresponding choice.
+	  renamed to BR2_PACKAGE_LUA_EDITING_NONE. You will have to
+	  select it in the corresponding choice.
 
 config BR2_PACKAGE_LUA_INTERPRETER_READLINE
 	bool "Lua command-line editing using readline has been renamed"
@@ -2707,8 +2741,8 @@ config BR2_PACKAGE_UDEV
 	  'systemd' as init system, 'eudev' should be selected, which is
 	  the case if '/dev management' is set to 'Dynamic using eudev'.
 
-	  If you are using 'systemd', its internal implementation of 'udev'
-	  is used.
+	  If you are using 'systemd', its internal implementation of
+	  'udev' is used.
 
 config BR2_PACKAGE_UDEV_RULES_GEN
 	bool "udev rules generation handled by provider"
@@ -2724,8 +2758,8 @@ config BR2_PACKAGE_UDEV_RULES_GEN
 	  '/dev management' is set to 'Dynamic using eudev' to get
 	  the same behaviour as in your old configuration.
 
-	  If you are using 'systemd', it internal implementation of 'udev'
-	  will generate the rules.
+	  If you are using 'systemd', it internal implementation of
+	  'udev' will generate the rules.
 
 config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	bool "udev extras removed"
@@ -2832,23 +2866,23 @@ config BR2_HAVE_DOCUMENTATION
 	bool "support for documentation on target has been removed"
 	select BR2_LEGACY
 	help
-	  Support for documentation on target has been removed since it has
-	  been deprecated for more than four buildroot releases.
+	  Support for documentation on target has been removed since it
+	  has been deprecated for more than four buildroot releases.
 
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake target package has been removed"
 	select BR2_LEGACY
 	help
-	  The 'automake' target package has been removed since it has been
-	  deprecated for more than four buildroot releases.
+	  The 'automake' target package has been removed since it has
+	  been deprecated for more than four buildroot releases.
 	  Note: the host automake still exists.
 
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf target package has been removed"
 	select BR2_LEGACY
 	help
-	  The 'autoconf' target package has been removed since it has been
-	  deprecated for more than four buildroot releases.
+	  The 'autoconf' target package has been removed since it has
+	  been deprecated for more than four buildroot releases.
 	  Note: the host autoconf still exists.
 
 config BR2_PACKAGE_XSTROKE
@@ -2864,7 +2898,8 @@ config BR2_PACKAGE_LZMA
 	help
 	  The 'lzma' target package has been removed since it has been
 	  deprecated for more than four buildroot releases.
-	  Note: generating lzma-compressed rootfs images is still supported.
+	  Note: generating lzma-compressed rootfs images is still
+	  supported.
 
 config BR2_PACKAGE_TTCP
 	bool "ttcp has been removed"
@@ -2878,9 +2913,9 @@ config BR2_PACKAGE_LIBNFC_LLCP
 	select BR2_LEGACY
 	select BR2_PACKAGE_LIBLLCP
 	help
-	  The 'libnfc-llcp' package has been removed since upstream renamed
-	  to 'libllcp'. We have added a new package for 'libllcp' and bumped
-	  the version at the same time.
+	  The 'libnfc-llcp' package has been removed since upstream
+	  renamed to 'libllcp'. We have added a new package for
+	  'libllcp' and bumped the version at the same time.
 
 config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL client renamed to MySQL"
@@ -2946,8 +2981,8 @@ config BR2_PACKAGE_LVM2_DMSETUP_ONLY
 	help
 	  The BR2_PACKAGE_LVM2_DMSETUP_ONLY was a negative option, which
 	  led to problems with other packages that need the full lvm2
-	  suite. Therefore, the option has been replaced with the positive
-	  BR2_PACKAGE_LVM2_STANDARD_INSTALL option.
+	  suite. Therefore, the option has been replaced with the
+	  positive BR2_PACKAGE_LVM2_STANDARD_INSTALL option.
 
 # Note: BR2_PACKAGE_LVM2_DMSETUP_ONLY is still referenced in package/lvm2/Config.in
 # in order to automatically propagate old configs
-- 
2.14.1
