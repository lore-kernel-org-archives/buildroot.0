Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06E9C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 08:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D85940D8B;
	Fri, 23 Aug 2024 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VRvH0gGmkti; Fri, 23 Aug 2024 08:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188AF40251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188AF40251;
	Fri, 23 Aug 2024 08:32:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57EC01BF366
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 08:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 440CF40251
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 08:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUqcDfWmYF_H for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 08:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 003034023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 003034023C
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 003034023C
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 08:31:56 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-429ec9f2155so13084505e9.2
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 01:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724401915; x=1725006715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oo24iOGSMOTfy4teouJpKX26n9DUaCKJFrtUAuG+bi8=;
 b=JjbIaN0OUPo7JngDcMqnvC///B0D5PW8ld1D8ull324u8XycujtIJ/4CKbf8I/CN61
 yUAcGnt0eVhPD1mFGdvtEMRjltNjeO7s7uYxo9JWQnUV4tSVFboWBo6LnfHpAWFbqUUh
 OW+nAapW6wALmxP+qN74ifrqfLajuC9UfHn5Zexe8rGBPVMybCqxlidUJP3bq/qhKaYl
 HtaxDu2UB/zK34EoxikK//AYKSIxUxXEzldPo4qqI0J/gAbTx6WdagnHMGpN1jvTl6Pt
 EgBltw0wzXfoJ9+1n0da3qzlWlHhAPv8+cf+ci1PIXmeJyLlwm0u1OB6ZmRbv/0dRNSw
 +lRg==
X-Gm-Message-State: AOJu0YwFmTCAsMzQn6FE8K3Xk37BxGKrB58zQztDe5R2OOlnXX38f+ZH
 cLTpEx8h2oxN7tdHUoeGqk8jwu7K4/0duaW5Iu6zxBt9eRO0VRvU8/P98w==
X-Google-Smtp-Source: AGHT+IE2yBwf3uT3epHuDUFLk2S5MPBIsgNj0BNeSSeAADN44ongnLFAj5euDokjTK56prYoFrITCQ==
X-Received: by 2002:a05:600c:1da7:b0:426:654e:16d0 with SMTP id
 5b1f17b1804b1-42acc8a6aa7mr12790645e9.0.1724401914509; 
 Fri, 23 Aug 2024 01:31:54 -0700 (PDT)
Received: from fedora.. (ip-109-43-177-41.web.vodafone.de. [109.43.177.41])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac518013asm51522045e9.42.2024.08.23.01.31.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 01:31:53 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 10:31:50 +0200
Message-ID: <20240823083150.74230-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: [Buildroot] [PATCH] DEVELOPERS: Drop some entries from Thomas
 Huth's section
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I lack the time (and interest) to properly keep these entries up to
date, so drop them from my section.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..426590d5c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3097,10 +3097,7 @@ F:	package/fluent-bit/
 F:	package/libsoup3/
 
 N:	Thomas Huth <huth@tuxfamily.org>
-F:	board/qemu/m68k-mcf5208/
-F:	configs/qemu_m68k_mcf5208_defconfig
 F:	package/ascii-invaders/
-F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
