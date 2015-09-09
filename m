From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:56 +0200
Subject: [Buildroot] [PATCH 07/14] libfslparser: bump version to 4.0.3
In-Reply-To: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441830063-8190-8-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license file + add hash file.

Changelog:
- Upgrade MP4 and MPEG2 parser
- Update COPYING with new version of license file

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/a7c90ea6

This package has been implicitely tested through gstreamer as the 0.10
plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/libfslparser/libfslparser.hash | 2 ++
 package/libfslparser/libfslparser.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/libfslparser/libfslparser.hash

diff --git a/package/libfslparser/libfslparser.hash b/package/libfslparser/libfslparser.hash
new file mode 100644
index 0000000..19ee12e
--- /dev/null
+++ b/package/libfslparser/libfslparser.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	9db10ca6a61c8fdbe91b55b65d084dcbb5f9cfb58b088996c7dd2d6dc8385730  libfslparser-4.0.3.bin
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 116a0a2..2b53d62 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = 4.0.2
+LIBFSLPARSER_VERSION = 4.0.3
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_INSTALL_STAGING = YES
 
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
-LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
+LIBFSLPARSER_LICENSE_FILES = EULA COPYING
 LIBFSLPARSER_REDISTRIBUTE = NO
 
 define LIBFSLPARSER_EXTRACT_CMDS
-- 
2.5.1
