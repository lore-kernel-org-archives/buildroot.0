From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Jan 2018 19:38:35 +0100
Subject: [Buildroot] [PATCH 09/16] imx-codec: bump to version 4.2.1
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103183842.10182-10-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
1. Upgrade EULA to v18
2. Bugfix/Optimization
 - AACPlus: fixed playbe silence after 1s of stream
 - Removed duplicated code in aac_dec/aacplus_dec.
 - Removed unused code in flac_dec.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-codec/imx-codec.hash | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
index 2bb7a242e9..53d8f71c39 100644
--- a/package/freescale-imx/imx-codec/imx-codec.hash
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	98fe71cb44f7e858c64c5eda81741ed02f40afaadc3d4ed1e693c7d1e684b81d  imx-codec-4.1.4.bin
+sha256	20d3f9b4187fcd9e7007c94558a00bab1191513eee74b6f0d8c7b43f874e06ed  imx-codec-4.2.1.bin
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 44be941fe2..ea4d90110f 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_CODEC_VERSION = 4.1.4
+IMX_CODEC_VERSION = 4.2.1
 IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
 IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
 IMX_CODEC_INSTALL_STAGING = YES
@@ -13,6 +13,10 @@ IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3-Clause (
 IMX_CODEC_LICENSE_FILES = EULA COPYING
 IMX_CODEC_REDISTRIBUTE = NO
 
+ifeq ($(BR2_aarch64),y)
+IMX_CODEC_CONF_OPTS += --enable-armv8
+endif
+
 ifeq ($(BR2_ARM_EABIHF),y)
 IMX_CODEC_CONF_OPTS += --enable-fhw
 endif
-- 
2.15.1
