From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 11:16:06 +0100
Subject: [Buildroot] [git commit] package/gst1-shark: select
 BR2_PACKAGE_GSTREAMER1_GST_DEBUG
Message-ID: <20190210101443.AC759884AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9d8a31100f08cb591ded583288b20d07769bcba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst-shark needs gstreamer to be compiled with debugging support enabled.
Make this selection automatically when the gst-shark package is
selected.

Fixes:
 - http://autobuild.buildroot.net/results/09b894b0775df2dd87d8fb2d53c6a243d8668aba/
 - and many more

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
