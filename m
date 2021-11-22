Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2144C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 02:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B06D403DE;
	Mon, 22 Nov 2021 02:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMOI6mq5BucO; Mon, 22 Nov 2021 02:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF1D40233;
	Mon, 22 Nov 2021 02:08:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D73D51BF83E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C934037A
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akuCvGNsCFUX for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 02:08:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE196400C1
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 02:08:15 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m27so73121673lfj.12
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 18:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c1gG+/gUMCKqMCv90Uj1XqetMFDI0PgoZxmIUZPVNvQ=;
 b=Yk+3I9c9bCXguvNOLxTBX0ZHBgwN9PKeXKyf3fqOUwd8UlO3l9lzuIuDVGfqGD0ual
 56QjRaME7v1qctsHvuKOJLgL402XJwSFLfefRIeSQTbDfLhoYHFESY3O5ToGaLvcHElS
 GFC0guevA4xVyJ4M7TDEKhufQi20e1/Ndoo6A7AtJQZFXAfkh2KNu66pPe2KDxJlN1+Z
 /Rr0iK5i8KxmMM0kzOrtec5aUulkG2l37xY3O45iZDPF17W3nWPz2TR5wGgR8teOh5t1
 VzJ+njgYgIaWrWPhQpTcDsGVYhdGBTj8QtHqReeM8JpMJzMbc6svXyJ3M5u4udNsduoG
 GFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c1gG+/gUMCKqMCv90Uj1XqetMFDI0PgoZxmIUZPVNvQ=;
 b=aDUMnYcS0Y4QWG5znITlhv63kpDaeVU585pBYcMU/NTQlafIsxezw50lttpYXQfvsQ
 2x/Srn+CpT/rlrxT5ZtH7kAbh+54man1uywdoW39t6Hm00/QqDGJFGOg/9Q67NcLppVy
 kTpdYTnbV8OiqYs1ah4qI73Hf4aChOh8h/su5AiWFWJO3tGpQcYR38dUyLp/ZcRLE98E
 n5Wy0U0pwX6PFd3dCZO2VW6XvkNdSNzubE7WCBhBH3knwo/CUcMGOAd/Ky6ugJ0ldTon
 NAUZmr2r1uGUMwbUy0qVxDOX0KeeUkE8oMQ4wliTFTsoau7IpWmTS1/fi5xRYXiCtsUn
 a+lA==
X-Gm-Message-State: AOAM531vvKoaT/4Xr1YVaOCM79jln8xbEAPOji9llPUPhFLcjOVASOQ3
 6xEOEcrBoOzmZ6nmXhwP4VWeKIkxecc=
X-Google-Smtp-Source: ABdhPJzlBqYGSDzQunM1LrAZodNPhQABHs20j1Kcb93w67D3fBqBfkN79sSvssZAJ38K7ujlvDQelQ==
X-Received: by 2002:a05:6512:2386:: with SMTP id
 c6mr54243700lfv.166.1637546893420; 
 Sun, 21 Nov 2021 18:08:13 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id h19sm788120lja.71.2021.11.21.18.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 18:08:13 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 03:08:01 +0100
Message-Id: <20211122020804.535891-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122020804.535891-1-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] DEVELOPERS: add Joachim Wiberg as
 maintainer for inadyn
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream maintainer, now also maintainer in Buildroot.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f812eb564..026ce8a9b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1343,6 +1343,7 @@ F:	package/rtty/
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/inadyn/
 F:	package/libite/
 F:	package/libteam/
 F:	package/libuev/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
