Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98C0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A5C80BE9;
	Mon,  6 Dec 2021 21:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4yKuFXZh45C; Mon,  6 Dec 2021 21:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D813B80BE1;
	Mon,  6 Dec 2021 21:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7591BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 609DC404BD
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojIY1tGPFXvT for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:33:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E4F7404B9
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:33:35 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x15so48885726edv.1
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e7AsMF/39DdxmK7LiuIVHOiepniTBjD86Br9LSFwWso=;
 b=Fr24LueDSVlko+IGCRc+Egrtt4Y9lIVTykCV+pl/rPVmGy+jGF0bd4n4sXhvdvbcI6
 GO2pjvlcA0PIWUlH+KKq6GiRfCzo864UO0TZD6cs0stMyE50K9IpnPMtS6K8LqlIj1dw
 0KNmKQtVCDSCl/JwdLWBR0sGJ70yZjVinTFal18hyeuuEG3r5ynL+RYQeT/1ZFqapry1
 u4NVf5mN47VZDjzrVZMkqkPRZA3bLoXakboH9iK6dl/icbTyEzTn2ut5AlC7jGyz5Wk9
 syEtbY8FKhcYClbsNyJ5uqtpuJmDnEITG9+0RFWWpfJ5VEHGgqkSmCmcG4gIRX80fdt8
 Pa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e7AsMF/39DdxmK7LiuIVHOiepniTBjD86Br9LSFwWso=;
 b=z0VJozeDLz9GK+GOl0n5F/ftkYZndkmcD+uwMJDWzwcoeF6kYcXOKwaCOvWbntYnAG
 f20HxlPQpi/K0tU70PjWW554XWsy4zeCPGrvUDD030OeYGuxvQ6pDRdL5GnBhXuDp6yq
 NpYkMtoZvvxB6U/nhIJJuQfRER0CMrf02U15L30jw2Ae4T4M7Gfl1T6mC/oP0HVGtXrB
 vGMmldkblmSdTkMj0pNvdRgxQt+sCtg6wMwj5O8DLAkAinskrld3VIXA2pVNPKf55N+r
 gD8b/WA6QdqogpKNvw1MjcmknKyXS1BgiFqIOQJGmPh55xFt0MfawDfUiESGwWwduETo
 Ms1A==
X-Gm-Message-State: AOAM530p07bJAr1CCUzI+d4Y4zAws/+iYflVJtTuW3c7rTzmIC7eFC8m
 6ksLefw2utd9KNxDosvQq8bEjA==
X-Google-Smtp-Source: ABdhPJz8/YHo8cAsYPex7ZmrzqC1iZtrGabB9eogctSz/9/IZHgXsQoxfhjaFKX3cfmPTlPh+rFcrQ==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr2496874edb.216.1638826412508; 
 Mon, 06 Dec 2021 13:33:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w23sm8653918edr.19.2021.12.06.13.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:33:32 -0800 (PST)
Message-ID: <f8cb816e-7922-f5c0-9f2f-a2ddba537958@mind.be>
Date: Mon, 6 Dec 2021 22:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211206192732.373740-1-l.stelmach@samsung.com>
 <CGME20211206192737eucas1p12496b4769a286f972f94b88a8c39dd81@eucas1p1.samsung.com>
 <20211206192732.373740-2-l.stelmach@samsung.com>
 <11d9789e-5a1e-5f75-8d18-6c27c56c4334@mind.be> <20211206212347.GC2603@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206212347.GC2603@scaer>
Subject: Re: [Buildroot] [PATCH v2 1/2] arch: Make page size configuration
 architecture-independent.
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/12/2021 22:23, Yann E. MORIN wrote:
>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>> index 61fdc0c76c..e66e0db52f 100644
>>> --- a/linux/linux.mk
>>> +++ b/linux/linux.mk
>>> @@ -328,18 +328,21 @@ define LINUX_KCONFIG_FIXUP_CMDS
>>>   		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
>>>   	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
>>>   		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
>>> -	$(if $(BR2_ARC_PAGE_SIZE_4K),
>>> -		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
>>> -		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
>>> -		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K))
>>   With my proposal, this can be kept as well. The kernel options are anyway
>> arch-specific, so it's simpler to use the arch-specific boolean than the
>> generic one.
> Actually, I think this huge list should move to the individual
> architectures.
> 
> Like we have a mean for packages to provide kernel options, we should
> introduce the same for architectures.
> 
> This way, it becomes easier to maintain (I think) rather than this huge
> mess...

  At the moment, there are just 3 architecture-specific kernel options: AEABI, 
POWERPC_DISABLE_WERROR, and ARC_PAGE_SIZE_*. Not exactly a huge mess IMHO. And 
also IMHO, moving it to arch just increases the mess: for packages, the kernel 
option usually have to be set whenever the package is selected, so 
FOO_LINUX_CONFIG_FIXUPS can work. However, for the arch-specific fixups, they're 
always conditional on something else than the mere arch, so you still need 
conditionals in there... You could indeed add them to 
PACKAGES_LINUX_CONFIG_FIXUPS directly in the arch.mk, but in terms of lines of 
code it really doesn't look better. Also in terms of keeping things together 
it's not better: this is something related to both linux and arch, so you can't 
ever put it in the "correct" place.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
