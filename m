From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 11 Sep 2015 11:39:40 +0200
Subject: [Buildroot] [PATCH v2 01/14] freescale-imx: bump to
	3.14.28-1.0.0_ga release
In-Reply-To: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441964394-3817-2-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash files for the updated packages.

Also update the license of firmware-imx.

This patch is based on the Yocto equivalent:
5521d77c9f191b5808cb3bad4af9484ac

Those packages have been implicitely tested through gstreamer as the
plugins rely on them for vpu decoding for instance:
 # gst-launch-0.10 playbin
 # uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 ++
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 package/freescale-imx/freescale-imx.mk               | 2 +-
 package/freescale-imx/imx-lib/imx-lib.hash           | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 package/freescale-imx/firmware-imx/firmware-imx.hash
 create mode 100644 package/freescale-imx/imx-lib/imx-lib.hash

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
new file mode 100644
index 0000000..0b89c4b
--- /dev/null
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 1f09acd4d605efc78a0672068a658cb16274811d2f444cf3ae7aaa075266746f  firmware-imx-3.14.28-1.0.0.bin
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 71e49e6..9cab5c2 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -10,7 +10,7 @@ FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
 FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
 	Atheros license (ath6k)
-FIRMWARE_IMX_LICENSE_FILES = EULA licenses/vpu/EULA
+FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_BLOBS = ath6k sdma vpu
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 26c591b..d4f8967 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 3.10.53-1.1.0
+FREESCALE_IMX_VERSION = 3.14.28-1.0.0
 FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
 # Helper for self-extracting binaries distributed by Freescale.
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
new file mode 100644
index 0000000..85f0a40
--- /dev/null
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 46022817d25f154b60247fdcbb87216e23e553bd88ec9664b1b5d5911e7aa2a2  imx-lib-3.14.28-1.0.0.tar.gz
-- 
2.5.1
