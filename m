From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:58 +0200
Subject: [Buildroot] [PATCH 09/14] gst-fsl-plugins: bump version to 4.0.3
In-Reply-To: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441830063-8190-10-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added the package hash file.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/0d2f4f8

This package has been tested using the following commands:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-0.10  filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! vpudec ! autovideosink
 # gst-launch-0.10  filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! vpudec ! mfw_isink
 # gst-launch-0.10 imxv4l2src ! autovideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

Quick comment on this one, I might delete this package during next cycle
as it is not maintained any more and has been removed from Yocto:
https://github.com/Freescale/meta-fsl-arm/commit/83b240e

Let me know your thoughts on this.

Regards,
Gary
---
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash | 2 ++
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
new file mode 100644
index 0000000..f1d6391
--- /dev/null
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	568883b2a1d8d32e4004cb3f123790d0b4286c91c1fac38c9dc8e20bd1250764  gst-fsl-plugins-4.0.3.tar.gz
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index a7dea0f..2ac558a 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_FSL_PLUGINS_VERSION = 4.0.2
+GST_FSL_PLUGINS_VERSION = 4.0.3
 GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
-- 
2.5.1
