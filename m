From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 30 Jan 2016 12:45:52 +0100
Subject: [Buildroot] [PATCH 05/10] libfslcodec: bump to version 4.0.7
In-Reply-To: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1454154357-31625-6-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog since 4.0.3:
- Add mx7 SoC support.
- Add test binary to release package.
- Fix segmentation fault issue with only standard build.
- Build std only for arm11 and arm12.
- Fix some mp3_dec noise issue of c code for arm11 and arm9.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/47b2677
https://github.com/Freescale/meta-fsl-arm/commit/c88fd22
https://github.com/Freescale/meta-fsl-arm/commit/3220a4c

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslcodec/libfslcodec.hash | 2 +-
 package/libfslcodec/libfslcodec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfslcodec/libfslcodec.hash b/package/libfslcodec/libfslcodec.hash
index 6a41be1..d977a66 100644
--- a/package/libfslcodec/libfslcodec.hash
+++ b/package/libfslcodec/libfslcodec.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	0d0ff933eed0a021763115b9c8ae812c6376a19bbd95e555d89ea7404f6c8f2f  libfslcodec-4.0.3.bin
+sha256	de1251286ebbc1541452f2f70fbd73e42c58f95630d65d1f9aaabf10a6caa38f  libfslcodec-4.0.7.bin
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index 473d662..e151c66 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 4.0.3
+LIBFSLCODEC_VERSION = 4.0.7
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_INSTALL_STAGING = YES
-- 
2.6.4
