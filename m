Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD2AC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 21:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FE4840025;
	Fri, 15 Mar 2024 21:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psJxKL8ma_Ri; Fri, 15 Mar 2024 21:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9651C40142
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9651C40142;
	Fri, 15 Mar 2024 21:47:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D78971BF3BC
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3DA040142
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpCK-lrojjlM for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 21:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBB7D40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBB7D40025
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBB7D40025
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 21:47:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so536407f8f.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 14:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710539240; x=1711144040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5JaJGBBr61AOgxgm3hC6P2OmVq3iPTkVh9He2h4K3s=;
 b=PqXEwSviozptyZKOZX/lFOQPwIa7Ywr1QWcE8r0GIL/ZJ+nQ+z167vnpRMwICXxpaT
 vyTIv96bAxnkbsbSrsXO9TsQA0IfXV4teb0dzs2FHFzAdsI27tgOpsTtSXUSfum7LScB
 DCt02la2mhFpjYGzaMHaFph0J8Sl5ytocs29GPgdJyj248dcdKEo07xYgG++R9AlIkn4
 hrTEaPBU97jpPfZMLstNR583ABFwko0KmUVkM/LFxfgyi1YPJrZF32IYi5hQn/OTEB8b
 kdARcogwXJdpfd9cU1zRCg304Rfy2p3cTQiEnf/zuzAleeqT12YdZGfYBDAZ5BymdXBa
 9SQg==
X-Gm-Message-State: AOJu0YzDGo/a+JB8uXWwQ3BrMXsjIC7Xrfk09duGYcG+uHyWoBIPMAFa
 HcmpzsaB8qYcE4CrdXdE1zxfzGlOW2/UAspNOGGQQapiCm8c1JuWZqzoI42g
X-Google-Smtp-Source: AGHT+IFwpv/qW+crBozwQHF3/rGiZdwHafqgPfLsZXbIbZmnCduNYWN5kRoRDkX7xxTfXHR0xt6/GQ==
X-Received: by 2002:adf:a4d2:0:b0:33e:c5c8:d04d with SMTP id
 h18-20020adfa4d2000000b0033ec5c8d04dmr4138097wrb.25.1710539240300; 
 Fri, 15 Mar 2024 14:47:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 az1-20020adfe181000000b0033ed7181fd1sm1054874wrb.62.2024.03.15.14.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 14:47:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 22:47:12 +0100
Message-ID: <20240315214712.4897-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710539240; x=1711144040; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l5JaJGBBr61AOgxgm3hC6P2OmVq3iPTkVh9He2h4K3s=;
 b=AzQkTMVb65SkW3LKqX36vLGyGFYedmRFHfLC+apuulrNwBXbI82ps1DR+DZTDNbAoI
 H89h4LqpNMEHRo+f0i/ws+Fsqx0UQhqCjt1mJwuoy5OwQPfkMKUMnyX24qfQqZP6RvzM
 E/3GU9Q0WLk2m7Appwrx8BcmKLUwrw4Bg3u2FbOkiHw/ZCKtPzLaR79nv3wOGaSCZXfI
 E75K91je4FwoNu5W/6CV17ndsyvGoZQUVkoG5UC1lEXmvwfCfrtpDadPgREdeaI4d7nZ
 imFNKRtc8aG1NCOYDh2K3Koo6T+J9YT3dWtmHgyQFlY7SC+yz9fO6f5rL37YfUOGJ2WH
 Ej1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AzQkTMVb
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: drop README.md
 from license files
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop README.md from license files as advocated by Arnout Vandecappelle:
https://patchwork.ozlabs.org/project/buildroot/patch/20240314211117.9103-1-fontaine.fabrice@gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/multipath-tools/multipath-tools.hash | 1 -
 package/multipath-tools/multipath-tools.mk   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index c1f32e7a3b..03a2867144 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  9c69bb0089aa0b82b10a25095c04a7c4aec6b5bbf0776b7129123c8459fe7725  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index e62e85e14d..164d850600 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -16,8 +16,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 	LICENSES/GPL-2.0 \
 	LICENSES/GPL-3.0 \
 	LICENSES/LGPL-2.0 \
-	LICENSES/LGPL-2.1 \
-	README.md
+	LICENSES/LGPL-2.1
 MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
 MULTIPATH_TOOLS_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
