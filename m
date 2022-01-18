Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C9DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F563819E6;
	Tue, 18 Jan 2022 10:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwSYeYJub3NW; Tue, 18 Jan 2022 10:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8913E81A30;
	Tue, 18 Jan 2022 10:50:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E10B1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C2B360D88
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLXl4HUeF08C for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp3.osuosl.org (Postfix) with ESMTP id B15D160D80
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:09 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2una8mY; Tue, 18 Jan 2022 11:49:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502948; bh=dHccQGzhlVaXZ1razFDW/z7+Ir6fKASYt3qb1jAYgYQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=csNFtnz8YswYsafv4cMZ7jr3beFBAYjjAZErrwwnWL4f2iUdiwJyygpOYxTwHLbZs
 zjwDaWobddQ04r6jYWhPNgHJo7b65LyXUH5IeV/WAVHDJITNEraTcNyBlf20319nwy
 I+Zhtq8rSyI+JkkfLmu8sulD91cc0lXpigZnRWz3YC7J6DYqTTE0mTvMny19YCNXaZ
 mYNWleXS+kVIbhwe72IpTURchufF+7ox5HUnTmyG4u5sEuyHGYrlqg0BjrHXfNmehy
 3BwwuQoKZ4kDyID9p4pnU18dHiPFwjE/SpEOyaTALgOmL6LMJDZhBd+0Vuwu21uFb5
 ee/iChM36wM+g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:37 +0100
Message-Id: <20220118104338.2081259-28-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMrCXzgzXGGtfcVN/DCQBQOhrO7+n99VG7XzASb3k/oLsoOYVRuVH6tdst4bdkNmnc3yYov1yo5o6DEptLxXTOnHgeIkhJgjCnlMJlZKMbV5yWSg482f
 wcbvQZFZ8GKFHRf09V3Q1qcb64IoyOdkYV+55SfkkONJhVQnYnoHCZ5i5tfi9Ci8g9Xh1+uu7fdqIAiwKVtpMzRCIUev5575Iu6FNQL+XwqgaZ/qZAkHoUFQ
 ON/gEkSXh+Cx3HP3YbYCWq6n43kkwPINsuWKZD9TQIPhI3SW3zcZz6fVwPzhiyORKJOIyKaKIllU1QnCxnof5reGNVXqlUxx2pdHGarF6Cqq/l+swjWxO0NW
 pYzKokr5+oeSXx9gE82n82Un8tuP+mxC52zkFMC4lFzvAhoS/g1UjzIwWkPagvbfDBvWkBdit7dFg3yYTaXA35nIviGBWum2DHLmJafE+y4dAWcRZq8nfHLI
 sQqHTHI1kCqbJgM35EF68f4pRwFMDmmbm1jeMQayTRKHyIGnXeIYYGDRtw5WAv7n3vBeHnohQGSC7PbVzYzM4512NEXxtlzI7Nn8fdYvSWHNcjPim3Y75bPm
 +j+VRH8NLqRTximVztlFzI0HunwvGmb0WB9AtWcA3RUnlaIlKq8epH9QgB6MPiTBt3T7+frLX6P7rzdsI5JlQGgwqCVb6n1bEQQAV7EXXXAbb+B8EniYascR
 wBjRmnHZLWtd/aw54c+3+c+DecEQJtuMGpj0YAKt959YjZEaQjfhPcPFEWLJmi7eR4vkCPKHolEeCHquRLdhmiG1g8YgGuU6imISpih1JPm6HDBHAFEkWYQt
 kkHetuleJRlzUZ4duJmAFWhKpTa0+sWuyeAMPcHTcHG83DwT4JvKfsylqKnbXw==
Subject: [Buildroot] [PATCH 27/28] configs/stm32mp157c_dk2_defconfig: enable
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

This board has stm32mp157c that is a cortex-A7 and supports NEON/VFPV4 FPU
strategy, so let's enable it instead of the default VFPV4-D16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/stm32mp157c_dk2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index f1f7baaa08..503ed91843 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
