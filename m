Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CAAC7EE2A
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 06:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1E34179A;
	Mon,  5 Jun 2023 06:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1E34179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTsqngkIXybp; Mon,  5 Jun 2023 06:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B8E4179E;
	Mon,  5 Jun 2023 06:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B8E4179E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA3461BF59C
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 06:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A17424179E
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 06:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17424179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nWv6U_cE2pm for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 06:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DBB4179A
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89DBB4179A
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 06:30:37 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so6872300e87.1
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 23:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685946635; x=1688538635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jfti9GwEDJEUYoLj3QZjfQxNKY66QTOjxLwY6ebVHno=;
 b=jH6uGfkeNbMN2s7RN5nXqnM6pL/DuhigWp4afICcqUuuNMwNozRiUduexOC2IlHyyw
 pLo294sNs00iiXwQd3dwib9cjDVftrgLEU2AuhBgVQwoTr/KN0X6wViA0KOPZq6yk5Zq
 DEndhwYH5S/3iey1uaMmneoidPdrRxdN1lOCUVsPgpVSyBr+YvnSmrM5RjXYuefMS9dx
 N7f/+htEbcFzH0pd9MFqhRNPdv2MRIDreRLb/D6BBuO6GYVBCB+aGDboFWiQkuaaZPk8
 nwj6xaq8twqERvLAyl2U/a2S0SWFkPuGknXT9V+6NI6UCL4aBmw8qeiBFpgoMAF3+bkg
 odfA==
X-Gm-Message-State: AC+VfDxEccWtEMhzOV8PadPeT05Z3j1fuGDeyr4HABUqXP//cDSDdxLF
 rfLAaqKTcmxmw30OjftWOZ5nP1javFU=
X-Google-Smtp-Source: ACHHUZ5o0Zfd2JRXkd4mm+ymKHaMupJro/0sHwf1IoKFd9qglzz9ESoDvhpsEj1a3dNadWaj77Ms3A==
X-Received: by 2002:ac2:4c50:0:b0:4eb:4258:bf62 with SMTP id
 o16-20020ac24c50000000b004eb4258bf62mr3579034lfk.8.1685946634932; 
 Sun, 04 Jun 2023 23:30:34 -0700 (PDT)
Received: from [10.101.3.227] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 x12-20020ac25dcc000000b004f0049433adsm1007394lfq.307.2023.06.04.23.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 23:30:34 -0700 (PDT)
Message-ID: <a04841e1-f20c-0d9e-a236-aed4166e8f73@gmail.com>
Date: Mon, 5 Jun 2023 08:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230605062451.405573-1-titouanchristophe@gmail.com>
From: Titouan Christophe <titouanchristophe@gmail.com>
In-Reply-To: <20230605062451.405573-1-titouanchristophe@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685946635; x=1688538635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jfti9GwEDJEUYoLj3QZjfQxNKY66QTOjxLwY6ebVHno=;
 b=sQ94mvnRnMkX+rHyDkdJTipHrY0rYFv98twT55gcOtlDCmeq5tHOu7a/aEfdh/xS0p
 xT0h7K0Zys2WTN3uXnt188oGQ5mgtb32FOrvpRiJtF9cTlw7XC0p9bl3kZJSbi7zdDzq
 2Ty80HpHB3dE0zcD3AkrhChary8M5P/hLfkN7ti4DNKJPE7bD2f3SwRWzdl4xOIV1jsw
 qE8V32lYm6Pww0zmFhpqSK5I1KjZ2HdlPpfYtQT3KuQ0yQ8LiouGx9HrAo2knMoSfx2O
 UwBUPr3AP3XvevGRvYXIEwy53RqjYQw6HZ1wMoQCB8wQVqHRr1ngvF/M5bwI4bvLjRtn
 wENA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sQ94mvnR
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.11
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

This patch is also valid for 2023.02, could you please apply it there too ?

Best regards,

Titouan

On 5/06/23 08:24, Titouan Christophe wrote:
>  From the release notes
> (see https://github.com/redis/redis/blob/7.0/00-RELEASENOTES):
>
> ================================================================================
> Redis 7.0.11 Released Mon Apr 17 16:00:00 IST 2023
> ================================================================================
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
> * (CVE-2023-28856) Authenticated users can use the HINCRBYFLOAT command to create
>    an invalid hash field that will crash Redis on access
>
> ...
>
> ================================================================================
> Redis 7.0.10 Released Mon Mar 20 16:00:00 IST 2023
> ================================================================================
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
> * (CVE-2023-28425) Specially crafted MSETNX command can lead to assertion and denial-of-service
>
> ...
>
> ================================================================================
> Redis 7.0.9 Released Tue Feb 28 12:00:00 IST 2023
> ================================================================================
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
> * (CVE-2023-25155) Specially crafted SRANDMEMBER, ZRANDMEMBER, and HRANDFIELD
>    commands can trigger an integer overflow, resulting in a runtime assertion
>    and termination of the Redis server process.
> * (CVE-2022-36021) String matching commands (like SCAN or KEYS) with a specially
>    crafted pattern to trigger a denial-of-service attack on Redis, causing it to
>    hang and consume 100% CPU time.
>
> ...
>
> ================================================================================
> Redis 7.0.8 Released Mon Jan 16 12:00:00 IDT 2023
> ================================================================================
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
> * (CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
>    commands can drive Redis to OOM panic
> * (CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and ZRANDMEMBER
>    commands can lead to denial-of-service
>
> ...
>
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>   package/redis/redis.hash | 2 +-
>   package/redis/redis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index eb8c21be98..69bfc1475f 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586  redis-7.0.7.tar.gz
> +sha256  ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3  redis-7.0.11.tar.gz
>   
>   # Locally calculated
>   sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index b08be11538..e5d3de8eb9 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 7.0.7
> +REDIS_VERSION = 7.0.11
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>   REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
