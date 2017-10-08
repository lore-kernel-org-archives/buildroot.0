From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:22:06 +0200
Subject: [Buildroot] [git commit] python-msgpack: bump to version 0.4.8,
	drop dependency on msgpack
Message-ID: <20171009074818.8E22380F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30c3eb419e7a8ff72882752e95e7f218a87a446a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package doesn't actually rely on the msgpack runtime libraries, it's a
pure python implementation.

Signed-off-by: bradford barr <bradford@density.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-msgpack/Config.in           | 11 ++---------
 package/python-msgpack/python-msgpack.hash |  6 +++---
 package/python-msgpack/python-msgpack.mk   |  5 ++---
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 9aa2b5f..2050d4f 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -1,16 +1,9 @@
 config BR2_PACKAGE_PYTHON_MSGPACK
 	bool "python-msgpack"
-	depends on BR2_INSTALL_LIBSTDCPP # msgpack
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # msgpack
-	select BR2_PACKAGE_MSGPACK
 	help
 	  MessagePack (http://msgpack.org/) is a fast, compact binary
 	  serialization format, suitable for similar data to JSON.
-	  This package provides CPython bindings for reading and
-	  writing MessagePack data.
+	  This package provides a pure python library for reading
+	  and writing MessagePack data.
 
 	  https://pypi.python.org/pypi/msgpack-python/
-
-comment "python-msgpack needs a toolchain w/ C++"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 636aa90..48313ff 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=eb2aad1081534ef3a9f32a0ecd350b9b, sha356 locally computed.
-md5	eb2aad1081534ef3a9f32a0ecd350b9b  msgpack-python-0.4.7.tar.gz
-sha256	5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b  msgpack-python-0.4.7.tar.gz
+# md5 from https://pypi.python.org/pypi/msgpack-python/json, sha256 locally computed.
+md5	dcd854fb41ee7584ebbf35e049e6be98  msgpack-python-0.4.8.tar.gz
+sha256	1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886  msgpack-python-0.4.8.tar.gz
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 344b7bf..5be2b14 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 0.4.7
+PYTHON_MSGPACK_VERSION = 0.4.8
 PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python
+PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/21/27/8a1d82041c7a2a51fcc73675875a5f9ea06c2663e02fcfeb708be1d081a0
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-PYTHON_MSGPACK_DEPENDENCIES = msgpack
 
 $(eval $(python-package))
