Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD03606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BAf9P3BZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77A340F1E;
	Fri, 30 Oct 2026 15:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id So3EBctAJLD4; Fri, 30 Oct 2026 15:31:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C91AF40F00
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374303;
	b=SE30o07k/XWJ4eokCfJMOxt56JyJWMOWWweWytLfj6+qr6vGZT87oH/8DVmhU5UX3dfL
	 H4OjvfT9IoN8tL/qVmtEfgYQp0L7KEomi+CAjoM5fTHmDdL9tGgCX41hHG1sw0kC4vTRk
	 djl0BRf0xY6dfElA1I6MhEH4JXvmSWwR/qCdDcCSRKTaIjxyqHzHF+CwxHHYKvaKN0Gr8
	 VhU9DWzYIImMD9mYIR7fhUaoeVZs4wlItxhafSxoI+6EAVVz9Xf/zQptZDm07BsgQZRS3
	 wSKYPcKcFmatl4l7tq9EA0AcuiMQV2oV1KykW8CCGRPCuS/xsM+iWvkt7k1IT+Fuu/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qF+0wkIAxNYffa/gUPoi2hGpZcHq8sMYilQtqlIwUFU=;
	b=m8y7z0pbYrcA35XkLKX2TiUaT3vyLCcAqQw/zLm5EWVO+ndHKQjJ45lMLVedqew1b9at
	 YQBMZII0Y51vvRpCQMzFnyMR82ubeypnShIH4vs3v4GNQWUmtiEJQWKap4gDSx9KUxMhZ
	 1eUpSeekCwHfBBzOvnofEYi8KmCt+Ym2x1O1qCDBnG+o1ducB9x6hTAunbgthm/GjFogv
	 f/N28RxolDfHhZeIyUzTEA6rPSI38JLHlGOyLivX7ICljPnqszAbqsTIt4upDDr2cggGK
	 u4HjmS5ip2tWmseMkpXh/RaocCFYRVbwUthBimBk2juRjIKbs1CgrTip6OKUDh0L9Vw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374303;
	bh=qF+0wkIAxNYffa/gUPoi2hGpZcHq8sMYilQtqlIwUFU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BAf9P3BZdMXs+ukLMu1o/yLiYclMKdE8WxKIDcY1jpzLj7X8UMk6xRLQ+Xe2XE5qv
	 ETurPxAm4eu9rYMM1XcNbDJcNBFyul40TTj76OcKsja+nHP3Rg2InD6yRrGjnzAaLf
	 w1ZbSaSRpSD0jsVhwnSaz/GqbLGQLMfNfp5/NmOTdlb9JnlYN07EfmRTi7ZsncsxtM
	 ceY2axHh3SnzO9E32pzkmXab14TljTatMrcs9CdFioeFuNJrceGu0JWCORgiSCz5iG
	 l75iKVxW2oqsSPI9nsSG6HnTVqp6cb+iWVsB0iUZip2hzp/jV2EG1jgBiFjnDHqAya
	 B8LfSWhd9wddg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91AF40F00;
	Fri, 30 Oct 2026 15:31:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F3BD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE26A60B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVIGocx9NFcx for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85E7A60B23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374198;
 b=NgKLAg3ZS3IIHEaw5KFG8L3ZCXDfD1a21+LuiRE8ugDP6i/SiZv4Uc+PlKaRdOlYketg
 J5otKNKKJbB0e4vo+0RuBGNeFiZnteSqs59WgC9f64JMJIZVNNhqR3YAX6oJSnWCMeXmh
 dGy42igEapmQKlhr4TwDDNAN2C4vOtwUa5q6OaEIXHtI2+CK8uqcH6wBbAcoMl6y8YrJf
 c2kDBBG4TBehGDvJ3sYDuC1b42giji/efvZZlDRmHsG/pgxS/Od9AXD49UEfyJty8wJPj
 yQzG++CTqjHVdSeVQn+acDw8YbXH5C+jLxxM0YFORWBwGcRuGGs6h74bO5gP9O/TJCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374198;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=oMiAfNdFLK82V8aiV4/bPyQgGfnzSuJctrJZACyxick=;
 b=SdyQiU3gpoaIlt5CvwOB4VVVdszwdq6ajdD2C+nIkaxBg5tJfgFiISXxumXUudMCeewm
 SvfCaulbSsqqEttCf2Ae9BejScQnFkqMjfrhpbLpswopMF6ni+PAl8ozKk2jhUVLhDKOT
 sSEX8CjLcfseASYzFRMFy1esROXS1L7+MB14lIoiN0WMy9qryl345uHpuhc/+PtOT3gLz
 kejIj/ZTONE1kJAGSXgVAk6dy79UwNaJJ5BWwtHy3CMdglqVsfZCYDL7TleAPu8YGKAb+
 p8u2cThFoxCnsBMJfWEAJPIFt+nc9fRrXev6x7V2shunf9lz/a6Yxd6fdEPHbmFmrrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QvnttKr+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85E7A60B23
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e0d885929so697368f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374196; x=1793978996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oMiAfNdFLK82V8aiV4/bPyQgGfnzSuJctrJZACyxick=;
 b=UpNsvXIcgwjsF8IrnjyW2BTK7kGItGFsanHpXlFOOXU5PLESx+R5pGc4aPuq2gITiT
 lV3Nh5ih90//83ypWticLzq7S9OLVjpaVYeXk/X7hWtQqGV3go9dIB1IBOEJKACvU+Om
 My1gb09QCDOUBLOZR7ZCRsSoq7nzjCsqdVWDUEd+sHyFMWPxtqoUU93XU5fRBNYRWwTc
 1ilUcxmpuVPt/7+T1I9GQEgv99h6ngKZJJZIFfigCKuBGbZU7c+KShMXslVqSU/Y55GI
 0t3t7uRhK2OaStmcub4mAUG2Cvfv2ioii9/ndGagwaqYn8KNltrGscB/IF8RYROC9DNX
 +POA==
X-Gm-Message-State: AFq9FYKHSZDCJ3MHe+iU3M5NC+CGzYVzVBdap+QexBwK7FQzoGLHrN1X
 DwFWNE09qOq5Cle53zyd7AStKXvmiXe6nHGcRGl8RSwf4LIwKV7bb8IiHix8BR7MS1Tegvhx5JJ
 bYNV8zu0=
X-Gm-Gg: AYBFou2u4GTCKFvFS+A0fDildIK3FVOwgTbocInCg58X9mWqQM4hTER1A97Sw9VlTUQ
 e9Xjzh7m9CjNGq6k2IO1NC7/vQ4vF5gOLoK0UjPTa9AZZjMOUBOX8ZdC1ro9BnLPwt+VSQ4B9G9
 HN9pNo8mCBH2+E1uWff/JNuJOq2kXsQfrlQh0RAHDQGq3/VqyVB3UrPPAGeMTLsRUPvFhfzJPEv
 M/b2WYW7wi+VWRK9l2KnB7o3yiWOuhtYhAjAp2F8S3dNNhnW5eccxY1DUG+2zS0ilbBWok5lTvA
 TJ8jAq9FdeMUCoz/2U/t3UgAwG0tATH5nhpUYdq8k/hG+dd6ths/JzUi+iNRliRTxA5YkT208OT
 B9wQxpZjFmW3nQmFC8Pwnd/yU+l/939Ms1YNh3MSYC/+lpSJuEcJP8/PmfQpH3Z6FJToA3ub/RP
 7ndqzx74VhSsTxwGDqLBmXBWWUzVol0qKf7LIqSvPBikZWzS2G/XUq/WF4TY/HaVprC5E+6y5yQ
 7ZQ+nFPq9nSypKDMbA34PkjLX8iRbOpyRnm+Abp37D1QuLouVX53KWhutfktQx9rwOKAW+oBf53
 32j4bm46OZsTNrOCv8Z3wBp4kuqo4ex112yU/rgDoVl43g43QSpLDLdflSZzsR+z+IhWqWT2Tn7
 dYQMqvy+dzLonfLYS3A==
X-Received: by 2002:a05:6000:2488:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-48e6e50d953mr6553947f8f.53.1793374196255; 
 Fri, 30 Oct 2026 08:29:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b725b8sm3848392f8f.20.2026.10.30.08.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:55 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:53 +0100
Message-ID: <20261030152955.1908187-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025090745.3693129-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump
 version to 2.0.14
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/containerd/containerd/releases/tag/v2.0.14
> Fixes GHSA-hc94-p972-ch66.
> 
> https://github.com/containerd/containerd/releases/tag/v2.0.13
> Fixes CVE-2026-53493.
> 
> https://github.com/containerd/containerd/releases/tag/v2.0.12
> Fixes CVE-2026-53495 & GHSA-rp3h-jf77-q9p4.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7c6b5d9a4cf9553a66173f785993f0079948a05d
> 
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index 410e5d61e1..97d2691c5a 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
> +sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
>  sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 4a3a371ee4..753011e125 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CONTAINERD_VERSION = 2.0.11
> +CONTAINERD_VERSION = 2.0.14
>  CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
