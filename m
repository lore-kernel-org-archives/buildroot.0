Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D16C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB54081763;
	Sun,  6 Feb 2022 21:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSBo3tZRYEC9; Sun,  6 Feb 2022 21:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261208174F;
	Sun,  6 Feb 2022 21:07:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B840D1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5A634019C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Kl-CC91eTd2 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:07:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824C5400E3
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:07:43 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id m7so10921167pjk.0
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkmdplkfux1YeSdPmm6RnsVLPJw6aoz3x1Uov3kLZxA=;
 b=o5dCqUNCOgOs28BE3GWQxOmVUG5NeQfoVS3NtcXfDp+TxaVM3a1tBSHPLORIUGx0bH
 R0A+vZzHB6IShy88ItH20cejXlbpxvrcelw8PbQg1XpJwM+rJCspkJMhS7ZOCcjtUZpv
 8n4Do053lZ+qXdzt/OfXIR3JbQgVecikCTZBRalBoQNhbjlr1kez6PL2wyDyKB3Nckkd
 dX6+rveuovg2dJs+VL8EcAIl0wYcNUcE8wPfDQ698/G9M2uj+Zn04KkbW52ggzc3vGHj
 LkwhrEYV3/26e87fYX80jkJmTekI22P9hy4YhPzETQO5w33wTseHjFutPjdeDk6e7BNt
 w7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkmdplkfux1YeSdPmm6RnsVLPJw6aoz3x1Uov3kLZxA=;
 b=kHZb35awnqkAnat5Ma1+wBDb7Nffe3cPY6ZB1AjX4deSjLVwN8giUC5klc3Im3RUZu
 4sLvlUmES672jg1EhkJUOdMl4tvCrcYtf9YJ++GVRAzXFFXl46oGXufkf7h5GOQlxIr8
 RfcmZc8n9s/13X6QjWu8ThrzYMTTF2J3n0sJ4F0Vp9e/BTAU5UVMWkVhu1uwmLOLT+L7
 5iTGQlHjrsZLDogmZ3OD/16m9ZvFKsOUhtMlyDdXBaGGbHBTgBzl/YdE8BQC8frZUEpe
 YleJmp29bUo3/lB95hf66KaZmBz2qVtmVFcMQXgM7oa6/ZKGLOnJCNpo+PyP+Qx4fIL1
 YWGg==
X-Gm-Message-State: AOAM533Mt9wilQEgZpmrunaqnIy5tfoETOVuRlcSuMPasoXFtkxoBlmQ
 6R9Yj2jfsxf7zp2vSe9o3v1IdkrPc2ifLQ==
X-Google-Smtp-Source: ABdhPJzEa4Y5JvDlbar9LkBgjhcqZkb/cgKqAO75solMjeY3c0G0jHIdvyAm7fohrOQKCefGAZTccA==
X-Received: by 2002:a17:90b:4f41:: with SMTP id
 pj1mr14974552pjb.209.1644181662843; 
 Sun, 06 Feb 2022 13:07:42 -0800 (PST)
Received: from solsona.hitronhub.home (S0106f81d0f601923.cg.shawcable.net.
 [174.0.44.90])
 by smtp.gmail.com with ESMTPSA id lr8sm20804470pjb.11.2022.02.06.13.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 13:07:42 -0800 (PST)
From: PeterThompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 14:07:39 -0700
Message-Id: <20220206210739.19361-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.0.18
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

From: Peter Thompson <peter.macleod.thompson@gmail.com>

Updated package/sdl2_ttf/sdl2_ttf.mk from version 2.0.15 to 2.0.18
Updated package/sdl2_ttf/sdl2_ttf.hash to match version 2.0.18

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 16459e4a59..a490b002b6 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
-sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
+sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
+sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 326cb99366..1fe7c0a075 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.15
+SDL2_TTF_VERSION = 2.0.18
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
