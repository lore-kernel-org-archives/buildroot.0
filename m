Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D8DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11E360FC9;
	Wed, 23 Feb 2022 20:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqSqc0Q9ofPR; Wed, 23 Feb 2022 20:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3545A60F89;
	Wed, 23 Feb 2022 20:32:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED35A1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB26C60F89
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71KDZ7ao9Kcf for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:32:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40AEA60B96
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:32:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p15so54777749ejc.7
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VF5OQes46s7KgxYWVJudYb3g6EfIz68X6TI+gArz1jw=;
 b=gn6T1p6s2q/8eLC3Mj6UwIpvxD2OBEePG/GYyMeUdB8UpnEFagpqEKegjr2E974l7p
 783anbmF+6lJA0NDlhMvaLRLTc46UxZbgAzT0Z8HLRzF4cuRunjDQE31wGE7VHhN3DJf
 kLu45bKK3WL64aVW4cF+iZK4OYZH3ZPQT1RnyUOJOimRnfe0us/dCZ1T6n8oeKMG68J+
 SK/YLpR2JV/yQ4sPxqTi9/Zxi9QwzNhAx4JCn1q8QMmBd4CA101+88SCDYl7xt2yNS7w
 kjB4oUXiTlAOmOJ+AoM3SeT4kl9O8i3zbHjSwbJfrQlD46Zpq8DJ/PpoTja5EsJyeirC
 QNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VF5OQes46s7KgxYWVJudYb3g6EfIz68X6TI+gArz1jw=;
 b=mYLpnYBmAhSuhnysjtzHThpM9/tLHUAOvobKDM6UH1f5IRl1Ylhn3FMLfHiNL0+6r4
 qLvHnz3UqNoEBQeXQv1O6YtpqXrWYY/h2PH1IS8+Z9veBp1JdZspj/TvoN111cJpWWOh
 0h7Thff+UzrC1do+2Trd7dTDNj8dOnb0CkLsmAjyTL2BdcBGxnhNYvpBuoZry1qzpufX
 EoYX1VXZXvuXrglK61h1ylN2fWNFgpmu87pzzD0YFoVyrHX8hkX+bHixN+G5B8nNSEs9
 DRHb1TbEjd+miV4i6p9+1OFyotUN/Rq+P60M+NlFNocH76uiVBwtaiXUVEGBGVcVMsUh
 2DKw==
X-Gm-Message-State: AOAM533AS9FL2o3hpVKklLd/vnRPAPI5JIQTIXNvw6gxOdJ3VKTngA9U
 Zg/7pKTjCAr2jSNvstpZJV3gn7OCYH09aA==
X-Google-Smtp-Source: ABdhPJyddm6QEvpcino+7TfpDwg62HMBQJhyLCtXul1Qbijzl/XOw2IxSMaIQiDWtX40tvV11PN4xQ==
X-Received: by 2002:a17:906:ce23:b0:6cf:7203:ded6 with SMTP id
 sd3-20020a170906ce2300b006cf7203ded6mr1076731ejb.170.1645648359253; 
 Wed, 23 Feb 2022 12:32:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 9sm300819ejk.28.2022.02.23.12.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:32:38 -0800 (PST)
Message-ID: <716c6a20-b60f-fda6-3e0e-06f97aab4b68@mind.be>
Date: Wed, 23 Feb 2022 21:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220217005344.2357385-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217005344.2357385-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 6.7.0
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



On 17/02/2022 01:53, James Hilliard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/8bf/8bfc2abe3ab7a0b53aa717c800a4c7a3c964f426
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  We normally wouldn't be taking a version bump in master any more, but this is 
anyway a new package, and it goes from a random commit to a tagged one, so 
applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bpftool/bpftool.hash | 2 +-
>   package/bpftool/bpftool.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
> index c7d4ae250e..2e414b8eb8 100644
> --- a/package/bpftool/bpftool.hash
> +++ b/package/bpftool/bpftool.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  c868cb85bf44195ec6cd20649c3db4f7aff64a38d950a1c2911d981fb2d7042c  bpftool-a7f0e7f057283ae8af3de4578bcb8b7ee80b7144-br1.tar.gz
> +sha256  e4ce219d3b87dd70d8dbfb8f02bd356f70c010f739f17baca1c8912199a8a72b  bpftool-v6.7.0-br1.tar.gz
>   sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
>   sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
> diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
> index 4276f91958..8742917253 100644
> --- a/package/bpftool/bpftool.mk
> +++ b/package/bpftool/bpftool.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
> +BPFTOOL_VERSION = v6.7.0
>   BPFTOOL_SITE = https://github.com/libbpf/bpftool
>   BPFTOOL_SITE_METHOD = git
>   BPFTOOL_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
