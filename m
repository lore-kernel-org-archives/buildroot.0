Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF1C6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 22:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F9560BCB;
	Tue,  4 Apr 2023 22:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F9560BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wc7_tl-dZFAW; Tue,  4 Apr 2023 22:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1243610D6;
	Tue,  4 Apr 2023 22:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1243610D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7803C1C2864
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 22:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E7EF8175F
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 22:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E7EF8175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5J63lXunJBP for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 22:44:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FEE98174D
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FEE98174D
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 22:44:56 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id ny16so1875774qvb.4
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 15:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680648295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wQCykafXk5zIv4uvRm3/AIzUn1DUpYZdStLMGHyE1Sc=;
 b=XzXw6Kg6fL44egRFosZIUXKLRbTeDzvjAuXmpjq2/2jmmZs2WaTFHPOwnCWCfxlSUd
 JDnSR+he6QRPs0TD9Cxz8EcrfK/rEjACYed8Lbo25przbX5tHSAPYDBKGGrR6KvYjOIV
 r3njsDWESud9Uer83STIFINhNx0NjrLzwYWB7OORtnLrCamBg52slK47hPaUnD/XBK3S
 MSCwSb/0Oqm/Sfpcyyf3pMVeTrIavu/watzEvXHV0c/FOtXAj+RL9DhUxt+of4ROw3RH
 doss3Y/jK1ScIesX5WJ2MxmNopM+CFLVPtntzMM8Im2Yp4yMS7Sy8VukMOKrzhFxn3ix
 lZ6A==
X-Gm-Message-State: AAQBX9dQ0clMkljtteP735iBExsgB7U+z4k4i0unkC/6ahTyj3hKiEMa
 PeiRPlMco89vmFIkVyoFUStiMtA8niA=
X-Google-Smtp-Source: AKy350a8JSV0K0TU+BtueZrBQYaRK8gGZmFbcGxHYE+xEXyeBdxArIbTVop6KZknhDfMHZZgQYuRzg==
X-Received: by 2002:a05:6214:2aa3:b0:572:636d:626a with SMTP id
 js3-20020a0562142aa300b00572636d626amr677237qvb.25.1680648294888; 
 Tue, 04 Apr 2023 15:44:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-vprn-wgfdon1802w-lp130-09-70-55-12-69.dsl.bell.ca. [70.55.12.69])
 by smtp.gmail.com with ESMTPSA id
 f30-20020ad4559e000000b005e2fc1182besm3053950qvx.4.2023.04.04.15.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 15:44:54 -0700 (PDT)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Apr 2023 16:44:49 -0600
Message-Id: <20230404224449.31701-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680648295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wQCykafXk5zIv4uvRm3/AIzUn1DUpYZdStLMGHyE1Sc=;
 b=L/1sHXAcf+kxHPiQtDBqKhHCz/7j6OEienkAdLerGiVGFvftI3e9tHTbyYBKSj7cee
 k0XPw8MymqvUROfrXntIDCwrZ9qVy0cAyyX79I7HEi0XR6dpgWQP3hXhJZy3WPp+eC4d
 viS58OJ4Uv2q5oKQwY5av0Vt9snnMgdMkOhL7AmffZzKxFNlMcrZn924bhBtwWWka1pr
 JVjf7NvQLETw75+i2Dab8SRMV7TVBu2mEAqEHGbdxkjh1UR85++hc6d67xOk6A3dDHi8
 qzWSvDyjAQMVLEVTLnS2YqD4OobOKD9Lb8nGMZImJN5h3OrJz4atGiIpFl/M9WGGMAkB
 VFoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L/1sHXAc
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.20.2
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 5 +++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 3313b341f9..5e7b614130 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
-sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
+sha256  9dc71ed93487521b107a2c4a9ca6bf43fb62f6bddd5c26b055e6b91418a22053  SDL2_ttf-2.20.2.tar.gz
+sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
+
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index f859d097ff..c2c4b660f8 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.20.1
+SDL2_TTF_VERSION = 2.20.2
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
