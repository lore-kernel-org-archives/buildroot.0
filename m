From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Mar 2018 20:16:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build without pthreads
Message-ID: <20180302191603.8499-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/4c7/4c77c15eaa2e44d0854cf24ab872e7b2ef83ebd6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/0002-ffmpeg-pthreads.patch | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/ffmpeg/0002-ffmpeg-pthreads.patch

diff --git a/package/ffmpeg/0002-ffmpeg-pthreads.patch b/package/ffmpeg/0002-ffmpeg-pthreads.patch
new file mode 100644
index 0000000000..c6d75d2297
--- /dev/null
+++ b/package/ffmpeg/0002-ffmpeg-pthreads.patch
@@ -0,0 +1,34 @@
+From patchwork Wed Oct 25 13:32:36 2017
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [FFmpeg-devel] configure: v4l2_m2m depends on pthreads
+From: Mark Thompson <sw@jkqxz.net>
+X-Patchwork-Id: 5688
+Message-Id: <27e5b360-1210-d550-c8de-a761f8e9f326@jkqxz.net>
+To: FFmpeg development discussions and patches <ffmpeg-devel@ffmpeg.org>
+Date: Wed, 25 Oct 2017 14:32:36 +0100
+
+Fixes build with --disable-pthreads.
+
+Downloaded from upstream patchworks:
+https://patchwork.ffmpeg.org/patch/5688/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index c86e578..76523c8 100755
+--- a/configure
++++ b/configure
+@@ -2780,7 +2780,7 @@ omx_rpi_select="omx"
+ qsvdec_select="qsv"
+ qsvenc_select="qsv"
+ vaapi_encode_deps="vaapi"
+-v4l2_m2m_deps_any="linux_videodev2_h"
++v4l2_m2m_deps="linux_videodev2_h pthreads"
+ 
+ hwupload_cuda_filter_deps="cuda"
+ scale_npp_filter_deps="cuda libnpp"
-- 
2.11.0
