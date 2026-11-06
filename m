Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAFF606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QK/eyyvP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdWOagld
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AFA6085B;
	Fri,  6 Nov 2026 10:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPoTggV1Xrpy; Fri,  6 Nov 2026 10:21:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CED6B607CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793960467;
	b=QTbBx2Hj+yBP69VY9puk0uHiGqcX3XbyU605ZJLLpxGJ3I/DuXW2S9comvCfES4x1MG/
	 rbeJwehedixFpum68CY6JXnINRUwuKSA/kwy0gOv+otaHTV0btZu3d/p5YPaoAUOqPDDm
	 s1PdehAKHwHFaw15yoxr3ureRhrus4eLJ8rpMixgbPVgj5vmaSu/WwG0hvsHAH3CzJuV+
	 LyUi525W/ajjxM6c7WyrZCVIUApkqwP0wqKWUooXd34ugmzIouNtQKCBJjalH0I54bXnE
	 5zcv/lNFWQiWVnguEveYQlzo+bbFV/g/d/7RsWFe90GXa6cqBkyQkL04ZetUUq7TqSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793960467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=n5zXFEQH5mr0qvfTNJg7QESRiJtEhkBNBkI/u1yH1lg=;
	b=Sq7flXPY2AJXymBKY7bMqXjSp4ORDyD/weZ2GdAHDoTR0ENGH1edYu7DftAIrQNpK898
	 AQp11RKoQTkpyIBeBVXMN8b5uP4MMh6Lv9ODuIS8uhNvmqj4BppeidgTvVKq9LzxmmGiB
	 t81ZZGif1xNWY1Un9ViztPUVvpybdYa+99++PS6wnh4BE5XG3nD33Qi5Zxa5CP99XXkgn
	 6X91co2qLHGGrDJyQnsG+LdXlRxWspO9KpZ5Y6jHtxrJDaOtqkh0Tq3tJxoK7hRVH+JDw
	 gxIzaQu+6PeIfv4CztG/1rLBKZjtYEpTICXfYubX038CG0SBrDSJvRWAPn3Ep25Mkzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793960467;
	bh=n5zXFEQH5mr0qvfTNJg7QESRiJtEhkBNBkI/u1yH1lg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QK/eyyvPDEgRihm+J2fQlS02i+2HR9Nie+duO5hSJHMQG2jVLRN0vf66wcGbqOfhA
	 320C4TCGZWgccdlO2t3X177BSP5yyfZD0WGhh6VP8xqKO6QqOUr+3rArCUGNPh4mKY
	 IKRuct5rFx9ccflcEfxG6IwEiLNr/42kRzT1G6jot3D6oc2bGQJt1oByUTibSb2YE6
	 rby14q8rr+G57wuI2uutlv2KIGiBagWlRyNwMWTcV0ZL0Y188Yelw6fO/Gx+iz2c9z
	 ShJvPpY+LR0pRD9Yfw9wSLadXkWjxnwgrqiW1IeKm6ARF0azEi219rrO3VV9yTS35K
	 ijcUGQHFsxL2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED6B607CF;
	Fri,  6 Nov 2026 10:21:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A530D34D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ADDF811F8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9tVHKeO-zYx for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 10:21:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B980C80A5A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=NdWOagld
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B980C80A5A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 10:21:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so2589295e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793960462; x=1794565262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u92cX73U9xYDzgdSxJ60vrqNDFt7PqGFOnHGhzQJJfI=;
 b=NdWOagld2OmwW2vWdBquKYIcSS31y9hRf9r1raJpXdpNkeOcFUmnwCWi9i7RJS5hT+
 60jMYIUsBVyItQZmiBudlXIpF3+qbi24uhLhHPvPsOo7uUcCIVhuu+DTFCgY1+QuwqGk
 IBWGKKgSO6TVcCf5vLLNk/3dDB3kRXTx/2vGRj2ZSW7ufqdiYRovz4L2tbHy0ELoAouY
 5Bi64pb5BsWpBqYRo8k/rMnrQ+S7EKHO4geShk+BAtDmUujrRfmiRmClHA1ivoR8oZId
 mv5+fpdqW8JgHtI6VaJzGxDrEE5emngZYGrQO4n9TWuNb1sYbU5xqYqYJhjggd4jPoAN
 EhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793960462; x=1794565262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u92cX73U9xYDzgdSxJ60vrqNDFt7PqGFOnHGhzQJJfI=;
 b=QpfAwLOqIYgGIAarnVY8FUC3qN4exeZlIGX5RyMgjdalrOGGflJIv8vr1p7o0sSXA2
 vPauITwwooLPQpy7jwaasuOqqzpN6rBrbCrem1MheGLub2E6Ez2GDbw8ENMOK5wTV0/O
 GDScQ9OnzqSTtzq0J5R7IS+Tqq5G00ZNYII8nUvPHGsZ4n2sdvCqozEEjA0nUA2eYIWw
 DQFvRoDCw4OkAHZ7wOW/UN0+vgWRnD7v7kc/b2adUVyQe5YhAsk0bYsQWy3LKUB/Lwtr
 s5Sv5PlQGQb/2isg7Zm/tZ11pzhYSx6V9f5ueN7h401vtxsc1d2ofPmRVHbPCKIpcUQi
 yXcQ==
X-Gm-Message-State: APuU4Z9AyNvd4RbZX5xcp4HZn1KEIC5Am89bz7bwPTC1a9dgsylkRvb7
 or6TSF6PEiXkFoc/1SY+kQyeq3CI/mqDLOyoSyfahZRXRjv6m3YM+Cmw3gU5ng==
X-Gm-Gg: AYBFou2YwaYAmxArXKxbPb9eb8IH/bBksl7rkpa/Jm2IJy4oSXpWOZ4OLEcp00wlZjR
 YfgSWL+rSB7Cv9k9tlHzN9xcFtIJ56uqQkNklMplZR5S0mri0mUIoRbKyR9OG2gaWLlxrUpQDkJ
 5QHPe4t9HSuNLQr/6baJ1JbmA8zzsnJ6WIXLmzNEXzkdxKEM35NuTAFRDhcPjRxEfuCReR7+5np
 OIAG1SObLS0mD1GVJWr/6VTHLLgcrhSjLvTqAUb+MKbeMA5hLa3El2RPOi4Wdhfur8pSXm/EFNd
 JpvYeyjJDmtr7xmYqovpClyMrF8zXUCQ9zX6LuqDKFaR+ucxxLtJM4HHPYDIDHed4ibPRzaWRLj
 ZRMSbLK+MOszbwMuzfdzUDK2EZqOBF32PU271gdT7b+M/6C8z+DF3wwmBJRLxMT7egA54xUNCny
 bufnD+jwTdTJWlZR9JdZhtXX8ruGuxYv7/jy+eHa8StGL031MKJ5607Zhd1pdGx7eyhPn8yfQTJ
 CwFBdgpO9bQOPklZD37fGfQuRnbx0VFQLKbQhMwXJQN6MAZyGZVjCy300DxhqGCsWZ0EpeJpwtV
 hFSN3pTTBl3Z/c/5cQXsv1Pgeo8ZhsaC3NUqjEQDYPfVEksA8O1nKQ==
X-Received: by 2002:a05:600c:528f:b0:4a1:de8a:603a with SMTP id
 5b1f17b1804b1-4b6de4a7684mr33218695e9.6.1793960462262; 
 Fri, 06 Nov 2026 02:21:02 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6ed5b8159sm43766145e9.2.2026.11.06.02.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 02:21:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  6 Nov 2026 11:20:59 +0100
Message-Id: <20261106102059.1407103-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106102059.1407103-1-angelo.compagnucci@gmail.com>
References: <20261106102059.1407103-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Angelo Compagnucci for the
 Vagrantfile
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index febf03773c..3960281d72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -265,6 +265,7 @@ F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/misc/Vagrantfile
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
