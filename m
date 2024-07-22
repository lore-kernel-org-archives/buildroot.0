Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0982EC3DA63
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B4C607BD;
	Mon, 22 Jul 2024 19:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0KQ7GCyW9-5; Mon, 22 Jul 2024 19:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF5C560755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF5C560755;
	Mon, 22 Jul 2024 19:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D19471BF281
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD3F660724
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnWwr34mFy5h for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 740646063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 740646063F
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 740646063F
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:17:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHrOf053698;
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MJHrNf010136
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 14:17:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 14:17:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHqL7103389;
 Mon, 22 Jul 2024 14:17:52 -0500
Date: Mon, 22 Jul 2024 14:17:36 -0500
Message-ID: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFCwnmYC/x3MQQ5AMBBG4avIrE1ClYiriEXT+ctskBaRiLtrL
 L/Few8lREWioXgo4tKk25pRlwX5xa0zWCWbTGVs1ZmGj+A4Rc/nLu4A9wLrJbQeEMrRHhH0/of
 j9L4fVgzTLWAAAAA=
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093; i=bb@ti.com;
 h=from:subject:message-id; bh=8IZ0Z6rzZVT3I6CqrRYlHNLg5wm1Npm/BjRH598Ao10=;
 b=owNCWmg5MUFZJlNZxoAbswAAZ3//////L2V/6h3d6+2fP213M2bzcc3/X/pNXX/e0bbV9++wA
 Rm1CHqPSAAaABoDTQ0DQBo0DQAA9Rk0DQAeoAAMnqAAZMmgNDTIeoPRPUM9J6ocmhkPUZGgaZBo
 A0AaaaNDQyAA0NNHpAA0GhkaYjQZBiBk9QB5QD0IbUMJoMcho0MRpo9CYgAMQNohhNADQABkABi
 aZMAIAPSepoMh6gAeoA0BpkADhyYgLYFx6ktDFDMk8J44KpYYPzRA3eNZGb72fqCMATSZgZPCLe
 kaxgwit/4m1iBWVWvHP0Z8BqpWyNFgtHr1TVLQgCVVtpinePmoAnO/MToEYU7Aw+DtDBhwghp76
 YC8k5Co724MMDAIS72boLyG1uYAXwmGKZa1EsHn7WpsyRSrgKgAdA3PgmNVToHb6M4+MhkelmRC
 L9RI2u2CxVQAwTgq3qONDFWIWeTc/Gv5E+0HtZLvPSSagz7/n8Ll2I55WOe1I2Ev1o4XvwwUZQO
 TD1Qboz8FRrHKgEV2Vqh71Fff1R/J5Yhw8QNbA967ttfjsQH0CCJOjEwFFkMSSV2iKjKdi3L3Wm
 laQoWxI/cdGKI3zAFCNGCyN+y0uShEO2bXgkEqJs9M9c3s19XCmBVmPIB39uIPPeZhsA0GFkEMp
 b/4u5IpwoSGNADdmA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721675873;
 bh=TBpWpCVWHCbrKLg5+ilqZaobnx/yvJCBgLES3uLUq/k=;
 h=From:Subject:Date:To:CC;
 b=CZrLtpoXVyRSVoKCM/rodNPxEIXSuNS/QAs2eGdD89/r+YI8F3mbg8z5VGy5DyEUR
 WUzLsoNVm7ubfIJTSagJGxxrGmPeBE6HG7onq0YpX4Ep5jBI93jJN8c/b3rFahMljj
 3sIS2dLbQbRhHnRdCM95vwxzu0PEM3KuMANanWIg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=CZrLtpoX
Subject: [Buildroot] [PATCH 0/3] boot/arm-trusted-firmware: version bump and
 source update
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
Cc: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

When trying to bump the versions for arm-trusted-firmware I noticed 
we're using the old mirror which hasn't received any new tags in a 
while. So this changes ARM_TRUSTED_FIRMWARE_SITE to point to the new 
TrustedFirmware-A[0] organization and updates all the hashes I could see

I did notice the lts-v2.10.x branch however I didn't add it as I didn't 
see anyone using it. (The boards using TI's K3 SoCs will be going to 
v2.11 in another patch series)

Happy reviewing
~Bryan

[0] https://github.com/TrustedFirmware-A

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (3):
      boot/arm-trusted-firmware: update source to the new mirror
      boot/arm-trusted-firmware: bump to v2.11
      boot/arm-trusted-firmware: bump latest v2.8 version

 .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 boot/arm-trusted-firmware/Config.in                                 | 6 +++---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.mk                   | 2 +-
 .../0001-build-tools-avoid-unnecessary-link.patch                   | 0
 14 files changed, 16 insertions(+), 16 deletions(-)
---
base-commit: 4e4554eeb76e8b516c6cbcd66f15868492aac594
change-id: 20240623-tfa-src-update-8de4cdf5ceed

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
