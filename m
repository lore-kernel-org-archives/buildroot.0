From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:42 +0100
Subject: [Buildroot] [PATCH 02/14] libfslparser: bump to version 4.0.8
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-3-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog since 4.0.7:
-Support hevc in MPG2 parser.
-Enhance the parsing conditions in SPS nal unit.
 Parse system header to get stream id.
 For mpeg video, don't call parseh264 to avoid mistakes.
-Fix memory leak, free temp data buffer after parsing header.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/c3aa06b3

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslparser/libfslparser.hash | 2 +-
 package/libfslparser/libfslparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfslparser/libfslparser.hash b/package/libfslparser/libfslparser.hash
index 976a2d2..c49345f 100644
--- a/package/libfslparser/libfslparser.hash
+++ b/package/libfslparser/libfslparser.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	e7c248e64db03c3ddd84f50ae408e560f8f5819e58c487a5dec5141bc384ae83  libfslparser-4.0.7.bin
+sha256	a04621783c84a9776216caff9563c7f840fddd584b0b2d27738d6ca6d2c77f32  libfslparser-4.0.8.bin
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index c5efc85..44e6039 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = 4.0.7
+LIBFSLPARSER_VERSION = 4.0.8
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_INSTALL_STAGING = YES
-- 
2.7.0
