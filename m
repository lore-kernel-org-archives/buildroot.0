Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1CD606A326
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ASmndQh/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eBHThiGL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A6040638;
	Sat, 24 Oct 2026 18:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmOC0SY2Js86; Sat, 24 Oct 2026 18:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5C8884064E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866560;
	b=bHFvWObhJu9bH3nVCxbQaQhYvMWhT/p+26EjmxfmHuIYfgAJzNzXlAM095i9LW12ymB0
	 LIjo1Mng8l1gU9rXsJtFPzActdMKWiZ+kcflUyq0zPaguAZpTf9rxtT5l6wW7pU/bqobe
	 fo/afM8T7asZxLmxBq7X+FXlpCM7ds3FVtT5EOGgQwBG5GbqnHYoxspwAiYxcT7j9rPzq
	 03wO/j8dg7lHUwbPMHADJ6O1LXbHGP+9o7HaIZy8qeYndmyd8Cm7NVMCRL9+Srt7Y5Jum
	 19tzNS6aWeMh3k7o0ibpSJaKr6WG6Kzvp5BAePSlx2fOGnFdO66X3r/4n43nE1m4M8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GJPtFSHZ3M2QJpif1YJjT6Mu0G8HdnwQExpbnuH8zG4=;
	b=apYYw+0BJc3oxxvSJOcjuSnMSq5Pw+A9sixQqvxNS9KL/Pk3xSg2uXcYNj3cYcaQHJuh
	 LYvqIc1u5OoG4WEGgdko3goqcpUaFGOz0odw9Txxx1EGYk/XRFHK7FQZvrP7Pu6NPXt0m
	 FaRGZi/F+xzifCWTdeQVmku5aqYiszGmSNj7d+9SUB7JXj1TQQ5ntR5q2WeLTu1MXzJ1u
	 IAyqcvvjQ5NMeCQx2NDbeoTl3Ta+zEcmq2TwAtFiCzZltYcz7x2zcL3jLsRh4/dm9JsGG
	 tN12Luv+eZArzudAdvWNqoODnVJcq9QXVVy1cu1+/iHD10BWnnCR/lya9xrEy2hc1KQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866560;
	bh=GJPtFSHZ3M2QJpif1YJjT6Mu0G8HdnwQExpbnuH8zG4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ASmndQh/haVuVA+oQgsbib2QJHmilzM4PQojimAPC6112RphvP1buz2B88zmfvCdB
	 lK5Fbs0gN56Q2PyYDNsT7AHO+x9y5tWPQDihgk0udeZQ41ehbWMNmxHXErTldUvGsf
	 rzxna+vnCNptoAggb6JGoWdI7KoI0f4RlH4S455AyBuIr1AIQlRPoIxvF0uZ1ruSQg
	 VO5QEI3kZYpN/jdJyf+0I6hiJ5H3wpePxSpQHetqEOjFlNkh8mT67JOaG/wo/46Uow
	 V5QGzfdJ7CLQde46iX1blRbsc2J0+lACTXHtU+FjHDhskZF1R2mIrNEFKkrssKKxRd
	 t+edaJhD+Ot0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8884064E;
	Sat, 24 Oct 2026 18:29:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07F494D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B137280A54
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64L0Um1_WEQM for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CFBBF809B3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866558;
 b=OY/MlvrhXLMak6FolAtXIuFMosbCqPTMvqDseebhccHD92Bgv2UZOA60AxD/sHznAe4J
 H8V6bI61JLDFx2yk6DqhxdeCkZ8LWN946bUiF4ej6gbSxkWPr9nDz7mDeukHRvDo8K/kH
 KXcWrcOC/NxErh4H9zFt5Dn179HEFTWH7jGfQcY7olgFRlsyYF3CiUAMobS0iDujbehl+
 MmUmtH1okwACCyftmshm7fMrY+YQT0mZc+M4QIlV5N3mBfZ9k+jOhl9JAubYJZqGYrZ5E
 G1fLr5S4p/1SaC0LzA3pb02Z9S5EDeYG2rd3daIYAjGmvSeXoaBdeEqI/bHy+b6oGQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866558;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=96x0YdL7VG4ns3LoF/M9vufJZXLNo4HudIb+eFFTgY0=;
 b=pjOdBGzNuIBE71vXg2t0NCWNfeahoOfzULt0rTdSYxBt9P88ZPXLFXhbYFVne7xMgnb8
 ZdZNBEL+J5pUxM30gEPoaxRQJmuoXLxMhfGvifFf0wUIx+BIZ0arhcZMxud9KDA8oeyix
 W94tv0kz4Ir6gJ8c+ElZnx+Hy0Q7B5za+KPk6ANc9ieupuLrU/WxyWSPzx9E44d9V9/zF
 YF1myP6CEbV4I4t4gj6skCVS42IU4APZybtdna7emQppzNt9hXp3LjZW5IBwEbQ2ghTxz
 YePQbQD0YqMc4XsYQqrBvENX7U8XA5CGNqtGZrDO8ZHqDKhAqayNlubZBo69qIdfGTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eBHThiGL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eBHThiGL
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFBBF809B3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:17 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6ddef424972so1068010eaf.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866556; x=1793471356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=96x0YdL7VG4ns3LoF/M9vufJZXLNo4HudIb+eFFTgY0=;
 b=eBHThiGLyz7V+QvmQppf0VOCesXyPjBenVjwUGV3nOjEjVUqcfPWst8eTUSje/FI2q
 Pelt83CMFADyrUApCdceYhKMop6Da9Eg6BSo+mmGCEzHik9tpGSMSFQy7GttfIfLlK16
 ZWGcwAGlq+XKsY5OxM50DsnhD8aiUL8j2sWK8x9MlLhQmRi7gpvWahY6bVV5h9y/DaMA
 6NM99Iq2EGmlbtleb2lm3fNp0n1GX68+DfY7unpswruaL9Rx0obSXcDtdhoQqbpU3efe
 xKgcd9g2OcQDdpDp1viIlhRVeqH16e+9j/LEpudI0Lv8QtF9J8tLBaoRIe8n96Dmxs4Y
 TSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866556; x=1793471356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=96x0YdL7VG4ns3LoF/M9vufJZXLNo4HudIb+eFFTgY0=;
 b=1yMqaPSvcf7BMNz1BakLcQoHBaBuYqqJJv8sEwk2K+mWaGxr2EF52tiuGrxk47mtis
 rdBjJqoTwnHoPS9ub3rvfxlmk8vm7zb+Nrz4Repin9iUBi/3AgJo5fvnELUlvY7dD1Ge
 bgVwj8T/q8+HR2UzV88VBA+3NlHVs+eLkZvEziklBWD2DKyQeP2ntVCKOhjiANQC9G5M
 1cGrE7uaHYHXcwddd7agEVavXYw6NgtK+xss5AUW7kwrmKbWeZRPvWFm9STQ8zeaxmxw
 YG5hze44WfJHD0ZgvE7FjZxIJVvWvqa6HYpCQg1wnAEa4LuyuZrQMWCVH4v2eeOcUbWj
 N5iA==
X-Gm-Message-State: AFq9FYJiH4M+NdGFHu7LYHa0Bh/VQEvl6RLKxs7aGyD7558BFrKPYF15
 Ha7ukVtJFUfsrOk9lZoB0S4/n/5Qdx9LscHCQbXIVT2WOMAtGC/WJPESWQcXmI2J
X-Gm-Gg: AYBFou3ph1Sv1uUGX27IqBKby4ifqwYBM6GNYttp9L5Hpiyx3+/YIfiKsH9TjK0haNK
 sQOWRVbSWaxSXKf3cyxplCVJMWhhRbq2LIQiEzo7wD/NmnmKEB93ePgEKWeTNc2BbJeUp+AstTM
 i4fbg4prpqf7uvECXfKvamOEtDR6T8zHFLurdqYXMJqAkHedJH6Sv08xnyyqXZ6G0pq1wpM+3K/
 bwpVtDB0hn3xqcmYGI6yc+HyQK1JMKLReLpHUJ5A5RYN9SFup6/rG32JQHIXyEuIxJ0fe9G6WZv
 OTKJ/X6zD4QFdbdYWROAPRbQbnxC9YrTOgKTTQqhwHLVEAY2bPKJIkVNfz7pnjHyw7qk/soUOtw
 4hY+8XT7LnQGqhhKSy8i8WPwOFveB4s9NOFAZyl3rjQHnWdj0phLwwHd0U47WdRd7mWxMVrxqyy
 vmczEu4szNSXZFgSX55kPR9c3iMv5ck/49TqKXMt5Sx+8/XkwU+Med16OHwmLfUBZylUMJLpSQu
 LIXA1zaBIbf64yM0GUcvXp5lYkfEAmcGGwM4oy6JcrK+gWJbrddBDMg4jufMncUaj+wibExxdW0
 Iqe0K/rVjCbGHk1PKODPe4rviV1WL5SSxmJRIkyu1vpOCaHGypXAhXkPcRIwNAixqXxtgf/LwNA
 Hu/fLel1m9bKaM2CV4eVyvmkAHIJm1+41eTiDxB0cjP1zmvw5iqjDpl/51K749Y0LRMyKluPx9V
 /sk3sn84aSMiZTbQj/HOHRFAYJ
X-Received: by 2002:a05:6820:f00a:b0:6d7:8f37:8b99 with SMTP id
 006d021491bc7-70ba084f9femr1241429eaf.0.1792866556364; 
 Sat, 24 Oct 2026 11:29:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:28:57 -0600
Message-ID: <20261024182913.1957467-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.162.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index ed222d8e6a..8422f7684c 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  9319a9bb00c891dd4d6df45dce5b34e6  fastapi-0.161.1.tar.gz
-sha256  4076b88434452e20289379068e976c4a04c65ffc8e6be31510106e150a422f0f  fastapi-0.161.1.tar.gz
+md5  615d6ffdfaec36a6303202c48fa9f676  fastapi-0.162.0.tar.gz
+sha256  6a22c1e2e6e32e0633ee7e170f00009a29b8228b16feb219ee42f32fd8d88a8f  fastapi-0.162.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 547748417c..9efb3b23b1 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.161.1
+PYTHON_FASTAPI_VERSION = 0.162.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ed/3d/2cc1a0dbc2dac6e157b4ef12bac063e1016cb7c6d7395f76665e439cf1aa
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/e9/eb/2cf8c80abf09b2800aef0a83b41066fbfda8ee5495b7a08b9d1af40f7046
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
