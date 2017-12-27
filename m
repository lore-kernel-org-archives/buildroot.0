From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 12:35:04 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] flann: Disable find
 package for HDF5
Message-ID: <20171227113626.E149D8103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbdcb171be992733fdfc2c4c08ffb4644bc6411c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

The HDF5 package is used by flann for testing purpose only and is
not part of buildroot packages. However, if present in the host, it will
be used and trigger the unsafe header/library path used in
cross-compilation error.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f6ee339e92360fc43ebe17928656c06634b09c97)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flann/flann.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index e777fd8..ef61815 100644
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
