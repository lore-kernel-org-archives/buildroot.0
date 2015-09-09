From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:55 +0200
Subject: [Buildroot] [PATCH 06/14] libfslcodec: bump version to 4.0.3
In-Reply-To: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441830063-8190-7-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license file + add hash file.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/93b4c8c

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslcodec/libfslcodec.hash | 2 ++
 package/libfslcodec/libfslcodec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/libfslcodec/libfslcodec.hash

diff --git a/package/libfslcodec/libfslcodec.hash b/package/libfslcodec/libfslcodec.hash
new file mode 100644
index 0000000..6a41be1
--- /dev/null
+++ b/package/libfslcodec/libfslcodec.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	0d0ff933eed0a021763115b9c8ae812c6376a19bbd95e555d89ea7404f6c8f2f  libfslcodec-4.0.3.bin
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index 665588a..473d662 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 4.0.2
+LIBFSLCODEC_VERSION = 4.0.3
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_INSTALL_STAGING = YES
 
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
-LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
+LIBFSLCODEC_LICENSE_FILES = EULA COPYING
 LIBFSLCODEC_REDISTRIBUTE = NO
 
 define LIBFSLCODEC_EXTRACT_CMDS
-- 
2.5.1
