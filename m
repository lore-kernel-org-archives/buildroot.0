From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 30 Jan 2016 12:45:54 +0100
Subject: [Buildroot] [PATCH 07/10] libfslvpuwrap: bump to version 1.0.61
In-Reply-To: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1454154357-31625-8-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Enable resolution change for H.263 and VP8

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/f11936b

This package has been implicitely tested through gstreamer as the
plugins rely on it for vpu decoding:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslvpuwrap/libfslvpuwrap.hash | 2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfslvpuwrap/libfslvpuwrap.hash b/package/libfslvpuwrap/libfslvpuwrap.hash
index e7ca1a8..8e6ba61 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.hash
+++ b/package/libfslvpuwrap/libfslvpuwrap.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	a278eb18ec24230166ac39e2eadf7b934798f0432654c2e24c4cb69c3ac1cf0f  libfslvpuwrap-1.0.58.bin
+sha256	e4bfe218d17ec66acf8cd97d08fef8ef71ab6762d4c8cf0d0193eca5f599b4c9  libfslvpuwrap-1.0.61.bin
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 7669c63..b3d6f0c 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 1.0.58
+LIBFSLVPUWRAP_VERSION = 1.0.61
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
-- 
2.6.4
