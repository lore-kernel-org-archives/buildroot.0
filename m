From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  6 Dec 2017 15:47:53 +0100
Subject: [Buildroot] [PATCH 2/2] flann: Disable find package for HDF5
Message-ID: <20171206144753.3603-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The HDF5 package is used by flann for testing purpose only and is
not part of buildroot packages. However, if present in the host, it will
be used and trigger the unsafe header/library path used in
cross-compilation error.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/flann/flann.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index e777fd8b2e..ef61815bba 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -15,6 +15,7 @@ FLANN_CONF_OPTS = \
 	-DBUILD_MATLAB_BINDINGS=OFF \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_FLANN_EXAMPLES),ON,OFF) \
 	-DUSE_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF) \
-	-DPYTHON_EXECUTABLE=OFF
+	-DPYTHON_EXECUTABLE=OFF \
+	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
 $(eval $(cmake-package))
-- 
2.14.1
