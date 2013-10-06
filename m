From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun,  6 Oct 2013 08:33:42 -0700
Subject: [Buildroot] [PATCH V2 1/3] i.MX: Use FREESCALE_IMX_MIRROR_SITE for
	newly-moved packages
Message-ID: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that libfslcodec, libfslparser, and libfslvpuwrap are in
the package/freescale-imx directory, they can share the
_SITE mirror with other similar packages.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
V2 updates libfslcodec/libfslparser/libfslvpuwrap in their
original directories instead of freescale-imx/.

 package/libfslcodec/libfslcodec.mk     | 2 +-
 package/libfslparser/libfslparser.mk   | 2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index c18332a..e0dca7f 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -6,7 +6,7 @@
 
 LIBFSLCODEC_VERSION = 3.0.1
 # No official download site from freescale, just this mirror
-LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLCODEC_SITE = $(FREESCALE_IMX_MIRROR_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 3e27a6a..c2af129 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -6,7 +6,7 @@
 
 LIBFSLPARSER_VERSION = 3.0.1
 # No official download site from freescale, just this mirror
-LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLPARSER_SITE = $(FREESCALE_IMX_MIRROR_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 1bc7129..f4539f3 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -6,7 +6,7 @@
 
 LIBFSLVPUWRAP_VERSION = 1.0.17
 # No official download site from freescale, just this mirror
-LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_MIRROR_SITE)
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
-- 
1.8.1.2
