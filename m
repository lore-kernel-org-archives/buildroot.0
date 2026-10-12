Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32317CA9ED5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECADF40674;
	Mon, 12 Oct 2026 06:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhE1ksr8c_Fr; Mon, 12 Oct 2026 06:26:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AFC90406E2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786366;
	b=INNes0wuBf8nFt9LmYol1dK+s+zFh2MCP7ftIXDJbNLh1nB2sJCEZNaE/sMUCTyIhfnT
	 +yPPCVnYWQdTkCoAlF+SB5fmnQJ3P2OyhXvtXcopVDi47F7lnkeqjYIzAH7ecpdrsCfS1
	 F+iglgDOiHxgaZF3TcAmJjZrlqJltGAEvCTi8wU8+sH3v3H2TT4NkO/FxGQt4u3q9uX02
	 g02UAFYvAFBsZWJol+80tRU3qtr4rWaxvF48WO8QuLzTV7whLrchCM1VKLoJdHTHTF1QY
	 9vjewnqKPzWCj7sSCAi57c+Eh5Y9Zah+7hZjC7AAHHleWg4QLRd0F29i37MEPbF2zZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eEIWtt9c1NsE5XO6UB5Ycx8KYiAE3njGeAFP9EAxX/Y=;
	b=M19kwjXWUWMWJrnpxOPHnJ6NXR4IxcuNx4Q3QTCznQqUqY7RYxrlvpF+EFf/U94BcncL
	 FNwJ+rfO5njgBil2IkSre4h756ituz8ZjePjg6l725oUw1fi1Xwqi7NAuh/n+Bec3Zr8R
	 7HyQAtBXDWxOb4FzcBCDUAdaU+4B+bdoM0KZKOCLiSch5+CttMgMD2Y5JD9qJF33CiROB
	 pWSfVunaGYz9inQCrv+UlejJ7cPuBEjRrDJXYE2cGaYHFb0bTSpG7uo0Z1SByHaR1c/8b
	 EUBHQY50wIrcYf2jTPB6mKV5q8wJFJyCI74/QxNJkHtTZ7oI1nynsrT4M+4wH/xrsQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786366;
	bh=eEIWtt9c1NsE5XO6UB5Ycx8KYiAE3njGeAFP9EAxX/Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aUaz1MOOn9+vnF6duko6tZyo4gUyzx5bIqgeX2irzviPhUbs771FfLea9OTmPUNFm
	 vGwaKyGxCqAJej5la3ivstlolcjXpwqgjh7hVlIUExnLoNoxOXZJj1IeqvuLDoICHo
	 /g7Y62TDL9X2QEQShF5AIvj23lHp6xqXCwo1RTIx2GKOpnnNEMHliaouGEgoYKSA8Q
	 vsKRVDchnaYnhme0fT0hyumdaDLTQM30FRBbX06OX27w6/Vm+q8t8eLML6fh5A0p7U
	 KhEp9mWmtu34JXmay2RE0FDSwcPn8f3oI2bomoYblY8PQzlx/4MP7c1uiTsKoAwh9t
	 xBa5j9A23BpbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC90406E2;
	Mon, 12 Oct 2026 06:26:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 173FB380
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 092BC80CEE
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2EByFbjE1cT for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D237D80CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786358;
 b=Y8JYWFJsv6bckReAnP6zVqVArl5Sjo9HfrFER8dbBCkNroh8IsgLyJHy7JSMcSO0fhUs
 MuCTBb0EY4fIYtf6h4HRJYi3xFNlaUnvJgPMWATiB8ut+kPf/wpp2Ge6D0WzzIEp4a1/a
 6pMkQfUP1ROsKVPT8NlH4FhD3UGGHnNrTit5ClybvzSWyVejQp0O/I9MUjpgc6piGaHC/
 745HBxQVdeVPkXSyYjhoNETT6Rn9Ex8dSunYYyNHlOJg+tcuVRyM+vrGR2vs+q1YzjLrU
 T2eJ95GgrtJoaXSpkBDBucurDP/mTyVo+l1KqjzogbSKwwGV+cPXXvese8AN9pKEJlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786358;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/ffXCavU9pvbeQvaO7sKEKoykJcteoD3MkWHvfjy0d8=;
 b=bqmqkYHguwwgOyWR1NouC1iM/2/ZxrtLChfetJ+rnqyD7408FzuBroEkj/tIqv9QoYYy
 HMyrhLpK38jUq9RC/rXo0zPdpZsvOhvQGrVaqsbYwRyWoNeCNzc06J5GgCJIAtnl9Voz9
 EYXOwRGr7pZhEvH1faUxHCh98kaBCNx1C6L2QAMpf0MqtFsZ5qXCdauVI+q0XRUbncqcN
 pY8Ql80o6AGhvqJPIVIZQUX8SPDVJJNrJvOgaEIRjhWay0QaNUhTtW9lLX3ViMS7eHQva
 dr+Vg5tSmaSQG+9E9Dv6mdHW8zlHcfvBTk0crDuBuDFWQhzZIAvDGutYtRymrlE/Rnw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aSvwdkuR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=aSvwdkuR
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D237D80CEC
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48b02b1b4cfso2246123f8f.0
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786356; x=1792391156; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ffXCavU9pvbeQvaO7sKEKoykJcteoD3MkWHvfjy0d8=;
 b=aSvwdkuRLWvD2hXbQ7VDRSA2N7jYfaE4Tph5byOsVV+mr8uy8/O+lUxDQgS58whj0X
 7mETJ55SOUq6eEO6Rx4ZKv/mlo9S40/9dn1L0CCyR80UwAFFTNm0iEe7/9D/IVn0nCAt
 VYY5R7csPYvlUN4aVyWvh/TsfctBxy0m3c+6ztgBL6NS9ZLCDwF3wXF/VeicQomo4+9Q
 Y2lKcwoFBkc+r2ZCj1BARSUeRyaQPbLjV4kf10NTNJcthH26qrh/kgCqA23nAbveOXI7
 jjR/ioE7UFjuUO6V6lqLhAIFLyYLMxWNe4CyZSxJdqDXnFyww0O2NGsA7cOdD8ZS3Y84
 w3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786356; x=1792391156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ffXCavU9pvbeQvaO7sKEKoykJcteoD3MkWHvfjy0d8=;
 b=YCz0rR3NWg7WevOi5NcvONF+zInVHnDu4LqhP4ciQvmvwAUAhwWLyBKeMs9zSC2RXm
 16vJolX+KBRT9GTLydRXkjsmUos/9aWl96cOjFFTYlvyH79LFWzoDriI75NQ1Q4fSAYe
 R9u1y0gLEtP3/qjI+bVyRwws8n4u8FcBzZq50dKlln59gB9X9FEWpdOcDkbTGMH6aUBU
 ZGR0KAE10wo6S5HJWvtZZyptoCpLW4/WKttg8ukm56SWOjJAK5v3X9o9ENeAGh8BWSmt
 cckTIqej/kfd4Ii2qWULXsG3MShxRrix2XuZFp0b4RAAuGb+gvlm32+y0C4TAxzcngT7
 rlIg==
X-Gm-Message-State: AFq9FYKoqSiKXy2RdK8IuSZU9moKlxMqbVqepqLF02O0pok0sz/Eb2cO
 PraUucoeJfbrYc8zrLVOb7lDJflCV+c+/XrgJt4fbPJs80Z579oMyWJMzz5tMA==
X-Gm-Gg: AYBFou2ZOLzth3BXst/1e1Y+ALokqVqOcOJ7dTqY4pTGG1N2NLMm5kLHsLk8ECSfnZj
 c0pZQGRv6ovnlyySTAIJ1Ckw9242VE5Nt9yMa8Mxnkq7BfAjPFmoa9QdXCLbaurEfvtd351LCqL
 nx0iBMOkQ/Wc9GGdluDIAnYmPqYsVEegB7WAQbJSh51UVQZWITuAYmCClyMq0CEmrqIWnIlD/xq
 VaaxdfPAIE5befy+ghRJ+NKuQ4n7yN+GUZRTBbsT9su/StICCBorQ35TbDMG+6nTsYqcUgA1rKp
 6wQ3gWyxPd5STQRCdyXbuoCJPH3sNWhigfuWRoo2Mimly+k3i50R3uljO9HdNbpa+OYlC6P19ui
 8tt5NIJK6I+y7paA3KxRHyV4a010jxLVPsoKU0hcltfju5ePB6aHxlaFNtXGHzq1Ys/+HWCIdBb
 gghVkCBMr6aHLRZu9osG9VSVyenQq2ueymooB8yCX18uJWk46tUmQ15Rygzy4NPgPmfKhvRV9Mq
 cfSuI6/B3YxG0copUY7TMHvv+sMsWM46Ne/ZFV7
X-Received: by 2002:a05:600c:c10e:b0:4a1:93fd:913 with SMTP id
 5b1f17b1804b1-4a193fd0ad6mr78791065e9.10.1791786355609; 
 Sun, 11 Oct 2026 23:25:55 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18f3b43efsm311505465e9.1.2026.10.11.23.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:55 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:52 +0200
Message-ID: <20261012062552.78913-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-cqueues: bump to version 20261006
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-cqueues/Config.in        | 2 +-
 package/lua-cqueues/lua-cqueues.hash | 2 +-
 package/lua-cqueues/lua-cqueues.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index a8c38950c..22e1bcee5 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LUA_CQUEUES
 	  Continuation Queues: Embeddable asynchronous networking,
 	  threading, and notification framework for Lua on Unix.
 
-	  http://25thandclement.com/~william/projects/cqueues.html
+	  https://25thandclement.com/~william/projects/cqueues.html
 
 comment "lua-cqueues needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index 5803a60d5..b2033b7f2 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e112edd246da5cfca264314b70325a0b63665cb87a00e45ee3ae4f194000d52  lua-cqueues-20200726.tar.gz
+sha256  4a6d45982ff0b916a7c71fb1a9dacdfcd67f1f0fe828ac0fc669f234d2f8e7c4  lua-cqueues-20261006.tar.gz
 sha256  5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 6d842eca9..c909d2587 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = 20200726
+LUA_CQUEUES_VERSION = 20261006
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
