Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED87340262;
	Sat, 12 Feb 2022 20:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8KADzKesWxb; Sat, 12 Feb 2022 20:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED99A40224;
	Sat, 12 Feb 2022 20:38:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D71401BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C545D40224
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NsXn0Q1JyzlP for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:38:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B663A40201
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:38:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id f17so21451849edd.2
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pa6vKPuC08BDrBJ/m8n3j3UctkgkAz0gRHNbc3XhwBE=;
 b=MBrwVEmeGiDC5QJrLIKKd3v3dUOB9jUoK5roklh5n1Pd/sHeXGan5DiP5GR2FSa3mX
 pmJrYxkjAOwb8Np7/y5ZL+gttLop+Ibkp26WbH9P5dH2Fx2lpq6I6Phv0jLTEJP6pFmf
 9rnAQqlLa7J3YrHiW4PXalciYZ6ahDMVa+CrNdsuFjtlwZqgK9b7ewq7tXXA7g0NWVts
 qkoDTGKr7A5vHdCKaAw68v/BCmqxpWAP6qsiES/yUrJACb/ROBG5HDRhp1UR2xCERuUM
 w2xBExJ6vP9kMXBs/fs3q0KBIZ/dpqz3lU4RhB9+KbMWXnZuRr2r4bwXYZ+jRPyq1tag
 z6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pa6vKPuC08BDrBJ/m8n3j3UctkgkAz0gRHNbc3XhwBE=;
 b=5EuAX0LAl6zOZXjBbnAHwwlJeqrfgP7bEJhu/E7IDBJt6luhyFxsoeZvtFD8K1yCFv
 Ycw8D8sbjUeJI5kwnIP2omTsVa4QJir1ibhMsN2nDqACbXha+EEWdkUhejVMEJLMl35a
 yyJasGGiDiyFRljvGoetTs9FGojdr7p+wUTw5oisIdyG5I3WMerl/9s6FQckrCnoFqNA
 VdMAsK7jSSlO82SpWicWjmLp+rJafvNdojQDmE8vAS9Xn5ImBEGTksM4f5Nrj871Ec+M
 L1Hy5YINc8A9OkxMfjb56Mv4t2ED6wBSeeNy9nhgXqszyqDE5mSMouRIT7tec6rwqgMP
 wVPw==
X-Gm-Message-State: AOAM532rx3DrLpBzEbtTi2ej+Y6tGeQLZIPb+5IgkhLmvcLTQrXEUnhh
 yavGYaXI8g3ssjn9i0yZNwgJ9Q==
X-Google-Smtp-Source: ABdhPJwKwakG4UXrW4/He+KPtass+HJdRZqSlcdxBsmlmuvkn1RSPF9auqsFOAkVX7HlP371NAD4Mw==
X-Received: by 2002:a05:6402:4384:: with SMTP id
 o4mr8274549edc.15.1644698328975; 
 Sat, 12 Feb 2022 12:38:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d25sm8634909edr.101.2022.02.12.12.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 12:38:48 -0800 (PST)
Message-ID: <0efa84fe-ed18-b918-d410-1d3042a52de4@mind.be>
Date: Sat, 12 Feb 2022 21:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1643665029.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cover.1643665029.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 0/2 v2] linux|uboot: fix build with host-gcc
 10+ for older versions (branch yem/yylloc)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 22:38, Yann E. MORIN wrote:
> Hello All!
> 
> This two-patch series aims at side-stepping the multiple symbol
> declaration in older Linux and U-Boot, where the infamous yylloc is
> defined more than once.
> 
> Like we have a fix for the perl timeconst issue in linux, do s similar
> tweak for yylloc in the two packages known to be affected, Linux and
> U-Boot.
> 
> Here is a pipeline with all the defconfig builds:
>      https://gitlab.com/ymorin/buildroot/-/pipelines/460207930
> 
> There are still some failures, but none relate to the yylloc issue:
> 
>    - too long build time or not space left on device (I am only using
>      elastic runners)
> 
>    - defconfig not up-to-date (e.g. using kernel headers version since
>      removed)
> 
>    - missing host dependencies for kernel (openssl, libelf) or uboot
>      (python)
> 
>    - another host-gcc 10+ symbol redefinition issue (galileo [0])
> 
>    - make 4.3 issues. For example: amarula_a64_relic_defconfig
>      https://gitlab.com/ymorin/buildroot/-/jobs/2035820886
> 
>        DTC     arch/arm/dts/sun50i-a64-amarula-relic.dtb
>      Error: arch/arm/dts/.sun50i-a64-amarula-relic.dtb.pre.tmp:66.1-10 syntax error
>      FATAL ERROR: Unable to parse input tree
> 
>      This is caused by make 4.3 that no longer treats '#' as special in
>      macros, and shall no longer be escaped:
>          https://lwn.net/Articles/810071/
> 
>      This causes '\#include "something"' to be injected as-is at the end
>      of the temporary DTS, and of course, dtc does not cope nicely with
>      that... [1]
> 
>      Unfortuantely, I don't think we can do a generic fixup for that
>      one...
> 
>    - some other issues (e.g. deprecated 'partition-type' for geniamge..)
> 
> [0] this was fixed in 2014 in the kernel:
>        - eeeda4cd06e828b331b15741a204ff9f5874d28d
> [1] this was fixed in 2018 in uboot:
>        - e5e701c2b8470de044c5c71d2a54ecfc72680d59
>        - 0c544115379ed77c1843a194e26960e5b8f3d369


  Applied to master, thanks.

  Regards,
  Arnout

> 
> Changes v1 -> v2:
>    - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
>    - extend cover-ltter with a pipeline reference and analysese of
>      remaining build failures
> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (2):
>        boot/uboot: fix build with host-gcc 10+
>        linux: fix build with host-gcc 10+
> 
>   boot/uboot/uboot.mk | 7 +++++++
>   linux/linux.mk      | 7 +++++++
>   2 files changed, 14 insertions(+)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
