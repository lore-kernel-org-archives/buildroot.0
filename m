From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Dec 2013 18:14:52 +0100
Subject: [Buildroot] [PATCH] external python modules: remove redundant
	python dependency
Message-ID: <7ffd4acd582283fb083a.1387905292@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

File package/Config.in already groups the external python modules inside a
'if BR2_PACKAGE_PYTHON ... endif' statement, so adding a
'depends on BR2_PACKAGE_PYTHON' statement to the individual Config.in files
is not needed.

This is in line with the way gstreamer packages are handled.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/python-configobj/Config.in             |  1 -
 package/python-crc16/Config.in                 |  1 -
 package/python-dialog/Config.in                |  3 +--
 package/python-dpkt/Config.in                  |  1 -
 package/python-id3/Config.in                   |  1 -
 package/python-ipy/Config.in                   |  1 -
 package/python-json-schema-validator/Config.in |  1 -
 package/python-keyring/Config.in               |  1 -
 package/python-mad/Config.in                   |  1 -
 package/python-meld3/Config.in                 |  1 -
 package/python-msgpack/Config.in               |  2 --
 package/python-netifaces/Config.in             |  1 -
 package/python-nfc/Config.in                   |  2 --
 package/python-protobuf/Config.in              |  1 -
 package/python-pyasn/Config.in                 |  1 -
 package/python-pycrypto/Config.in              |  1 -
 package/python-pygame/Config.in                |  1 -
 package/python-pyparsing/Config.in             |  1 -
 package/python-pyro/Config.in                  |  1 -
 package/python-pysnmp-apps/Config.in           |  1 -
 package/python-pysnmp-mibs/Config.in           |  1 -
 package/python-pysnmp/Config.in                |  1 -
 package/python-pyusb/Config.in                 |  2 --
 package/python-pyzmq/Config.in                 |  2 --
 package/python-serial/Config.in                |  1 -
 package/python-setuptools/Config.in            |  1 -
 package/python-simplejson/Config.in            |  1 -
 package/python-thrift/Config.in                |  1 -
 package/python-tornado/Config.in               |  1 -
 package/python-versiontools/Config.in          |  1 -
 30 files changed, 1 insertions(+), 35 deletions(-)

diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
--- a/package/python-configobj/Config.in
+++ b/package/python-configobj/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CONFIGOBJ
 	bool "python-configobj"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  ConfigObj is a simple but powerful config file reader and
 	  writer: an ini file round tripper. Its main feature is that
diff --git a/package/python-crc16/Config.in b/package/python-crc16/Config.in
--- a/package/python-crc16/Config.in
+++ b/package/python-crc16/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CRC16
 	bool "python-crc16"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  This library calculates only CRC16 (16-bit codes) and the
 	  only supported variant at the moment is CRC-CCITT (XModem).
diff --git a/package/python-dialog/Config.in b/package/python-dialog/Config.in
--- a/package/python-dialog/Config.in
+++ b/package/python-dialog/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_DIALOG
 	bool "python-dialog"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dialog
 	depends on BR2_USE_MMU # dialog
 	select BR2_PACKAGE_DIALOG
@@ -11,5 +10,5 @@ config BR2_PACKAGE_PYTHON_DIALOG
 	  http://pythondialog.sourceforge.net/
 
 comment "python-dialog needs a toolchain w/ threads"
-	depends on BR2_USE_MMU && BR2_PACKAGE_PYTHON
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_DPKT
 	bool "python-dpkt"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  Fast, simple packet creation / parsing, with definitions
diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
--- a/package/python-id3/Config.in
+++ b/package/python-id3/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ID3
     bool "python-id3"
-    depends on BR2_PACKAGE_PYTHON
     help
       This module allows one to read and manipulate so-called ID3
       informational tags on MP3 files through an object-oriented
diff --git a/package/python-ipy/Config.in b/package/python-ipy/Config.in
--- a/package/python-ipy/Config.in
+++ b/package/python-ipy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IPY
 	bool "python-ipy"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  IPy - class and tools for handling of IPv4 and
 	  IPv6 addresses and networks.
diff --git a/package/python-json-schema-validator/Config.in b/package/python-json-schema-validator/Config.in
--- a/package/python-json-schema-validator/Config.in
+++ b/package/python-json-schema-validator/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
 	bool "python-json-schema-validator"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
 	help
 	  JSON Schema Validator
diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  The Python keyring lib provides a easy way to access the
 	  system keyring service from Python.
diff --git a/package/python-mad/Config.in b/package/python-mad/Config.in
--- a/package/python-mad/Config.in
+++ b/package/python-mad/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MAD
 	bool "python-mad"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_LIBMAD
 	help
 	  python-mad is a Python binding for the MAD library, a
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
--- a/package/python-meld3/Config.in
+++ b/package/python-meld3/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MELD3
 	bool "python-meld3"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYEXPAT
 	help
 	  A HTML/XML templating system.
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MSGPACK
 	bool "python-msgpack"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_MSGPACK
 	depends on BR2_INSTALL_LIBSTDCPP # msgpack
 	help
@@ -12,5 +11,4 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	  https://pypi.python.org/pypi/msgpack-python/
 
 comment "python-msgpack needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Portable access to network interfaces from Python.
 
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
@@ -10,5 +9,4 @@ config BR2_PACKAGE_PYTHON_NFC
 	  https://launchpad.net/nfcpy
 
 comment "python-nfc needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Python implementation of the Google Protocol Buffers.
 
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYASN
 	bool "python-pyasn"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  PyASN is a Python extension module that enables you to
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
--- a/package/python-pycrypto/Config.in
+++ b/package/python-pycrypto/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_GMP
 	help
 	  PyCrypto is a collection of cryptographic algorithms and
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYGAME
 	bool "python-pygame"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
 	help
 	  Pygame is a cross-platfrom library designed to make it easy to write
diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
 	bool "python-pyparsing"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  The pyparsing module is an alternative approach to creating and
 	  executing simple grammars, vs. the traditional lex/yacc approach,
diff --git a/package/python-pyro/Config.in b/package/python-pyro/Config.in
--- a/package/python-pyro/Config.in
+++ b/package/python-pyro/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYRO
 	bool "python-pyro"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  python-pyro is a Python library stands for PYthon Remote Objects.
 	  It is an advanced and powerful Distributed Object Technology system
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	bool "python-pysnmp-mibs"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_INSTALL_LIBSTDCPP # pyasn
 	select BR2_PACKAGE_PYTHON_PYASN
 	select BR2_PACKAGE_PYTHON_PYCRYPTO
diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
--- a/package/python-pyusb/Config.in
+++ b/package/python-pyusb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYUSB
 	bool "python-pyusb"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -10,5 +9,4 @@ config BR2_PACKAGE_PYTHON_PYUSB
 	  http://sourceforge.net/apps/trac/pyusb/
 
 comment "python-pyusb needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  This package contains the python language binding for zeromq.
@@ -13,6 +12,5 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	  http://zeromq.org/bindings:python
 
 comment "python-pyzmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
-	depends on BR2_PACKAGE_PYTHON
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  python-serial is a Python library to access serial ports.
 
diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  Download, build, install, upgrade, and uninstall Python packages.
diff --git a/package/python-simplejson/Config.in b/package/python-simplejson/Config.in
--- a/package/python-simplejson/Config.in
+++ b/package/python-simplejson/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SIMPLEJSON
 	bool "python-simplejson"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Simple, fast, extensible JSON encoder/decoder for Python
 
diff --git a/package/python-thrift/Config.in b/package/python-thrift/Config.in
--- a/package/python-thrift/Config.in
+++ b/package/python-thrift/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_THRIFT
 	bool "python-thrift"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  python-thrift is a Python bindings for the Apache Thrift RPC system.
 
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
diff --git a/package/python-versiontools/Config.in b/package/python-versiontools/Config.in
--- a/package/python-versiontools/Config.in
+++ b/package/python-versiontools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_VERSIONTOOLS
 	bool "python-versiontools"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Smart replacement for plain tuple used in __version__.
 
