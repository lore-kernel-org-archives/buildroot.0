Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB3F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NLJA/qU1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D8C540992;
	Fri, 23 Oct 2026 13:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPfvABzC6sP7; Fri, 23 Oct 2026 13:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 86F0640921
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761656;
	b=E2Z3TOQm7YLJfd/Br0lARaVMRSDdqs62kj+32qEAAY850GtUrSr0Kdz0LLdRNXluL6Q/
	 dV20I3PkJCbWZUQyFuD9Y89TwMa9eV/t2gf3W0rgA2xeHXBclVaNButolR7Y3kh8XxhXb
	 J5ymI6RZFMFnBT7M7Kthcuo1HX7oLQEV+558rw/TP4U58A/2xcI1KHfb1D7AhCvcayxm+
	 7zhQtA16fUFDOhdqZmoW1eoYhexhjhuWH/f+9zj5KTHJMgf4qvEKwCLF4444DdrlxpwDL
	 VX1reosnXTK5oi2L9dKMX/YePSykA4uuwn9zbrFbVpxSe+klk1KHdnKPSSCqMN5GpBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Z9gItBDQlFK6eILshiusKo2GK2eKGunOpxHQpbJ6WU=;
	b=AUrwFPYklt2HZ8dDJqhuNsjLqhRdJ7ArTPD9eZWaYz1zBkkz85FEcQTkVCdQXSjPVGvA
	 MAUcMVrNBe/gQrd+CTTHoEZGWoGuPHRbCgKAkF3otXxDfeS1pX2kRoTRciCkF6nRCD0+X
	 E2+t0ikkJtHgWtd6P7gP2318SL1hJB+cUBvh8i5h4DXMt9wzE0JYWrFz/DRJ+U/ymTzK+
	 nH6ga0LBbqZ+YNX0pUzrZLFOpdEdqffg+AIPEzmLW13sD8a0dbCiaAA4i3uIvXAagVm8e
	 ZeRrzjd5uw4CAC2KkAzp4v1LNkiqgN7ozKQFqlpYKJllcGZkh9UpXtQHDcQqv9KR7eQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761656;
	bh=+Z9gItBDQlFK6eILshiusKo2GK2eKGunOpxHQpbJ6WU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NLJA/qU1V/A4kLCWPjbKz2op4xSXdlx8RDQDgfB4erQ3EPQQL1L4KhhXjkzZf84x+
	 QTwMbhVjIp81zAXoXK603s3ZRgBy/5SJiWqNzoXL2ceQXNKFhbagCjXqZ08j4V8gls
	 FcdLgIShXWCZ4wUavCoZ5yKdsV1x8cCgq/T/mtJFYGDpszfcvfg1sdugoSY4/QiHzW
	 CEszGQfvkIpwg+RJ0qT86He1O/p33SM2OgKp/dBkjCdDkKt8AC/4m+sdAm1s3/K56X
	 cSrfWbu/3e73IbVWs9d4U6viQt1afOIJvGhbeTJRq60nRjpzAsStPAucI5oGm1T1A+
	 EFABEjpEQM9BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F0640921;
	Fri, 23 Oct 2026 13:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0496356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2717401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVjPqoU18sxS for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7681E400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761653;
 b=EKDxrJ03GKiD0zetac7Ul/p65Mt5AQ6DxIUmF84//PM6X8fZNxI8jE0ZT2iidT/APc93
 5Ldz97KdipeNz5A0DfVQ6w4MDLQIUHr60W5uHr48rLAou4x479gstfCN0NjH0kXaJkDdh
 i5J3KgVV1yLEAh8v3dlRWgfJ2M9JxRpvxSDSCfnp/QpCtW6GO8CHSD2lUNBBIRrhZjMJZ
 xC4Kx113wILkVBMOhmQvat5hzY0DRkpjFf+cpd5ewpt4JaVYoI04Dhnm7OQjcjBdNQ5Pd
 1G8yYGpUdfgfk3rxH3jhGeAGFJ6n1c8TFTxBgmo9iybHsOvr5lVrzAGmBQpyrp2TKHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761653;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WqTTRQpZqpbfe+poHMi/g0vt0crdHaOdX7MU2bPq5SE=;
 b=Zua5/fyXHha22qymuB7Idu/DXnGzIaydUmtyewBNmZsiPE1jph7y1PTyIsdjo9z67eb9
 Dnh5kuROrhexaB7hJFOiPczVknNdaWCb2i8TPPvhF4g2cFRWf1hkSMH8Kix3ospYVCvNz
 9oBbzqUKg5YOeD6ZDZ25PwUpdw3XXv1n3PD7tcuFGq8Nbl/HQpFb6hdYPgypPcngHEx+j
 eoodGn93VHYLKYMUyLVZwKAqKwSv4IzfFYgJsqDBmjQes76PVQtHw5fFgIqhaUIay+kpU
 MHYJdUcgf3/YzvcKDhw++kOdimXvitX3AS5y7amlj+n4lps1Q7ht7gh2Uy+smPyx56w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dHUqKWpm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7681E400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so729554f8f.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761651; x=1793366451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WqTTRQpZqpbfe+poHMi/g0vt0crdHaOdX7MU2bPq5SE=;
 b=dJ7VsFZS2JrR8DUVr8d5+9XC+KG4WOrmM8H0qGE2Dx4i5uaWCN4aYJAGz8UqX4OvK/
 TfE5hkGagUeULzdR8sPoK7vI5J7PYKR2oD7Qw/SC9b65dRG1ygk54NQgM2JO9a81VhPN
 dfRc2WGRXsWzu0npZF0ekZx0tzu1bOpdageLSpMO6zFFa+N66eIxhfkQILR5TvXALdMy
 odxq6LprnOSjRoYxi2SM4nA4PITXWiQ6Bzao4MEwE/rudD5b7B6/5NRkOk6z1l6sxfam
 ppl9sir0he4p+HfmoO9a+OqjirokWhr6KFVvqZGQGqTCcxtVng6A4v177OIWif61dEFM
 aopA==
X-Gm-Message-State: AFq9FYI6SKZoe4m0OZIgK7sVkSvUnmzZDtHMSZf9k761zeQru73OAnDW
 F8rUFaC/duyFu44SdDVdDTqCnTXbkVhlS7f8CPiY05wfbpFCLMi4laLCMfnpxfwfpZ3D9MmP4sR
 qRCt/QGA=
X-Gm-Gg: AYBFou13ZVMepusW9xvPXsfgwEBLmp/sFAKmzqZbAvXBXmW+Dy33DjlNnntls9iBdZV
 200apFh/rPVrzOFNO0f1IyHoEksfbgJTYlzXSc4IgOWbapZ1kvh3sFM+5h0xYGIbuQvfbY9lTvn
 zB5+sa3C4pn16aAHuJKiv3/Qs+Yw4SxTfRXJKOQUHlcijl+cNpGybMADuXNKq/qYTK+GEcgftc7
 R70P7a5F9sxGWKnQ+n+3PMoHolTaCUbToOGS3RAMjZgCcUspXU7MFjWQ1vMPKM6igMlwaOLG+rg
 Jodtk1xR5ELGea3vBhUGkPbzFA76UAKEhv+9UH40n4VySXqcm6cDQDyRek66PLtZ21RfB7oSn4R
 vTKij1lhAVeFG6OpQ8WYbqhRlG/V30ZaMgjP7+UoCPyQ+sOX8pqeWG16fj/4zXT/uY0wkJpwxhV
 Y1g6FbGA3BD95AT3YswJ9o0FqAi/K35hKSlQgdNhTIVg+EK2bXCG5AjlsDtSX9/kG+2XuRoZGYL
 PXgCVRg6OyDWSoA2nsA6GSzzPiQQ3K27up6wkasSGE60Jis0ZRg/Mduww==
X-Received: by 2002:a05:6000:4905:b0:48d:f069:570c with SMTP id
 ffacd0b85a97d-48e385afe32mr3947586f8f.41.1792761650782; 
 Fri, 23 Oct 2026 06:20:50 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e380636bcsm5033052f8f.58.2026.10.23.06.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:50 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:46 +0200
Message-ID: <20261023132048.1607022-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017140027.697390-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/p11-kit: security bump to
 version 0.26.5
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
> Security fixes by versions:
> 
> 0.26.5
> * CVE-2026-18938: rpc: guard against overflow when decoding nested
>   attributes
>   https://github.com/advisories/GHSA-6x8p-h5fj-5ppr
> 
> 0.26.3
> * CVE-2026-13757: server: fixed stack exhaustion via unbounded
>   recursion in RPC attribute parsing by enforcing a recursion depth
>   limit
>   https://github.com/advisories/GHSA-p2wm-69qx-x25w
> * various memory management fixes (including memory leaks) without
>   CVE or details on possible security impact
> 
> Full upstream changelog:
> https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/p11-kit/p11-kit.hash | 2 +-
>  package/p11-kit/p11-kit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
> index 943ad9c22f..ca76eddae6 100644
> --- a/package/p11-kit/p11-kit.hash
> +++ b/package/p11-kit/p11-kit.hash
> @@ -1,4 +1,4 @@
>  # From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
> -sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
> +sha256  f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7  p11-kit-0.26.5.tar.xz
>  # Locally computed
>  sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> index 60133223ce..b3bb3e1263 100644
> --- a/package/p11-kit/p11-kit.mk
> +++ b/package/p11-kit/p11-kit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -P11_KIT_VERSION = 0.26.2
> +P11_KIT_VERSION = 0.26.5
>  P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
>  P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
>  P11_KIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
