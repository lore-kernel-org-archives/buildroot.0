From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 18 Mar 2020 14:37:37 +0530
Subject: [Buildroot] [PATCH v6 1/4] package/python-numpy: Bump to version
 1.18.1
In-Reply-To: <20200318090740.4973-1-jagan@amarulasolutions.com>
References: <20200318090740.4973-1-jagan@amarulasolutions.com>
Message-ID: <20200318090740.4973-2-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the python-numpy version to 1.18.1.

Drop BR2_PACKAGE_PYTHON dependency from
- opencv3
- gnuadio
python support since numpy now support only for python3.

Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Esben Haabendal <esben@geanix.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- new patch

 package/gnuradio/Config.in             |  2 +-
 package/opencv3/Config.in              |  2 +-
 package/python-numpy/Config.in         |  2 ++
 package/python-numpy/python-numpy.hash | 14 +++++++-------
 package/python-numpy/python-numpy.mk   |  4 +++-
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 6d438bcd6f..bf69ed605b 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -63,7 +63,7 @@ config BR2_PACKAGE_GNURADIO_FEC
 
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index d4b17b6acf..18c390c515 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -156,7 +156,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
 
 config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	bool "python"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 5b9ee5803b..f7311fed0f 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -15,9 +15,11 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON if BR2_PACKAGE_PYTHON3
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index eb4123e3f6..5c280479a2 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,9 +1,9 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.4
-sha256	a3bccb70ad94091a5b9e2469fabd41ac877c140a6828c2022e35560a2ec0346c	numpy-1.16.4.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.18.1
+sha256  e37802868ba5f389bf4e3f4c40c16e1b031814f0585ac122637de219de6279cb	numpy-1.18.1.tar.gz
 # License files, locally calculated
-sha256	6b5086f61fe0c71564a79304ecbaa60f11fa3f3debf82f73d16a611cab102adc	LICENSE.txt
-sha256	426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
+sha256  ad81d0c21843ba6ce6fe5fa3eaacb61120be70cd798c52f63df3f4c12a843f0c	LICENSE.txt
+sha256  d3045980e80a6b39f98586c24bc7f39a7625b4b9f08ce72e367d12814743d047	numpy/core/src/multiarray/dragon4.c
+sha256  426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
 sha256	154a8706fa0fdeff1073bf6239c4ecf51f562ab107066eef839dade1a45c824c	doc/scipy-sphinx-theme/LICENSE.txt
-sha256	a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
-sha256	badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
-sha256	d37526b4a34c0aa859afe6f9b7e64ca7c306b7430df8113dd5ac6fcb246bd2d4	numpy/core/src/multiarray/dragon4.c
+sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
+sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 3b474efa6e..6d4cd22e62 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.16.4
+PYTHON_NUMPY_VERSION = 1.18.1
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
@@ -14,6 +14,8 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
 			tools/npy_tempita/license.txt \
 			numpy/core/src/multiarray/dragon4.c
 PYTHON_NUMPY_SETUP_TYPE = setuptools
+PYTHON_NUMPY_DEPENDENCIES += host-python-cython
+HOST_PYTHON_NUMPY_DEPENDENCIES += host-python-cython
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
-- 
2.17.1
