Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0684DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 10:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8993781E6A;
	Mon, 13 Nov 2023 10:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8993781E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHfEPdguf1pc; Mon, 13 Nov 2023 10:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16A181DF1;
	Mon, 13 Nov 2023 10:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16A181DF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0A41BF406
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 10:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 243154099B
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 10:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 243154099B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzG2iR9UBk4z for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 10:45:11 +0000 (UTC)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 071CC40994
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 10:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 071CC40994
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-507be298d2aso5639978e87.1
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 02:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699872308; x=1700477108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGAB6z1ej0RuTSnj55hRqsoFTu7ss4WqObv0UZA6YZY=;
 b=O0d7ZTkb6bUF5Bj1GDfUussDGBICiI6p21VF6JIQ5V+CJfCwIEssEzJAhGiDXp3WVZ
 FyfLf+rK+bhujg5uOf+BZkYHtAfYmHfeO5Cg4yFWvVXHu2nK0mxN3WJtVJoOcb0sIEfM
 ho9MZ3lNAKz2kD0fYnN+bhNJRCNWL3uHWz6/RlUpANBHD0i/aJMBVY5QEibxTJRJsyMU
 2AknwOI0hoG5iqmSYfVTNneJXHH7uwfa4R+Wf4BhzBYzmUHQLaQ8bKR3IPDmTPA9Lgs2
 +rVz8DejUpxqH2+w9UxiK+Zhge7+2BuIi4gwZ8ktl1SBjz/tqitN5k7H/V41qtEXmQ4A
 ax+A==
X-Gm-Message-State: AOJu0YxBG6GOoDlwdp6YFt4Byp/C06nFXDmArXsnGNntPr6dhS7XPZ2C
 WS/eKUidorv5Y/Eu3vShL8NfJZJl9H0BeSts8CH1mlQmapg=
X-Google-Smtp-Source: AGHT+IG/VQhceW4YwVdNAKZwgRHDwRhUzk1TGUvY/vKqUQrtL61aw91og10TfOyhelxsLOwO7Mp+0Q==
X-Received: by 2002:a19:5e19:0:b0:500:b42f:1830 with SMTP id
 s25-20020a195e19000000b00500b42f1830mr4225740lfb.63.1699872308261; 
 Mon, 13 Nov 2023 02:45:08 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:7680:71a8:5ca2:5d29])
 by smtp.gmail.com with ESMTPSA id
 v22-20020aa7d816000000b00533e915923asm3497012edq.49.2023.11.13.02.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 02:45:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 11:44:54 +0100
Message-ID: <20231113104454.18667-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699872308; x=1700477108;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aGAB6z1ej0RuTSnj55hRqsoFTu7ss4WqObv0UZA6YZY=;
 b=l3WPmRmltJzAd0ktT/gK992BGT9KviKhbWtZmRQep0LH+bvObgtbXSnyrFGahMvma1
 hpwkKmLDhqwjeeuAtRnWMNgI8WMLO8fGsrNwWJUQsQiKD+U7ngZ2i3ztIu6th60ktOUk
 8Du3DzhobSaaD1RZDrjeIEfQ0NWUNztDM6YWc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=l3WPmRml
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.141
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Increase default timeout to 10s (1.5.140)
- Hot Fixed for SPDS crash for some images (1.5.141)

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.140
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.141

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 2d7a8dc7602a..20816b5081db 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  16eea2446160976e20d2f20257cecf7490979431f17971af374e81bba8d5fa98  uuu_source-uuu_1.5.139.tar.gz
+sha256  6972c7a1e76d60a22212913a8867b737104410c2a47ad88c8af460bd4885ec09  uuu_source-uuu_1.5.141.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 218001cde4e5..93c748ee46d8 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.139
+UUU_VERSION = 1.5.141
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
