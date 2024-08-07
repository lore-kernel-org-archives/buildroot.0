Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA103C52D73
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 17:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A9294063B;
	Wed,  7 Aug 2024 17:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgveyAmCpw55; Wed,  7 Aug 2024 17:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4021140336
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4021140336;
	Wed,  7 Aug 2024 17:48:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBE0A1BF30E
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C221540352
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLaaN7ONi73c for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 17:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E4914013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4914013C
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E4914013C
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 17:48:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477HmR35072075;
 Wed, 7 Aug 2024 12:48:27 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477HmRnt000550
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Aug 2024 12:48:27 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 12:48:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 12:48:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477HmR6T055179;
 Wed, 7 Aug 2024 12:48:27 -0500
Date: Wed, 7 Aug 2024 12:48:22 -0500
MIME-Version: 1.0
Message-ID: <20240807-tfa-src-update-v2-4-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
In-Reply-To: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=bb@ti.com;
 h=from:subject:message-id; bh=9hUtaOhjtyYFZera9WUhOMyj+XCLzRhla6+xwh061hI=;
 b=owNCWmg5MUFZJlNZV+ok8AAAaH///////3/7K/+df1wdU17zp7/r89+tT/vj9/m447b3vf+wA
 RmYHagAGI9Q0AAAAAA0ADQAaNAA0AAA0NAaBpoAA9QAyaNMjJ5TamyDTUOmjQ0yDTIZNNA0aGgM
 QDQAAxGgADQyAAMmjQDED0htQyA0GmQBoeoxD1AyBkCbSBhNADRoNDQaGjRkNNABoDRoYTIBoAA
 aADRtQDT1GhoDQGQMgBo0NGgYMqHOmC8wbpwJUS8e7mi0QDiM7jmyHUDXeiQCnSLMAEInGCI/mn
 twxRTz5LKLZiGWjAoi5suLaN1XQDZoSoYcxuDqUolCjZq+knnybZccvq3EU1HvYd6aYVsZdz5ku
 HMDCdOeOW+i/ggAuuvzyiloowmWDzM4ZrBMNA/hnkilkQzFR8DKCSiBgd6mR1Bc4l6xEqnmVm8B
 8f3f6GnSOM3QRFvnieVR+A9IZMTTBJpBxVkNsXFK+ANq50SZSGsKV6C1CRAi3WMj40ccO4IDcSs
 CVmJXHYJSABVJzeHSd00eXraUooKJ5GADBt5cVBlJlWp8q1Y2utjW8Q/etb8dK/ziovxD5ePXeF
 hJMepCEvASAIQxU5Y8LCm60ATpoEuIu0u8Y0C0fCyeJMPUod9FVcXIOFlo5pgGygDFZkjxXEVJL
 HhJEJpP8XckU4UJBX6iTwA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723052907;
 bh=b9nPXTJvycoXo6riiDo+ezJB0uHrfsOebiUyhLEIuKA=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=Uz6X67JnZ8HT+nwoeBMfObe3UxrhWOgC1ysZ0veTEAEXAH6iqnbNNgNsnQXEwy5Sk
 4zleUwVmwW5aycQq2wJyotGE3MJw8xMNLxf1Q1uSvArp1ZtJbl1QIwnLZudaKEbIWP
 j7HHqy1G4zm3luocadiUoc/AUI3TkOvNdDFWBdEc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Uz6X67Jn
Subject: [Buildroot] [PATCH v2 4/4] boot/arm-trusted-firmware: add
 lts-v2.10.x selection
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

There is a new lts-v2.10.x branch. Add it to the selection

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/arm-trusted-firmware/Config.in                 | 5 +++++
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 1 +
 2 files changed, 6 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 870db48c80b07..066ca98a6aeb7 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -16,6 +16,11 @@ choice
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	bool "v2.11"
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
+	bool "latest lts-v2.10.x"
+	help
+	  Select the latest LTS v2.10.x version available
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	bool "latest lts-v2.8.x"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 6955743e42c2e..f562486aa8150 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,5 @@
 # Locally calculated
 sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  62af6f1f2e9406d761ace03025f6bf22a0670578b1d0b76092dc1db455746dad  arm-trusted-firmware-lts-v2.10.5-git4.tar.gz
 sha256  a90617cc2c1791c98d36b9e3d9a7f3f77029897e00c4279ff4ef559b769e9d7b  arm-trusted-firmware-lts-v2.8.20-git4.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
