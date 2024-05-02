Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2451C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA6741E2C;
	Thu,  2 May 2024 16:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3UBrKeBNNlu; Thu,  2 May 2024 16:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B89441E4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B89441E4D;
	Thu,  2 May 2024 16:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1AA1BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 765BC82F03
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_xD5hDYqRCI for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA97D82EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA97D82EFC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA97D82EFC
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDe6120090;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDYT131039
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRD9f127924;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:26:55 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-5-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=bb@ti.com;
 h=from:subject:message-id; bh=0VwnxdymhUT2q4LT0OmKhnv5F7xxxm6d+pBXIDkIDFk=;
 b=owNCWmg5MUFZJlNZBtkPGwAAa////3/b7j/3/73273dve/Ia72v+2k+u/1vfQ/sv3dnavdywA
 RsZpDQPUyaA00Ghk0AGjRpoBhGQBoAaNAyBggAAGgaGgGgYgNMmmTTT0Q0aMm9UQAGgDQ0Gg0AA
 DQ9TTJo0AADQaGn6oADag9TQ0ZADI9BDTR6j0gPU0DQyAPU00DvVNNHpDR6hpoBkHqaaDQDTQDQ
 GhowgMmjQAGIyAYjTIANNGgBkNBoaBoNAD1Bw7reUVciIKHjBCfioZHAhZcQL92MffIQQYwSwbA
 L4mScaGRDZvXYd4ENGZYBr3pzSlgmB74M65BPawiBPAdXR07VCiUJxFp1kCdKGVSVsaCzBXF97F
 nf+iHAMWHAGSu3Y4QotE6gf2TrfcagODh86sIVTqp3VkByQJg6LOKpKsJiv5OwwzPDJCWIMqJIy
 7i0fiW6b9ZyF+j4rgsRLGg7VQ3jDLhy6lxvn28LcR+MVEA7oZTxj1JQCCfIFQc/isgrlWU1VsUz
 93SY7tq6gJEiaaa6GYzqcAoMP+axwguvsAqPNYObXUbA8OjK/HQa71bs/inWGgxLxWcDlrrxHbV
 NsGeFZHm4C6nAgxs3DS7ZA9STZzm20q7DPcaNObhMX+BS/RGkSSyQUJS1uzAZf85XMm/nqG0QhW
 XmTFAgASYPzt2D/F3JFOFCQBtkPGw==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=Cc/Gw2hmV8zm8xKxZ8swsEild2KgwkC6tAzW9p2QJiw=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=abofMpAg0v91ZF8rwzSKsJ0PnQ0wg9f7guTUAB2mKc7bo3rqWTTOLnxnlpzoiGG2g
 iLJumHK2pKU/QqoPjTbEByzRgrxg1oWseaEUdL/VZLcnaM+V9AC1TgWK5vERuYxZwf
 vzwSp0alMmg9XRmTRLjgrYa08FBnIug1Gc1fgkdM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=abofMpAg
Subject: [Buildroot] [PATCH RESEND v2 05/11] configs/ti_am62x_sk_defconfig:
 update TFA to v2.10
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

Update the TFA firmware to the latest LTS tag for v2.10 release of
arm-trusted-firmware

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 configs/ti_am62x_sk_defconfig                                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 74fe35c9bc733..8f60864fbf67f 100644
--- a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
+sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 405016818438a..e169b6834d89c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
