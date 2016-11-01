From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 19:27:52 +0100
Subject: [Buildroot] [git commit] imx-vpuwrap: bump to version 1.0.68
Message-ID: <20161101182817.23EA6801D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4888778b69a9149f9b18bb5cec09d68f5c247e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Coverity fixes for checkign return values, unused values, null checking
- H.263 encoder invalid frame rate

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/fd160ae9

Implicitly tested through gstreamer as the 0.10 plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
