Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF03D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E446083E;
	Thu, 27 Nov 2025 20:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_mKfFaXMJRs; Thu, 27 Nov 2025 20:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 188766151B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188766151B;
	Thu, 27 Nov 2025 20:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 477072A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E15440315
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Enp2sCJt3W1B for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BE6F402A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE6F402A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BE6F402A3
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:01:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A29AB979CEF; Thu, 27 Nov 2025 21:01:14 +0100 (CET)
Message-ID: <e4159c5e-6db8-497c-b84e-02687fa45159@rnout.be>
Date: Thu, 27 Nov 2025 21:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20251117171656.260404-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251117171656.260404-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273674; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+Oo93cjImeO0guicxJloVw1mxgxpaHn/0Vntpv03J8U=;
 b=D3yVg4sXU94UFvWblpzD+9nB1Meoycpz81bbtQFzbd5WHIjVumrhC0sEiXGQ4lfMijqlLa
 2uH48BUKrAZTUU6PfAlacUouP9qRw0NCi+63HWKcdBlcIObGt1wKloo4mpjzAxRc/5Dozt
 hRyS39KuPrsFHtaNf0F0TwagC/b0KoljMm5IPCXJHpIZmIcl1wvFW0G0TJotwfyNZvrUB6
 GXzA5CsT3M3NrOmmmo2YhKR5Fz8CD9T0L7ypOLjwxNzQytIVIaGM4e9VWYvLH0Qzj/pPC0
 SoQaO9TAvBGiiJctr0tdiFahHa69OOCepnY7Z14pJEY+19hUdufT2siVKwQ0pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=D3yVg4sX
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/redis: bump to v7.2.12
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



On 17/11/2025 18:16, Titouan Christophe via buildroot wrote:
> See the release notes: https://github.com/redis/redis/releases/tag/7.2.12
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
> index aa3253335e..7677642ed1 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d  redis-7.2.11.tar.gz
> +sha256  97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc  redis-7.2.12.tar.gz
>   
>   # Locally calculated
>   sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index cd9736663b..e6175b69b5 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 7.2.11
> +REDIS_VERSION = 7.2.12
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>   REDIS_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
