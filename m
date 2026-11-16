Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6269606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iAiP+9Il
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 845384087B;
	Mon, 16 Nov 2026 15:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRPe2RAtxN14; Mon, 16 Nov 2026 15:41:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8BE634082E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843660;
	b=LYrhrIO+53yYnYEax/dJar0dnZcBu1Bv2TiOkgG46EcyfVY53yc1TTmVUG23PyI1XXiD
	 h8YfiweEyM6HMtHGx3LJFUfv3ElPfggkEn2NnTjnM6mwjwW7ECIlADoD76inHtpkdKzet
	 6P2qA0AuuF9L5A3dOOC1AV5ErA1S9eL3ZaqO7e3pOYw0x9VCSA3jb1MSqX2ef+iKEM5iH
	 XaIZD+CTb3WfCGWhplNLAjhzYTShP3lOgWh4aq9p5F1JPZM85JjL3TD0naJ3Utx4xWRzN
	 ggHhERO6ywXXntCY4gNYsK0HZySGMXUloKAiFiAA/Q/b5DWOIM9RANcrSnXXpLoBwKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ApR3D95pKmzumAMxvSU6CL5VWHekoVB/DZRkJVPIsNc=;
	b=OaL79ldu+xS50CHCr+UhtZOPMKzO5eosV1uTxfOc6VCVbq0wC/pZ4qUQ4oB9NXblyZCr
	 /68mLMdIlYO4C79Vu20vqEPlqy7kS4nTGjh1gRHevj/1yZpHmnyXRxXm6BiqZvfUqDr47
	 AioXGT+akJcnYuapab0M0Ao8FeygUHCAwVdJ86OIG3N2BytuPhOfIXwign0qjKSWORRRg
	 8xSmLg8Yp6EC4C0ZP4cqw+P5YvXq0Mu/7rcKpQwlU7FHJLAXnPP/XWA5Xx/s6+hmiKSFH
	 BSyTMVJdCan6sEv4Ng6xgnW/Uvcqe4QEGEOVS9A0lOFnB4GhmAyuQ/wg0vRjRKjXICQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843660;
	bh=ApR3D95pKmzumAMxvSU6CL5VWHekoVB/DZRkJVPIsNc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iAiP+9IlzS2y9uVLJTdGxDCb4ZgEqhnPREedw8PfqHdkgVqgoDGm7EBZw3W79oAty
	 LyUaR2wEvuzpPgNtYSSghC/oOQmk7SWGNklvzLZNxtk3M+mRReKesZvr0xDcLAL+29
	 tRef+6+l5mgQjkWuJyJ/1t51b4t8HFrW5ppWCfM9BKwXv1N6NagIImoyIhAuU2DwNp
	 0v7BHnJqDca5dQ0NiA43AxCkHXNVajDZzZe5d49ycfg1muYM74xzLPIm8+SsD7VGT7
	 aGtYaehbvP3IETQXYpaP+JxnTTGRB0TGjQP3JK2EKciNaeKJ6nzKSESG5Ibml52A/u
	 KZbvlCJYlAhHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE634082E;
	Mon, 16 Nov 2026 15:41:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6084109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7A9980F0C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTVNvmDttsv7 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 911CF80ED8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 911CF80ED8
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1796089f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843655; x=1795448455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g0u4lyMpWHFTcsuvzoPSrp/YfG68E+BNo7zLviHFNaM=;
 b=nOP4Ol+HF+YnMnu1LAFJapC+syehFy6+9nSj5qTMRXyXxHfBhKtYodHdYCLmTdB2XI
 3112WqYThkKDNp8DJN+rlGFXssCHJHhN/IR5igQe8rG6aeM8Yq9UbYAcoPAcjC3eUpIZ
 Hht4HLNYRMDsV3LHE79c6X70LW6bIceIzJdQiN0JVeny3EpDnb2sUpBCbDa6cXprTJi5
 WeZHZU5hDtrn5xiGiiAPCOiwYLol5rfXGohk0zkHW5V3opUU8McZxw4dZ9amDbQFiY19
 OI3B4lBX1UA20m8K9wSXsY+gvYtAC225l3V3h/VE5UXGGZA+c3/7c929ZeFC/0l8uhwU
 kL1Q==
X-Gm-Message-State: APuU4Z/sDnPNaugLBPKewBi2oUpcsn0oQ8WMXvl64dWuGHFxNTH6unpy
 Edqrv2U2y1POl8tInPat8U7Qh5WrwoJFfUJxqb+jyvFBqsWFX79CZu4WBvhR5ettPCdqEbzQktS
 qJHx5D70=
X-Gm-Gg: AZFdTZcTHaYTPlHH5g75mXTlfdTdISCGdB82RBQXI1MsQawA6SvEUPUtFNkKGN1ZI1c
 7ugP0kshkJ/Vv7VSIJ3VpC5MInyZU96gpi+y6dDY/Q5bMZOK5otvX0gwCS+1piJwH7wpYeKiLRM
 WwrqbWbSrS5ll9LLp+T6/Cl9jZVZgtm6mCGVrJmaOmz1TFT6Cx+lQrhbOCn6nRbhv1apznksgbd
 aoLMy2ZzasW47rzuJXjlti/sjxdyHk+q/+BFxSod4QFKAJyTGGxAlDqu7yWYnf7UJhMJYbETZaL
 jbIab4LNyTPKUz52uOqKxHhh/VTgXVEWW7EqoLkdUFeknf4ejjDWFcrItK+pquR/EMnYYRP7Z2l
 kb8e4h28tr8KJhakn9Qs/fPtT+FzbkDqZitzy/+h8o3CLyXd3WWgc+7aUoYcSoDwyy2XqBXQZ2m
 G+D18DhkJMFIm77nTZ84RgYhDjSX9nmO5gtmZ4mIiMG5NRP+knCqTf24Kj+bPK7c0RBodEJNpXD
 5MPAzN8mxbom9S8jKp8wKU8Vfn/X1yAM9RtrIKYauPv76Yxthixz7Z7nuZ6nC42Ads5Q8L37gS1
 kKSr1KJ8gEY3hYvCEJrZYy93x738fiTJ
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id
 ffacd0b85a97d-49c7353c415mr22849713f8f.45.1794843655376; 
 Mon, 16 Nov 2026 07:40:55 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d03b10fsm25649541f8f.1.2026.11.16.07.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:55 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:52 +0100
Message-ID: <20261116154054.726186-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109161949.714131-2-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 2/2] package/python-django:
 security bump to version 5.2.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following security issues:
> 
> - CVE-2026-108147: memory exhaustion via base64-encoded file uploads.
> - CVE-2026-111211: log injection through geometry form values.
> - CVE-2026-111362: SSRF through GeoJSON coordinate system references.
> - CVE-2026-113593: private data exposure through cached Vary headers.
> - CVE-2026-114582: SSRF through SpatialReference string input.
> 
> https://docs.djangoproject.com/en/5.2/releases/5.2.19/
> 
> (alternative to commit 5b5c1c9b6b4086a405a5a2a8f3aa64e018e3697c)
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 9bb445877f..30676ddc60 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  37d9504be21272595b91c2aa3ef4904c  django-5.2.18.tar.gz
> -sha256  461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d  django-5.2.18.tar.gz
> +md5  48e88356608f080fa460259205e88487  django-5.2.19.tar.gz
> +sha256  ad03d8abc51dbff95ebf34b27123cf0c26a3b62db7ba0cd520783686362533d1  django-5.2.19.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index a94853c518..d36c6b82ce 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.18
> +PYTHON_DJANGO_VERSION = 5.2.19
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
>  PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
