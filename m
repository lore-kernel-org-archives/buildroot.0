From: Esben Haabendal <esben@geanix.com>
Date: Fri, 20 Sep 2019 18:36:54 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/python-numpy: fix setup type
In-Reply-To: <20190920163656.6388-1-esben@geanix.com>
References: <20190920163656.6388-1-esben@geanix.com>
Message-ID: <20190920163656.6388-2-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The numpy package is using distutils, not setuptools.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 package/python-numpy/python-numpy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 3b474efa6e6c..f1f6f8cba407 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -13,7 +13,7 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
 			numpy/linalg/lapack_lite/LICENSE.txt \
 			tools/npy_tempita/license.txt \
 			numpy/core/src/multiarray/dragon4.c
-PYTHON_NUMPY_SETUP_TYPE = setuptools
+PYTHON_NUMPY_SETUP_TYPE = distutils
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
-- 
2.23.0
