Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A0DE7718F
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ACE80CA9;
	Fri, 27 Dec 2024 14:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUfiR4hcWlA0; Fri, 27 Dec 2024 14:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A0B80CEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A0B80CEF;
	Fri, 27 Dec 2024 14:36:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82958E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6221640582
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMJrctdVll2S for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F58E400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F58E400AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F58E400AB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:36:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 01E762003C6;
 Fri, 27 Dec 2024 15:36:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:36:42 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:36:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>
In-Reply-To: <20241223150605.1724459-1-james.hilliard1@gmail.com>
References: <20241223150605.1724459-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8492c8a594f290178627cae2dda927ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310205;
 bh=jIDNhuKD2ALlItGHWbI5wfh1Art2pDkXh+ppWfOQ1Pw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oqCtq4vmxl63730+dz8A8kkeULZUACCrkSVQxOfKLleKNEmoy39WQxdGgXu6OhthX
 Mfn11+kIwMk+GQr1eSmzG6P0A/yx32S1hpP8YQv6tvYAZwiin/Y5BSmrOuXVTll/MB
 y7vx4CGogGURGtSvBwVMAYVcjQLt7hV1GQ8M/EGug/DAlzhhAyk8siPMv7DXQTwvC1
 eHvsyEdbgzjXYZ7VM90tS3vCnndiubftaemCcFI8mQeryaDNNQLnyLe/8zavIZS/xj
 QPDvDDuc6Ofsgem05pih+aQxo/yqUDniHjYxYfRHJZSC4y0S9zYQvhpRgYG/Cgyggs
 uryW0iqLudxKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oqCtq4vm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.8.0
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

On 23/12/2024 16:06, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-apispec/python-apispec.hash | 4 ++--
>  package/python-apispec/python-apispec.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-apispec/python-apispec.hash 
> b/package/python-apispec/python-apispec.hash
> index ee6c422433..7bfbb5a9b0 100644
> --- a/package/python-apispec/python-apispec.hash
> +++ b/package/python-apispec/python-apispec.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/apispec/json
> -md5  0ace01922cd42fc19da5e597df73b631  apispec-6.7.1.tar.gz
> -sha256  
> c01b8b6ff40ffedf55b79a67f9dd920e9b2fc3909aae116facf6c8372a08b933  
> apispec-6.7.1.tar.gz
> +md5  89f6b8186a8772dcfc54aade5e3495e1  apispec-6.8.0.tar.gz
> +sha256  
> 861cca82bbc0652ca9acea896921b254944580342fde849f86f6dac1acc6ca96  
> apispec-6.8.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  
> LICENSE
> diff --git a/package/python-apispec/python-apispec.mk 
> b/package/python-apispec/python-apispec.mk
> index 168d3890ce..a02a1cb8a8 100644
> --- a/package/python-apispec/python-apispec.mk
> +++ b/package/python-apispec/python-apispec.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_APISPEC_VERSION = 6.7.1
> +PYTHON_APISPEC_VERSION = 6.8.0
>  PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
> -PYTHON_APISPEC_SITE = 
> https://files.pythonhosted.org/packages/96/26/ef0e72400707469058a7536f64d4e00e1a1c07a179acd00fb7e424dc9330
> +PYTHON_APISPEC_SITE = 
> https://files.pythonhosted.org/packages/12/66/81f6f31feafb0ee2f6c649ba33f4c768f837bbabef279f12053d00a7099d
>  PYTHON_APISPEC_SETUP_TYPE = flit
>  PYTHON_APISPEC_LICENSE = MIT
>  PYTHON_APISPEC_LICENSE_FILES = LICENSE
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
