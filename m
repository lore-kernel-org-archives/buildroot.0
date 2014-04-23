From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:32 +0200
Subject: [Buildroot] [PATCH 13/14] flann: do not override CMAKE_BUILD_TYPE
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/flann/flann.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 6f95f19..cddd2aa 100644
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
-- 
1.9.2
