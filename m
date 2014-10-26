From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:03:13 +0100
Subject: [Buildroot] [git commit] package/flann: cleanup configure options
Message-ID: <20141026160700.0D3B4B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0dc4f5e769a71143cc9d51deee80531bc4b061b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabling doc and test build is already done by the cmake-package
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flann/flann.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index bbf1e03..98af0b1 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -14,8 +14,6 @@ FLANN_CONF_OPTS = \
 	-DBUILD_PYTHON_BINDINGS=OFF \
 	-DBUILD_MATLAB_BINDINGS=OFF \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_FLANN_EXAMPLES),ON,OFF) \
-	-DBUILD_TESTS=OFF \
-	-DBUILD_DOC=OFF \
 	-DUSE_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF) \
 	-DPYTHON_EXECUTABLE=OFF
 
