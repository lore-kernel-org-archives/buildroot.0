From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:20:29 +0200
Subject: [Buildroot] [git commit] flann: do not override CMAKE_BUILD_TYPE
Message-ID: <20140601202128.650A49CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=844209c8d6ab93e338a540ee5a48712fccb62d85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flann/flann.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 5b73881..dc9cd1a 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -10,7 +10,6 @@ FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3c
 FLANN_LICENSE_FILES = COPYING
 FLANN_CONF_OPT = \
-	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_C_BINDINGS=ON \
 	-DBUILD_PYTHON_BINDINGS=OFF \
 	-DBUILD_MATLAB_BINDINGS=OFF \
