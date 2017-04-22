From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:02 -0400
Subject: [Buildroot] [PATCH v2 16/25] fix ordering on configs starting with
	'p'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-16-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter p in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter p.
  
 package/pangomm/Config.in                 |  8 ++++----
 package/pcmanfm/Config.in                 |  8 ++++----
 package/php/Config.ext                    |  8 ++++----
 package/portaudio/Config.in               |  2 +-
 package/powerpc-utils/Config.in           |  2 +-
 package/powervr/Config.in                 |  2 +-
 package/pppd/Config.in                    |  2 +-
 package/pulseaudio/Config.in              |  2 +-
 package/pulseview/Config.in               | 16 ++++++++--------
 package/pure-ftpd/Config.in               |  2 +-
 package/python-crossbar/Config.in         |  2 +-
 package/python-ipaddr/Config.in           |  2 +-
 package/python-libconfig/Config.in        |  6 +++---
 package/python-msgpack/Config.in          |  2 +-
 package/python-pylibftdi/Config.in        |  2 +-
 package/python-pysnmp-apps/Config.in      |  2 +-
 package/python-pysnmp-mibs/Config.in      |  2 +-
 package/python-service-identity/Config.in |  2 +-
 package/python-treq/Config.in             |  2 +-
 package/python/Config.in                  | 12 ++++++------
 20 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index a7c41a0..08c6064 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_PANGOMM
 	bool "pangomm"
-	select BR2_PACKAGE_CAIROMM
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	select BR2_PACKAGE_CAIROMM
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_LIBSIGC
 	help
 	  The pangomm package is a set of C++ bindings for Pango.
 
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 40ebbdf..979e747 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
-	select BR2_PACKAGE_LIBFM
-	select BR2_PACKAGE_MENU_CACHE
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	select BR2_PACKAGE_LIBFM
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
 	help
 	  PCMan File Manager (PCManFM) is a file manager application developed
 	  by Hong Jen Yee from Taiwan which is meant to be a replacement for
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 7c3ba7e..43cc4b3 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -53,8 +53,8 @@ config BR2_PACKAGE_PHP_EXT_ZIP
 
 config BR2_PACKAGE_PHP_EXT_ZLIB
 	bool "zlib"
-	select BR2_PACKAGE_ZLIB
 	default y
+	select BR2_PACKAGE_ZLIB
 	help
 	  zlib support
 
@@ -136,9 +136,9 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on BR2_USE_MMU # postgresql
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PDO driver for PostgreSQL
 
@@ -164,8 +164,8 @@ comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "Gettext"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Gettext support
 
@@ -180,11 +180,11 @@ config BR2_PACKAGE_PHP_EXT_ICONV
 
 config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
-	select BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	select BR2_PACKAGE_ICU
 	help
 	  Internationalization support
 
diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index 252a92a..18e87fd 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -14,8 +14,8 @@ if BR2_PACKAGE_PORTAUDIO
 
 config BR2_PACKAGE_PORTAUDIO_ALSA
 	bool "alsa support"
-	select BR2_PACKAGE_ALSA_LIB
 	default y
+	select BR2_PACKAGE_ALSA_LIB
 	help
 	  Compile with ALSA support.
 
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index fb2fb7f..b0ca847 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -16,8 +16,8 @@ if BR2_PACKAGE_POWERPC_UTILS
 
 config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	bool "RTAS support"
-	select BR2_PACKAGE_LIBRTAS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBRTAS
 	help
 	  Enable support for functions that require RTAS.
 
diff --git a/package/powervr/Config.in b/package/powervr/Config.in
index 746e15b..7be2b23 100644
--- a/package/powervr/Config.in
+++ b/package/powervr/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_POWERVR
 	bool
 
 config BR2_PACKAGE_PROVIDES_POWERVR
-	depends on BR2_PACKAGE_HAS_POWERVR
 	string
+	depends on BR2_PACKAGE_HAS_POWERVR
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index b56b623..8c56421 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_PPPD
 if BR2_PACKAGE_PPPD
 
 config BR2_PACKAGE_PPPD_FILTER
-	select BR2_PACKAGE_LIBPCAP
 	bool "filtering"
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  Packet filtering abilities for pppd. If enabled,
 	  the pppd active-filter and pass-filter options
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 20aa374..0adfd88 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	depends on BR2_USE_MMU # fork()
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 46abe78..daa0fba 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -1,8 +1,15 @@
 config BR2_PACKAGE_PULSEVIEW
 	bool "pulseview"
+	depends on BR2_PACKAGE_QT5
+	# libsigrok->libglib2:
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP
+	# libsigrok
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_LIBSIGROK
 	select BR2_PACKAGE_LIBSIGROKCXX
-	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5SVG
@@ -10,13 +17,6 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
-	# libsigrok->libglib2:
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP
-	# libsigrok
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index 57b78d1..0e1e9c2 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PURE_FTPD
 	bool "pure-ftpd"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Pure-FTPd is a free (BSD), secure, production-quality and standard-
 	  conformant FTP server. It doesn't provide useless bells and whistles,
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index be83325..faec922 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
@@ -31,7 +32,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
 	select BR2_PACKAGE_PYTHON_WSACCEL
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	help
 	  Crossbar.io is an open-source WAMP application router that
 	  allows to build advanced applications from loosely-coupled
diff --git a/package/python-ipaddr/Config.in b/package/python-ipaddr/Config.in
index 9db2dab..5727927 100644
--- a/package/python-ipaddr/Config.in
+++ b/package/python-ipaddr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_IPADDR
-	depends on BR2_PACKAGE_PYTHON # included since python3.3
 	bool "python-ipaddr"
+	depends on BR2_PACKAGE_PYTHON # included since python3.3
 	help
 	  An IPv4/IPv6 manipulation library in Python. This library is
 	  used to create/poke/manipulate IPv4 and IPv6 addresses and
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index a222f9a..0068871 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -4,13 +4,13 @@ comment "python-libconfig needs a glibc or uClibc toolchain w/ C++, threads"
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_PYTHON
-	select BR2_PACKAGE_LIBCONFIG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# error: invalid use of incomplete type 'struct _IO_FILE'
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_LIBCONFIG
 	help
 	  Python bindings to the C++ library libconfig
 
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 7dfe8e8..9aa2b5f 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_MSGPACK
 	bool "python-msgpack"
-	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # msgpack
+	select BR2_PACKAGE_MSGPACK
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
diff --git a/package/python-pylibftdi/Config.in b/package/python-pylibftdi/Config.in
index f829071..d340974 100644
--- a/package/python-pylibftdi/Config.in
+++ b/package/python-pylibftdi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYLIBFTDI
 	bool "python-pylibftdi"
-	select BR2_PACKAGE_LIBFTDI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBFTDI
 	help
 	  This package contains the python language binding libftdi.
 
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
index b032eba..32e3269 100644
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps"
-	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	select BR2_PACKAGE_PYTHON_PYSNMP
 	help
 	  A collection of command-line tools for SNMP management
 	  purposes built on top of the PySNMP package.
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
index eca17d2..521d95e 100644
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	bool "python-pysnmp-mibs"
-	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	select BR2_PACKAGE_PYTHON_PYSNMP
 	help
 	  PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and
 	  packaged to simplify their use with the PySNMP library.
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index c9cbb6c..304b38a 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	help
 	  Service identity verification for pyOpenSSL.
 
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 4a23737..2047cc0 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents.  It provides a simple, higher level
diff --git a/package/python/Config.in b/package/python/Config.in
index fa83e77..054ccd2 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -39,14 +39,14 @@ menu "core python modules"
 comment "The following modules are unusual or require extra libraries"
 
 config BR2_PACKAGE_PYTHON_BZIP2
-	select BR2_PACKAGE_BZIP2
 	bool "bzip2 module"
+	select BR2_PACKAGE_BZIP2
 	help
 	  bzip2 module for Python
 
 config BR2_PACKAGE_PYTHON_BSDDB
-	select BR2_PACKAGE_BERKELEYDB
 	bool "bsddb module"
+	select BR2_PACKAGE_BERKELEYDB
 	help
 	  bsddb module for Python.
 
@@ -56,8 +56,8 @@ config BR2_PACKAGE_PYTHON_CODECSCJK
 	  Chinese/Japanese/Korean codecs module for Python (large).
 
 config BR2_PACKAGE_PYTHON_CURSES
-	select BR2_PACKAGE_NCURSES
 	bool "curses module"
+	select BR2_PACKAGE_NCURSES
 	help
 	  curses module for Python.
 
@@ -67,15 +67,15 @@ config BR2_PACKAGE_PYTHON_OSSAUDIODEV
 	  ossaudiodev module for Python.
 
 config BR2_PACKAGE_PYTHON_READLINE
-	select BR2_PACKAGE_READLINE
 	bool "readline"
+	select BR2_PACKAGE_READLINE
 	help
 	  readline module for Python (required for command-line
 	  editing in the Python shell).
 
 config BR2_PACKAGE_PYTHON_SSL
-	select BR2_PACKAGE_OPENSSL
 	bool "ssl"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  _ssl module for Python (required for https in urllib etc).
 
@@ -110,8 +110,8 @@ config BR2_PACKAGE_PYTHON_SQLITE
 	  SQLite database support
 
 config BR2_PACKAGE_PYTHON_PYEXPAT
-	select BR2_PACKAGE_EXPAT
 	bool "xml module"
+	select BR2_PACKAGE_EXPAT
 	help
 	  pyexpat and xml libraries for Python
 
-- 
2.9.3
