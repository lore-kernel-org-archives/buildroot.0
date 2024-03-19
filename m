Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC14C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 07:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EEAF40AF8;
	Tue, 19 Mar 2024 07:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wf4Tz_RXRilb; Tue, 19 Mar 2024 07:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4EE940A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4EE940A5E;
	Tue, 19 Mar 2024 07:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3C651BF310
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F5A40B26
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQe4P56jRKeR for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 07:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D850C40A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D850C40A45
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D850C40A45
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 07:06:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33ed6078884so1947613f8f.1
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 00:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710831974; x=1711436774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hL0f0So4JBgzQgWzS+8UTUad9CdknSAo8Z5fyKGpDaM=;
 b=XHy2B+Z1uEsAEH9xZ+1l+ean2p+7C9tUUFkWuMc/NXinlqW7jKiQ/62Aq7Z9BCFtum
 kyBouefT2xoZvQHJbIhuqAo/36+nMpUsiLNNjLkrjXo79/bY5stBSxfnv1Y26SVsSuk4
 JnBO+iIGFNzAUurN6ngVJMKOw6zBIcL5jJpU6Ht1jAp5sX4McG87g/Hv9V67hO6dKoHF
 vwpk3EIplmQ6IXVMQ/SKs9bYy+UVvXi7y1BTc7NJcpbW18xi9PX9xrwdeW2F4HLXevuQ
 Wt2WpYAQE4TYTKUPFLoX4v0SKvy/eJnSeRd6K5b158R/CV/SwRxGCVoLJetCCgjO+KGj
 st8A==
X-Gm-Message-State: AOJu0YyZ/FzLR4UJrPU8hJlCHhqSoZP/y5ImH5MB1CSSxcN8tajIf0U7
 Wc1W3T9E79d8HWLARo59PD352z4TeR4i52NF0M3aDta3LM+jnYcRuxw+YlE7u6dqOwjg6XFAc38
 Epo4=
X-Google-Smtp-Source: AGHT+IE0D9d6TtYFfZdR7o+jnjfwxpaifmWqODTcW8WNeiaJ/h9OqZ3wfJuxdrJsBmQePSihOVltCw==
X-Received: by 2002:adf:e589:0:b0:33e:9f3d:6910 with SMTP id
 l9-20020adfe589000000b0033e9f3d6910mr1416460wrm.31.1710831974258; 
 Tue, 19 Mar 2024 00:06:14 -0700 (PDT)
Received: from localhost.localdomain (59.178-181-91.adsl-dyn.isp.belgacom.be.
 [91.181.178.59]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b0033e192a5852sm11583865wrp.30.2024.03.19.00.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 00:06:13 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 08:05:54 +0100
Message-ID: <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710831974; x=1711436774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hL0f0So4JBgzQgWzS+8UTUad9CdknSAo8Z5fyKGpDaM=;
 b=OIgZLPaDHBS5YRr5PZXbpA4K9gPfsgO5Dvnup4T7iqA7Wtha7CeIDSRGaEtqQhicdr
 4Hbm4u2gF/J0WSg7tfQ1e8TOWvz04GRW9Fu6uWWpi2taJajB9Tks9XGhMYmYBu/jwfaL
 lsaL+SQdaSsWZFkH3Mq3iULVuexJNAy6Fq+jBFXQV1r7HFq2Nx70MVd9ICQ1588ABmBj
 VDe/Mm19Evhvsk/ObYPT+zeGHAQWolShalJqwxmu0mXC8shAO35j9sEh3vlENCx5sops
 T9fbtddSwYkdW04qF7wz/J75pHh7wi8s7zsOiyYBTSMzXKfttVHcRhOlTJsdyHaISYFn
 l8Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=OIgZLPaD
Subject: [Buildroot] [PATCH v3 3/3] configs/avenger96: bump ATF version to
 v2.8
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades the ATF version to v2.8. Please note that
due to DTS chages from commit 51e223058fe70b311542178f1865514745fa7874
("feat(stm32mp15-fdts): add Avenger96 board with STM32MP157A DHCOR SoM")
The ATF additional build variable also modified to use the new DTS file.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 configs/avenger96_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 98a71a0f25..67b6d16749 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -29,13 +29,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
