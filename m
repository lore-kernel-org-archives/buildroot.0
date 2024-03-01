Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4A7C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CA2383419;
	Fri,  1 Mar 2024 18:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8G1qnpt91MUU; Fri,  1 Mar 2024 18:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609C483B53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609C483B53;
	Fri,  1 Mar 2024 18:34:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 070EC1BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 332EA83B53
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Eu1dWzpsjZb for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15A9183419
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A9183419
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15A9183419
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:34:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51336053255so615924e87.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 10:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709318054; x=1709922854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dco0+B4j3Fsc7K+1Nu1ovR7lzcLF8qGlFVV+mnoR6hY=;
 b=mPbDS8QqJXyPRxwWbgA1yMBrZyJBbd4JlzdE0Gb+Z6euWZW5F0SXIkYWbrUrVUz0Ja
 S1a2wvYX2oA+wLysNPzxes/nBS+OTyDV3s4K/XoDXN9ZPFcRtBAqT2e7c4ic/SpBWlLK
 53wJQN1DoJzX30XMcPyZmYK8F7axXxwWkStJClW5WB7iud30vLQiv/1W2gCeIfTSweW+
 AytgYtbJZ1WwgtNZEzwH+tbX2i3nVW8ZH8YxirjD37HjX07slaU/v2BNlPBcoYtGwSFG
 ApQEYrgiiaQhVHxZz8vhxhwJGnnnaZh8uf6cOPfjUigJxPjr7LFyT/KYF+jCpySFaXqm
 TT0A==
X-Gm-Message-State: AOJu0YwZPenrJpSSlGfMmS9PiRUGTmd3qZazKeFNV2goVs0sBgVsjbGk
 P1lBQkzblOiNbkzPM5elykygPf17x8iIGL3VJucOmKf7AmDO+eUrv5l5ZiaX
X-Google-Smtp-Source: AGHT+IHHJhyToM4S0oh3a6bUNQb08df6LW1qe2fL8Yi+qYQ/wZfKUUNRiNVUNlmHVnDRGEedtSVm+w==
X-Received: by 2002:a05:6512:1598:b0:512:e8eb:f964 with SMTP id
 bp24-20020a056512159800b00512e8ebf964mr2557708lfb.37.1709318053737; 
 Fri, 01 Mar 2024 10:34:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b004129867fae8sm6297530wmq.1.2024.03.01.10.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:34:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 19:33:49 +0100
Message-ID: <20240301183349.808102-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709318054; x=1709922854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dco0+B4j3Fsc7K+1Nu1ovR7lzcLF8qGlFVV+mnoR6hY=;
 b=nLWru6ycvHbVgql5Z43el4ABjJlyYBy2I24gG/p8fA4hhhs6lE60Z2PCVW109B0GJk
 qBEnN8h/UFAJM4M6NJGFmMwGgHyn3up4fj+PtPiQ2QxG2ktfL1PNpqk68xHooA3ctxB7
 gnrYXNyfQWtRxjEBLnJ/W3+uB2EPdhjLWttoFnhxMApNVTCtmCyQivE0tWfS07RoBEJH
 EjGn/9syC8S2qUisO6XcgbbA6RoWN7bfH86cJziKYgnsD4UwfntNEnqD8wiu9Th3IYIj
 GOMStZz9joTs3Lw+UBU2Dg8N2j7Rkutzoj6WEhrPLGkJhRyHPBNrpenVwku98fQKXmBk
 QYsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nLWru6yc
Subject: [Buildroot] [PATCH 1/1] package/redis: disable -Werror
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -Werror to avoid the following build failure raised since bump
to version 7.2.1 in commit d49f53f8aaf0bff9c8d04c16485c844fef2832d0 and
https://github.com/redis/redis/commit/8e138ba44fc3eb676c0f31faac19d1acc6a4c7ed:

In function 'hi_sdsll2str',
    inlined from 'hi_sdsfromlonglong' at sds.c:500:15:
sds.c:457:12: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
  457 |         *s = *p;
      |         ~~~^~~~

Fixes: d49f53f8aaf0bff9c8d04c16485c844fef2832d0
 - http://autobuild.buildroot.org/results/fdc9f940b348430cb4da8efecc5cc047b21df281
 - http://autobuild.buildroot.org/results/e5747674d52b065203a0442f7cab13e8be5f426b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 09a3b9448b..2680b11b74 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,7 +30,7 @@ endif
 # https://github.com/antirez/redis/pull/609).  We set PREFIX
 # instead.
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
-	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
+	PREFIX=$(TARGET_DIR)/usr MALLOC=libc WARNINGS=
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 REDIS_DEPENDENCIES += systemd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
