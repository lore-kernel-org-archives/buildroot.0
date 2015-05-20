From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 20 May 2015 12:12:15 +0200
Subject: [Buildroot] [PATCH 04/13] gst-fsl-plugins: bump version to 4.0.2
In-Reply-To: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432116744-25760-5-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/730b7ca5d2f13083f4e44636308a2f55a8d346f2

This package has been tested using the following commands:
# gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
#?gst-launch-0.10  filesrc location=/root/tears_of_steel_1080p.webm ! \
  matroskademux ! vpudec ! autovideosink
#?gst-launch-0.10  filesrc location=/root/tears_of_steel_1080p.webm ! \
  matroskademux ! vpudec ! mfw_isink
# gst-launch-0.10 imxv4l2src ! autovideosink

Regards,
Gary
---
 .../gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch        | 4 +---
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk                  | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch b/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
index 35617cd..471c483 100644
--- a/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
+++ b/package/gstreamer/gst-fsl-plugins/0002-Fix-bashism-in-configure-script.patch
@@ -25,7 +25,7 @@ index 5968eb6..1a31a06 100755
  fi
  AC_SUBST(VPU_LIBS)
  
-@@ -176,15 +176,15 @@ AC_SUBST(RT_CFLAGS)
+@@ -176,14 +176,14 @@ AC_SUBST(RT_CFLAGS)
  AC_SUBST(RT_LIBS)
  
  FSL_MM_CORE_CFLAGS=`$PKG_CONFIG --cflags libfslaudiocodec 2>/dev/null`
@@ -40,10 +40,8 @@ index 5968eb6..1a31a06 100755
  FSL_MM_CORE_LIBS=`$PKG_CONFIG --libs libfslaudiocodec 2>/dev/null`
 -FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslvideocodec 2>/dev/null`
 -FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslparser 2>/dev/null`
--FSL_MM_CORE_LIBS+=`$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`
 +FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslvideocodec 2>/dev/null`"
 +FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslparser 2>/dev/null`"
-+FSL_MM_CORE_LIBS="$FSL_MM_CORE_LIBS `$PKG_CONFIG --libs libfslvpuwrap 2>/dev/null`"
  AC_SUBST(FSL_MM_CORE_LIBS)
  
  EXTRAPLATFORMCFLAGS="-DARM -D_GNUC_"
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 8d8b8b4..a7dea0f 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_FSL_PLUGINS_VERSION = 3.0.11
+GST_FSL_PLUGINS_VERSION = 4.0.2
 GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
-- 
2.1.4
