Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2820C83F2F
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE2D60BC9;
	Thu, 31 Aug 2023 19:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE2D60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjYkEGJ5N_Wa; Thu, 31 Aug 2023 19:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B559260AFE;
	Thu, 31 Aug 2023 19:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B559260AFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D70881BF295
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFBAF60AFE
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFBAF60AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgM30ZV0_MZV for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:53:45 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B127460AC3
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B127460AC3
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401ceda85cdso12612975e9.1
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693511623; x=1694116423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ctxm1cQD1Pab8jKqR7i0FH2yTomzBTJrrt1Vd8LdQ0=;
 b=kgyEYAF0pTRWBA/yuToq43YjEoBMcYgJ/6KSURGkZyUk51QBRqErLxFEK1iqGvt165
 nl79MFifCe4isD7Dq/z/t2Nym5GMddyPbje1enBnPOSmhHtGQIR9g5/3bMCu7Bfk9v/M
 N1tWKyjET8ZNXpnb4SBmIo0Lw9xLb7grlrlZwOe56BWLnDilqvE6Rpc6sWCTM4aDn9XO
 sXHJMttLlPphiQxxkwPY6iN5PpiEvQUyyYM7giEQSPpeP/9gMDcQH7yiqUOfNDidtcjM
 mO4Az2D1lzKW901z5G5n2oFLNdhpFuHm2WY+koTLkU4bZDZDqPKQuJC3qe9xG7bz2926
 AENA==
X-Gm-Message-State: AOJu0YwRN/ewB1sIK7ON9ht5xphl3Gi1Tz0Y62hpB3t7SqlgJoFtHlzm
 Ts90RB7ZioIEJUS07pyGSeA6s2cntEo=
X-Google-Smtp-Source: AGHT+IEEhkjvqPGb1Kasi3BQV84jCI7pzmparsYoygrKjrlF0ueyXFHAGvrHlnjnrqIySowXjRdnDg==
X-Received: by 2002:a05:600c:364c:b0:401:b0f2:88b4 with SMTP id
 y12-20020a05600c364c00b00401b0f288b4mr241577wmq.26.1693511622533; 
 Thu, 31 Aug 2023 12:53:42 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a1c7416000000b003fe23b10fdfsm6044620wmc.36.2023.08.31.12.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 12:53:41 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 21:53:38 +0200
Message-ID: <20230831195338.469375-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693511623; x=1694116423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9ctxm1cQD1Pab8jKqR7i0FH2yTomzBTJrrt1Vd8LdQ0=;
 b=bYFzGEWk9KJ0+7uukWSQ42oLpVz9LZ7JJKhdD0+ACdKOsXBnYXuSl+dbMgiiQ9omT2
 VuC8k5hEPAXMswwXibkIlLAFREU2NOPg+ANfA6T6T1W8EQ3/EGohAGkh/qGGMZsllM3W
 6FHNCLQptabChRl7SiIuJNu0mX2puBxMY1jTsce4CWha6XpPkSZ0kAtFVB3DLTwLhg6V
 Ce+padX1ZTkHWxsNi+gyJabuszLi6gZXbyD4GIDi72CaqEwicI3D7POBg0eKV8wceLEI
 k2Ag/dsa8rSwmFQmpXNKNkmMfbCdtUzXTa0Jj5IF3+LBgZF1df2HEg7AW2boPwAOGhMZ
 dUWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bYFzGEWk
Subject: [Buildroot] [PATCH] configs/hifive_unleashed_defconfig: uboot needs
 OpenSSL
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4987456270

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/hifive_unleashed_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index c9d4a31ede..fbc273fffc 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unleashed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
