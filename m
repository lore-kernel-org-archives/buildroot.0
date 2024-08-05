Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA79C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EB880D11;
	Mon,  5 Aug 2024 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjRqTVCy6e2J; Mon,  5 Aug 2024 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E067480EFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E067480EFB;
	Mon,  5 Aug 2024 16:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4301BF3AD
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098AB40231
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AImVLwagQ98L for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 16:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BD3840151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD3840151
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BD3840151
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 16:31:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-39834949f27so49009025ab.2
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 09:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722875495; x=1723480295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yLJGTikDhLddhcZSO7xcgzvKOk5AsPzj37mwVxrJgrg=;
 b=t/dQtF8lGiBajBzB5NQlcBGKVYZM9x+uFJVlDWX7U6p3n5B2WqpqV+FXhaeiL+klnb
 8tSPKpNcKC6Ctje70XETYl981032Z/p/+pUEmD6Ji3MMe6dhrYd+4+A1/oLDJhLg9OHn
 j2pLJ6cyDRSANT7eM3IdzSYe+B5fsvsx1FeqKSDD6wzP9wIhMFocRfaY/IlDH4HVcPXM
 aLbGSG7yGiSdNTsIvmVC5hxveVNeGV429HVc8TEcvkLUfYwhqk3nwITJNCYV0jAUny5f
 erNq04V9H2jxmCIad/isn/LIpucO9aNBWMtRQ8Kcs7ei2ZQm+IOxCBoK7bA7Z2C9yCmc
 4qWg==
X-Gm-Message-State: AOJu0YzxNpVZaLLsgI5eLldEkoNLfaBP/GR3UvFpdql4ZjnBuHm8NDnQ
 F794/kud9FhJOER9Z0TWowAfGeVhoF21O7Urnl83aa4p49BNWo7OiSqZ331v
X-Google-Smtp-Source: AGHT+IHp4q7+4sSRzYiyCOjfViX0rJjCtPs0KG3TXzhw2g7HSY+X7xiBmUBpTqCzvnD1yZeLFjkYYA==
X-Received: by 2002:a92:c542:0:b0:395:e85e:f30d with SMTP id
 e9e14a558f8ab-39b1fb5d303mr178625355ab.2.1722875494651; 
 Mon, 05 Aug 2024 09:31:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39b20ae354dsm29940935ab.59.2024.08.05.09.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 09:31:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 10:31:32 -0600
Message-Id: <20240805163133.4126564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722875495; x=1723480295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yLJGTikDhLddhcZSO7xcgzvKOk5AsPzj37mwVxrJgrg=;
 b=M9Pf3kXFv2+Mkrdagk8xs+Il7gmV/P+gDLjS9OtymlaUPR0bcYh2g5XJ5uQk4E4ZX7
 X200lKqqfCSm/mqLVQVn7Uka17nm4Oy78wVZ9rIlqXqH+1ieqb8QOm1tcyGAqMQrmye6
 qV9PP1bl4P5adGibWjDKwtkEO2ObSzc0i2D5BvC4pTFgFljM5z2K9LLLpUxSz8ahYSUn
 uneY5mK+2c+JKPP4gygCKU2dBINffkYSaMLD5gMHJRK7nCB3sxSywYldRFlnyNqLV2Aa
 MaioYpQYSo5OoawyuFAZ9bKquSiEKmmOTcExAHYpT3tFsTQdNXzQ6j95C3SHRX0AWfLh
 p1IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M9Pf3kXF
Subject: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow packages to
 override download GOPROXY
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages like the upcoming tailscale package need to set GOPROXY
to get the correct dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 8e27602d41..118908a159 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -85,10 +85,12 @@ define $(2)_GEN_GOMOD
 endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
+$(2)_DL_GOPROXY ?= direct
+
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY=$$($(2)_DL_GOPROXY) \
 	$$($(2)_GO_ENV)
 
 # Because we append vendored info, we can't rely on the values being empty
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
