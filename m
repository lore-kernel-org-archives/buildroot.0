From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Jul 2018 15:01:44 +0200
Subject: [Buildroot] [PATCH v3 5/5] imx-parser: bump version to 4.3.5
In-Reply-To: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
References: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
Message-ID: <20180730130144.31110-6-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added COPYING hash to track license changes.

No changelog provided by NXP for v4.3.5.

Changelog for v4.3.4:
- Fix crash issue when parse index list.
- Add mett atom in mp4 parser.
- MP4 PARSER 06.13.00 add interface PARSER_API_GET_TEXT_TRACK_MIME
to get mime type from mett atom.
- Add protection for contentDescriptionObject in case the size is not
correct and larger than qwSize.

Changelog for v4.3.2:
- Fix creating parser error
When the variable value is negetive, if(bytesToRead) will return true,
modify this condition to if(bytesToRead > 0).
- FLAC PARSER 03.00.07
Check read actual length in case of parser reach eos.
- MP4 PARSER 06.12.11
Fix crash issue when parse id3 metadata.
- MPG2 PARSER 04.05.16
Fix parser return wrong frame size after fastforward.
- ASFPARSER_01.00.55
Update for HEVC tag and audio AC3 support.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-parser/imx-parser.hash | 3 ++-
 package/freescale-imx/imx-parser/imx-parser.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-parser/imx-parser.hash b/package/freescale-imx/imx-parser/imx-parser.hash
index 3266f48110..708e9b8386 100644
--- a/package/freescale-imx/imx-parser/imx-parser.hash
+++ b/package/freescale-imx/imx-parser/imx-parser.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256	36d3ae7285f3a83a87abf680b8a52b3c07df869d2443de844fb5f0ff528ca862  imx-parser-4.2.1.bin
+sha256  9cd8c49a0bb1050afcfbcc7a677a348443fda4ecacb621cc6e38897619e27c67  imx-parser-4.3.5.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index 11536e5024..fc4376f04b 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_PARSER_VERSION = 4.2.1
+IMX_PARSER_VERSION = 4.3.5
 IMX_PARSER_SITE = $(FREESCALE_IMX_SITE)
 IMX_PARSER_SOURCE = imx-parser-$(IMX_PARSER_VERSION).bin
 IMX_PARSER_INSTALL_STAGING = YES
-- 
2.18.0
