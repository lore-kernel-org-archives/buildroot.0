Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE98C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368E041583;
	Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWpS7OPfyk3V; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5579441586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5579441586;
	Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3571BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B4C741583
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEbjk5CdCyoB for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BCFF4157F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BCFF4157F
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BCFF4157F
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b18099411so2707749f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845300; x=1708450100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDm8WOjWUUVqzv/EgRx0YD0AbiihwuEN7SrY2GcbBsw=;
 b=ndIUgetLVmtaFkpL4WlLogFCDUaY7ntkZgn1HrELbTr8u4v/ajtFpeGljsOmsTQPVO
 ldSBimcUMou46tUKImk3AnRodVZeA0TZ6lF9RqfDUBzsRpjra/1DBarT+3pvjzNRy4Ch
 UvblMN+tasc1/tupoecuY9mQ5jWAsQTR6SI7zbXBWss4cAvQ98XxXrjZxNtpIpSOSsqI
 ieCt7ONaioyVdUAZo1/tvmI/Ge/yS41hJG6VdGg6v0ZmNvABKkLj4y05D9y/DLrAHNSx
 iZQaEnSLGViwo1YSwFP8RPL/58pdpNrDiyZZehMLxvZuD5WdETnxOQIp8qM4ewSU0HYv
 +GvQ==
X-Gm-Message-State: AOJu0Ywe26LWuEv7JuF6WJtWyMgi2h3tJRRuz12RXz4vymK4Xp0yMNWa
 6IPOud09OW6gsSZwTSbpJea9nk0mE+G3cJxf7cCR7WkaLYU6tIyzdKX+smGvk5cxO7BjgEyTaJq
 t
X-Google-Smtp-Source: AGHT+IF3sKQ9KHmfC91McDc4w+3J7Y1oh95h2u1Xyum2cJpgZ2yRjS2ijJ40bPsD9bZdjJPUfEPcaA==
X-Received: by 2002:a5d:574a:0:b0:33c:e2aa:e810 with SMTP id
 q10-20020a5d574a000000b0033ce2aae810mr896964wrw.56.1707845300612; 
 Tue, 13 Feb 2024 09:28:20 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:20 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:27:57 +0100
Message-ID: <20240213172817.2872849-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845300; x=1708450100;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDm8WOjWUUVqzv/EgRx0YD0AbiihwuEN7SrY2GcbBsw=;
 b=k2EvM6l7pD4SK3UVrpu1x1nCiWAp4rbDVBjEZp16CrhQASdn/tBmW5y3tW0244ljeH
 Yzbmmwe4Q3h5P0tpfUTWCGIgOUnb0zbAK81rOranIlUwssITv9joBYzlQET/MoBkz38B
 8Yh91OXQ4BBHiAoln3G4SA3d6x8WuQXklle4wQ9SNYuq4fwK22QJZ27vkWUVaBMI0KGD
 gSc7c07bOHP7UbjF60iXfieYSsCFDOthT7JgQJYxWEDYRn+VGBH10G77hKG/n7hOE+Mw
 CWL6xsriGeR8YRq3GyE9eI4aKoXjKFVUMkTuyGgUUzet5LnOhe6t2oDV9ZRDVugGeKjr
 DRyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=k2EvM6l7
Subject: [Buildroot] [PATCH 01/21] DEVELOPERS: add Romain Naour for
 am574x_idk_defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DEVELOPERS entry was missing.

Fixes: 35eb74c634 ("configs/am574x_idk_defconfig: new defconfig")
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..ff44741f9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2667,7 +2667,9 @@ F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/qemu/
+F:	board/ti/am574x-idk/
 F:	configs/qemu_*
+F:	configs/am574x_idk_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
