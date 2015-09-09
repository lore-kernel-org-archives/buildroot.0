From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:57 +0200
Subject: [Buildroot] [PATCH 08/14] libfslvpuwrap: bump version to 1.0.58
In-Reply-To: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441830063-8190-9-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change license file + add hash file.

Changelog:
- Update the license file with new version and use COPYING
- Remove the folder /usr/share to avoid empty folder installation

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/1506776

This package has been implicitely tested through gstreamer as the
plugins rely on it for vpu decoding:
 # gst-launch-0.10 playbin
 # uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslvpuwrap/libfslvpuwrap.hash | 2 ++
 package/libfslvpuwrap/libfslvpuwrap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/libfslvpuwrap/libfslvpuwrap.hash

diff --git a/package/libfslvpuwrap/libfslvpuwrap.hash b/package/libfslvpuwrap/libfslvpuwrap.hash
new file mode 100644
index 0000000..e7ca1a8
--- /dev/null
+++ b/package/libfslvpuwrap/libfslvpuwrap.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	a278eb18ec24230166ac39e2eadf7b934798f0432654c2e24c4cb69c3ac1cf0f  libfslvpuwrap-1.0.58.bin
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 625f586..7669c63 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 1.0.57
+LIBFSLVPUWRAP_VERSION = 1.0.58
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
 LIBFSLVPUWRAP_INSTALL_STAGING = YES
 
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
-LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt
+LIBFSLVPUWRAP_LICENSE_FILES = EULA COPYING
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
 
 define LIBFSLVPUWRAP_EXTRACT_CMDS
-- 
2.5.1
