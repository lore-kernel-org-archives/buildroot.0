Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2908BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE588196E;
	Mon,  2 May 2022 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUEH26FHXV2K; Mon,  2 May 2022 21:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9DB9818B5;
	Mon,  2 May 2022 21:55:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1C6A1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B5541626
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvW3BhdqU5OR for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B66514109B
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:55:40 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g23so18021268edy.13
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jp1j/p3u6D7F5MP/QxlYC6wyXTdA1TIAyvTn9ESdOq0=;
 b=KNBrt1tHnt/DI2v+nLXjYZfJK4SfdZqIK0nRRai6ch01DYZydwcBdoMmaSAI6d5Mez
 FkH+Ckym0dqwtWc+gAlFLIvKTi+rK8NytblxhEDwADNpjdgBxq4wjsEBHc//Jfxv5BZq
 3Xa5hjIwiex5WhR45hlZPc4zvmJop/Vd6xRrD+I6IpXnUBp3gcQ5NY1X9TPB1xQuxutE
 W0Gj1mivbGEEBwiTFA5h2TWSIQd4jKJehkoov0aEEz/zQa9HRiLiNgPqI4TvlL6iaqPq
 BIgnGLTdm1MpSSp96tYQGZEP+bAsALDdvsJSw39V1bvsrnRy90TqjUFlqFoyLRcjrrII
 Ublw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jp1j/p3u6D7F5MP/QxlYC6wyXTdA1TIAyvTn9ESdOq0=;
 b=1Nihmls+5CrvWbiTs0uXlQnFN+zDpGO3LZL97O4HHsJBLx9Tua0nxxl91wf1hoJp2g
 dI05Oed4YJwQ2nJ3nOw6wc89UOqIA+DaM7DYlSWRSDlUJTPWLejgK5ZcrvcazdoOego+
 x2PkBT4WtlvrSRTK0FxAiaoeyXcULU3+Pp9DYMXKpazPNpBSCEU4QXuRHdPyUy6SEJvd
 iPNOUyRIX1yKKa4LdRmrfTs6PPtD2v0agO1Po6j/FlHzndKzUG9FgYwea8JSK4xbAx4x
 mJpvpTt9OIc6GOO0HcqVMg28TVmr1VSJGw6vOdqr523jUqG6zjsYPYpULMgiZpAlqk4o
 bwFw==
X-Gm-Message-State: AOAM530l+igNTwvibZAiAUbymLB0waN+hf4787G2LpbkeGWP/2z821GO
 Q4H/O1tXQJrRWCZBiXJFLHcRmw==
X-Google-Smtp-Source: ABdhPJwLIROFKiJYtaIZsh5sshYUlU/0HJw8xCaJTNJq6kwMlivBYp/Ki43JuXaDs09fx2H7sFVXmw==
X-Received: by 2002:aa7:c5c9:0:b0:425:ca31:4e35 with SMTP id
 h9-20020aa7c5c9000000b00425ca314e35mr15646139eds.315.1651528538892; 
 Mon, 02 May 2022 14:55:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214e1bsm3983572ejc.129.2022.05.02.14.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:55:38 -0700 (PDT)
Message-ID: <923bebe9-28e0-889c-9a95-5a22449b1024@mind.be>
Date: Mon, 2 May 2022 23:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
References: <20220502101208.1576497-1-titouanchristophe@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502101208.1576497-1-titouanchristophe@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: bump to v7.0.0
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
Cc: Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2022 12:12, Titouan Christophe wrote:
>  From the release notes:
> (See https://github.com/redis/redis/blob/7.0.0/00-RELEASENOTES)
> 
> Introduction to the Redis 7.0 release
> =====================================
> 
> Redis 7.0 includes several new user-facing features, significant performance
> optimizations, and many other improvements. It also includes changes that
> potentially break backwards compatibility with older versions. We urge users to
> review the release notes carefully before upgrading.
> 
> In particular, users should be aware of the following changes:
> 
> 1. Redis 7 stores AOF as multiple files in a folder; see Multi-Part AOF below.
> 2. Redis 7 uses a new version 10 format for RDB files, which is incompatible
>     with older versions.
> 3. Redis 7 converts ziplist encoded keys to listpacks on the fly when loading
>     an older RDB format. Conversion applies to loading a file from disk or
>     replicating from a Redis master and will slightly increase loading time.
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/redis/redis.hash | 2 +-
>   package/redis/redis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 74a9392a63..582c3afa03 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab  redis-6.2.6.tar.gz
> +sha256  284d8bd1fd85d6a55a05ee4e7c31c31977ad56cbf344ed83790beeb148baa720  redis-7.0.0.tar.gz
>   
>   # Locally calculated
>   sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index f3c030d68c..3b91fbf8c8 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 6.2.6
> +REDIS_VERSION = 7.0.0
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>   REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
