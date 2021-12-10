Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1FAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 18:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC69E614D0;
	Fri, 10 Dec 2021 18:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpq5Q5x97ADW; Fri, 10 Dec 2021 18:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A744614CC;
	Fri, 10 Dec 2021 18:24:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1641A1BF2B7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 18:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 031BA4129A
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 18:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oL53BIH3Yhmk for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 18:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFB17412B1
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 18:24:22 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y13so32153859edd.13
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 10:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=e9z5ai2kph7V8a5CEBXwhRTX3V5TX6OeKLU5xxlr3LE=;
 b=Bh4eyTDquwnNwoirYjbpk2ijIehbGRjhRBq8XZJuPUk7wEy84yFRWkQgi0bpqoYS7C
 JIbhP7t5IQCV8IrAB1Be4H20XIiASfYKPZgd7iCPuomJDNQslgA/Hvh6H+z0raF4xvCu
 o/Un0wE3x4qBP6jNjstqF5hS90CpFEsoMT4DafdKayD6Tgv6KZkjdbi35LKaU3DCbEO0
 r0RhT07eZQXTcs5VK8eA+l+fzgGo5Usj6C4X6xQfnL9Yt4aaITqZftY0wQOFcjVeKGGp
 X+wbe5uGYL0aWtmZCRfw/Cqf4adQVot4GHb0y1MiSYXI5wXf/FgHSPOiV5d8wJ26YLDw
 nOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e9z5ai2kph7V8a5CEBXwhRTX3V5TX6OeKLU5xxlr3LE=;
 b=5lbYH3wJpowe6Z+xqabsF8Rbq3IC5zUZX1CeP0IYx+p0913Zepdc/4gMHpvJ543ho9
 7QkgWn2H4TrTDfzy1xp84GLFnqyE3oP6+CPx7DvJYFWTn8Q69rGK20gfgbiXNwRdaRBJ
 C5xnJfoucBJvPKdluKjDD/xH5ZAqAgFKoEGdi4gHXBpIxIsint1vE1qNjOvjcTnOIBZE
 62BjuEsySPkTf7gTDoO1BxRdQ9+0jsaMPQEeznH7VN0z8zzZxdcmWajQO1d2Qe5vbW21
 Tma4cMzhWO7eNXPIE4ymPqtB1EXu2N9n51jjEKvbcWIvpF4FikFpH/Ei88m7olgNU884
 gueA==
X-Gm-Message-State: AOAM530XtCfdzM3mFV1Hu9jJFpuse7fFU/Ph8YLbItA4ASMC3/JGpfMN
 h2LO8mbWwlx3ZSgX2Jjp6XJNYw==
X-Google-Smtp-Source: ABdhPJwENnGAKgcTahGd5K12xQ1d33vAF+LJecNvXmFn9WJgAfubgy2o9shNag4HcvxPwVlEocVozA==
X-Received: by 2002:a05:6402:1ca2:: with SMTP id
 cz2mr39571073edb.302.1639160660472; 
 Fri, 10 Dec 2021 10:24:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f17sm1933566edq.39.2021.12.10.10.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:24:20 -0800 (PST)
Message-ID: <5be296cc-0cc1-77c1-01dd-8cffc8ecbefd@mind.be>
Date: Fri, 10 Dec 2021 19:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Andrey Nechypurenko <andreynech@gmail.com>, buildroot@buildroot.org
References: <CAOiXNkBa2iycZvTW3pmSzHq6EmWTGoQfD_iHQ5mWyDyVRBYHeg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAOiXNkBa2iycZvTW3pmSzHq6EmWTGoQfD_iHQ5mWyDyVRBYHeg@mail.gmail.com>
Subject: Re: [Buildroot] -E flag in apply-patches.sh
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



On 10/12/2021 11:40, Andrey Nechypurenko wrote:
> Dear Buildrooters,
> 
> There is a -E flag passed to patch in
> support/scripts/apply-patches.sh. It prevents patch from creating
> empty files.
> 
> I have got a kernel driver from a touch-screen vendor which contains
> empty file. So my attempt to integrate it into Buildroot as a series
> of patches failed because an empty file is missing after applying the
> patch (because of the -E flag). As a result, the kernel could not be
> compiled.
> 
> I am wondering if there are any particular reasons to have the -E flag
> and if it would make sense to remove it from the script?

  I think that's purely historical, from back in the days when many patches were 
downloaded externally and some of them could be really odd.

  I expect that none of the patches that we have now still need this. However, 
you should probably check:

  - all patches in the buildroot tree;
  - all patches downloaded from somewhere (git grep 'patch\|diff' -- \*.hash)

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
