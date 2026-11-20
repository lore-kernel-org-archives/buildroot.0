Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F4606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RlK7qHAF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BC660E4E;
	Fri, 20 Nov 2026 09:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njYx20E0ckkL; Fri, 20 Nov 2026 09:59:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AB9A60E38
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168755;
	b=SEh4nWMmav4A5dfWRS74DrrP3WdgzrkbeP52bUkTyj6gSSKHu8RIJo/BsxVgwI4BCVzO
	 x2IZJ2rOl+FGaUOdjBTXlMMfIsOR/wZD8cn0hexQ5JY91zS+plfo8xRoz2qmmaHqUAGI3
	 JvGt7fpCh5lIkmoXnyaEPWQ2Av6ka1/4cGYF0yiAHXGwyDKY3hst/gLvI9/ZyXRvwf+a9
	 WrbOjGm/9r3zTSZIF3LFCwsVebmsuuAU59JDta6tNFhRgQ7exp4UC/Yv3jgFYg7M+SaeB
	 VLCmTq7+fxZol2szDp2KMoAiu3F9Am98hNFcj3V8G1MP56LwKc+KqVrb+v3xV4LAX4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168755;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PUe/uDMcRLMIcE9BeLZdNjz76Q9Vvmw67Ac/0D5gPlo=;
	b=RxXoAFr98q+PQSF/Uz5cKiX86wqOPf6r4URYuX7KA2ZAt+vFnMlRwd2DQLprIjFubH9Z
	 pWe63kMPYpLaarfmsDmIDH7n3Rt9DSCB1UzbiF/53GQRPg65dgE2dHYkEq3L6Ohx3VkmM
	 wqXgdEJf16xx3IbhGbX0pfw3h9DvwYWtSqBuNvhBxazwghOm9KPSGNv9DyUg07bP00/HP
	 Zh+mszXhU74bjVB4wiimQZuTq8OMgFC5QBmk/ghSESLNc71MqkbGkeOwqMcjVtSg3drXL
	 n18D/5xBL/Mc9Br1yLVx8vfdCUMaJdAdBIC/Z1D86xmVZvtwppwrcHcdLcvVGtoBGeg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168755;
	bh=PUe/uDMcRLMIcE9BeLZdNjz76Q9Vvmw67Ac/0D5gPlo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RlK7qHAFWMH5d/thYF8xGj4eRXJPqR+SC26iJ6/bfsT4ZbZ3VfhHwkCBGoJvot3tQ
	 5bSuw4GKZ+2WvjbccuAi0bhBUcqaEXaS3dTqKXleVBKXietFlJRt8A8fCNQH5L5X+a
	 jIvBXOuThPgJdB+bLBcSlORIiyOIoXD9JO8lSEz9eWAfwdkBspR0JNbK2+xdGQF+d4
	 yXHupY2UWxPB8SjT0iD1Fy7viu02G2+RPbFKXhwGGL99Ydm5m4LLVjO3B/QTts5H3m
	 XEnBCOsKw2C/USgLZS9w4I6fZba/HLQHy8hdKye2YAXOq6jjZPQK478q3ETG9nOWxx
	 ivVag8+6VeRGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB9A60E38;
	Fri, 20 Nov 2026 09:59:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB6A169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C7640ADC
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtrXg4d0p0XW for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CE64740E08
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE64740E08
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso460141f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168752; x=1795773552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w73nbmGm2hKrtdhGW1zTJmFQQnQECcXCsFqeJ01u9/I=;
 b=mS0pb8+VJ2AfpBiXa1ddFt+yyRehBAkNsaPYO4cz4PGdtoS2Z98PemcXGDAfPCmgxl
 94m2ud6BbYCHV982UbsZq8E6URdbqckpouhZm9S9ko+IIaSX0+9NzE8DN3x4aooP2oIG
 L4CIuZMhUIh8A6g2gVzLQIW35ZkHwO64UxvWcqj7KLIbZB8X7lgkKg+CO1xktA0sGhHi
 h09Ny3qhzGAMJQQVYy4/dKMRZSSiq4GOd0WyonAt3gRU684nFcV1WXbbBkMZmMBkAhUC
 swU6OTgUh8LR3TuLccG20MHAeG/yHb1dH784nnK/6JCQ5nwXP608xEtShv9JtEIsm4sl
 cyEg==
X-Gm-Message-State: APuU4Z838jOnzvRDd/4xEtowJdUltId1NUnWl8rhavgfXreQkOONg6OE
 vp09hNVPMbJe6trvEQQ9SFtJ1/kxUGyR7uAz3a2IxLi5uU1hHjFvUtzzIH0IH+hrqhcNmf4M55Q
 QaYp5EtrlNg==
X-Gm-Gg: AYBFou0+zukuMYCfzq74XJ6LNIeOaeDqd3U5l7CgQIEobOTfSbLix8F7byo0FSrFYkW
 /Ris8WuVX+1v+OFe1hd1Xo97bAui6wPFUD/LPnpiEj20M85od78d94DoWWCG8qOEM+xCjwlPoQv
 l4dK2aobqoimULKUsH9jtc72ABP4+GN0Lf1d8vNhEGLxSkO3QCr67dP7ay0xPFtZUSgFruFWDQf
 k4tCqJxsjct3BFYipjmNLJareAuyDxe6j8zS9CtOPIlXzlvM01p1KDK2j16BnYIs0cy6X25Vpfg
 Mda/srF7wT64MTs9TC4GfF9bOP2XK8yBPiqGSZ905mYOBxlyZZvgnArRmUIwsn6o6KZUTImbxcL
 LHZACE3KHnWWOMSbCSeRonGN5AGCcsxp0TokDk/s/43mNoOectcIhKcTVbKTQBQz7r1MJfnWyyN
 8NCv6B0Z5dVE8YtNMyKR3N9SFj2a3qmmDDtT3IJTF0CdFtb7sQw8dpf6An7aVmGu4MbGVpj2m4g
 xrlrSaBHeKyL9Hgl1D4rlXmFfjebppNkRwzgAIEly/LgrJG4dP0dc4mokG6+VQQI4DDej4yXAQh
 CFyTTd3Mvf+lfyKHZuGWLNOBcxTGRqAOIqLUEwRwUD2z
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id
 5b1f17b1804b1-4bb8880b984mr63342135e9.14.1795168751805; 
 Fri, 20 Nov 2026 01:59:11 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm71549865e9.7.2026.11.20.01.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:11 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:06 +0100
Message-ID: <20261120095910.539618-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110171404.869236-1-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.133
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
> Release notes:
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_133_RTM/doc/src/releases/nss_3_133.md
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 37922f094c..31a7a98802 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_132_RTM/src/SHA256SUMS
> -sha256  ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff  nss-3.132.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_133_RTM/src/SHA256SUMS
> +sha256  4d752526b9846a1d962588cfbd09b7cc2a4f6a4effbd9157d58a30e8a2573065  nss-3.133.tar.gz
>  # Locally calculated
>  sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 209730f6b5..1a98caf6df 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNSS_VERSION = 3.132
> +LIBNSS_VERSION = 3.133
>  LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>  LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>  LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
