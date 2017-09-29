From: Bradford Barr <bradford@density.io>
Date: Fri, 29 Sep 2017 16:47:24 -0400
Subject: [Buildroot] [PATCH 1/1] opencv3: enable pthreads parallel for loops
Message-ID: <20170929204724.25507-1-bradford@density.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

The WITH_PTHREADS_PF option was errantly categorized as a Windows only option.
WITH_PTHREADS_PF actually enables a parallelization framework that utilizes
pthreads to optimize some inner for loops of different OpenCV operations. This
optimization is available on any platform that has pthreads.

Signed-off-by: bradford barr <bradford@density.io>
---
 package/opencv3/opencv3.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3a7c3f4..cffe66b 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -166,7 +166,6 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_CSTRIPES=OFF \
 	-DWITH_DSHOW=OFF \
 	-DWITH_MSMF=OFF \
-	-DWITH_PTHREADS_PF=OFF \
 	-DWITH_VFW=OFF \
 	-DWITH_VIDEOINPUT=OFF \
 	-DWITH_WIN32UI=OFF
-- 
2.9.3
