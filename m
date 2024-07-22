Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8971C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B6A960724;
	Mon, 22 Jul 2024 19:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTUEKD8XX7rI; Mon, 22 Jul 2024 19:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E2DB60755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E2DB60755;
	Mon, 22 Jul 2024 19:18:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9C2F1BF281
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9726660755
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyIChmUUQpyp for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D272260724
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D272260724
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D272260724
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:17:57 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHrhZ034013;
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MJHrb3062598
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 14:17:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 14:17:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHqdS103394;
 Mon, 22 Jul 2024 14:17:52 -0500
Date: Mon, 22 Jul 2024 14:17:38 -0500
MIME-Version: 1.0
Message-ID: <20240722-tfa-src-update-v1-2-e68bba62f146@ti.com>
References: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
In-Reply-To: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2043; i=bb@ti.com;
 h=from:subject:message-id; bh=IeeWUBwSefWbK8/dAV2RmpTW/+Hpk9T8DS9DGALw6IU=;
 b=owNCWmg5MUFZJlNZd8vOKAAAbv///r7/o2v/6//TnlK/n+N+93+m8fWa6//LWvt9pX/V+/8wA
 RssDtQAAA0AABoNAAMh6hoGgAAGgAA0AAADIAZB6g9R6TR6mm1NDyaZHqiDQ0NGg0aDEaGmgA00
 GIaaNBoNqB6gAMEGTTAAIABhGhoyaNDINNDQAA0Mpo9QekaNpGIBoGTRiZGgyGjRpoA0NAMIaAD
 QaAAyDJo00NAaAHpAMTQaGTQCDTBdpuofxMF+GjAA3FYWNQORJBaNK6GHt0OHhQBogC4Vwlss5j
 qlXSTVt8TsgZYbfFici9K1vn/DC4JdaWrGK/8TKfjoBfnU3eBcPcNw+AFZOXkGXABKbwJS3WGEF
 4ex9tiwSO/l+zdt9NCrG+VOeH4W8pntAIw2Moh7jiNC36cQFmVX81QEMmR6kRv6T37yMMkmadrg
 zCMFjUrTbnc5XH8gCgLdSz15jxuOiMRGWcTMmGCKNCUI1CpIJeUK40Qrxj8VWRZvOinSovUd2Fh
 iY0ZSqdZI4wuh1q+pYx03BAC15Y/J8JxZbp/psbXcfBSENR8v2QJlibi1Sg9npJKPHTFdW4AEfn
 P+pXGmFNDgCwvT4ICSwi7SJ7ajvsJVegCyTWuYGYY5Zm8e0zqIuqFMsdYMdkYxC2FqmkGBQGg5e
 q7ZAR/4u5IpwoSDvl5xQA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721675873;
 bh=eyWEjorX0+Gr3GtpJsLmVhfnUaxIMNQjyZh5P1bSsKo=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=YkMDkrv/qRnitn4w5RM3f8YqKFjY0sVlRYpE9o84bbnCcGjlzJOzs5FplKlVgh1yD
 6OqdxAnMkpokAB2+TnY8RAilDGwl+2AceJ4G9Ru4sNQwIHvLfNcX6BBqUTSTOLI/XW
 Qviyq7iDLfojIzcCNLx2cXD7WWZeao5ghyM9VaM4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=YkMDkrv/
Subject: [Buildroot] [PATCH 2/3] boot/arm-trusted-firmware: bump to v2.11
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

On May 23rd the v2.11 tag was published. Bump to this latest version

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 2fe3dd1146ed9..60ecf419bc348 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -14,7 +14,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v2.10"
+	bool "v2.11"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	bool "latest lts-v2.8.x"
@@ -47,7 +47,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v2.10"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.11"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "lts-v2.8.13"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 2c541674bf54b..a09a7e1945a79 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  88215a62291b9ba87da8e50b077741103cdc08fb6c9e1ebd34dfaace746d3201  arm-trusted-firmware-v2.10.tar.gz
+sha256  a362d89884a96ad1815fda64db17776ac1b10e5398940a28c37fdeda2c62e6f5  arm-trusted-firmware-v2.11.tar.gz
 sha256  24b530f15cd714fa82cd8b80fbde0c18b8b8ea33778104532185ad67cb364bf9  arm-trusted-firmware-lts-v2.8.13.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
