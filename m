Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D00C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755C861369;
	Fri, 16 May 2025 17:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiuHXMtHE4sU; Fri, 16 May 2025 17:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96B7F61373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B7F61373;
	Fri, 16 May 2025 17:59:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B063713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1EF3400FF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdbT-KS7bzaV for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C13A24003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C13A24003A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C13A24003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 092801C0FCB; Fri, 16 May 2025 19:59:31 +0200 (CEST)
Message-ID: <93593338-ec8e-4a40-831a-c058cf3baaa9@rnout.be>
Date: Fri, 16 May 2025 16:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tyztYsUxhQ3vKqbWRa9j9inQwx6FkTWmJYzWTNOObUg=;
 b=AyKrxnKRgq2MWQKdas990gPdSGSEas4KKjfRY8q2XuHSasjz82DfYLDsYuju7DoKOnuO3d
 WiAJis4XFKjTaXrAcILw/yvDLnK6M8IrqYaxmD0A8vwLMfvr1AGOud5RaHWjK/mdw6vm3U
 kEPffzgVqWLnfxHuln20JrE+KiKdPrpi5tDBBYgXk11olLRA0BvvvHufqn9fUiW/nOBqXG
 LRiVcer/PpqeZQS3gcHvpfH8MolCKpchTuD3paYUqcYOyTw43QQgZ5T2Bvhk7S6NtnKPyA
 5I/LKWzRfHZKzmTJAByUCl4BDt9RFS2EQ2EkmGTkc3dKNpCYCQC7syPwjWk6LA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AyKrxnKR
Subject: Re: [Buildroot] [PATCH v2 01/12] package/python-fastapi: bump to
 0.115.12
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



On 14/05/2025 17:12, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Series applied to master, thanks. I just had to adapt python-pydantic-core's 
hash file to the cargo3 hash method.

  Regards,
  Arnout


> ---
> v1 -> v2: fix version name in commit title
> ---
>   package/python-fastapi/Config.in           | 2 +-
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
> index d4a527c601..21997daf9a 100644
> --- a/package/python-fastapi/Config.in
> +++ b/package/python-fastapi/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_PYTHON_FASTAPI
>   	  FastAPI framework, high performance, easy to learn, fast to
>   	  code, ready for production.
>   
> -	  https://github.com/tiangolo/fastapi
> +	  https://github.com/fastapi/fastapi
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index a241937ce5..41b208a8a7 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  38428aff025530f61cd5b10efd764229  fastapi-0.115.8.tar.gz
> -sha256  0ce9111231720190473e222cdf0f07f7206ad7e53ea02beb1d2dc36e2f0741e9  fastapi-0.115.8.tar.gz
> +md5  af68daf64073e04653b314a895aee297  fastapi-0.115.12.tar.gz
> +sha256  1e2c2a2646905f9e83d32f04a3f86aff4a286669c6c950ca95b5fd68c2602681  fastapi-0.115.12.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index 2662f3ddaf..95961972fe 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.115.8
> +PYTHON_FASTAPI_VERSION = 0.115.12
>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/b2/5a5dc4affdb6661dea100324e19a7721d5dc524b464fe8e366c093fd7d87
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/f4/55/ae499352d82338331ca1e28c7f4a63bfd09479b16395dce38cf50a39e2c2
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
