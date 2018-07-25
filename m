From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 25 Jul 2018 17:01:48 +0200
Subject: [Buildroot] [PATCH 7/8] imx-codec: bump version to 4.3.5
In-Reply-To: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
Message-ID: <20180725150149.30774-8-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No changelog provided by NXP for v4.3.5.

Added COPYING hash to track license change.

Changelog for v4.3.4
1. Add INSANE_SKIP for file-rdeps to fix QA Issue
2. Update mp3_enc version to 02.03.01
3. Fix crash in lib_mp3_enc_arm12_elinux.so
This crash error is caused by division by zero
in noOfElements_mp3e() function When encoding 0
size file by using unit test
so before performing a division operation, need to
check whether divisor is zero or not to fix it.

Changelog for v4.3.2
1. Upgrade EULA to v20
2. Add i.MX8 support
3. Bugfix/Optimization
   - Remove video codec in imx-codec package.
   - Fix logically dead code issue for aac_dec.
   - Fix wrong sizeof argument for flac_dec.
   - Cancel unused code in nb_amr/wb_amr/flac_dec/bsac_dec.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-codec/imx-codec.hash | 3 ++-
 package/freescale-imx/imx-codec/imx-codec.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
index 53d8f71c39..9d99ee0101 100644
--- a/package/freescale-imx/imx-codec/imx-codec.hash
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256	20d3f9b4187fcd9e7007c94558a00bab1191513eee74b6f0d8c7b43f874e06ed  imx-codec-4.2.1.bin
+sha256  6bb54f91c3ca18567e14d95d3858022dc9be00dc86e9edfdb544d1240a3b2b04  imx-codec-4.3.5.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 7f738d8129..a3276027fb 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_CODEC_VERSION = 4.2.1
+IMX_CODEC_VERSION = 4.3.5
 IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
 IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
 IMX_CODEC_INSTALL_STAGING = YES
-- 
2.18.0
