Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE846C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 993FB41740;
	Fri,  2 May 2025 10:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qddm--GBBZuE; Fri,  2 May 2025 10:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB12E4174E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB12E4174E;
	Fri,  2 May 2025 10:30:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9F75EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB9DF40B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1hYCG8BMtc5 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39F0540A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39F0540A92
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39F0540A92
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8392C1C1112; Fri,  2 May 2025 12:30:14 +0200 (CEST)
Message-ID: <5b605727-a4b6-4260-9e81-022f9c272ff0@rnout.be>
Date: Fri, 2 May 2025 12:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250415200117.2207610-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415200117.2207610-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181814; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OhqioWfC2iN9YF0kvLJWkz00EmcgIUdqId4xKA9zqSw=;
 b=ovN/2VDVt+fNgxU86wRZJJ8ip0QcayYNEWblbPoELo0+Qcfgl84GvHLDIoZmC0ddoNeC2n
 e8+WfKsPJz/fdytOVlzG9k9iXQY0nFHIfoV5BqcjjRIOFHOyAuerUTcDV686Nr0YOwJAU3
 N3u8HcSEmVv8HOnlvJJ+gj9vsrxweWNcB4Vaf49hHTXOobgdhR3yqSiknPY+Wx2W8rTrH7
 48fz890eCGt9/Ja9DyE4hnNqZqZbp9pjqcU1HOnP7qBg1jjDVA7g/eBqhLXAoGrt2NRXGt
 kpGsBS54UzLQcyOTtnVpVT3R53gwEekyONLGlmHSbbs/4CW8O3hJCCfDWaknpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ovN/2VDV
Subject: Re: [Buildroot] [PATCH] package/c-periphery: bump to version 2.4.3
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



On 15/04/2025 22:01, Thomas Petazzoni via buildroot wrote:
> Changelog:
> 
> * v2.4.3 - 02/28/2025
>      * Fix memory safety with some older `strerror_r()` implementations in error
>        formatters for all modules.
>      * Build
>          * Fix character device GPIO support tests in Makefile for alternate
>            shells and older versions of make.
>          * Fix cross-compilation in Makefile from Windows.
>          * Fix CMake minimum required version.
>          * Add CMake package generation.
>      * Contributors
>          * Ryan Barnett, @rjbarnet - ec31b39
>          * javalikescript, @javalikescript - 024a25d
>          * HopeCollector, @HopeCollector - aca6815, b5e53e6
> 
> The hash of the license file has changed due to a copyright year
> change:
> 
> - Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
> + Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/c-periphery/c-periphery.hash | 4 ++--
>   package/c-periphery/c-periphery.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
> index f8f0654b4f..1914ad2255 100644
> --- a/package/c-periphery/c-periphery.hash
> +++ b/package/c-periphery/c-periphery.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  24327bc2a22588444b2576fa1c9560619f6faad986c236c54f4b3f36b20dad56  c-periphery-2.4.2.tar.gz
> -sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  LICENSE
> +sha256  367b263a14f80eac19c738de56b4a730a4b5e40e05586479a9515612eaabaff3  c-periphery-2.4.3.tar.gz
> +sha256  fd3377c82df42bd00d8ac9c25d22dc63f80b7a491b84f2ba82d2a7621432c511  LICENSE
> diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
> index e3745c4af6..38f1fa9fc6 100644
> --- a/package/c-periphery/c-periphery.mk
> +++ b/package/c-periphery/c-periphery.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -C_PERIPHERY_VERSION = 2.4.2
> +C_PERIPHERY_VERSION = 2.4.3
>   C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
>   C_PERIPHERY_INSTALL_STAGING = YES
>   C_PERIPHERY_LICENSE = MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
