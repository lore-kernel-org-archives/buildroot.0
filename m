Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B450C4706C
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3EB6105F;
	Tue, 16 Jan 2024 09:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C3EB6105F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzW9_CvP_3Yr; Tue, 16 Jan 2024 09:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65DCD61044;
	Tue, 16 Jan 2024 09:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DCD61044
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF251BF2CB
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0901282284
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 09:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0901282284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45qyD3nNbiBn for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 09:34:14 +0000 (UTC)
Received: from mail.eaton.com (mail.eaton.com [192.104.67.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F35082277
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 09:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F35082277
Received: from mail.eaton.com (simtcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9BFB96216
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 04:34:12 -0500 (EST)
Received: from mail.eaton.com (simtcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B33C896177
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 04:34:12 -0500 (EST)
Received: from USSTCSPGWY04.napa.ad.etn.com (USSTCSPGWY04.napa.ad.etn.com
 [151.110.126.248]) by mail.eaton.com (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 04:34:12 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) by
 USSTCSPGWY04.napa.ad.etn.com (151.110.126.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 16 Jan 2024 04:34:12 -0500
Received: from localhost (151.110.234.152) by USLTCSPGWY04.napa.ad.etn.com
 (151.110.126.205) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 16 Jan 2024 04:34:12 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 Jan 2024 09:34:03 +0000
Message-ID: <20240116093403.10573-1-laurentbadel@eaton.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eaton.com; 
 s=eaton-s2020-01; t=1705397653;
 bh=sjYDk1VHy5NODTHXf4yLYFxR3SQ2d3QBSVkloI1FWlY=; h=From:To:Date;
 b=BczG1OGQCvc/CLRbTgOBT18zaNjDsY7/B/DpGZTSttI95oYmje/WUJUJqOCTXhMsU
 OJ3FXrYgEXHCWOBmsG/ETQ2hSRKSgwYgPEX6uT5Pl13aH2VoJ1NXoHZTL2TfxNiVEu
 4+NwHLNfCHYnbFNvD9lc9OUXyBNVcHBHOXC2moPDUdn4fYldAqyHhuDBdP3DvRZt6T
 SDAaA5zTIKSeWX9Gnv4TOCgltRxSco5AuLRVTNW5Og3Tg+DlfVm9FPHjG5oNXgw0Xh
 46o/8j8XR5jShIbxEjQJ6XAzt+Yk8nTb7CaCD2SKymimbj+PIoJnWEcCau2hfbGHl4
 1ox8P6uNtdvUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=eaton.com header.i=@eaton.com
 header.a=rsa-sha256 header.s=eaton-s2020-01 header.b=BczG1OGQ
Subject: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for zImage
 with appended DTB
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
From: Laurent Badel via buildroot <buildroot@buildroot.org>
Reply-To: Laurent Badel <laurentbadel@eaton.com>
Cc: Laurent Badel <laurentbadel@eaton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building a zImage with appended DTBs, buildroot creates copies of
the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does not
take this into consideration and passes only the original zImage
(without DTB appended) to elftosb to generate the SB file. Thus,
make sure that the correct zImage files are used in this process.

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 36 +++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index adc22767..efcee16a 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -38,20 +38,21 @@ endif
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
 MXS_BOOTLETS_LICENSE = GPL-2.0+
 
+MXS_BOOTLETS_BOOTSTREAM_EXTS = .sb
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
 MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX)
 
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
 MXS_BOOTLETS_DEPENDENCIES += linux
 MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX)
 
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
 MXS_BOOTLETS_DEPENDENCIES += uboot
 MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
-MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
+MXS_BOOTLETS_BOOTSTREAM_BASENAME = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX)
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
@@ -65,10 +66,18 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
 		$(MAKE1) -C $(@D) linux_prep
 endef
+
 define MXS_BOOTLETS_SED_LINUX
 	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
+	
+define MXS_BOOTLETS_SED_ZIMAGE
+	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage$(1)";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+endef
+
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB), y)
+	MXS_BOOTLETS_BOOTSTREAM_EXTS = $(foreach dts_name,$(LINUX_DTS_NAME),.$(strip $(dts_name)).sb)
+endif
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
@@ -83,7 +92,13 @@ endef
 
 MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
 
-define MXS_BOOTLETS_BUILD_CMDS
+define MXS_BOOTLETS_ELFTOSB_CMD
+	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+	-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
+	-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASENAME)$(1)
+endef
+
+define MXS_BOOTLETS_BUILD_CMDS	
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
 		$(MAKE1) -C $(@D) power_prep
 	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -94,13 +109,16 @@ define MXS_BOOTLETS_BUILD_CMDS
 	$(MXS_BOOTLETS_SED_BAREBOX)
 	$(MXS_BOOTLETS_SED_LINUX)
 	$(MXS_BOOTLETS_SED_UBOOT)
-	$(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
-		-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
-		-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
+	$(foreach ext, $(MXS_BOOTLETS_BOOTSTREAM_EXTS),
+		$(call MXS_BOOTLETS_SED_ZIMAGE,$(subst .sb,,$(ext)))
+		$(call MXS_BOOTLETS_ELFTOSB_CMD,$(ext))
+	)
 endef
 
 define MXS_BOOTLETS_INSTALL_TARGET_CMDS
-	cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
+	$(foreach ext, $(MXS_BOOTLETS_BOOTSTREAM_EXTS),
+		cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASENAME)$(ext) $(BINARIES_DIR)/
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
