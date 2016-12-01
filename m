From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Dec 2016 22:43:17 +0100
Subject: [Buildroot] [git commit] gst1-imx: unbreak after 0.12.3 bump
Message-ID: <20161201222141.D4FCF8026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18bd407ba441606b7782c7fc1c6902a96a1c5505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0.12.3 bump forgot to update the download hash and remove the now
upstreamed patch, breaking the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch | 33 ----------------------
 package/gstreamer1/gst1-imx/gst1-imx.hash          |  2 +-
 2 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch b/package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch
deleted file mode 100644
index 67ac055..0000000
--- a/package/gstreamer1/gst1-imx/0001-v4l2src-Add-V4L2_PIX_FMT_XRGB555X-check.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1ca05ebb7cb63607d14983948105dd1483ea6b65 Mon Sep 17 00:00:00 2001
-From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Tue, 9 Aug 2016 10:26:15 +0200
-Subject: [PATCH] v4l2src: Add V4L2_PIX_FMT_XRGB555X check
-
-Since this format was added in kernel 3.18, any prior version will
-fail to compile.
-
-Issue reported by Buildroot autobuilder with 3.10 kernel headers:
-http://autobuild.buildroot.net/results/b46/b460a770c8f4e992d29dde8fe37fc23a949937f2/
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- src/v4l2src/v4l2src.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/v4l2src/v4l2src.c b/src/v4l2src/v4l2src.c
-index c77ae49..12b392a 100644
---- a/src/v4l2src/v4l2src.c
-+++ b/src/v4l2src/v4l2src.c
-@@ -447,7 +447,9 @@ static GstCaps *gst_imx_v4l2src_caps_for_current_setup(GstImxV4l2VideoSrc *v4l2s
- 		case V4L2_PIX_FMT_RGB555:
- 			gst_fmt = GST_VIDEO_FORMAT_RGB15;
- 			break;
-+#ifdef V4L2_PIX_FMT_XRGB555X
- 		case V4L2_PIX_FMT_XRGB555X:
-+#endif
- 		case V4L2_PIX_FMT_RGB555X:
- 			gst_fmt = GST_VIDEO_FORMAT_BGR15;
- 			break;
--- 
-2.8.1
-
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index b0124aa..e2e3971 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 a75f8bc3219fa3c62637f443cef0196c9eafb90aaa5af094847d007124895822  gst1-imx-0.12.3.tar.gz
+sha256 999c093e38768e51d14abbe7836c09b666bcb89f03f34dd3697a6e5b5e4a4086  gst1-imx-0.12.3.tar.gz
