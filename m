From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:40 +0200
Subject: [Buildroot] [PATCH 04/15] package/flann: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disabling doc and test build is already done by the cmake-package
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/flann/flann.mk | 2 --
 1 file changed, 2 deletions(-)

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
 
-- 
2.1.2
