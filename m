Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC2BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5AF80B78;
	Tue, 18 Jan 2022 10:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ColX4-70Idp; Tue, 18 Jan 2022 10:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73B0880B6E;
	Tue, 18 Jan 2022 10:52:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B33F1BF990
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3966560DE5
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUdn7IMZn1Gn for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7512A60DB7
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:39 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2Sna8Hc; Tue, 18 Jan 2022 11:48:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502917; bh=jGiTckRVQA5YLl/Dbzmaq84W9uyyOq0QmKrCpRTlGOI=;
 h=From:To:Subject:Date:MIME-Version;
 b=ipZR22oAxDJbYEH42kgfAEIml6hh1MSJ9AHskWDZBWRJqBfRT6PIyNKVEq2eJ7zYR
 RwH/9K0b2AyKr0ujzuALp7HY0pUM4h1Ft271j/c8cFYq/SPVvZS/Jgk3fGVC8ZWIP7
 Zu6kDIBvi34Bkoixh2ngTd/9g0NUsx0MsxhiBnW4TnUhwD2ughr8mSzkveSoH8BYtx
 lppBqav8DTGOstou1Y7yNWVx4x2UyI2jgyvB4GlHqtpJvSTQVucCn2ciMQh7KCQmbt
 YLJb6a81p19g2N/bdKWgwlyxaom7fhzmaGHt1T/3CeHu+OcWxQtPG+YtI3X40l3nhm
 fuAAcFnulFBWw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:33 +0100
Message-Id: <20220118104338.2081259-24-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA1/L6jrVm7rPZD0N9UidjQDg6XD7Sr2JW0Kbpmsc4zpwq1LqAT4zAF3ls5Nqi8Dc+Zrl09C9sfdEgZF0/15I/GCVFhac5/ySO3yb7Kfe1ygVZomHoe9
 bwMxzeiuN+ABUOKttUmeeR83G3xHLo98KaDvLKNGj9lqN6aKlICvWkVsK/Iny3gUOBe7eOIgJyf4vtmc8uRdyhKXX+msuCGNS5+Q9NebAIuFOPUcO85XKocQ
 H5ALdFNmBLCSOh1WeONaAz0xbTWYw79Ue7HTuy3MF9vV3L9K100uHP59wkWPSahuGcOxDI+h8Vn3er3IyHzCvqjpJfw6VMg3d7dDE0wFVTJ1QG39vFYaVPHr
 pRcoLmjV/SH+j0Uf3aSZ+PrkMdQJUCWgifrB0+YMz/j1J5PgalDO8+9RMFD47J/EXowd+te8St9zDjiLXGOShHAZY9nJk2Sz5vMjpzU9zbTz/ZPAu8U4OdHW
 stIeb9kiCvguxwA1wnNPOHVqcE8KXcrY3VnqmLOKhgSJTv3WQcVEPRHJn5TqeRacxIxmI7TXUyiB9jQv5WO40TKFq9jxL8cf4TiDiIYXf9gBhniwyxp1PO44
 PVayEFoymSMZPyVULGSO8pVXUkKNx1FLhF0Ma8ZSny9bDzSO4KZYPFebtEgHb7Fvgu9Odc6WCAWbgK3baEDSMipwB/7K6+eMS5ErfBIDkV0gMuDLk7Ri7Hdj
 dovYzie9PPhyThOrPtnLtucwwdnBzF4pENFREs5MMGoIy04eOSRwla5IsDqjhpY4KVMTyp0GXZTuc1Ptfygqt7yJw6AtxO6SNm5gTVIvhk/uF2O5rLrw2ReL
 Lifjcl4j7tz3hWmTE7bY6DLZWrFXlrZRtMFsK5S8vrUZCiGWV7MrJEWqxXwlYQ==
Subject: [Buildroot] [PATCH 23/28] configs/orangepi_plus_defconfig: enable
 NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/orangepi_plus_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index 11d7486486..897246373b 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
