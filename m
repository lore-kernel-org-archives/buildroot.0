Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E5EECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95D5C817EB;
	Sun, 11 Sep 2022 08:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D5C817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kBqmK4IF0Yi; Sun, 11 Sep 2022 08:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD3981763;
	Sun, 11 Sep 2022 08:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD3981763
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54D501BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9812183EC2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9812183EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JE8V-X6HyCeq for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B1F483EC0
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1F483EC0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5975883620; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 20:57:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c3b7870cf4bbabb0b19abb2e28e8040980645f2
X-Git-Newrev: 721d3c6e802b8f97e133b2974cbf615dd00a1e80
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.5975883620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: rename
 FREESCALE_IMX_EXTRACT_HELPER to NXP_EXTRACT_HELPER
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=721d3c6e802b8f97e133b2974cbf615dd00a1e80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Freescale extract helper was introduced before Freescale was part
of NXP. Nowadays, we also have NXP packages, and they do use the same
archiving format.

Rename the helper under the now more generic NXP name, so that it is
more logical to also use it for NXP packages. We do not retain the old
Freescale-based name, because we should no longer add Freescale-named
packages; they would most probably be introduced under the NXP name.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr:
  - provide the rationale in the commit log
  - keep referring to Freescale in comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk           | 2 +-
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk   | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk                 | 2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk             | 2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk             | 2 +-
 package/freescale-imx/imx-parser/imx-parser.mk               | 2 +-
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk     | 2 +-
 package/freescale-imx/imx-seco/imx-seco.mk                   | 2 +-
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk | 2 +-
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk       | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk                     | 2 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk             | 2 +-
 package/freescale-imx/libz160/libz160.mk                     | 2 +-
 package/pkg-utils.mk                                         | 5 +++--
 14 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 47c21585aa..4884079d5c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -15,7 +15,7 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
 define FIRMWARE_IMX_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
 #
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
index c99c568f73..895fedc2e1 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -23,7 +23,7 @@ GPU_AMD_BIN_MX51_LICENSE_FILES = EULA
 GPU_AMD_BIN_MX51_REDISTRIBUTE = NO
 
 define GPU_AMD_BIN_MX51_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(GPU_AMD_BIN_MX51_DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(GPU_AMD_BIN_MX51_DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE))
 endef
 
 # Upstream headers need to be compiled with -D_LINUX. It is more convenient
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 1ec701d2f1..2b7c346a6e 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -26,7 +26,7 @@ IMX_CODEC_CONF_OPTS += --enable-vpu
 endif
 
 define IMX_CODEC_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_CODEC_DL_DIR)/$(IMX_CODEC_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_CODEC_DL_DIR)/$(IMX_CODEC_SOURCE))
 endef
 
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 0e4078a962..c5df87e618 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -19,7 +19,7 @@ IMX_GPU_G2D_LICENSE_FILES = EULA COPYING
 IMX_GPU_G2D_REDISTRIBUTE = NO
 
 define IMX_GPU_G2D_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_G2D_DL_DIR)/$(IMX_GPU_G2D_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_G2D_DL_DIR)/$(IMX_GPU_G2D_SOURCE))
 endef
 
 define IMX_GPU_G2D_INSTALL_STAGING_CMDS
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 1d76d79e2b..63d5d3c2ea 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -44,7 +44,7 @@ IMX_GPU_VIV_DEPENDENCIES += wayland
 endif
 
 define IMX_GPU_VIV_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index fc4376f04b..dccb8829d2 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -24,7 +24,7 @@ IMX_PARSER_CONF_OPTS += --enable-fsw
 endif
 
 define IMX_PARSER_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_PARSER_DL_DIR)/$(IMX_PARSER_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_PARSER_DL_DIR)/$(IMX_PARSER_SOURCE))
 endef
 
 # The Makefile installs several versions of the libraries, but we only
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index bbb7310306..6a304c0c8c 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -13,7 +13,7 @@ IMX_SC_FIRMWARE_LICENSE_FILES = EULA COPYING
 IMX_SC_FIRMWARE_REDISTRIBUTE = NO
 
 define IMX_SC_FIRMWARE_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SC_FIRMWARE_DL_DIR)/$(IMX_SC_FIRMWARE_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_SC_FIRMWARE_DL_DIR)/$(IMX_SC_FIRMWARE_SOURCE))
 endef
 
 IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 79c9722c43..987f24658d 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -13,7 +13,7 @@ IMX_SECO_LICENSE_FILES = EULA COPYING
 IMX_SECO_REDISTRIBUTE = NO
 
 define IMX_SECO_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SECO_DL_DIR)/$(IMX_SECO_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_SECO_DL_DIR)/$(IMX_SECO_SOURCE))
 endef
 
 IMX_SECO_INSTALL_IMAGES = YES
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index b07e116674..5f4c6faee4 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -14,7 +14,7 @@ IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
 IMX_VPU_HANTRO_VC_REDISTRIBUTE = NO
 
 define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
 endef
 
 define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 360591b444..9d34c7add7 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -23,7 +23,7 @@ IMX_VPU_HANTRO_LICENSE_FILES = EULA COPYING
 IMX_VPU_HANTRO_REDISTRIBUTE = NO
 
 define IMX_VPU_HANTRO_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_DL_DIR)/$(IMX_VPU_HANTRO_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_DL_DIR)/$(IMX_VPU_HANTRO_SOURCE))
 endef
 
 define IMX_VPU_HANTRO_BUILD_CMDS
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 14a1a7a9f0..cae3d88b6d 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -21,7 +21,7 @@ IMX_VPU_LICENSE_FILES = EULA COPYING
 IMX_VPU_REDISTRIBUTE = NO
 
 define IMX_VPU_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_DL_DIR)/$(IMX_VPU_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_DL_DIR)/$(IMX_VPU_SOURCE))
 endef
 
 define IMX_VPU_BUILD_CMDS
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index 4f89165403..4bee1cf642 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -22,7 +22,7 @@ IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
 IMX_VPUWRAP_REDISTRIBUTE = NO
 
 define IMX_VPUWRAP_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPUWRAP_DL_DIR)/$(IMX_VPUWRAP_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(IMX_VPUWRAP_DL_DIR)/$(IMX_VPUWRAP_SOURCE))
 endef
 
 $(eval $(autotools-package))
diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
index 5b1feeb441..a15b5f6b60 100644
--- a/package/freescale-imx/libz160/libz160.mk
+++ b/package/freescale-imx/libz160/libz160.mk
@@ -15,7 +15,7 @@ LIBZ160_LICENSE_FILES = EULA
 LIBZ160_REDISTRIBUTE = NO
 
 define LIBZ160_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBZ160_DL_DIR)/$(LIBZ160_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(LIBZ160_DL_DIR)/$(LIBZ160_SOURCE))
 endef
 
 define LIBZ160_INSTALL_STAGING_CMDS
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 57f4af04c5..0945e6ed31 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -276,7 +276,8 @@ legal-deps = \
             $(call non-virtual-deps,\
                 $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
 
-# Helper for self-extracting binaries distributed by Freescale.
+# Helper for self-extracting binaries distributed by NXP, and
+# formerlly Freescale.
 #
 # The --force option makes sure it doesn't fail if the source
 # directory already exists. The --auto-accept skips the license check,
@@ -290,7 +291,7 @@ legal-deps = \
 #
 # $(1): full path to the archive file
 #
-define FREESCALE_IMX_EXTRACT_HELPER
+define NXP_EXTRACT_HELPER
 	awk 'BEGIN      { start = 0; } \
 	     /^EOEULA/  { start = 0; } \
 	                { if (start) print; } \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
