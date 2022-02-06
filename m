Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4305EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC449400A8;
	Sun,  6 Feb 2022 11:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTLmOrgv3L_i; Sun,  6 Feb 2022 11:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98CE9401A2;
	Sun,  6 Feb 2022 11:49:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA67D1BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A784F401A2
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a3u3-58gjni for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EE76400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:49:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f17so6816468edd.2
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 03:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hlaYguRN+BIBVWxiDu3o9F4k6eOojsLZK6xSK8QtCmw=;
 b=LL9BWsRJb+XvbskyQTBemHG8MVeQ/Q/tNpZwJCrDaeIyDOuz1eZE+Ni2xrIOtLx9za
 WbweJJ/iwWyIGKZzdAleAuHNYNWtdHTk0gC/oEB5oOE7KfMJUw6g2VJhHmHnQU3pnqAB
 M44Bku65rANV6qKDWa5tNzGvtKhzBJmXt9uvA7bqddVSS3FxMD4nreu+GbvrVoteBXWv
 MbBXpJiRVi5uHsCRU7UQ7KafpLcM5GKclcsdV45o9M6/gHEPn0xJWK2tFmYVjA9FJs9A
 0QJY8Utrhlb1Y2GzLgtU1o5l3Zt/ii+xIUvYK3ncoR9T6vHBap+AGXxSW1rw7dbhTI1Z
 meqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hlaYguRN+BIBVWxiDu3o9F4k6eOojsLZK6xSK8QtCmw=;
 b=MROt5+UHqs/SuoDYsbtn4EujNF/uwCKE2Ac8WtIUi7YMHRgOjrbi4GQcMQmTEqJ/pS
 rpzlrUNEWqCu5ezUghFw+96KMRoJ4Y0xKZpm4/XRN5eDpYtvOd9wsotn4H3I1dzE4S7s
 FgMVjhxwnYo0Els0n0ecJj9SRLrl9GSpLig25UMffR2HIBwVDFNwMuxIhtebwAqRVe1i
 6I7yntTb6TtVhRXELk4EnUFswHT3HQ2a1u7wJCY6p6UtS1GY8VqTjJbK9MTrqVQ00X5W
 lKxoqRMaTZDgHIt1pqCnt4SJA5oxCIovNl7URGGShLLhbig4twgrIkxTNlvx+SJjwKnp
 ecZQ==
X-Gm-Message-State: AOAM530s4VwM/kDjHbjteToh18utshvFlqYWATDmqXpRRO+UuNOpTOQQ
 4ihf3BXgZFlZp2ygaSuaYlUY5N42ZiJxbw==
X-Google-Smtp-Source: ABdhPJw1lOt9XLSAWMNo2c/333ONWKPSKBDA7xZLJw3y9Yy+93Rh+lTM8g23us8NmmDVUkEEUpoy2A==
X-Received: by 2002:aa7:c2d8:: with SMTP id m24mr1334941edp.435.1644148177395; 
 Sun, 06 Feb 2022 03:49:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x6sm3508265edv.109.2022.02.06.03.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 03:49:37 -0800 (PST)
Message-ID: <53fa9f43-8aa2-4820-70e9-365e22b3408c@mind.be>
Date: Sun, 6 Feb 2022 12:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Dan Jackson <dan@thejacksons.uk>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AM6PR02MB4884FDD984AFCD1A4DC6B30CDA299@AM6PR02MB4884.eurprd02.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <AM6PR02MB4884FDD984AFCD1A4DC6B30CDA299@AM6PR02MB4884.eurprd02.prod.outlook.com>
Subject: Re: [Buildroot] Getting Buildroot-created binaries to work with the
 Intel (TI) Puma 5 ARM-based CPU?
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



On 04/02/2022 17:55, Dan Jackson wrote:
> Hello everyone,
> 
> I am new to Buildroot, so I hope you will forgive me if I make any obvious mistakes or omissions in my email.
> 
> I hope this mailing list is the correct place to post my query, normally I would ask on forums or in Github issues, but Buildroot seems not to have a forum and its Github explicitly says not to post queries in the issues there.
> 
> I have been experimenting with an old router, which uses an Intel Puma 5 ARM-based CPU (it's my understanding that Intel bought this design from Texas Instruments).

  ... And last year they sold that division to MaxLinear, so it's no longer 
Intel, actually :-)


> At the moment I am not looking to replace the whole operating system, initially I would just like to build some binaries (such as dropbear for example) to make the exploration process easier.

  This may not work out so well, it's often easier to just build an entire 
system. The kernel can be tricky though (since it's probably not running an 
upstream kernel, and it may be hard to find the vendor kernel). But building a 
complete userspace is definitely a feasible option. Though it may be tricky to 
be able to boot that userspace and still go back in case it fails. What could 
work is to build a chroot environment to do some experiments.


> The original software on the device was built with an ancient version of Buildroot - a config file can be seen in the /etc folder - and many of the options specified no longer exist in current Buildroot versions or relate to proprietary software components for which source code is not available.

  It's way more likely that it's actually built with OpenWrt (they sometimes 
call their build system "buildroot" even though there's not much of a relation 
between the two projects). Not that that will help you much, because the 
considerations are still the same.

  Theoretically, you can demand from whoever gave/sold you the device to give 
you the sources for both the kernel and for OpenWrt or Buildroot. In practice, 
that is probably going to be a bit tricky to achieve. Still, it may help to 
point a request to the router vendor.


  Luckily...

> There are two other Puma 5 toolchains I have come across on the Internet, and both of these are also based on old Buildroot versions, but also patch these with a number of things, such as compiler command line switches and options file tweaks.

  It's very unlikely that you need any particular options to build userspace - 
you may need them to build a userspace that is compatible with what is already 
installed on the system, but not to build a complete userspace.

  The only issue then is to find out which architecture options you need to enable.

> 
> Unfortunately, the older Buildroot versions do not seem to function properly on modern Linux installations.
> 
> So, I was wondering what would need to be done to enable creation of Puma 5 compatible binaries using the current stable version of Buildroot?
> 
> Links to the two toolchains I mentioned:
> https://github.com/bmaia/cross-utils/tree/master/armeb/puma5_toolchain (uses Buildroot 2009.02)

  This one uses

BR2_armeb=y
BR2_arm1176jz_s=y
BR2_ARM_EABI=y

It's not clear if there's an FPU, so use soft float.

  That should be enough to build a toolchain and userspace with current Buildroot.


  Regards,
  Arnout

> https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103FB/ (uses Buildroot 2013.08.1)
> 
> Thanks,
> Dan Jackson.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
