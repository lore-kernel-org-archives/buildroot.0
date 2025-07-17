Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A2CC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D9060790;
	Thu, 17 Jul 2025 20:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA6KLIkQqnDw; Thu, 17 Jul 2025 20:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D2260666
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D2260666;
	Thu, 17 Jul 2025 20:29:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C66226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E6080A5D
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YtIiGEfPg4d for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1A3E80A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A3E80A8C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A3E80A8C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:29:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E880CB977AA5; Thu, 17 Jul 2025 22:29:27 +0200 (CEST)
Message-ID: <1f135eeb-13b6-4386-b6f2-bc389bbb8944@rnout.be>
Date: Thu, 17 Jul 2025 22:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250716102159.306474-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250716102159.306474-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=q7QOANbTYYnnYqgRNcu6Ia/7pnrp3oKHMeoEzW2ce9w=;
 b=GiSjR2X5bwdrdbzgY9Ab92IWsh3ZyULMcMdCUuehwVPO1D3XLi50bcHWJkhK/E9oG7cmgB
 RsntrTvslkeJivdsZt14wuYg2Slz7Fdd05bQwS49IKTc8RIH6cJs7+aEOGy+G2U3wE7FPK
 8kdFT5UhkEyhyyo/TEBMnbahQ0x3Vot0pj34Tjj+fGQd5w1rE20MRZrPtoB59ehNh65jCd
 O1cyGivO9ZW1qdcAJIqM9ezIx/qHW8XMwr8PqSrwC3roTr9FEeqdAdzVRA5cMNIxMqqeku
 GdN6bgdy+FZG+pKnS/0LT6DXOlnnsnA33SyLugSYSRs8OYO7/fY5qoVzh4xrBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GiSjR2X5
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: security bump to
 v3.12.14
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2025 12:21, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> - CVE-2025-53643:
>      In aiohttp prior to version 3.12.14, the Python parser is vulnerable
>      to a request smuggling vulnerability due to not parsing trailer
>      sections of an HTTP request. If a pure Python version of aiohttp is
>      installed (i.e. without the usual C extensions) or
>      AIOHTTP_NO_EXTENSIONS is enabled, then an attacker may be able to
>      execute a request smuggling attack to bypass certain firewalls or
>      proxy protections. Version 3.12.14 contains a patch for this issue.
>      https://www.cve.org/CVERecord?id=CVE-2025-53643
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiohttp/python-aiohttp.hash | 4 ++--
>   package/python-aiohttp/python-aiohttp.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
> index ac12cafeea..0aa8dbd3bc 100644
> --- a/package/python-aiohttp/python-aiohttp.hash
> +++ b/package/python-aiohttp/python-aiohttp.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiohttp/json
> -md5  7835f28e41adf6f09467533e8de0c199  aiohttp-3.11.14.tar.gz
> -sha256  d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c  aiohttp-3.11.14.tar.gz
> +md5  4ed66dcec63108ae3a7c01d0415b4dd9  aiohttp-3.12.14.tar.gz
> +sha256  6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2  aiohttp-3.12.14.tar.gz
>   # Locally computed sha256 checksums
>   sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
> diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
> index d3e7d12eb6..e52b6e81c5 100644
> --- a/package/python-aiohttp/python-aiohttp.mk
> +++ b/package/python-aiohttp/python-aiohttp.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOHTTP_VERSION = 3.11.14
> +PYTHON_AIOHTTP_VERSION = 3.12.14
>   PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
> -PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/96/91e93ae5fd04d428c101cdbabce6c820d284d61d2614d00518f4fa52ea24
> +PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2
>   PYTHON_AIOHTTP_SETUP_TYPE = setuptools
>   PYTHON_AIOHTTP_LICENSE = Apache-2.0
>   PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
