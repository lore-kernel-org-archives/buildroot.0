Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D044AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67869415A6;
	Tue, 31 May 2022 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adLW2QrVpVte; Tue, 31 May 2022 21:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C134409F6;
	Tue, 31 May 2022 21:04:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2551BF27E
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8AEB409F6
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 21:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4gtbtUyTolx for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 21:04:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC2F1409ED
 for <buildroot@buildroot.org>; Tue, 31 May 2022 21:03:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h5so12161978wrb.0
 for <buildroot@buildroot.org>; Tue, 31 May 2022 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vG3ghjLAGaOkg1EK3eKFn3KzUoVkl1Sh8r87kwcg1SY=;
 b=Bk3VSb2PWY/R/TkrlUyRplKil/cuEHMUjdPQf1KYtqhPm64M2WYW0Ewn8LBKhojbYu
 gIUIamFlus29Htt5eU5LHSBnFZAlsH5/pZg+bFreeH9Zzr9jYxhJwavymDToMQDVqPi9
 Tl747XzAwLj7JT0gSjrTX3ZURRqL3OktIlYmru0aZNQnKmXXfvH0NEv/cAPiZKvkMPMY
 OjtghEOS9Vainaq1tIrNrbBYkUu2oLwGzmJKUY013Z2/T/yzGEGtFB7WQvzuYHlS44+n
 1YPzwTmsx7Kx8LYpgfN5bbuNVjL02RNzyTypyiTUrTl6tnmlV5ZBUr/sEIAkhfN4aPJe
 cYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vG3ghjLAGaOkg1EK3eKFn3KzUoVkl1Sh8r87kwcg1SY=;
 b=liAGy/vJ6beSfQpAjwSZtVzRd158WB4mNOZKu1DmK/aO6VR0NFCWPHo9dKOftQECtp
 0ryHkEnhX3TFrQ7Uop8hztjWnmuqGzam7qFZq5Y8UYWDZUF3yGgR0uRyREdCpCiQYG+N
 kWAU8J3mzBJuHosXrJDEsUd566TpyPG7IHIv4A0BO+jiEfHNq/kivVNR85JcOnrK9HtK
 +wSyjDeKdU2CYEdNoS4/H1k8TcIB4oCpHJLIlbqOPmrc2OQZsJRxpEKECPuWMVh+nHUb
 Pc38qLU5pgP8GNNKw12p2H/FYxv2FJnd5u+d8O4tXtgYvNbA041k82EoqsQYawJE3YYb
 pf1Q==
X-Gm-Message-State: AOAM530xbpTZGfEU5IeyOM/uuRIKVgu4CTWmH2hLC/NIxDf5bkFpWqpx
 N8IaYTBu51vlbCygPuDgzhfAxOlQ/tg=
X-Google-Smtp-Source: ABdhPJyWVFtj9q926KWRRVlqdhvORb5jbbhrTmqPRCBnIZzsaoEevGNoWO0DPW/zL3FeCeE2WrgXVA==
X-Received: by 2002:adf:d1c6:0:b0:20f:c7dc:8466 with SMTP id
 b6-20020adfd1c6000000b0020fc7dc8466mr41677629wrd.43.1654031037667; 
 Tue, 31 May 2022 14:03:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm3698974wmq.25.2022.05.31.14.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:03:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 23:01:09 +0200
Message-Id: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] toolchain/Config.in: sh4{eb, a,
 aeb} are affected by GCC bug 101737
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pixman fails to build with BR2_OPTIMIZE_S on sh4{eb,a,aeb}:

In file included from pixman-fast-path.c:33:
pixman-fast-path.c: In function 'fast_composite_scaled_nearest_8888_565_normal_OVER':
pixman-inlines.h:586:1: internal compiler error: Segmentation fault
  586 | }
      | ^

Fixes:
 - http://autobuild.buildroot.org/results/c9d35d5975311a191dfbe12291398503987e804e
 - http://autobuild.buildroot.org/results/d34b8672f6211d60af4122bdd94fa8c2f4f4bf6a
 - http://autobuild.buildroot.org/results/933c4a2e73c987573ecc97172f442b78199462d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 73ea78624a..7584b85f71 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -199,7 +199,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 # still exists in gcc = 11.1.0
 config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
-	default y if BR2_sh4
+	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
