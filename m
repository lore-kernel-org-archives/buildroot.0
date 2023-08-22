Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193EDEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB1E611AA;
	Tue, 22 Aug 2023 19:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB1E611AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rag900f2gDl; Tue, 22 Aug 2023 19:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2D0460BF7;
	Tue, 22 Aug 2023 19:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D0460BF7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53A7E1BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A20F81350
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A20F81350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHXCz16KQ3DN for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:48:07 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AAC68134D
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AAC68134D
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68a3cae6d94so2673073b3a.0
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 12:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692733686; x=1693338486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=bvL42/hs4pNftBr5IE9ltTDbB7vqTFErk4m0r4czKRj4QJaQxp6mu7Px/thJWRpw+m
 FEy/iUWANxPTgEF6IKlCEO/6cj/sXMUbmlOrlxmTyekr8fVdxWH4YftJ8WrcOHNJQuGX
 AW0DaF96/x42YldJljLuYVQSdAQg7EkBtlfPE4S9CQwIoyh7Sw+Suy9YDQ6OROWnaI8T
 Uz1c/GwgMp8hq7msNfhMSVxTqRz3bbADl9tG0dkVzDiD5SrAgjl1c4nXhXSow19ejwPF
 3VMzoJu+nl4rZkgw1+cNONNvHqsWsgqyPF+gxGSIGJ1sQT+JYuBvROuPGMKe2RwXcgvJ
 6jmg==
X-Gm-Message-State: AOJu0YxGxwO42+DfY0VNVJiWiB4X1JP9X8w/6djNSJz0R8rvYeUmyBYS
 RdcDRphJ7tu/xT0YojVUD8VtFiwQSwwJ1UOuPFY=
X-Google-Smtp-Source: AGHT+IFhJLE733kcJWOs8h1BFoeKh7ptWpZ584KUN8pvMAUFX5fHGkZSaU3gSlFrN5ubjw+efzMMWg==
X-Received: by 2002:a05:6a20:548f:b0:143:4382:f836 with SMTP id
 i15-20020a056a20548f00b001434382f836mr12965788pzk.14.1692733686357; 
 Tue, 22 Aug 2023 12:48:06 -0700 (PDT)
Received: from localhost.localdomain ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b0067aea93af40sm8128584pfa.2.2023.08.22.12.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 12:48:05 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 13:47:51 -0600
Message-ID: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692733686; x=1693338486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=WFuvVWNZWTNb1a+ETTxFyj7USJ79jxb+jc4ifq3xsKEi6KC+cZkp2vgtThXy1fUKya
 m38CRvyr7WyJ0Zcy5T+hYb9cUHsCnUQM0GRmUr95KAnI7DCF9UWUCYrNkEB1NdpQboGN
 DZv6ZlT3HN21IgSThkuM5xikaa/61NXasUJe8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WFuvVWNZ
Subject: [Buildroot] [PATCH v5 1/7] package/python-httplib2: add host variant
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
