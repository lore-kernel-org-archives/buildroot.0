From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 May 2017 20:26:55 +0200
Subject: [Buildroot] [PATCH] package/opencv3: disable explicitly lapack
	support
Message-ID: <20170514182655.4945-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lapack support is enabled by default but the opencv3.mk doesn't handle
this dependency yet.

Fixes:
http://autobuild.buildroot.net/results/c8a/c8a25af38c405594722b44aef34e5e4c549639db

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv3/opencv3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 153fd06..6df5705 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -192,6 +192,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_EIGEN=OFF \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
+	-DWITH_LAPACK=OFF \
 	-DWITH_MATLAB=OFF \
 	-DWITH_OPENCL=OFF \
 	-DWITH_OPENCL_SVM=OFF \
-- 
2.9.3
