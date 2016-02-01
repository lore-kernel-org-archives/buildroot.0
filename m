From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:46:08 +0100
Subject: [Buildroot] [git commit] imx-kobs: bump to version 5.1
Message-ID: <20160201224708.A0A917F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bd5740421e7c87ae0f47fa2da2110287ed231f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a different versioning schema based on package versioning
instead of BSP version. This way, if a new BSP version does
not bump this package, we can keep this package unchanged as well.

Changelog since 3.14.28-1.0.0_ga:
- Add fixes for maximum ecc strength for each platform.
- Add mx7 boot config support.
- Add i.MX 6UltraLite support.
- Join the ecc with real FCB data when not byte-aligned.
- Generalize the encode_bch_ecc function for different configurations.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/8d47a2e
https://github.com/Freescale/meta-fsl-arm/commit/70edf16

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 13373ea..477f231 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 cfac042f5c96731205c397a4a6b3ed966f804569ae4d0e2685d22fdf6bdc9eb7  imx-kobs-3.14.28-1.0.0.tar.gz
+sha256 28c7356187ae26a2b37fb37a4b7bfdb63b3628b72d737d897ae6d5b969fbb51a  imx-kobs-5.1.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index 02c5cad..bf01567 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_KOBS_VERSION = 5.1
 IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
 IMX_KOBS_LICENSE = GPLv2+
 IMX_KOBS_LICENSE_FILES = COPYING
