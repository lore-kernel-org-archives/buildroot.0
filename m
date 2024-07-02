Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B4AC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9900F80EB2;
	Tue,  2 Jul 2024 07:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFRu36wpLoQg; Tue,  2 Jul 2024 07:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B77A80EA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B77A80EA1;
	Tue,  2 Jul 2024 07:29:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADAC01BF335
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0FA80EB2
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dvulsAEL3xU for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9988280D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9988280D5E
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9988280D5E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:29:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a724b4f1218so457518166b.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719905340; x=1720510140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMJuHMRmhTt3NPrEBIBWLnzbBNWt4NNWL5Fm+2ecC/s=;
 b=bmLoqj8y3IFt/uh+BG6bYXRz8Mqpq5XTl6gR8JApXLu7lxf9Tg4uLODt4AHEaju3Hm
 Q9BuErlZzAC0UUMsJFGfGEO71wo19iZpGJf7LUZAvSJDr12LCzJrvaNm6xAHyrihP+1A
 ihTziOWigwU+08lDrC9uksEBQVk+H28bLzmKP+k0f2qtYMXt4gJFsd504AWmKMwWEtsd
 CwsugZQq1LKWDn836C3oP2o+/At9jA/uD3ikfyROj88pC1j6qqgLYN4NeYGUzmt9NpDb
 xqQqbP6DFRoD99PrRKb0ARBEEIKtM4eVduU70045OolIzEAvdp0ChY4ARNQNP4D8Vp9v
 gW9w==
X-Gm-Message-State: AOJu0YwG70ZSdAoOtUyl7UXWshvup8X/+eHC0MOFmwAWW5PL+XBseTrO
 ZIO9dRjO1emxi9NFW/5/LMO6Fhv4+0y3KBlxXqucFBGafaMKOxQjfdD6iqoTmeavsoPD/9hu2iw
 1lt8=
X-Google-Smtp-Source: AGHT+IEQfHweFLlLuGqoj7scxAK/IcFQTew+10vrX50Q/HERA1JXYnYF9ZdvHkh3huC631nD1i7vew==
X-Received: by 2002:a17:906:c10b:b0:a72:84c9:cee2 with SMTP id
 a640c23a62f3a-a751440230fmr526280666b.5.1719905340226; 
 Tue, 02 Jul 2024 00:29:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63390sm393066966b.69.2024.07.02.00.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 00:28:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:28:56 +0200
Message-ID: <20240702072856.2376924-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719905340; x=1720510140;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hMJuHMRmhTt3NPrEBIBWLnzbBNWt4NNWL5Fm+2ecC/s=;
 b=Ei1yFJ/gpdQ/3/pTmvU4DCtyNRV3enQ9McBtqqOqyxBSsb3R5Vi3zLUfI0VTZZxwuU
 WFiNAtqjq52gFaVldkrKTh+/aNyjtyvf+PFTQGvpetSwfdTFQI5A/QkK/aLx+8AJi7JP
 fHVwRbDRHeqztt3bWpwo1yz5CmKESagCb7SYU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ei1yFJ/g
Subject: [Buildroot] [PATCH 1/1] package/flite: update the patches to be
 applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, flite fails to build with output:

    Applying 0001-fix-alsa-static.patch using patch:
    patching file configure.in
    Hunk #1 FAILED at 275.
    1 out of 1 hunk FAILED -- saving rejects to file configure.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/flite/0001-fix-alsa-static.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/flite/0001-fix-alsa-static.patch b/package/flite/0001-fix-alsa-static.patch
index 7ed4899cc4f7..83f0a86e4d14 100644
--- a/package/flite/0001-fix-alsa-static.patch
+++ b/package/flite/0001-fix-alsa-static.patch
@@ -1,12 +1,14 @@
 Use pkg-config to determine alsa link flags. This fixes static linking.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
 --- flite-1.4-release.orig/configure.in	2009-08-14 23:46:38.000000000 +0300
 +++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
-@@ -275,7 +275,10 @@
-                 #endif],
+@@ -383,7 +383,10 @@ AC_CHECK_HEADER(sys/audioio.h,
+ AC_CHECK_HEADER(alsa/asoundlib.h,
                [AUDIODRIVER="alsa"
  	       AUDIODEFS=-DCST_AUDIO_ALSA
 -               AUDIOLIBS=-lasound])
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
