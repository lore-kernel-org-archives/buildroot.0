From: Andrew Webster <awebster@arcx.com>
Date: Fri, 10 Jun 2016 14:13:50 -0400
Subject: [Buildroot] [PATCH v2 13/14] imx-lib: bump version to 5.4
In-Reply-To: <cover.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
Message-ID: <c15929189545aca13e272e5a2feae1cc32553d24.1465578220.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Remove platform check in hdmi-cec and imx-lib - simplify to support builds
on multiple machines
- For ipu use the dummy defaul object to fix build issues on non-ipu hardware

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/7946533

Implicitly tested through gstreamer as the
plugins rely on them for vpu decoding, e.g.:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Andrew Webster <awebster@arcx.com>
---
Changes v1 -> v2:
  - added test procedure to comment

 package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index 8e4bd73..76dcb23 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 2b4547ffb1de328cf8997a09a423c6f015d808493efd11a98a5d42c6497e3445  imx-lib-5.1.tar.gz
+sha256 8d12c4a0a44d29569f1ead3a36adc28402b9c4036b53e11dd3ebf2295e3ce1d0  imx-lib-5.4.tar.gz
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index b49357b..d3603ca 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_LIB_VERSION = 5.1
+IMX_LIB_VERSION = 5.4
 IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1
-- 
1.9.1
