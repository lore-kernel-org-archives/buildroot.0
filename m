Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E69C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C2260A52;
	Mon, 12 Feb 2024 21:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_P_iahXyqcg; Mon, 12 Feb 2024 21:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1097260A46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1097260A46;
	Mon, 12 Feb 2024 21:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F25B1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8974F81E08
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLyY5KotzN6g for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1534481F5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1534481F5B
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E61F7878BC; Mon, 12 Feb 2024 21:45:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 21:49:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8740387457f4dfccbd211ffaef1cae91db9f232d
X-Git-Newrev: c1cdd48e13b2842669f0ab30e817d8064663beec
X-Patchwork-Hint: ignore
Message-Id: <20240212214540.E61F7878BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: add i.MX91 and
 i.MX93 SoC support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1150492099888006844=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1150492099888006844==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c1cdd48e13b2842669f0ab30e817d8064663beec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds i.MX91 and i.MX93 support to Buildroot.
https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS

There is no i.MX95 software provided by NXP at the moment that's why
i.MX95 is left behind.

Adapt package firmware-imx for the LPPDR4 firmware binaries. The i.MX91
and i.MX93 only support LPDDR4 and LPDDR4x, but using different binaries
than i.MX8. For simplicity, use a completely separate code path for
i.MX91 and i.MX93, using the symbol
BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9. There is only one type of
firmware supported, so there's no need for a choice or for selecting the
version (at least for now).

Reviewed-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Arnout:
 - Remove BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A1 option.
 - Re-wrap help text.
 - Introduce BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9 instead of
   reusing BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW.
 - Create completely separate instance of
   FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW for
   BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9.
 - Drop the training binaries choice for IMX9.
 - Drop the firmware version option for IMX9.
 - Keep options for IMEM and DMEM padding.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/Config.in                    | 26 +++++++++++++++++++++
 package/freescale-imx/firmware-imx/Config.in       | 11 ++++++++-
 package/freescale-imx/firmware-imx/firmware-imx.mk | 27 ++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 1c26b3cc6f..3221f06e43 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -61,6 +61,30 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	bool "imx8dxl"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
+	bool "imx91"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+	bool "imx93"
+
+endchoice
+
+choice
+	prompt "i.MX Silicon Revision"
+	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+	help
+	  Some packages related to the selected i.MX platform need to
+	  know the silicon revision of the platform they will run on.
+
+	  Note - mismatches may result in a failure to boot!
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
+	bool "imx93a0"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+	bool "imx93a1"
+
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
@@ -80,6 +104,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "IMX91" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
+	default "IMX93" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 087ddef877..63990947c8 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -56,6 +56,11 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+
 if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
 choice
@@ -93,6 +98,10 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
 	  Use a specific version of the imx ddr binaries. Leaving this
 	  field empty will select the default version.
 
+endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+
+if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
+
 config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
 	hex "(LP)DDR IMEM padding length"
 	default 0x8000
@@ -105,6 +114,6 @@ config BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN
 	help
 	  The DMEM firmware will be padded to this length
 
-endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
+endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 
 endif # BR2_PACKAGE_FIRMWARE_IMX
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 66ef8c3930..2a74f58aa6 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -45,6 +45,33 @@ ifneq ($(FIRMWARE_IMX_DDR_VERSION),)
 FIRMWARE_IMX_DDR_VERSION_SUFFIX = _$(FIRMWARE_IMX_DDR_VERSION)
 endif
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9),y)
+FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
+	# Create padded versions of lpddr4_{d,i}mem_{1,2}d_* and generate lpddr4_fw.bin.
+	# lpddr4_fw.bin is needed when generating imx9-boot-sd.bin
+	# which is done in post-image script.
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		lpddr4_imem_1d_v202201,
+		lpddr4_dmem_1d_v202201,
+		lpddr4_1d_fw)
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		lpddr4_imem_2d_v202201,
+		lpddr4_dmem_2d_v202201,
+		lpddr4_2d_fw)
+	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_1d_fw.bin \
+		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_2d_fw.bin > \
+		$(BINARIES_DIR)/lpddr4_fw.bin
+	ln -sf $(BINARIES_DIR)/lpddr4_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+
+	# U-Boot supports creation of the combined flash.bin image. To make
+	# sure that U-Boot can access all available files copy them to
+	# the binary dir.
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4*.bin $(BINARIES_DIR)/
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
 FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
 

--===============1150492099888006844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1150492099888006844==--
