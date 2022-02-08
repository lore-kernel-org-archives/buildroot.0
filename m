Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0960FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CC3340198;
	Tue,  8 Feb 2022 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4gfdWQm64Ym; Tue,  8 Feb 2022 19:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0A540432;
	Tue,  8 Feb 2022 19:51:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9471BF8C7
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1828560E3A
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ba5ONmjGM0Zu for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 19:50:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C37960E2A
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 19:50:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ka4so709161ejc.11
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 11:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+3IpSM2fW6dfsZNqW/RywatFhgqrce974mwQp1/HQZ8=;
 b=HS+P6qXQRjxFT0fVVzkTA4WIKC6k28YHDCCIBWdH1rHSq+mMr2dUHQDOCTjHuoZrIt
 970g9ejWoo3KYK4wO1NbYkVk4wOglv12AQANRzz9+jKDJvykbZGTWatBnft2uTyHJlAb
 haJsFFNQ1EeppnV+WYLwTrwE9FBpeWRkqCw10Ione1ITuYGiilRLYjgGVSKMJwG7av8r
 zV0rr0bylgXyDFUCJ0eYwmzSuSNSq6taMeuq0foCYHKHd9e2qirH6oWgA8tiBGg5TtJP
 rAyBi2gLBsh+1foR8ns8URdSMhq3Bj7U4B9okYgr5cLLjOZXG5aDK6fq9zM3Lu3BjusZ
 kFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+3IpSM2fW6dfsZNqW/RywatFhgqrce974mwQp1/HQZ8=;
 b=C/BaTtAdtvydWHSxY/iIxoXjGa1p5F/q6McUoYbH2G9A4LOoHm0fg17s6T0f/YgkBi
 CY6t2JqV3+XyK7wAMR5rAkimxlOTQHpYKbX8ESJMUfcSc+N2ivsttL9B1rutyUVIkYCT
 5qWhtKaiv3gsN9YSUQdzW3kR4TdCJAkgp9GerzpXmoXtFezKK3arTGpgHOu/lV8bdi8W
 ipatxOFLNY2j4QOG34aNmS0wb7Vz/WzeyI8NvBrKAIW2P0I6AqzKS2CF05K9M5Q+OzcC
 1Rm5NEqTuMlimZTnk/EWkrpxgJVnOcAzUEtZa3YIduVjSczbN0wLXSHYT4KwftHIgcqe
 yVBQ==
X-Gm-Message-State: AOAM5303ag1zfSEbTR/L42XCwAXGTCH/BH0J7oyX1UEZZYBB+hKY+crw
 ou++bAVib2LbYm8XVNYXBYZMFO4j2CT0AA==
X-Google-Smtp-Source: ABdhPJzOVEdRh7OeY2cETOFlsnIb/6GKPhdkLCio/5VW1HV7V338KCsk+4T9rzp86txx/f0a5dLhdQ==
X-Received: by 2002:a17:906:604d:: with SMTP id
 p13mr4864237ejj.639.1644349855340; 
 Tue, 08 Feb 2022 11:50:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s6sm1570499ejc.206.2022.02.08.11.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 11:50:54 -0800 (PST)
Message-ID: <a5cfceca-d49b-c2a0-b1b6-f5acded31890@mind.be>
Date: Tue, 8 Feb 2022 20:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Dan Jackson <dan@thejacksons.uk>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AM6PR02MB4884FDD984AFCD1A4DC6B30CDA299@AM6PR02MB4884.eurprd02.prod.outlook.com>
 <53fa9f43-8aa2-4820-70e9-365e22b3408c@mind.be>
 <AM6PR02MB48841BC55D50D047E0C48D73DA2B9@AM6PR02MB4884.eurprd02.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <AM6PR02MB48841BC55D50D047E0C48D73DA2B9@AM6PR02MB4884.eurprd02.prod.outlook.com>
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



On 06/02/2022 14:55, Dan Jackson wrote:
> 
> 
>> -----Original Message-----
>> From: Arnout Vandecappelle <arnout@mind.be>
>> Sent: 06 February 2022 11:50
>> To: Dan Jackson <dan@thejacksons.uk>; buildroot@buildroot.org
>> Subject: Re: [Buildroot] Getting Buildroot-created binaries to work with the
>> Intel (TI) Puma 5 ARM-based CPU?
>>
> 
> [...snip...]
> 
>>>
>>> Links to the two toolchains I mentioned:
>>> https://github.com/bmaia/cross-
>> utils/tree/master/armeb/puma5_toolchain (uses Buildroot 2009.02)
>>
>>    This one uses
>>
>> BR2_armeb=y
>> BR2_arm1176jz_s=y
>> BR2_ARM_EABI=y
>>
>> It's not clear if there's an FPU, so use soft float.
> 
>  From /proc/cpuinfo on the target device I can see:
> 
> 	Features        : swp half thumb fastmult edsp java
> 
> It's my understanding this line would include "vfp" if there was an FPU, so I don't believe there is one.
> 
>>
>>    That should be enough to build a toolchain and userspace with current
>> Buildroot.
> 
> I tried creating a fresh Buildroot using the current stable version 2021.11 and only the above options.
> 
> I then tried transferring the files from the generated rootfs.tar to a directory /var/tmp/test on the device (the reason for this is that / is a read-only file system, so /bin, /lib, /usr are not writable, but /var is a read-write file system).
> 
> I then attempted to execute it in the following manner (accounting for the fact that Buildroot builds dynamically linked executables by default):
> 
> 	/var/tmp/test/lib/ld-uClibc-1.0.39.so --library-path /var/tmp/test/lib /var/tmp/test/bin/busybox
> 
> (this method was suggested in the section LD_LIBRARY_PATH on this page: https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)

  I generally find it easier to chroot, but OK. (To do anything more than the 
simplest thing, you'll have to bind-mount a bunch of directories of course: 
/proc, /sys, and whatever directories you want to share with the rest of the 
system).


> However this did not work and in fact produced a "Segmentation fault" error.

  Segmentation fault is not what you'd expect if some arch-related setting is 
wrong - it would be SIGILL or SIGFPE or something like that.

  You could try building with BR2_STATIC_LIBS=y, then you don't have to worry 
about shared libraries.

  Oh hang on, I forgot: you need to make sure that the kernel headers version is 
set to the same version as the running kernel. With glibc there is some backward 
compatibility for older kernels, but uClibc needs to be identical.

  Regards,
  Arnout


> 
> Have I made some kind of obvious error or mistake?
> 
> Thanks,
> Dan Jackson.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
