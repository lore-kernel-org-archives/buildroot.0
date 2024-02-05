Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87DC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC0760E7C;
	Mon,  5 Feb 2024 13:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DC0760E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tScwCkACdAYA; Mon,  5 Feb 2024 13:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6032560E32;
	Mon,  5 Feb 2024 13:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6032560E32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248611BF3F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F044E408F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F044E408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Coy7zXiFc5-d for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:14:14 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7560C408D1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7560C408D1
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40fdf17fa89so426125e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707138852; x=1707743652;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mTgODmluRUKdZltlbVef+Q1LbQBsyOH+rpaVWVqhwoU=;
 b=gaPM//ZDkFAQTeV6G1Yo2UBYRU/qC8a6Y2WS5hDBsCoptnaRSLQZmhgQ4Q9pNVrL7R
 EVp3bfQRx50COjbqA1IVS14Fo2Jni4L/j9CiP+ScNXOFbyXM36K0LHvlzCSuFYAe1LIr
 Fwy/c3numCn9jxic9nSG47lPTbHQBVUBo4bgTKoLDxm+j90iwv3UaNPjAqWFuBv1yBeG
 PhykxOgUJWQidPdar57aNVgZfkWwjqSbAeXsIBu+DetVXWegrTknGgDDezBCRZ9p45H5
 i6GqYhcv94QpOKtkLCNaLDMHt8KlQOcXsg9G+Rf4VN6VvIdYyhHa5jWPn6ed7rziv1Oi
 n9dw==
X-Gm-Message-State: AOJu0YyLSdpPxFJnXGGTShqd6hHI+JwxMCWIlBKme4vuDI8lv8IgKzjj
 P7mKG5WA/iMwy9iac7hersBu5bxnEI+efZ08Q+sw1l94/Eq5TRkuB9XuwWzz7oBERXfzJ4Zhuhi
 5
X-Google-Smtp-Source: AGHT+IEtt5WjkIPUdjXvIztCiMYDXGh6uaA3IhlMBIqmVSpE3biKU8L3Ll697nHaTybuqxi2hUB2eA==
X-Received: by 2002:a05:600c:3581:b0:40f:d2f7:6e52 with SMTP id
 p1-20020a05600c358100b0040fd2f76e52mr3907825wmq.4.1707138852220; 
 Mon, 05 Feb 2024 05:14:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXNkhXJrP3HJNbZSB1L+GAvjew2rj5cc3NIK33FeE4gEDN5bAr/2xTrwT7q3EJVe+qC7kFfdAs2+ZcKsYBUxN1VeWivRX5AAA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6481000000b0033af26545c8sm8058849wri.50.2024.02.05.05.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:14:11 -0800 (PST)
Message-ID: <d15e9acd-36c1-42f1-b961-9895c6d0f8b7@mind.be>
Date: Mon, 5 Feb 2024 14:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240108205150.783168-1-ju.o@free.fr>
In-Reply-To: <20240108205150.783168-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707138852; x=1707743652; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mTgODmluRUKdZltlbVef+Q1LbQBsyOH+rpaVWVqhwoU=;
 b=iI9MuAAUUSLZh7ihe26xP/lVqAk5Wmo89Kiac+M4rkBUgMzW+GLACkVswEZF2wjrfV
 xGs80G24TQ81pIwNfxnYZOu6GYpgr+O8cS25NPXW07r19TLNfMS7yy56HVMv+I4LDCIz
 g6tXZrR+8Q3ROQAFUpBnR/4Gcx8w0IESG2lGzbJK2G6rcU0FWUorPss2Sm5TIHYK9sIS
 VrjEYcrKGBEL/08gd/qSMgc4hRu0aLby/FbJ4RpVFl5tqMqZ+O6lE0bwdzTwQOQBIQfW
 sXflK2ewGA4xzhCpyonki9b/a2o/aJBrL/Mkf5RXMGdtX5jSyXX14UdmnLNFDw3KVxqZ
 d3SA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iI9MuAAU
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.26
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2024 21:51, Julien Olivain wrote:
> For change log since v0.3.25, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26
> 
> This commit also update _SITE url to follow download url published on
> the homepage https://www.openblas.net/
> 
> Also https://github.com/xianyi/OpenBLAS is now redirecting to
> https://github.com/OpenMathLib/OpenBLAS
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested on branch master at commit 1d97f8c with commands:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_openblas
>      ...
>      OK
> 
>      utils/test-pkg -a -p openblas
>      ...
>      45 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   package/openblas/openblas.hash | 6 +++---
>   package/openblas/openblas.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index d946ae7296..a0f054dab7 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
> -md5  48384e324cd1cdcfbdb0d2e16ca55327  openblas-0.3.25.tar.gz
> +# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26
> +md5  bd496a1c81769ed19a161c1f8f904ccd  openblas-0.3.26.tar.gz
>   # Locally calculated
> -sha256  4c25cb30c4bb23eddca05d7d0a85997b8db6144f5464ba7f8c09ce91e2f35543  openblas-0.3.25.tar.gz
> +sha256  4e6e4f5cb14c209262e33e6816d70221a2fe49eb69eaf0a06f065598ac602c68  openblas-0.3.26.tar.gz
>   sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index 76833121a9..2d6cdaa7bb 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -OPENBLAS_VERSION = 0.3.25
> -OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
> +OPENBLAS_VERSION = 0.3.26
> +OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>   OPENBLAS_LICENSE = BSD-3-Clause
>   OPENBLAS_LICENSE_FILES = LICENSE
>   OPENBLAS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
