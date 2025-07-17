Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23172C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670AE404B0;
	Thu, 17 Jul 2025 20:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhu-8kXR809t; Thu, 17 Jul 2025 20:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B10B4118B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B10B4118B;
	Thu, 17 Jul 2025 20:21:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D55931A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6992607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaBenganoFe5 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4E0C607BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E0C607BA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4E0C607BA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF6CCB977A8D; Thu, 17 Jul 2025 22:20:56 +0200 (CEST)
Message-ID: <678ac98d-b0b0-4789-b3c3-715ce4cde3da@rnout.be>
Date: Thu, 17 Jul 2025 22:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250621163539.263715-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250621163539.263715-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783657; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=eZuBE+CqlPFay5JfJUXXXITm9V/IqouC2LAKIOiHiJE=;
 b=dGWoGxjECBV99hr5ao+s+hG9baVJdsT5DxudmyLYC7zvtAVAO85l72jwYU7ZNMchfKfyqf
 JlV3oTQjGd5Pb69KHRwmhrNAKufKaPzZtqubd08lfetKXZuPoDcPyYvSo1KrYOTcUG3ZVR
 uC9O/23sm7cFg3+qUP77Q6LmFtWtY1N0oRgH+u7oZnVPuAfT9eJVuAjteuSWk1hSyclyDo
 L3ZJruLzCv0DpNJ8BOLmTvZZq9u1+8sqtPBMrW2by+WvAy6oRBzVkj8uL5eFR0nB1DLPwf
 UaIyQ6cuN6eyNfF82cwlU14Nm6CV1HqR77So8AYq5gft4lqrcyD8BK0SKc4tQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dGWoGxjE
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.30
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



On 21/06/2025 18:35, Julien Olivain wrote:
> For change log since v0.3.29, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/openblas/openblas.hash | 6 +++---
>   package/openblas/openblas.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index 6b123b5c58..965d7458ba 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.29
> -md5  853a0c5c0747c5943e7ef4bbb793162d  openblas-0.3.29.tar.gz
> +# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30
> +md5  8db3d57f4d4485c6ae3f21ea465660e7  openblas-0.3.30.tar.gz
>   # Locally calculated
> -sha256  38240eee1b29e2bde47ebb5d61160207dc68668a54cac62c076bb5032013b1eb  openblas-0.3.29.tar.gz
> +sha256  27342cff518646afb4c2b976d809102e368957974c250a25ccc965e53063c95d  openblas-0.3.30.tar.gz
>   sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index 069636f5f0..edab26493d 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENBLAS_VERSION = 0.3.29
> +OPENBLAS_VERSION = 0.3.30
>   OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>   OPENBLAS_LICENSE = BSD-3-Clause
>   OPENBLAS_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
