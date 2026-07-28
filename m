Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F9CC531F9
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 09:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 103B440919;
	Tue, 28 Jul 2026 09:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sV9kxYi5-iyU; Tue, 28 Jul 2026 09:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 103FE406C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785232097;
	bh=gEj8W+g6Ia6WwojUPeCYTKGncJ1WwxwDAcud9l2wQPo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=GoSyj68+YGb1/Pn5p798ZWtWMCI7DRbJxDuOml+Ij3Td3fBfjmm2HIODu/Dxumif5
	 rNCfyh51shs9RjWE22eXQRxMQh9NqUXlkbGkoiMMH9rdqrHl1kOzRzFvyH91KBU7uX
	 eLiTyNYNN5+aYjqDS/h1j1vMISE+aVRUpGU9dE2sD8vNQUC7QbjtlaJmsaQOHVwINL
	 mNPmcWwx8QXVqzvYO8Cr3zaCXxkbj8QFalvvPHpG748kMieulR/RYf/IH/hfCWbro/
	 ZmpRdED3YPIoB4PNZVvitYv9rsxF/GLsQsyt5vwOuJIYNn6W5AtNL1Km4jyVAx3Wrp
	 TONaUUruP5xLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 103FE406C6;
	Tue, 28 Jul 2026 09:48:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2006B26C
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 09:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E416075F
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 09:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLOwbELyPjbG for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 09:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 107E960779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107E960779
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 107E960779
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 09:48:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c1c26d7e951so521917266b.0
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 02:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785232093; x=1785836893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vf3HgcHYCZ9xN0n2+WhDd9wVH++b7Zpuw0wVELtwhbA=;
 b=Pow7obFhCFmi+7YIGIMWHzrao2ArHqgKhVLwRIRHesuiAi4iR+k+7L0t/7WvX4P3AC
 LmQJRAJUihn86yS+Wtk9z4KIhdOJ+O/SOLSYHiXJIozHW9wpYZ68VvwevA7Vp2FTa5xr
 smh5xHRh2qWWcJbK58EU08i+oc8fOOXO8jmaYbuyQ7GES32swFVRH6l2vOsd2gA3YZrt
 /WSBzXTUZnw55lQQ54yFSNNSucjr1Wng9SNUpTEgm9o6sYIcWiovbjcsWB9zAGkpYNi2
 lp2Hr99H3HRzhDVPwe1dwzQrzYVlVWqEgcj9t+ahozh6lgMaaaxQ6ogvdcHI4qp5vgI9
 C6GA==
X-Gm-Message-State: AOJu0Ywh1qeUMGNM6lbaDmDH5BITcLRZLk3hhCnBcHj9U2Z98Dll35Qs
 m3ei3aE6xRSRmd0gUuU/SacrtkNq4IGbPxCUdSvEk6D40ZpLKFDAqpiF2sOwrQ==
X-Gm-Gg: AR+sD1172hlgoza8y6bqRirPyt4B0JOpQvReugExhSLgNv5HL+cfTlwkuxb/Zy4u0lp
 xD55Nyz3gVVNNcRQY59zz9fgzYoqycLZyTlNsqXLWahDDck4/8nqNWpo2fdR48Tsuk8yU/nhMoV
 U4yPk43FBy0plsuuMhXFxGLGD+qerVJ7BGGND6RseAIl9PGTfG2/xUcTWY2FoBfQPQyjHOpH+xG
 +3F9YLmBwgMzWj90i/r5gEaDoMlz4p1UkltAUdS+kHlK8AkoKwXx3TKgQGIoIlyebpRWlCpFLZr
 Dq4ilODVCpjQbQ/M0ouJnHiUOl3xUf3BGj1dbyuv2fgno7ykCcr3vnarPCHlngjYN2Fzv3yJZ7z
 Wt7Lzy79u/an1rFwfc1yPi6wTC7TTehwFBxX0eUVIIXkqsRd54KYZgML3wIaUOfXJ/RfjygWcKm
 ygjsTut0HhIsjDC8S6CfPTYAvBdJKAGAEZKt4ImLgwMPy+6W626+ZZ85eaegigji8TZ3os
X-Received: by 2002:a17:907:1b1f:b0:c16:8404:4631 with SMTP id
 a640c23a62f3a-c1f720fddbbmr86681166b.26.1785232092660; 
 Tue, 28 Jul 2026 02:48:12 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32a79c59sm749041966b.13.2026.07.28.02.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 02:48:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:48:08 +0200
Message-Id: <20260728094808.2438837-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1785232093; x=1785836893; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vf3HgcHYCZ9xN0n2+WhDd9wVH++b7Zpuw0wVELtwhbA=;
 b=kujrKhR0Wxb4AYQgn2VIlOiTp6I10WvQvFFup/wR7sody4/dys6es2CWNKfe6+2mHG
 k1/17UtwvxxGIyOlZsTHZzn4kF9ycWDIyJd0ZWDv2oTOYs2rCoHAXbt5GQEX208PcGaO
 Ux+MCIAJb8Wrhwg/eyuMoEUYQamhO3M5ONQ4kgOaGfsZ8odWYDa0vvFFJPN5yobBDvZJ
 XXEiE9ekD0x+OzYm5NojYxMXKtbCRrRQXw7nZ+QoL36/TSVlPjLi2YXTwT4HolmDOE4m
 z6EI5yhXCprlPrW9cVdDw4EGsoeZHC6ev3vEP6t5J/XUnrXKfNJDZNlYnfoR+GnCLLWt
 snew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kujrKhR0
Subject: [Buildroot] [PATCH] package/libmicrohttpd: bump to version 1.0.7
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Changelog since 1.0.6:

This is a bugfix release, fixing modest security vulnerabilities
discovered by A. Ramos.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 90b598f9a5..d342eddc9e 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70  libmicrohttpd-1.0.6.tar.gz
+sha256  827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98  libmicrohttpd-1.0.7.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 6e7c79ee88..605291c046 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.6
+LIBMICROHTTPD_VERSION = 1.0.7
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
