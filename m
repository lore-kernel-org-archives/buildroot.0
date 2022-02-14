Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA3DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE29414C9;
	Mon, 14 Feb 2022 20:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tm9rSu8xPOvL; Mon, 14 Feb 2022 20:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE654149D;
	Mon, 14 Feb 2022 20:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB2721BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B771A8186B
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDQ4NVO_DV1f for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:36:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98D2E8184F
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:36:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so176501wmq.3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AXD8jHun6+INfKSL93ZHix78qwqv7nW3y74mGyWjXBA=;
 b=AX1lkybggu9TGlJ2G8CSpkuhZVVKPoMxz8F9E5oKVnJeXbvLx/sctEhYXMlKX+9WnK
 g4IcTE4LbmwdtzDLU0zsvBbgXfdlaKQQ+Pd3XE9435dXK+pvLU6vYjNfTTiRs2yivFUm
 yBJORic29F3bJcANyDIRMoj2Zi+kVOCQrN6IwXc0CiKJVVr1QcSMV4uTR7U8d4Fv+D3C
 naMUjHG8Y66R65lUxvm40LXcjjXuwOAZkbaTP7l74kTEFneWBn2Z1QT0v3lZUxUUJSBp
 8DOEyTXeqvF7qbOEI5J2z/9Q3vyOIWjZ3CxQ57F53K4YzQxtw3eY1rli5X0RSk4kNtzp
 DjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AXD8jHun6+INfKSL93ZHix78qwqv7nW3y74mGyWjXBA=;
 b=p78OJkcPPzXFog4b9ESswrEVRQDZmMieTA+ashbz+o8mhj8YT3HRB7Xz/RqGZO7hfi
 qqiXGMDl/SF2y1tDmBV01kr1mHpAsWNa3NyMyp35Fl1bnLQeeERPnTKDBvMXYq5ieMwh
 7NflZfF9q2xpnqMzIx7ao1CQlAUEHYSTXpipj9lAD6p/kcNeiQZzB4XroNFQ8gVNX7IC
 OAYK/q7m+728piXPEZp9oHHU5nxV1HA7foQlqUi41hMh/uwJ65Tv15vIW2ASjPevwu+k
 SgxX+Artvsg0P039g1KCATUQ+GcTqqzRNAEi/KpOU5GJlTyRRcy7m7EhyFHj1AyOVeUm
 tsvw==
X-Gm-Message-State: AOAM530zDskdDLKyus/kCLBIl0dQE6LqUC7f8CWbHF7IUT62HQFMMbga
 c7dz627v1PaHNxrkxk4eJzlG+A==
X-Google-Smtp-Source: ABdhPJxvk5DLyQl+gwyBQkUs8HboMaO89wTdcCJ07qgVcKJoBtV7AB1/oxwCoOkX/krmnuBaRivPJw==
X-Received: by 2002:a1c:f007:0:b0:37c:487:2c59 with SMTP id
 a7-20020a1cf007000000b0037c04872c59mr445568wmb.26.1644870998728; 
 Mon, 14 Feb 2022 12:36:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t11sm17600289wrs.66.2022.02.14.12.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:36:38 -0800 (PST)
Message-ID: <78553604-4270-93db-de3b-638dea64867c@mind.be>
Date: Mon, 14 Feb 2022 21:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220208192157.4058193-1-fontaine.fabrice@gmail.com>
 <20220208192157.4058193-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208192157.4058193-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/keepalived: fix build with gcc < 4.9
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
Cc: Ilias Apalodimas <apalos@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2022 20:21, Fabrice Fontaine wrote:
> Disable track-process to avoid the following build failure with
> gcc < 4.9 raised since bump to version 2.2.7 in commit
> 79f631000fe6846e72f44810452bb764c228ad44 as suggested by upstream in
> https://github.com/acassen/keepalived/issues/2094:
> 
> In file included from ../../lib/rbtree.h:24:0,
>                   from ../../lib/rbtree_ka.h:26,
>                   from ../../lib/scheduler.h:40,
>                   from ../../lib/notify.h:31,
>                   from ../../keepalived/include/vrrp.h:41,
>                   from ../../keepalived/include/track_process.h:31,
>                   from track_process.c:50:
> ../../lib/rbtree_types.h:31:25: error: initializer element is not constant
>   #define RB_ROOT (struct rb_root) { NULL, }

  I expect that they'll introduce more things that require GCC 4.9 over time, so 
this is probably just a stop-gap solution. Still, for the time being it works, 
so both applied to master, thanks.

  Regards,
  Arnout

>                           ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2132570fb0407abc0e70146d771471e13ef10237
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/keepalived/keepalived.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
> index c7e8c3e2ec..5d6cf174e3 100644
> --- a/package/keepalived/keepalived.mk
> +++ b/package/keepalived/keepalived.mk
> @@ -56,4 +56,8 @@ else
>   KEEPALIVED_CONF_OPTS += --disable-nftables
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)
> +KEEPALIVED_CONF_OPTS += --disable-track-process
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
