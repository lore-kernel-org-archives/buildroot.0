From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  1 Nov 2016 17:10:03 +0100
Subject: [Buildroot] [PATCH 6/8] imx-codec: bump to version 4.1.4
In-Reply-To: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
References: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
Message-ID: <20161101161005.13302-7-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog
- Upgrade license chksum to v14 EULA
- Check for lib_src_ppp_arm11_elinux.so library before removing
- Fixes for error hadling and robustness

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/78856879

Implicitly tested through gstreamer as the 0.10 plugin relies on it:
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-codec/imx-codec.hash | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
index 39bddc1..2bb7a24 100644
--- a/package/freescale-imx/imx-codec/imx-codec.hash
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	62bda182143cde9743cba0eb2a1c315a53cb434294605742f9fc364219958888  imx-codec-4.0.9.bin
+sha256	98fe71cb44f7e858c64c5eda81741ed02f40afaadc3d4ed1e693c7d1e684b81d  imx-codec-4.1.4.bin
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 4840872..911ad8b 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_CODEC_VERSION = 4.0.9
+IMX_CODEC_VERSION = 4.1.4
 IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
 IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
 IMX_CODEC_INSTALL_STAGING = YES
-- 
2.9.3
