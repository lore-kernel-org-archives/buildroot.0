From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 21:57:31 +0200
Subject: [Buildroot] [git commit] package/opencv3: disable explicitly lapack
	support
Message-ID: <20170514195753.932E782889@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4aaf6eae0c99d5da0ae16c2db53eec84d549cef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lapack support is enabled by default but the opencv3.mk doesn't handle
this dependency yet.

Fixes:
http://autobuild.buildroot.net/results/c8a/c8a25af38c405594722b44aef34e5e4c549639db

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
