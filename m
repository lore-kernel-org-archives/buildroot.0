From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:38:51 +0200
Subject: [Buildroot] [git commit] libfslcodec: bump version to 4.0.3
Message-ID: <20150919134123.ABB38801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bd786276a3147bbd273efb46a654242d82c9fc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license file + add hash file.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/93b4c8c

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslcodec/libfslcodec.hash |    2 ++
 package/libfslcodec/libfslcodec.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

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
