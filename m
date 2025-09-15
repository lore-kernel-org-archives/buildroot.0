Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBBFCAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 18:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1F4807E2;
	Mon, 15 Sep 2025 18:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoWnCUmpQmI5; Mon, 15 Sep 2025 18:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0642807DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0642807DA;
	Mon, 15 Sep 2025 18:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1565C12D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 070A3807D2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyzhDXlHKTUj for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 18:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3C52807CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C52807CD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3C52807CD
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:55:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 15E285FFAA;
 Mon, 15 Sep 2025 20:55:06 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 15 Sep 2025 20:54:46 +0200
Message-ID: <20250915185448.11118-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757962509;
 bh=uhxAZ6gv7ZQmFPK3WyKGqxHTk3ymBburZeuoVqo9whU=;
 h=From:To:Cc:Subject:Date:From;
 b=ROD/yIWgEdHBP/A3nHqqS9rXPDZk1rq48PCbReMelk+5PY8kfItmabWFRzLmCdPdz
 51ZA1nNpX3+KDtD0A9Np4bCnmrncZ0dOweTerfvuzIRMMmUj6pB56HcfjxUCGXR5JA
 I8InLY/MxQv33odY0BpxGmwqGQje9z4Azx3UWnToUrghoQRyTw13eNdXfB4IgALfzt
 Q9C83g8DA/NfGjyE5p8/LUOv1AgUsdDzxPsw3HEI7/q1CrlhFiAyR86dO5NMgCIQZL
 KhVWuBTwnj3tNHDE0b+9Cj4Glkv8hDnR38FdpFeLydIGLtPC9fCeLzNJtrISQ1H6+X
 QC1ZtgOouQDWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ROD/yIWg
Subject: [Buildroot] [PATCH 1/3] boot/boot-wrapper-aarch64/Config.in: switch
 homepage URL to https
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] ("package: replace git:// URLs with https://
URLs where possible") switched _SITE URL from git to https, but did
not updated the package homepage in Config.in.

This commit updates it to match the package _SITE URL.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6626bf7c5fc1f5f47fcade03090de212a6121db3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/boot-wrapper-aarch64/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index dfefb7a9fd..7271336166 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -11,7 +11,7 @@ menuconfig BR2_TARGET_BOOT_WRAPPER_AARCH64
 	  possible to start an Aarch64 kernel inside the available
 	  software simulators for the Aarch64 architecture.
 
-	  git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
+	  https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 
 if BR2_TARGET_BOOT_WRAPPER_AARCH64
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
