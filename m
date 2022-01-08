Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0461C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DD3240185;
	Sat,  8 Jan 2022 22:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDUyvwDdDX6Q; Sat,  8 Jan 2022 22:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6EB240220;
	Sat,  8 Jan 2022 22:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76C9D1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D1E60AAC
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5C_1azyP_hpp for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53B0560A93
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:37:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l25so7917943wrb.13
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xrGMjO9+dh8rQFUKRXg6ywH/bD8KX/dc9hytCKXTKbA=;
 b=Zo4F3eDyun0gKf3Y7ijO1dLfJ/jDJNR1ilfTHDxi8ve8afKm8yLut4jB09RmLaRjTF
 d8YroaJXAlkMwZ99DdgbfNeFGpkzVod1oi5f5A6Xvz3Gnr8sY3xZOFfS470wbgHXQ4If
 Plh3GANaf39cm0yCs4pk8dsJd8CYN3xQfbfjczUcCwiH0/PmXfcaDtKwtjDnhOU1qjoW
 SsxRJR4VOFrPKkMR0OetLTX0nI/a9rqc2JCghqD7nadtUWZ9igNIL9n3iAqejHFQ3AGS
 71g8297iFiXmR2qLTYJM0OzpKbJnzP9P5HZCo7dKWeRltLK3te7EGnuLCJ1ymY64Ssbj
 tdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xrGMjO9+dh8rQFUKRXg6ywH/bD8KX/dc9hytCKXTKbA=;
 b=dge68jI/NT3wO1G3DQoxCmLZj5C03+lpjbNCmJ4nHHP1FxYpMzumVzoQsk6gnkxu/l
 2inBYOv9nu7fbsFy7sP33/pNUzbaDH2UtYdsUdCwtTejtkH0e7s+OFPIl5cLiplUbytD
 TkfdWDiRPrZYl9Qc2vYzARr74t8slILvUY172Fh3WPpq1QI6I2LP2MriapGCJ9U7VRi8
 158JFv7N7LXad9IDAF9rxDIb/s2v1S00RzE1ZgGfK06PikLhsJbNArzer8gdqWey2WzO
 YFMzIt08p7XZdkG14YlhBQuvHmMF1YMk6gvmOR8QIoCKWQzkXyL5Z0hkbRQMobkG/BVm
 huGA==
X-Gm-Message-State: AOAM530Fd34CKTS4XRRhE0SiniNNTI98sIPGW9QYNN9mJ9OrOAbo7+wl
 uOMhn2cnTF2Z8iA/hTc1b/1uW7lkH8I6hJ3V
X-Google-Smtp-Source: ABdhPJxxsTUnozKdWnyffl9QeuuPWpBgWbZRW1b+SepvvXPO0anehXKwrPcqQDrHgWhfMr/ApQdxGQ==
X-Received: by 2002:adf:d226:: with SMTP id k6mr57705701wrh.243.1641681452647; 
 Sat, 08 Jan 2022 14:37:32 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l8sm2678945wrv.25.2022.01.08.14.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 14:37:32 -0800 (PST)
Message-ID: <00e4f4ae-de7d-d159-c557-18a56b66b499@mind.be>
Date: Sat, 8 Jan 2022 23:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
 <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: buildroot <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 22:31, Norbert Lange wrote:
> Am Sa., 8. Jan. 2022 um 20:04 Uhr schrieb James Hilliard
> <james.hilliard1@gmail.com>:
>>
>> On Thu, Nov 26, 2020 at 8:28 AM Norbert Lange <nolange79@gmail.com> wrote:
>>>
>>> Systemd has very many options, adding a way for the user
>>> to set custom options can help customizations
>>> without changing buildroot files.
>>
>> I'm not sure this is a good idea, if a configuration option needs
>> customizability it
>> probably needs a specific kconfig option. Systemd config options tend to require
>> dependency selection and special handling so this seems likely to cause
>> spurious errors due to improper usage. Seems to be a pretty big footgun IMO.
> 
> Sure, you are aware that many of my buildroot patches are stuck in limbo
> since early 2020?

  Yes, due to various circumstances, maintainer time between Feb 2020 and May 
2021 has been very limited, and nobody in the community stepped up to review 
patches. We finally have a hackaton again where we're processing the backlog and 
we're making good progress. But we're not going to be able to fully catch up, so 
unless someone reviews and acks your patches, or unless they're trivial, they're 
likely to still face long delays in the coming months.

  It doesn't help to get your patches in faster, but it does help the community 
in general if you do reviews.

  Another thing that may help you get patches merged is if you collect them in a 
series and repost the entire series when something changes. Ideally you also 
carry patches from other people in that series. This makes life easier for the 
maintainers because it shows that it the series makes the whole more cohesive.


> Just doesnt seem feasible to timely fix everything and version bumps often leave
> more untapped options. Some part of the necessity would be just being pragmatic.
> 
> One example would be using the unified cgroups hierarchy
> (-Ddefault-hierarchy=unified), hybrid is pretty much deprecated,
> and some systemd features that buildroot allows to enable (OOMD for example)
> wont work without it.

  That's still a fairly recent series :-)


>> What systemd configure option would you want to be using that isn't
>> currently able to be enabled?
> 
> FYI those are the ones I currently use:
> 
> -Ddefault-hierarchy=unified \
> -Dutmp=false \
> -Ddefault-dnssec=no \
> -Didn=false \
> -Denvironment-d=false \
> -Dxdg-autostart=false \
> -Ddns-over-tls=false \
> -Ddefault-llmnr=no \
> -Ddns-over-tls=false \
> -Ddefault-mdns=no \
> -Dlz4=false

  Except for the unified hierarchy, all of these look like they should have been 
added when systemd was bumped and the option was created...


  Regards,
  Arnout

> 
> Norbert
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
