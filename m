Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A2606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HFjGCYvw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PlJAOOQn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F124812CF;
	Fri,  6 Nov 2026 19:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MOLwBOYoMw8; Fri,  6 Nov 2026 19:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AFAA680BB6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992551;
	b=ktmyYckOMG1oaYkzyYplZCgknajkI7xA0mDT3ZNLPlpJFx3AyLPRlDw+fuquFkal2N2h
	 A+heRf64B7rGxULmwaR75N35Kq1L7XTyzMIeKYgeDhAsrfoIjYxuAKmoaF7qx6hrLX0/0
	 0ToelGbDYManbXwugPdw7YLBrbxWAgFmTo0Bpe6KkpcDlHAr+gZtlmCdpsk8Ww7YliEfM
	 56DlWYslAllqwSR9i2rjwF9gGka7csdQuext8/kpL+xyZ0qe2TY2eqNURWdGoq9Ydh1R1
	 K0z8SmFyc7kHQu6tRxaDCW5ZtJxzeKmJHKEC3UGmncIITXAXCz5o5qhHbkvkYLQ6CIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992551;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tosv/l8DhMyW1rnUnxajXxj9BC6QiPcq37fq4QE5Fjc=;
	b=mWTF7hTOY4Y5GCRU+OKGVWpifEz73UEZkTxpf0ciRtgbU8ODqNnkpmlBEOST5JvsKQfO
	 zyT/1Ni/4nzWkUU3zFq097UWUDfzgrzRe3K8/4SG9HqcdmCWRaA7YgdBA/cCpJxa8KKV2
	 r7qeld5GygTcm8CiF22KdiQXkvtvmgNtSglo7XuH0Mkg/E7IasJaElgiAKSnAUKhl8RsP
	 v0L6Zfgw/Peswn2HBKdaguSAJNwAGK5hpkgGwAF5VUESu5XctEx53CGQvB91hNcmeG86j
	 RrIh49uSfwW+Brzd3n4xdOQw4YbOrX8G/IzBeYv0JJ3M41PCtXfPW/zrEwZLxphPtbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PlJAOOQn;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992551;
	bh=Tosv/l8DhMyW1rnUnxajXxj9BC6QiPcq37fq4QE5Fjc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HFjGCYvwbvZIuwESZ8PeCFQE+tWBR2tsD5SKl3mX7ac7PVwn/u17qmQ/iSQqa7BGp
	 OZNpK483lwZvmGUTyb65qB4UwA1XSrB4jevy6oOiIWsf7T/GR6+2tXv9LlVHATkaRS
	 I4s72fAial/aRF92hb5zoCOynalblbElx3zPuXjmBOzRjYLpY2dJSbjxDRJEwYMoa1
	 p27iSCd/DVB0SveBw+6gpVVIjICjYe8/UK7jXdi5/V7HKN54TWD4BsvdrFZhzy7igB
	 RaQXfxTVD89tMsgf1aUP/BmytAoZwnSdvqR6a2YjIt0ll3Pbp4KP1AHQ1MKHi86L4k
	 32HnGyU4qxwIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFAA680BB6;
	Fri,  6 Nov 2026 19:15:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F37B4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1166480BB6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCVg_VNY4GkX for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FB54812D2
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=PlJAOOQn
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FB54812D2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:48 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-8490a7d6696so690501a34.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992548; x=1794597348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UmzY8Uw1r4IyO0rtCUor4kXW/ykP4iZQNe8LEmh/PE8=;
 b=PlJAOOQnOPFJA/Uu862FCs/E/YKvcaLtlVYjH1i6eqOJ4Ur81kb9U08thjZaWDPOkU
 JpCv0GQgJWtVA/PsIjxRvl9n+Y6DCLfjOxWshFR/9KyhpKbUz5B+g61749na7KmsGnp8
 BfQzHHWoVGaMV0nK/6aR6nhfnuW47nAMsrxH/KgPXZGw0KlTX5LBoTr+g7Yx+FPe6SRG
 /EaAs14UvwvuBdvM72LAr1J+SOWNeKEfdIkxpDSavM58UhrgsmWTv3pkEn5m4uajMbJp
 ME1Cse5DDY8O9oliXkPaib38YYIooCc2rLvOjdbeZiQS5xD1jK5+wjYJDIa5FobZlRZH
 qoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992548; x=1794597348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UmzY8Uw1r4IyO0rtCUor4kXW/ykP4iZQNe8LEmh/PE8=;
 b=tHqHhtBRDvQPuWvAGWcupwfSVXXcdougr34+NYrtXsrK8xsVJ0O6At3TUZYYk45waL
 VI+muUIqli9a9Y6mnWm1HIh7qrN0yv0oHxZdma9Tnr8BG66FseSI9s0ej1aEBIouwLOK
 ADCa7GGGx1oGtSn7YZVKVcyY23x0iSdRbRgx2VGS8UX0wJOqAdk4EDh/K3NzS+Kr8e7t
 Bd1biQ8IoQPoHKZFa59IIKgAfeFEjp/7BlsvANOQMp3H9FVOtv64PLe6ZvXjQLiL1ayP
 Q5cPlPnGA7QuK2GAZd01e7RwiI39bHexNrD+1f+llkyrKGcMbjA3c6I0zuVit8M7n4TC
 0YRA==
X-Gm-Message-State: APuU4Z9OK5vwZMGdgHaR/y1mkU73YsI3H1REgHerxNeyuEb5YTBjcJqd
 jlUa3tGfAAfTriUelvNca1vIzOaQBl7aTgEsOh6ha7ESJtytzu0DUHy5mfcPcQ==
X-Gm-Gg: AYBFou0x514OGGq+KkwaaUv0bu0tuf4t9zwYf2kGfu4gedI7I3BPfqmEY/S59JX8bjA
 WDdrIybL6cgkDv+PUqAzUfIhmasPU7LmUGfcQr9l+HQu2SmCLxz/3UObtrj8iPxoHl2Ozh2NUYc
 /SsdF1jD15quSeFCupcyMBwCGWkzzRhyh2tPPZwCyrq0Fm3UFJuXdwIqzm6PIcgb5JV348vfntn
 yDdBLqvVaBRcyN2WLbUyTfunaxxqaNwcZutI3rSg+LovWHj63fL7y4ohirYdlLMJU3/IAOYteLc
 t2AhIf2EhfIw8WTnjeyflX+/y4jtyD6JNzfa/WbQgNK4xjEI3xgTwY0rNpWkvJs4qiNyLYucFNQ
 5jGshGc8tlCe8NeVj9hr0xLiD7aKAYsmTTVnKm0Uz3igtFfNQKLbj1L8UfD61K3i/E/dGhupifK
 Fqcu6Gqmr+QXg8yEGS711ue9IfPLgfrSzgISsVVug4xks8tK1/xSrUg6udWGQ/ei1NoUy9Vt8d0
 +QgjWO0xC2Le1UfY4MAWQwhvR9HafEh05sKjAOm0COuE4hVFQ5qN/hl6heE6Mda1tcOG4+Nsjoa
 oLUzPndpj9Kgp7KMRhM27+2NToITKJCgMRn7F25R56skI3M9vhcdY/bmMqx3h138LPgZOMPbGxy
 9b5aSA5f7xk0L/LnyuT3vCACaf856dHs6fp0djIdMot9BYOm/EdFVl9alzz3oLV3c22Dqcg6ZCI
 lvV620QeHuzwlCT3FC+N0/4cR2t7M0PgaEIHZO35CBRzV/FWbT/+QhyfvWqrYFB2KpxpoWFS0WY
 w==
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id
 46e09a7af769-85f1d102bf6mr4184542a34.25.1793992547772; 
 Fri, 06 Nov 2026 11:15:47 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:27 -0700
Message-ID: <20261106191536.2120153-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-apispec: bump to version 6.10.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index cd3a0c8aaf..b36bd571e1 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  847fa44044377f3e52bf15abc471fe8c  apispec-6.10.0.tar.gz
-sha256  0a888555cd4aa5fb7176041be15684154fd8961055e1672e703abf737e8761bf  apispec-6.10.0.tar.gz
+md5  06365fb40f68398ae69f779d97863d94  apispec-6.10.1.tar.gz
+sha256  46896cb0cab23b4e853e528528937719739f836358832bb8610edd14db1d9c01  apispec-6.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index ddbb211244..3ae771c1f2 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.10.0
+PYTHON_APISPEC_VERSION = 6.10.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/4a/f1/1f5a9332df3ecd90cc5ab69bc58a4174b8ba2ac1720c4c26b01d20751bf5
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/10/ae/da295e3a85bf8188dd5f15e91e245ecc946c9c6af319883baaffd37f1b6d
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
