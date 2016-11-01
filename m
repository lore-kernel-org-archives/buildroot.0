From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  1 Nov 2016 17:10:05 +0100
Subject: [Buildroot] [PATCH 8/8] imx-vpuwrap: bump to version 1.0.68
In-Reply-To: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
References: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
Message-ID: <20161101161005.13302-9-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Coverity fixes for checkign return values, unused values, null checking
- H.263 encoder invalid frame rate

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/fd160ae9

Implicitly tested through gstreamer as the 0.10 plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash | 2 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
index 42b97a1..2999984 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	ddeacb7d9cb26c8864374df6d3f090aad47cd2ae409c2b9c817b773447252d61  imx-vpuwrap-1.0.65.bin
+sha256	282e7f8766ce385d8752bd29f04ddeff709ece0846be97547cf982183bbe241e  imx-vpuwrap-1.0.68.bin
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index da0e32c..7cbf778 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPUWRAP_VERSION = 1.0.65
+IMX_VPUWRAP_VERSION = 1.0.68
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
 IMX_VPUWRAP_DEPENDENCIES = imx-vpu
-- 
2.9.3
