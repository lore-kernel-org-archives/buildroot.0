Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93132C433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 02:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA67940BE5;
	Fri,  6 May 2022 02:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Rx2OqOGXQIR; Fri,  6 May 2022 02:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07C5240396;
	Fri,  6 May 2022 02:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC951BF390
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 02:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC53840A2
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 02:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=flatmax-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQb83rA_59Qr for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 02:56:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DEFB840A1
 for <buildroot@buildroot.org>; Fri,  6 May 2022 02:56:18 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id a11so5191181pff.1
 for <buildroot@buildroot.org>; Thu, 05 May 2022 19:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flatmax-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wsSVGBJtzVZsFMcBE4flnVxRODyKuz6Q+3Q0mRmBLcg=;
 b=l+SRsR4b7K0QdSq3L1q9p3kyLAJEnIwiiJOU3ZtGNIsN3x3lMAnLlg11/KOuHohtdM
 QUECMw8v1QjUejPpjnu2NEr7HnLawPiEyBbvZs1fRXu/YOfXIz8LXIhaI32uficSaMT8
 Ag/IFh26t41JdKxVKqynFESNVfJeCdH8g67gXrb4UIJ9tK/OsqqlyVXCEoClxYDejmgR
 M9fXfTBTOFN6EOfx2L4tD3vc7fQHcVJQcCK7NG1f8BwsbXZCAeZv14T0LKyrSCf85BaR
 Qng8amGuufI55cHHt+gG8+zVnQrv57GJ7SSbdHpYjomj3hgkTy26LXl8a4q3iOKJZ2JU
 7/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsSVGBJtzVZsFMcBE4flnVxRODyKuz6Q+3Q0mRmBLcg=;
 b=gyrxI4kV5vnpJQLF293x392rYE9qKhab9RNW5uTgGmiFN5xsE7BnL3ZEzv3lQthBfj
 lx4CEbyM3iphMOgeJZ62/aKkeOyZOFj/gjdflpMNG9RB2+HIOm6+T0ungCecVL+B23JS
 9JOAqoGsQcgg1k6wRMbMm5tXFSysYFSBxUhEOyBfj86d1MPRFqAzV2XVYMNaepaDikCl
 vLVvGehzWe69Oxe76UIDb/r/51/NZEg1Ew1Cbh09XByh98P3K3OEsIZwbGdQIc5moxOS
 012b4j6BOuNAWQjAqGsuGc5hJ73VRtr/JPwspXDgTAb+pey5TlspPzZ6Limysa88blyJ
 PTAQ==
X-Gm-Message-State: AOAM533sLxhvrgIkr7c6E2b6SpBCl6Ep5MgPE6olGOclk1EmLcC+xjqg
 2o4neHoXbfkFlynnnPIGtjYEQw==
X-Google-Smtp-Source: ABdhPJwR6fkcxdh5DEVf1EIEgCeBQgm/wE+GKD4EwjX4Rl5cfSzjkt6os7z55B1afZAzIkRwiUohDA==
X-Received: by 2002:a65:4807:0:b0:3aa:3050:e24 with SMTP id
 h7-20020a654807000000b003aa30500e24mr1007163pgs.299.1651805778394; 
 Thu, 05 May 2022 19:56:18 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:400c:dcb7:32f1:4d06?
 ([2406:3400:213:70c0:400c:dcb7:32f1:4d06])
 by smtp.gmail.com with ESMTPSA id
 v68-20020a626147000000b0050dc762814asm2161472pfb.36.2022.05.05.19.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 19:56:18 -0700 (PDT)
Message-ID: <59b352c2-0dc5-583c-3686-1dbae0310f38@flatmax.com>
Date: Fri, 6 May 2022 12:56:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-AU
To: Tim Harvey <tharvey@gateworks.com>, buildroot <buildroot@buildroot.org>
References: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
Subject: Re: [Buildroot] how to get buildroot to update a git repo that has
 changes? (ie building HEAD vs a specific SHA)
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

I think that if you update the repo version to the new git checkin 
number, rather then the branch name, then it should refresh the tarball 
to the chosen version.

Matt

On 6/5/22 09:17, Tim Harvey wrote:
> Greetings,
>
> I use buildroot to build a Linux kernel+ramdisk using:
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>
>
> When the upstream branch changes I would like to build that kernel but
> I find that buildroot caches the repo in dl/linux/.git and doesn't
> seem to know how to check to see if there are new commits.
>
> I realize that this is atypical as typically you want to configure
> buildroot for a specific package gitsha/tag.
>
> How would I go about getting buildroot to update the repo? I don't
> particularly want to rm dl/linux I want to instead somehow check to
> see if the repo needs a refresh then refresh it without a massive
> network download.
>
> Best Regards,
>
> Tim
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
