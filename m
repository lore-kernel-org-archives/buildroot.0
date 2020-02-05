From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 15:48:22 +0100
Subject: [Buildroot] [git commit] package/python-iniparse: bump to version
 0.5
Message-ID: <20200205143952.8B59D8C9E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca328f80da2da66c0c6940cd4908ab868025f670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version brings Python 3.x support, so we make the package
available with Python 3.x. Also, iniparse now requires six, which has
been detected thanks to the runtime tests.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Thomas: drop depends on python || python3]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iniparse/Config.in            | 2 +-
 package/python-iniparse/python-iniparse.hash | 6 +++---
 package/python-iniparse/python-iniparse.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-iniparse/Config.in b/package/python-iniparse/Config.in
index 65c1064927..3d9c02e4cb 100644
--- a/package/python-iniparse/Config.in
+++ b/package/python-iniparse/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_INIPARSE
 	bool "python-iniparse"
-	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  iniparse is an INI parser for Python which is API compatible
 	  with the standard library's ConfigParser, preserves
diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index b843025521..238d41e06d 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,7 +1,7 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e573e9e9733d97623881ce9bbe5eca6
-md5 5e573e9e9733d97623881ce9bbe5eca6 iniparse-0.4.tar.gz
+# From https://pypi.org/project/iniparse/#copy-hash-modal-5fdd923b-0592-4d2d-8b49-03472f948290
+md5 2054bab923df21107652d009f2373789 iniparse-0.5.tar.gz
+sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
 
 # sha256 locally computed
-sha256  abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054  iniparse-0.4.tar.gz
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 5c4e03c88c..d31a490bd8 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_INIPARSE_VERSION = 0.4
+PYTHON_INIPARSE_VERSION = 0.5
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
 PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
-PYTHON_INIPARSE_SETUP_TYPE = distutils
+PYTHON_INIPARSE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
