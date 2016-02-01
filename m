From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:46:08 +0100
Subject: [Buildroot] [git commit] libfslparser: bump to version 4.0.7
Message-ID: <20160201224700.BFC457F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e22f85b1802ac7d602887a2918c92a51ca59b458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Add h264 parser version.
- Support wide and 'ms 0x0 0x11' adpcm tag.
- Support hev1 tag for hevc video codec.
- TS segment fault.
- Improve mkv parser's loading time when create parser with large size
file.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/6406ad4
https://github.com/Freescale/meta-fsl-arm/commit/09a532c
https://github.com/Freescale/meta-fsl-arm/commit/371df94

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslparser/libfslparser.hash | 2 +-
 package/libfslparser/libfslparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfslparser/libfslparser.hash b/package/libfslparser/libfslparser.hash
index 19ee12e..976a2d2 100644
--- a/package/libfslparser/libfslparser.hash
+++ b/package/libfslparser/libfslparser.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	9db10ca6a61c8fdbe91b55b65d084dcbb5f9cfb58b088996c7dd2d6dc8385730  libfslparser-4.0.3.bin
+sha256	e7c248e64db03c3ddd84f50ae408e560f8f5819e58c487a5dec5141bc384ae83  libfslparser-4.0.7.bin
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 2b53d62..c5efc85 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = 4.0.3
+LIBFSLPARSER_VERSION = 4.0.7
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_INSTALL_STAGING = YES
