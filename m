From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:43 +0100
Subject: [Buildroot] [PATCH 03/14] libfslvpuwrap: bump to version 1.0.62
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Add frame rate check and return failure if frame rate is invalid
  value (<=0)

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/67b3b998

This package has been implicitely tested through gstreamer as the
plugins rely on it for vpu decoding:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslvpuwrap/libfslvpuwrap.hash | 2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfslvpuwrap/libfslvpuwrap.hash b/package/libfslvpuwrap/libfslvpuwrap.hash
index 8e6ba61..e987077 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.hash
+++ b/package/libfslvpuwrap/libfslvpuwrap.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	e4bfe218d17ec66acf8cd97d08fef8ef71ab6762d4c8cf0d0193eca5f599b4c9  libfslvpuwrap-1.0.61.bin
+sha256	0717faccb5413dc95ce9ad919400095ecf722320478c924366793a6cc450ae16  libfslvpuwrap-1.0.62.bin
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index b3d6f0c..12a4e86 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 1.0.61
+LIBFSLVPUWRAP_VERSION = 1.0.62
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
-- 
2.7.0
