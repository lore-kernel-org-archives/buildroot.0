Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C579C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 15:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C4282572;
	Mon, 15 Aug 2022 15:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C4282572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbDuycvzkroD; Mon, 15 Aug 2022 15:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33200823C6;
	Mon, 15 Aug 2022 15:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33200823C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B63891BF3C9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9113F60FA8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9113F60FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-hHW1eQgOpt for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 15:49:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA1660F9E
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFA1660F9E
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 15:49:00 +0000 (UTC)
Received: from localhost.localdomain ([151.34.232.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NcKloknb6TCpUNcKoowBr2; Mon, 15 Aug 2022 17:48:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 17:48:52 +0200
Message-Id: <20220815154854.17628-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
References: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHKbsiG7TgxQNk2vZYaqDXXOq64sAznnddelKJnd1jtocqmwWZwHjExOSMSLFPX1kl+uJVn0m8ev14td3Cm91ZYLFyoONkySoCFT8COJhLS5zZC84xN2
 9vllT8xImZoCyHo9XpxNZEdXciNcFrNvBr3xlzTkVjvlvPwRCj0eQx9Oj1nm1FhvGjQoLbkjHrQLkf3o+Y++N7f9B5d/rnYnLL83wSTixcEJjQ2u3dWcS6Zc
 AWobOI+Y1s1GNnAi3zUsAMYv5aHAUBe80/CcDzOH4g7LHxN9cHo2qBP0dXWm9hhey6Q+55qz7FgsQmQPLe3sLxaxWXi34KtYA87AEpEVGxkedtxM2aoF5s4c
 657DZFwo+yJOHpqXRs8RNVp3B+M+BwqxhdTbDcX/xmzz7htrYn2RTV/51klH6ZJxFKg5SCoOj+gbTPTzHlpGLM6+j61y6Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660578538; bh=3e0xbb2j3sT9MJ+p2P6QeTuA+87Z6s41je5QphDZ8ts=;
 h=From:To:Subject:Date:MIME-Version;
 b=CD3UZMOZX8nKueCN/t7xgrZMIVKaOCYxwlBTTVCuL1WPM1QAwjV92zdQbmjX7VZmi
 DPB7b55iBcvC8+wt4rT9H5528RxN7K+NUr4eUKEXXUyBrRjuZ3ZpClE/5wCLLzG0H6
 l5Saoow9uuBhSA9yrVCJCC3yTtHCHvfjwUEyCEe5qKhK4Wcn5SVXY/f2cED70L81nG
 ypsZ7Nj9lUIzieM58OiJcKlugGwvxBPqzwwfuuwQBSCIMySHXoKgqwTbae24TTMTwq
 EtZ0os1wV7d59pzVav1nXWccYLo0feYCRnfSjVlNap9Q1glWi5w50fE9N8lz4yt+5A
 aC3nT8x0kgo0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CD3UZMOZ
Subject: [Buildroot] [PATCH 2/4] Revert "configs/olimex_a20_olinuxino_lime2:
 use NEON+VFPv4 as FPU strategy"
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gcc man page states that specifying Neon as part of the fpu setting
has no effect, unless the -funsafe-math-optimizations is also specified,
because Neon is not compliant with IEEE 754:
```
    If the selected floating-point hardware includes the NEON extension
    (e.g. -mfpu=neon), note that floating-point operations are not
    generated by GCC's auto-vectorization pass unless
    -funsafe-math-optimizations is also specified. This is because NEON
    hardware does not fully implement the IEEE 754 standard for
    floating-point arithmetic (in particular denormal values are treated
    as zero), so the use of NEON instructions may lead to a loss of
    precision.
```

-funsafe-math-optimizations must be explictly specified per package to
really use NEON as FPU, but it's something that is left to the user as
well as setting BR2_ARM_FPU_NEON_VFPV4. This way the default
BR2_ARM_FPU_VFPV4D16 is used as previously. So let's revert the
offending patch.

This reverts commit f8528acdfda278ea9f2f9bc8a47eb77ace0c050f.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index a032eb922f..e325184e9e 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -2,7 +2,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
-BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.15 LTS series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
