Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7DAC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A5AC40816;
	Thu, 17 Jul 2025 19:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9glGE1LY6gb; Thu, 17 Jul 2025 19:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0361406A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0361406A5;
	Thu, 17 Jul 2025 19:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CEB3226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3396F400C0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9FHDugzzjML for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58CED40358
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58CED40358
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58CED40358
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:56:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45E96B977AA4; Thu, 17 Jul 2025 21:56:15 +0200 (CEST)
Message-ID: <a81a2274-440c-4173-9e47-4a4708e086d7@rnout.be>
Date: Thu, 17 Jul 2025 21:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: thomas.perale@mind.be
References: <20250707081113.1996451-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707081113.1996451-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=W76ar/I/TegE6FvSouEzOe2NPqCLf2xgFdomEjg9UKc=;
 b=aXkEsTAtNMRRlECZ/EDpzIInDApoZ8KPzF62BVnC99UIkeUWD9AWZmZHIfTy7LF1oMBVE0
 HivEurJ9vFmrraEFxqQn+kRTicjWeRKapIcwUm+g9bu/Sdj8bpwWWQguXgV0YgeypmRWzv
 tGFQRxdExLtpDrCQtdE3/67PtCiDjXZS+iBQAvr9mymUUi1Uw020Mh90RH9Uv+0cgCHf20
 sIXvg8ab69TbTFp6Xy8Jmtg+wU8Ss0/KBoNZlLwJJk6mL8blFU8WB0t5CuAhR6LZJM8jl0
 sf6dcANxG6ucq73d99hdiJobCxscX+BSUK4s7E+X2JVZgb0VhGFaqosA4Fsuyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=aXkEsTAt
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump
 to v7.2.10
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



On 07/07/2025 10:11, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> 
> - CVE-2025-32023:
>      An authenticated user may use a specially crafted string to trigger a
>      stack/heap out of bounds write on hyperloglog operations, potentially
>      leading to remote code execution.
>      https://github.com/redis/redis/security/advisories/GHSA-rp2m-q4j6-gr43
> 
> - CVE-2025-48367:
>      An unauthenticated connection can cause repeated IP protocol errors,
>      leading to client starvation and, ultimately, a denial of service.
>      https://github.com/redis/redis/security/advisories/GHSA-4q32-c38c-pwgq
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/redis/redis.hash | 2 +-
>   package/redis/redis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 158931bb89..630f6b6d76 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  2343cc49db3beb9d2925a44e13032805a608821a58f25bd874c84881115a20b7  redis-7.2.9.tar.gz
> +sha256  e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7  redis-7.2.10.tar.gz
>   
>   # Locally calculated
>   sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 7c847690a9..a2d4fbe138 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 7.2.9
> +REDIS_VERSION = 7.2.10
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>   REDIS_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
