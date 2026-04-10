Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A99F36BAE
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 06:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89754401AF;
	Fri, 10 Apr 2026 06:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm-ND0RDQy0d; Fri, 10 Apr 2026 06:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6D0402B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775802001;
	bh=iCp/b2LeUv78M+PO60AOJx5XkgG5W8YZ0bMje5iH9rU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=piTZRo7htTiFkWgPjDYYkTZ/o/7WVlL+sMHHPi+4TR2v2K1CUwnH4aBQvUb7XbOhW
	 mA7QYDoGdMjOsNrQ68c8pVrowCKRhNcWxiDeHxyhmOcFXcbcI3/5LiIpIti+MkxcP/
	 GY1XTjnjglsYszadnVOt/Bo6hThbsPMlCvsQLOgf18mxO8sgl8DFx9qMmWcXi27bGH
	 CdVE9ScNa4f7kEChsihoP1fuJ83wUHbLFkQxn9h91KyS+evY/4JXhJ69JqXa/Ia8y9
	 rhqvEa8ci8hjs3QAkAjcJBoq2P1uWiha9HaD19/C36uwyWZWdxBKM15GsAtM0/uJxR
	 9ZTUtYwPkYTew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B6D0402B5;
	Fri, 10 Apr 2026 06:20:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE7F237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE9B54030F
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGJJLC9Qm3lE for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 06:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B321340313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B321340313
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B321340313
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:19:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so1216318f8f.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 23:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775801994; x=1776406794;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQpH/FCwlr6wNnkswoVmcjA4MUwAlQ+4DrKwwm9pXhg=;
 b=pVs1MCZh3s1tKHnBlCauLnqhj6PMOZvYp9JFRvGRslsn8w+cYJsu1aCaR/bH0Dl/Fc
 sC1hgRkjmpRalC6sElkw+qpqlfd4dQmvRWIveR8QZ2kzyKevR2fTxrmpNmiT07Y19tq7
 d9qIx04vwex+Bg/MZrq1yABws/e5biBSDyeiTuZPc5Rxu7V5JTONGN4GD+v6wn/BdCIX
 +2XZ6qSXnEBVzL4dpkk15d3EI2Kg80q9sWHh0tAxcC9gXRw6ckCxgCTGiAoAaNynvKL6
 HK33mp72CaszefI+2c/gHCTnXvw3bb+XTYK810/SgwK+1j+0+slL/7V/jaimjBelLwRj
 ScIA==
X-Gm-Message-State: AOJu0YxzuyoXSC3d4bTMYrF+yNvA1cTsbdNlcsJAOEzVW+oUYGnjvfko
 ftDIjeEqZel1Zj9gHI32hFaL0pOAfRJIVijUPUNEYK0H3Q+d4Xg+j6ccBrI88x9eLwHdU9Y79/g
 jp0KW
X-Gm-Gg: AeBDievIBGyp/8dG0wikGrmDNS7dz3svP7qJOR3E8wPtL40qXCI1+NYLqhsXUEywY/l
 kSvcderSlcsZhu+K8SN1qVoMR5m3XUz/uh6pclwe3LBFqhL7UVAWlT7oFlrsmiC5yadSU8iLVdR
 QQQ+Ttdaw/wEvRYuBKvEtObMMhxVGzQhD85FnTXZGfM8tWjCdDJDqP7P9xLuDlbYurwp2al23q1
 2Y9Dfs2IU1Mo0YTN9zcKXHEWeYQfqhtiLNWEPnTXwf26s3c0EasUF0PBP9yzOhmKMk6yCWnYrHM
 Ljn2lxWkua3vTZEllxMUjz5DEDtafNB4WLGLQuXNcQ6AZVcYdHLr+Tf7EAq/ibVdBE1+O/m4jzI
 XC7GeU9jmgpQ3dr1YoqWQLzrPSvRrlWTdloC9hOYdUSAp8HBQFK4bwJztxkwrMQmDIbesQ7h0EX
 7dEKTljwE9ho+MWtH6piQJK6B1zZ01lhNMYEOGIIeR6TmBEmXdVEcXeZz6T1JK
X-Received: by 2002:a5d:588c:0:b0:43d:1b3c:83bc with SMTP id
 ffacd0b85a97d-43d642bb20dmr2586273f8f.48.1775801994018; 
 Thu, 09 Apr 2026 23:19:54 -0700 (PDT)
Received: from dragon (ptr-94-109-198-162.dyn.orange.be. [94.109.198.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5c98fsm5182837f8f.35.2026.04.09.23.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 23:19:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Fri, 10 Apr 2026 08:19:23 +0200
Message-ID: <20260410061924.1759312-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775801994; x=1776406794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uQpH/FCwlr6wNnkswoVmcjA4MUwAlQ+4DrKwwm9pXhg=;
 b=dKugax4qgnA0tckjhYjTDaUCDCy8v+adGDbeycuNIBlIeF6bxFhMhL8c7ct8O8Qm5C
 uBXqPclgzG6+LgZd9qPwIV3qN9NOo/1pZJAYMBHgHfakNyup20ze1a0Hs/AwqiXSmXIX
 MqhvvTaC97/2LYbilbm5Pw8cz7Is0Zl5Z9rja+Jo8NfLfSTC6RRF3tHU+YmPrWorAikn
 3brr9fBGgtnOMrDNIAq94DhCncn/x1Efr2KVJXtDXCWqSc94AreoOvxWj7aCZNJdDMjR
 tHq+VCwcuN0ccCvEiSkotwVfcydpnnan3y0MMEKC4+rV/qdcNYbJznNmqBgn8zufbJd3
 Vb3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dKugax4q
Subject: [Buildroot] [PATCH 1/2] package/redis: security bump to v8.4.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://github.com/redis/redis/blob/8.4.2/00-RELEASENOTES

================================================================================
Redis 8.4.2    Released Mon 23 Feb 2026 10:00:00 IST
================================================================================

SECURITY: There is a security fix in the release

- A user can manipulate data read by a connection by injecting \r\n sequences
  into a Redis error reply

================================================================================
Redis 8.4.1    Released Sun 8 Feb 2026 9:00:00 IST
================================================================================

Update urgency: `SECURITY`: There are security fixes in the release.

- #T1837, #J1474 Hide Personally Identifiable Information from server log
- #P936 Cuckoo filter: crash on RDB load on 0 buckets (MOD-11593)
- #P945 Bloom filter: crash on RDB load on large number of filters (MOD-11590)

(And a whole lot of other bugfixes)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 1ac1b1764d..e690dd1eaa 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ca909aa15252f2ecb3a048cd086469827d636bf8334f50bb94d03fba4bfc56e8  redis-8.4.0.tar.gz
+sha256  0e7c150919e10c630d6e806fa7e65ce12aa90ddd0805e459b7da64ee65892805  redis-8.4.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 36a13a34ef..fb166b6f49 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.4.0
+REDIS_VERSION = 8.4.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
