From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 10 Feb 2019 21:07:32 +1300
Subject: [Buildroot] [PATCH] gst1-shark: select
 BR2_PACKAGE_GSTREAMER1_GST_DEBUG
Message-ID: <20190210080732.4651-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst-shark needs gstreamer to be compiled with debugging support enabled.
Make this selection automatically when the gst-shark package is
selected.

Fixes:
 - http://autobuild.buildroot.net/results/09b894b0775df2dd87d8fb2d53c6a243d8668aba/
 - and many more

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
I'm not entirely sure how I didn't notice this originally. I swear I did
compile it before submitting it, still I can't dispute the fact that
BR2_PACKAGE_GSTREAMER1_GST_DEBUG has been there since gstreamer1 was
introduced.

 package/gstreamer1/gst1-shark/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-shark/Config.in b/package/gstreamer1/gst1-shark/Config.in
index 9d656e2419..ad6b6fb9bd 100644
--- a/package/gstreamer1/gst1-shark/Config.in
+++ b/package/gstreamer1/gst1-shark/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GST1_SHARK
 	select BR2_PACKAGE_GSTREAMER1_CHECK
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GSTREAMER1_GST_DEBUG # gst_debug_log_valist, GST_CAT_STATES
 	help
 	  GstShark leverages GStreamers newest instrumentation subsystem
 	  by installing a set of custom hooks to the trace points. A
-- 
2.20.1
