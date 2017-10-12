From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:51:24 +0200
Subject: [Buildroot] [git commit] opencv3: enable pthreads parallel for loops
Message-ID: <20171012204404.4B1E381150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60a7dd9f8743ba679efec6c466830ba480e78946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The WITH_PTHREADS_PF option was errantly categorized as a Windows only option.
WITH_PTHREADS_PF actually enables a parallelization framework that utilizes
pthreads to optimize some inner for loops of different OpenCV operations. This
optimization is available on any platform that has pthreads.

Signed-off-by: bradford barr <bradford@density.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
