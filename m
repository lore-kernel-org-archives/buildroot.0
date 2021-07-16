From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 22:59:10 +0200
Subject: [Buildroot] [git commit] package/python-cchardet: bump to version
 2.1.7
Message-ID: <20210716202900.E7F539111E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=40fe600f17ce0cfb7377d6a02230a171d4d174ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 2 is no longer supported.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cchardet/Config.in            | 2 ++
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/Config.in b/package/python-cchardet/Config.in
index 74153126fb..0f8645aafe 100644
--- a/package/python-cchardet/Config.in
+++ b/package/python-cchardet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CCHARDET
 	bool "python-cchardet"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  cChardet is high speed universal character encoding
@@ -8,4 +9,5 @@ config BR2_PACKAGE_PYTHON_CCHARDET
 	  https://github.com/PyYoshi/cChardet
 
 comment "python-cchardet needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index 960801f889..1ecfd6fa95 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5  ee884e2c7762e56e8a0600aa34ad4fa3  cchardet-2.1.6.tar.gz
-sha256  b76afb2059ad69eab576949980a17413c1e9e5a5624abf9e43542d8853f146b3  cchardet-2.1.6.tar.gz
+md5  8a76472ad09c68c12069203ea9348ee3  cchardet-2.1.7.tar.gz
+sha256  c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf  cchardet-2.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 78daf6075e..396e9d6c53 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.1.6
+PYTHON_CCHARDET_VERSION = 2.1.7
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/41/e6/2e2184a3bc887bfb6e6b97aef5e94af9b8de43806ce14b023ddbbcb0b30d
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/a8/5d/090c9f0312b7988a9433246c9cf0b566b1ae1374368cfb8ac897218a4f65
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
