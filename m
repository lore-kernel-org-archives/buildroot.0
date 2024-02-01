Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631F6C48286
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 17:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70D342049;
	Thu,  1 Feb 2024 17:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70D342049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBPgepX39E3R; Thu,  1 Feb 2024 17:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B05441FEF;
	Thu,  1 Feb 2024 17:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B05441FEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3424E1BF45A
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1B041FEE
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1B041FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gHwioEff0py for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 17:20:57 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 106C841FEF
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 17:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106C841FEF
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33b189ae5e8so401611f8f.2
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 09:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706808055; x=1707412855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JntYJjshcIWNPE595brRQycLnDXBGwT1/EujpCI4gac=;
 b=JI4Lcdp+UJVobbRydSvPCRBXr795jkTZh2ix9DgqHd1M3ZEzh/1qZNnhZbYvvOQ5D3
 BFVIbOr9+rLOgeUAUR7bccHOeZnSnQuK77h2CF4Gg4ADBO97T1PtapwoeshrRHZwCzNM
 q8VyrPTK6JAAgO5ENYzWg9d0jguM+JZD6P4zJc6OaoxKASHk6W6DJuXztMTW+Hp/9++2
 1qAO74yXNoDlNDVbm1CLFoBjfyYTdE4leqa/2FTUZs9WjeDK4qLa/jo8XIB3XmxJPWZr
 +FftALfSdv4x7T5txkEk853F9zXpeny7NzW5Y5jGabMWqBWBtYZjNhBFa1bmj8GnmGLY
 Wf6Q==
X-Gm-Message-State: AOJu0YzXCXCfvelxE2Ofp28+z6YIZyzLuG4olDOxKJ1g1MGXwZ2N8BZj
 dzmBz94GYy12ZpMiYbdY/bzqf102vZc0Lxhj5SZWIS/6mH+cgxoEY5OXaV97qds=
X-Google-Smtp-Source: AGHT+IGTYlXqNsBLDow/EtmpWDPAiK3ogJ0OFvC4O7uWXdJ4kFf2Y4uN8F6yWK0pJZSoFoqAmocBXA==
X-Received: by 2002:adf:f746:0:b0:33b:14b9:8203 with SMTP id
 z6-20020adff746000000b0033b14b98203mr1729129wrp.7.1706808054625; 
 Thu, 01 Feb 2024 09:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWQljCGEGiDXXYxTtnGa+/YDTkBZ7sULuVX04pELE0GQwBuNCGasHhLWMvXmq3eR5V62lFcM48x39e62rzkvlNMpRtGrQ6VL4XCcw==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ck14-20020a5d5e8e000000b0033afcf26e11sm7119761wrb.29.2024.02.01.09.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:20:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 18:20:51 +0100
Message-ID: <20240201172051.165994-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706808055; x=1707412855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JntYJjshcIWNPE595brRQycLnDXBGwT1/EujpCI4gac=;
 b=BmnTzTQsbFh2OlSmVYSQWjLAh82hZU2HYmE1eMVPuAms5sV77hXhGrGgxSt8c1eR6w
 c3GJKCFG5WOrNm8UL5w71wPJ2ES/PHZHYGJQoJqimKpyWroqvZc7V3RT2RwdWG41LY78
 F5gQTTjs84Wr0cy81HTfgfv0c6PF+embs+a/1XyZalvIZ71RwdVUjiRW7qhU3SeZhmoQ
 3S+OpJoC5lCwWAeVFDGdQoOT0bQP7PSvioQTtdGS33tPGORpAMJud0kC1Xmli1zToyVX
 wZ9AmmIgq84XwDmaXq96Dj4l58dFxhZl4eLXSt6KCAiWA8AAkY2EMr6LP51cGbu5AK+q
 FptQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BmnTzTQs
Subject: [Buildroot] [PATCH 1/1] package/libvips: update
 LIBVIPS_CPE_ID_VENDOR
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libvips_project:libvips has been deprecated in favor of
cpe:2.3:a:libvips:libvips in September 2023:

<cpe-item name="cpe:/a:libvips_project:libvips:8.10.6:-" deprecated="true" deprecation_date="2023-09-29T11:18:01.067Z">
    <title xml:lang="en-US">libvips Project libvips 8.10.6 -</title>
      <reference href="https://libvips.github.io/libvips/">Project</reference>
      <reference href="https://github.com/libvips/libvips/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libvips_project:libvips:8.10.6:-:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:libvips:libvips:8.10.6:-:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 1a0f9d5ead..8eb1f0964e 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -9,7 +9,7 @@ LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
 LIBVIPS_LICENSE_FILES = COPYING
-LIBVIPS_CPE_ID_VENDOR = libvips_project
+LIBVIPS_CPE_ID_VENDOR = libvips
 
 # Sparc64 compile fails, for all optimization levels except -O0. To
 # fix the problem, use -O0 with no optimization instead. Bug reported
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
