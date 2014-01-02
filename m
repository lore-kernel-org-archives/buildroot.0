From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:12:02 +0100
Subject: [Buildroot] [git commit] package: standardise Apache licenses
Message-ID: <20140102141207.8DE429C360@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab836f14e62209ce506ff17c7f344e07458e9085
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apache licenses are referred to in a variety of ways; standardise these,
choosing a form which does not contain whitespace.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/legal-notice.txt             |    3 +++
 package/freerdp/freerdp.mk               |    2 +-
 package/imagemagick/imagemagick.mk       |    2 +-
 package/ne10/ne10.mk                     |    2 +-
 package/python-msgpack/python-msgpack.mk |    2 +-
 package/python-pyzmq/python-pyzmq.mk     |    2 +-
 package/python-tornado/python-tornado.mk |    2 +-
 package/subversion/subversion.mk         |    2 +-
 package/thrift/thrift.mk                 |    2 +-
 package/zxing/zxing.mk                   |    2 +-
 10 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 574c1d8..f79a578 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -122,6 +122,9 @@ Buildroot, with the name used in the manifest files:
 * `BSD-3c`: BSD 3-clause license;
 * `BSD-2c`: BSD 2-clause license;
 * `MIT`: MIT-style license.
+* `Apache-2.0`:
+  http://apache.org/licenses/LICENSE-2.0.html[
+  Apache License, version 2.0];
 
 Complying with the Buildroot license
 ------------------------------------
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 3ac53aa..e92067c 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -8,7 +8,7 @@ FREERDP_VERSION = 1.0.1
 FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
-FREERDP_LICENSE = Apache 2.0
+FREERDP_LICENSE = Apache-2.0
 FREEDRP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ef9c1c0..cf02174 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -10,7 +10,7 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
 IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
-IMAGEMAGICK_LICENSE = Apache-v2
+IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
 IMAGEMAGICK_INSTALL_STAGING = YES
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index bb5259f..79b53b8 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -8,7 +8,7 @@
 # one year old.
 NE10_VERSION = 88c18f02199947b2c8b57796f5a3ca53160aff96
 NE10_SITE = http://github.com/projectNe10/Ne10/tarball/$(NE10_VERSION)
-NE10_LICENSE = BSD-3c or Apache 2.0
+NE10_LICENSE = BSD-3c or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 2a7c384..725a29d 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -7,7 +7,7 @@
 PYTHON_MSGPACK_VERSION = 0.4.0
 PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
 PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python/
-PYTHON_MSGPACK_LICENSE = Apache License, Version 2.0
+PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_MSGPACK_DEPENDENCIES = msgpack
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index b3a8f9d..b792ee9 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -7,7 +7,7 @@
 PYTHON_PYZMQ_VERSION = 13.1.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
 PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq/
-PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache License Version 2.0
+PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
 PYTHON_PYZMQ_DEPENDENCIES = zeromq
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 781ec03..bac3ce7 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -7,7 +7,7 @@
 PYTHON_TORNADO_VERSION = 3.1.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
-PYTHON_TORNADO_LICENSE = Apache-v2
+PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 6eb3218..d7a4b42 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -6,7 +6,7 @@
 
 SUBVERSION_VERSION = 1.7.14
 SUBVERSION_SITE = http://archive.apache.org/dist/subversion
-SUBVERSION_LICENSE = Apache 2.0
+SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
 
 SUBVERSION_DEPENDENCIES = apr apr-util expat neon zlib
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 8af9643..d61cc3a 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -14,7 +14,7 @@ THRIFT_CONF_OPT = --with-sysroot=$(STAGING_DIR) --with-tests=no \
 	--with-boost=$(STAGING_DIR)
 HOST_THRIFT_CONF_OPT = --with-sysroot=$(HOST_DIR) --with-tests=no
 THRIFT_AUTORECONF = YES
-THRIFT_LICENSE = Apache 2.0
+THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index f58be08..367a84f 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -7,7 +7,7 @@
 ZXING_VERSION = 2.3.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
-ZXING_LICENSE = Apache v2.0
+ZXING_LICENSE = Apache-2.0
 ZXING_LICENSE_FILES = COPYING
 ZXING_INSTALL_STAGING = YES
 
