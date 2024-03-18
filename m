Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6734AC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 09:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B87081754;
	Mon, 18 Mar 2024 09:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_4WYP7AIPVm; Mon, 18 Mar 2024 09:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 252F7814BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 252F7814BA;
	Mon, 18 Mar 2024 09:30:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 511AF1BF365
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ED8A4054D
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcIuhCMNY-SG for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 09:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 337A340538
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 337A340538
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 337A340538
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 09:30:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41413ad1f73so2708645e9.0
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 02:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710754231; x=1711359031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1x3nDTYdlOhY+wTGZs+BV/Phh8QjPq4e0S1RQJIYNU8=;
 b=OgO1C71RPo5O5QNuSKHxQ4Ylu+WNr8ICVd9MLx7KKvhMA51V4sZxRdx5C71SA+NMY/
 /ul23j9rObPkPZj5+/Qo6ESVon9jHehX5csj3JRB5YBOKUMxJJg7EGOmLmZIaXI53RzF
 dSSD23RBtF4vMSq+fTkT7D9H36HE5mvNoK2GN4ZxYmTF3BPgfmWHHiErl4Nnx4hFb2Ib
 MkgLQx/QLrFIV8Ns4NoGMN+NCIpJCxzYX18J9++MYMLQ+mmPegwwc0uygglS14DO7oaj
 CV1AH1nHMk7yJgjws1pDP9IRtnusOVGcbbhyAxGsoxwSYHSxA1sAWO9gOuoesy65tjvf
 Uslg==
X-Gm-Message-State: AOJu0YzFma3mzZflfr28t5ktrRJtDy8YUi1ZSyrLWrpk/Pumdhy9jiNs
 sQK1QG4feqZ2R0EPjz0eEzP79d81Ad7TeKuAXc2TCvPu/fwzRs5dNtR4AddLXbQqkugOYLFNzRk
 +XQc=
X-Google-Smtp-Source: AGHT+IGFvhOtk8CRUSym75vS8lgKJtaiSRN7dDDrljazu9ilQqj0uvsOB6rc5Yb+mKohKfvt8lrLlQ==
X-Received: by 2002:a05:600c:1c8d:b0:414:227:fc66 with SMTP id
 k13-20020a05600c1c8d00b004140227fc66mr6044615wms.2.1710754230775; 
 Mon, 18 Mar 2024 02:30:30 -0700 (PDT)
Received: from mind.. (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041409fa57c4sm5825360wmq.34.2024.03.18.02.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 02:30:30 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 10:30:26 +0100
Message-ID: <20240318093026.8193-2-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318093026.8193-1-javad.rahimipetroudi@mind.be>
References: <20240318093026.8193-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710754231; x=1711359031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1x3nDTYdlOhY+wTGZs+BV/Phh8QjPq4e0S1RQJIYNU8=;
 b=GUshBV20lToMdfatCzw5cDi8eqdjsdLJNVtCtq0JknrW37PtcnzYSe08eHt2b24GCg
 UDVwsKuKK8wf/OAH9RHN9nCvdH01M7tcqP4xaUDDHYlkyZo+/Kg2FE+43XDWrsVTxynP
 VaO4vF06iI+QIEidylDYbheVCdGrnujmnoz4OvWzns4EJfYf436jqg3PoA5nPQ8DFfHU
 zxJBr8XfwCooruuysWjH+2hueFZtq/IdyRbdjwULOWj4Hy8pkmShwCxLP8nPLw9Rq0FA
 3ray7hioV5LUGrtitfMEJcpBtTPkalik6wRxuIip1Sp+yB1VzEDgaV7NctGG87eg/UqN
 eKZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=GUshBV20
Subject: [Buildroot] [PATCH 2/2] configs/avenger96: bump Linux version to
 6.6.21 LTS
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
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades Kernel version to 6.6.21 LTS on avenger96 board.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
---
 configs/avenger96_defconfig | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 45600ef2fe..ba3d093d59 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -2,9 +2,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
-
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
@@ -13,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -39,9 +36,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 PLAT=stm32
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
