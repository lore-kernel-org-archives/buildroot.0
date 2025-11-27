Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F6D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D70F4067A;
	Thu, 27 Nov 2025 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wacHVw4bwfRw; Thu, 27 Nov 2025 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC80403D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC80403D6;
	Thu, 27 Nov 2025 20:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2827E708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED0D84400
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mvuxuuKcrk3 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01DE284404
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01DE284404
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01DE284404
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:01:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2338CB979CE5; Thu, 27 Nov 2025 21:01:26 +0100 (CET)
Message-ID: <e562a014-05d1-42b7-8e9a-f4da88df453e@rnout.be>
Date: Thu, 27 Nov 2025 21:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20251117171656.260404-1-titouan.christophe@mind.be>
 <20251117171656.260404-2-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251117171656.260404-2-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273686; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=eiwgDuC5oFIuqfgwMhVDCAbJL8xgRNFcdtS/QVLa7WE=;
 b=S/lkPdEc6BkXXNQ8wn/jTMiZrwn8hVZ2VS9A+J0zdRRDDdXDkvPq4kEnqLZAOMWgyc3Xu7
 SedBjmeqlhPjKiv8/qROVxMiiUZw/dCgBKkq5J98nA2EmOyZQfpeA69nb+Dp92zke2azuB
 haMtrQNOPTrU1poQeMenh7qTAXxT+1wZMmVEjLTdyXzG7+kfKLbSf1A2vJGV27oOU4Xd+v
 +8rzRGy1sdzElkN4AWPRk6sHM2Y68/L/dv07XgxUVaE8OYn9tya+p3Y6NVquGWuORlBMo+
 PA1nhDV0+uImKaXAZYYjvQ/EYkBVEnJsmGM1rT0oa4z6vDS/2OFP30E4s6WisQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=S/lkPdEc
Subject: Re: [Buildroot] [PATCH for 2025.08.x] package/redis: bump to v8.0.5
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
> See the release notes: https://github.com/redis/redis/releases/tag/8.0.5
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/redis/redis.hash | 2 +-
>   package/redis/redis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index e9a495d633..cad5517181 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  7e185265d455ea8deb6bb7e071352ea691ca4d7b5105fc172fa524af59917b89  redis-8.0.4.tar.gz
> +sha256  012bca956fc7151abc2281950e69768ee9c53ce4b36588772041675bc95fd313  redis-8.0.5.tar.gz
>   
>   # Locally calculated
>   sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index b954190546..cefca5f915 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 8.0.4
> +REDIS_VERSION = 8.0.5
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = \
>   	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
