Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED0EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EF260AA5;
	Sat,  5 Feb 2022 22:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6wDXuyczLtf; Sat,  5 Feb 2022 22:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A5D260806;
	Sat,  5 Feb 2022 22:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 341551BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2292B60806
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3tutooOgE4my for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42C4A6079D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:54:12 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k25so30360657ejp.5
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QVfj2GA740y7a0EumlZppOUQfrvvgHJndEEYnw50djA=;
 b=dkheL21Ij2MQpQMetyxZXXQVR3PDl2rTUwBsrt0gnbBQZbBSgzhBRW2MQ+8w9pc1bv
 rH5SQJMBphPrMN+KzULAiDm2geVU2NT+v8UFKZXv3r+IMqHYenhPfSjd/peX18VyatX1
 u41uzmlGV97eOI1V0f4OTzuME2ay1VEck/V8IhvrV8To0CuUPU2lTr/FxUXz6Mj/cJwx
 JbiwirnoZrz5C0tRT3UsCiA/cFqxXAMJDy/Cj8tI/ykJJc5wm0l7XsG2IK5XYKtMHuXj
 zfgq1oox8RcuqnIPWLm8PUrAUKfkTQhW94lRq0TfGwdgoypnhKUDQZKhyoTgvC3cJBwO
 EBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QVfj2GA740y7a0EumlZppOUQfrvvgHJndEEYnw50djA=;
 b=JDDdK5lxB3SyxKl3NeiKobC5ExYF/NvBpqKhE2OSe52YaTrdmOJIgHuHzAi88tetDd
 UTOkbxX8Fl1Lk+Z5nFnvBQvt0/0Cg2f6r55GEBiIkyf53I4VEIHV24d9QZwooGqWCBOP
 B9KnG956etzWgfCyINh3YD8ArDARplhJonfgJdRB5QbDYjiFDpPRNkPMJLIuZAApVQj1
 tMspEPlFc2IKxlcGq1n3gugaESS5oBRCVUzYLeXO1m31RBo38ztNuLttwJH+qWl1Qfo8
 BjR9w6X3fCGrBa0ov/oZjvD+JwuvSQz2a4P/3UIQTXfpyPYX1ht4llJATw5cWMOfDjz8
 irOQ==
X-Gm-Message-State: AOAM530v8OFilipK7GM73Bep8AgMPnT1G/6hXJyeJ84YOGIgSM6zYQH4
 3Lprt8H+BDX8wV11NvtKdiw+mA==
X-Google-Smtp-Source: ABdhPJzAZFevy2IFAB+g37K2aaLBs2biXjWSw030nFwWPNKa4p2PlM+dsaEPsx0NONBFFs7w3iflyA==
X-Received: by 2002:a17:907:2d11:: with SMTP id
 gs17mr4702863ejc.189.1644101650498; 
 Sat, 05 Feb 2022 14:54:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ry6sm2004648ejc.45.2022.02.05.14.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:54:10 -0800 (PST)
Message-ID: <ea01a1ab-2f48-f815-7d69-5858afba69e1@mind.be>
Date: Sat, 5 Feb 2022 23:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Pieter De Gendt <pieter.degendt@gmail.com>, buildroot@buildroot.org
References: <20220126082505.10253-1-pieter.degendt@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126082505.10253-1-pieter.degendt@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: enable context/coroutine
 for arm variants
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/01/2022 09:25, Pieter De Gendt wrote:
> Add boost context support for aarch64/aarch64_be and select AAPCS
> as ABI for all arm variants.

  I've added an explanation _why_ the change to AAPCS (because ucontext only 
works with AAPCS ABI).

> 
> Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> ---
>   package/boost/Config.in | 1 +
>   package/boost/boost.mk  | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 1c405a36c3..cc11b8f53e 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -74,6 +74,7 @@ config BR2_PACKAGE_BOOST_CONTAINER
>   config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS

  There's a comment just above this that refers to an outdated URL. I've updated 
that as well.

  Applied to master, thanks.

  Regards,
  Arnout

>   	bool
>   	default y if ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM)
> +	default y if (BR2_aarch64 || BR2_aarch64_be)
>   	default y if BR2_i386
>   	default y if BR2_mips
>   	default y if BR2_mipsel
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 2d2a8fb311..b6681b0ad3 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -85,7 +85,7 @@ HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
>   
>   ifeq ($(BR2_MIPS_OABI32),y)
>   BOOST_ABI = o32
> -else ifeq ($(BR2_arm),y)
> +else ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
>   BOOST_ABI = aapcs
>   else
>   BOOST_ABI = sysv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
