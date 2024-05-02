Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9434C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9452B40347;
	Thu,  2 May 2024 16:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQk0t1ZyNnf6; Thu,  2 May 2024 16:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7191541737
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7191541737;
	Thu,  2 May 2024 16:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF8DE1BF995
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B87FF4026B
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFCTrvtXqVvw for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB99F40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB99F40347
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB99F40347
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDe8120094;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDmR014702
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:12 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDTt109060;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:58 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-8-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=bb@ti.com;
 h=from:subject:message-id; bh=xgccWr8n1Q96VQRrzXoWgxkfYdR3jPtubXXm3xfknOs=;
 b=owNCWmg5MUFZJlNZ0UupdAAAZP////5vbnunzpv/Ab8x22s/+lnu3dZe73+n+ct/5//v+22wA
 RswHagAaNNAaAxA0AAaA0ekAxNDQBoBoaMjCAaGgaAGIZDQNPQjEwRkbTKINGmIDJoDIA0xBoZG
 gA0AyBiD0QBpiNA0HonoE0aBpo9RoaMIDTTQDTEA0IaGnqDQA0wjQ0ADRoGmBNNGQAAA0DCNNGA
 CMjRkNANMJkYQxNAANGTQDB9QQuwARGvoCXkpiBp1dCA13yXAdIzObKDxAWIce7WsdgrMKy76g7
 TMmGT3AgqSjW1QEwiBu8lvKwK3lAVXJXTQ2DZwHPtKfvvsFImFPScOCngoUI1zBmmIjobOy3wR3
 CIB/yjpxiFgRn6doBTMB9549dvn/pmikJTk9gyf9nJ9VoC3zbO1LZkRvsFuVKl/VIgsMkjcHag+
 0YmGnuJQrShktM4BNKbJRHjVhsyrZinOXkaqVtSI4NkChMqjUgvbqVYwwfCsSARJNUvyTYWAjyl
 n8bbZ5BiAKO9Gh4U71LmkFzBpOah0IrBLcaGj/RcEvGtTy/eGN5I0OucXzTXXz7W7l5+M2Sgaet
 XBenu3OmgAUXzfuOFgGeEmDFFNzAwHqVvnp4B2TEDfIlKIfWBu3D2qfYkpSunUn/CRYAazREFRi
 ZiUX/F3JFOFCQ0UupdA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=LpRa4fatGfT1ZxpygBnz3/1rvTFrgD7EkJM953AsD80=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=pvBIW+2v/JEpEn5PJM02t2GeSEt45WzB9GiGwcl5WNaxSeHRd+bD/o0O/jKozF67R
 nM+BkG4/8GAmDK+uyy1scH4Ca+UntGphVvKF1ostj8YsicEXVXjFsg7DWmI+7VQn/K
 3Sksil0+5odEHYoMsJkgMoqaNBc9H6A2EB4b0vIY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pvBIW+2v
Subject: [Buildroot] [PATCH RESEND v2 08/11] configs/ti_am64x_sk_defconfig:
 update U-Boot to v2024.04
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest release from U-Boot

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 configs/ti_am64x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index e0f48cd5bb062..bdd85f82a60e6 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
