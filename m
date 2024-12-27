Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD2EE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC58F80ABA;
	Fri, 27 Dec 2024 14:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxeFMZ9eyrjH; Fri, 27 Dec 2024 14:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9693A80BD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9693A80BD1;
	Fri, 27 Dec 2024 14:39:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4079E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0A8140328
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuD7W2jfMd5d for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72F9640325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F9640325
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72F9640325
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8264F19F742;
 Fri, 27 Dec 2024 15:39:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58184])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:39:03 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:39:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20241223155629.1849349-1-james.hilliard1@gmail.com>
References: <20241223155629.1849349-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <902a531cf802b2163a104cfb2ec201e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310345;
 bh=IFQZwOItGqPBxpasjoT7NQAj2HJPWpcUN5VKfr/2o0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jLAiGgpJ++z2yms4U54SiIwxSMYnTzW5NCUetBwRkoL/6wdiE+vESUv4jY3p2XL53
 RcN6ptBXD0SuKviUYVXaiwHnPjUw03RVj19vcDCnGqst45HaNVkSkH5mRmsOUPx0US
 1zv8byNr/VTi3dA+OtcwqFpCXVxnfovtxzQinHAj+YR0PK16QYHf+kC55hi+k5iCvq
 Odi6iX2H8l5xSqeL9R1ntgXolAk8AxVH5tmD9dR398Nqdq5Xy37aPCMyQhYeDb2m9k
 8Ex4wJH8oiiUIx47Ib0zdj5F4HgysH/vIv9CimNbObBvPE9vk6uxrboPqv/Y+4SaIT
 nUZ2r1czZjfBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jLAiGgpJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.35.86
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2024 16:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-botocore/python-botocore.hash | 4 ++--
>  package/python-botocore/python-botocore.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-botocore/python-botocore.hash 
> b/package/python-botocore/python-botocore.hash
> index 1076a748b2..3c57ec639a 100644
> --- a/package/python-botocore/python-botocore.hash
> +++ b/package/python-botocore/python-botocore.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/botocore/json
> -md5  d317006e6032155bfd46a949cddbac72  botocore-1.35.57.tar.gz
> -sha256  
> d96306558085baf0bcb3b022d7a8c39c93494f031edb376694d2b2dcd0e81327  
> botocore-1.35.57.tar.gz
> +md5  32354bfad0d8ad0fde84143f2f2edaf8  botocore-1.35.86.tar.gz
> +sha256  
> 951e944eb30284b4593d4da98f70f7b5292ea237e4de0c5a2852946a549b8347  
> botocore-1.35.86.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  
> LICENSE.txt
>  sha256  
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  
> tests/unit/auth/aws4_testsuite/LICENSE
> diff --git a/package/python-botocore/python-botocore.mk 
> b/package/python-botocore/python-botocore.mk
> index d8d410aea5..c5168b1792 100644
> --- a/package/python-botocore/python-botocore.mk
> +++ b/package/python-botocore/python-botocore.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_BOTOCORE_VERSION = 1.35.57
> +PYTHON_BOTOCORE_VERSION = 1.35.86
>  PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
> -PYTHON_BOTOCORE_SITE = 
> https://files.pythonhosted.org/packages/61/17/65b0a3bb507b19a7a1c6cc7c63e374906891798986f0ba2b6ad174ece86a
> +PYTHON_BOTOCORE_SITE = 
> https://files.pythonhosted.org/packages/14/ed/f639350bfa1c1f898dbbf69250c961ded22ebf7bedc02fa23127c7762d78
>  PYTHON_BOTOCORE_SETUP_TYPE = setuptools
>  PYTHON_BOTOCORE_LICENSE = Apache-2.0
>  PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt 
> tests/unit/auth/aws4_testsuite/LICENSE
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
