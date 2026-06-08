Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2931CD8C90
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 447C940511;
	Mon,  8 Jun 2026 02:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ow9mf-kWAd3m; Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611984056E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884380;
	bh=plCpPgOOo/xhM1eVkdFvARThqgVaZv3B4OpdOOOsi+A=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B/qIJS6jqpS5QEAHRbmLdSbW1IGuH/6m8uAtH7ISMDploIx7JUb+dlgIh+Y2LO9cM
	 0iUmlCU2/phZVe728Bkr/oM1yNnA0Kg/GhSLwcK9oQEyYJD8636mnzCurm34qnkZhc
	 EoHDfDjgYx2nh8oiMS6l5yGESfGg3WL1+xLjdgf9QyCQCA7iEmRqCdI1C3KY1CEMJY
	 mMOaFXlJ7FQe4450NHrTMkRlFRc1J+8Tk8RksdSU3lhpMmE/uUUrebVfXpZbCnJwIw
	 pPM2ezZMEbRzwJx1nY4TNp/t1Q3KKugqalTQazDhKcfmg5zbQrLarErGmyFYBzwjVL
	 XaA25F/bknxBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 611984056E;
	Mon,  8 Jun 2026 02:06:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF23EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A592D8084C
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pNgG0rm7-rY for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08EAC80849
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08EAC80849
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08EAC80849
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:17 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-36da151a152so2581200a91.1
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884377; x=1781489177;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZUPokL0CypCJ5L5zQ0yuf+SRPURzQRRo4HY+6Rk0PCQ=;
 b=MNIWy+SjZnjgqsryl9TxoaEVM8HqCTrOPo4uIZImoDjkYCkax1uG1YAIfSkwInIWGX
 yOlGT1/Tc+SbS1DSz/bfdtMP5DZLFxCvJMiw2VlXT0ciNqOx/lmTufgrmyoppUocwP/P
 hCvBYCT662zwy9FaVA/t4RmpfJ4m1angXEPJRRvQG8Eq8PiWwgMG6yAqPI1mjHSTI2A6
 ecCTYWRw9dvBD7+0LzVQUQau4dK/VXJlSGgYOTixoWnCf71iCs4+EWYPGNFfAfKXJPFw
 LoEwpwwMX6FX6tXNdzNh85CXKFWrY0tkt780kr80cRttxklGI8hsFfUIpBytdpzxcjLY
 aIQA==
X-Gm-Message-State: AOJu0Yy9DUp+XdTyPBwCkP8isMjugBA0N66TXkxSA4WkMT1SakWZ3Cjv
 qCaZQR7JMv6ydhjD6fZOX3WQYNzNbrgkKhTpWkrroCnxgwjcbRWs8SNz
X-Gm-Gg: Acq92OE4113GgGrzMPHMSAdyMEXmkOv+mOEFNssR/IyRxakCdOlRNLCZoC+LGVH+/qF
 xwAANLbLD3681/BfWT1/+I4HRHvoawtbRss1VMxApr3MfW4uSDUuEM60ZAtBWcgTV5ayCkjHX6N
 xu3nny5AkTgP+DmT4q2SKnUZVHEEqI/lu/Cpt/xdDYpoFP6vgw7g20opoRxegR633fRvTFNcb2M
 vLiRx1baFLzGdfBO00e5qT6HX2DaFOs/WVSfqv5B1Mk2atPokcy7Je0Sg0OwGmnNWe+azGb8Wui
 t+CfOQrKn9KqQP8xyMJnRz2/GxSW7y6AHz0SdXorWNgQE/4oZqcJPfohRBzgemXU10bf/XeC1pd
 Q2QItUu/IjnsscH7M33nQBv71Hp03TpHryRjJexfrVxIgyL3bXKpLH1INbJ/mfAS5rz9Kha/K0c
 3nz9SajTqWgN/lwoS2UDs4hkjxLKFQ54Satzi6GvY=
X-Received: by 2002:a17:90b:4fd0:b0:36d:66d4:270e with SMTP id
 98e67ed59e1d1-370ee5450e3mr15423438a91.5.1780884377353; 
 Sun, 07 Jun 2026 19:06:17 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:17 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:05 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-2-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=1163;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=74rKK7cVN3RTlGgJZFe7NmjOSnswKvE1N7vAFN8Kpc4=;
 b=Sk6ruU8T2w7TsOzZsipzddFRQj26CnPsG5AP4v0I8MhQQtD/cutTTkn4idtobJuECRA6dDlML
 kTDywqhUQUiARBGRp7QuAKuNruv3OW9r7+nOahnK+m4/JxKmADZhP49
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884377; x=1781489177; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUPokL0CypCJ5L5zQ0yuf+SRPURzQRRo4HY+6Rk0PCQ=;
 b=bPDwCPCiZc8mnyV4DKDUL3bx+SiKeB1iHN0EIsmiF5QSynTKYuO3wChe1yny3WBXkF
 BkFs9IdHf5AkrNgZCcQNUHi1sSmPLlBfGDGOHyAY9uJpnEO1wmzV/EN+x+d9IACop9o7
 ma34UXqz2WM3o91aZTkE80gCAcNmL5bRtz0Tu3zBwrNC9vq5ICizqPIj+P1SUfTDtz9x
 MblN4tBtsI1epi9Q7AL4V4dLRViQxIyGicI6HTCA3Bo4u/6VX+t0ht5tedWlS2c98Ln+
 M9ZFAimfYT6KXajZzETyu4HgysHXUoQhHVHNY5yi2H8pnCWchrEIvU7OZuxHZYg8N/3x
 TCow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bPDwCPCi
Subject: [Buildroot] [PATCH 2/7] package/wpewebkit: fix stale libepoxy
 dependency comments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wpewebkit depends directly on OpenGL ES and EGL support, but those
dependencies are not imposed by libepoxy itself. Update the inline
comments so they describe the actual dependency source before relaxing
libepoxy's package-level EGL/GL dependency.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/wpewebkit/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c8602f1de6..c4ee5a27f7 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
