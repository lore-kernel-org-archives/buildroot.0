From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  1 Jun 2014 11:24:32 +0200
Subject: [Buildroot] [PATCH v4 10/11] flann: do not override CMAKE_BUILD_TYPE
In-Reply-To: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401614673-3703-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- rebase

changes v2 -> v3:
- new patch
---
 package/flann/flann.mk | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.2
