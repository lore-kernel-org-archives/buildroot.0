Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF606C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 750F183E7C;
	Wed, 27 Apr 2022 07:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWqMoVHSX0Sn; Wed, 27 Apr 2022 07:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6435D83E54;
	Wed, 27 Apr 2022 07:28:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 418CC1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DBCF41938
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhsKFxAhv0lJ for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 021634190D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:28:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id r13so1636038ejd.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Vbb68ycF9BEFUzKbCxJ4GLoygZo2hwXfQ1MT5Qz6MI=;
 b=buVEdUrkDutNzvCPMRxqRgC6J5fxMEDH5mRzY5wC/uSusrCvkSf4GCKRJ6nDVdsC2E
 R7j7qt0rfKEmNtJJTYEmDc69xlinRGL2NIUNDhtarQvIMMzKLdO0X/Y2ypirU2Wjp2k3
 6wXl03KjPBYuFFwEQRbrcJ962EEfFaOqBHUVFiGt44GuF0E5yVjyLCgnq02/nmmfW2Dd
 og5cE9DKDoGabS5MqTbkYeBoi4XvjJzi6Oy6YYD2wor7JfuKvcZUG3eA7rXuW5Zq/1Ox
 dGqN+H7MJsedOp2PZgnHX1ji8PDCA1t24hQF6k8wBFlaTjTYdOw/UOCHYJquN50dXRHM
 u5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Vbb68ycF9BEFUzKbCxJ4GLoygZo2hwXfQ1MT5Qz6MI=;
 b=LqnEl+xrPrXves/fgzHObbs0r5Nl3Lk3sZUlEfpnoir3ie7sH/f3jcrNxzYyp9nODO
 ZCuAUkvduaiggiQ/DszOiXRGPjTf0BkNsGZz9qr1NFZruWqnASmKORFBg0PDxUVQq7s+
 EKZpVIgXYwMyXaPEsd3NwBlWN8j9Tcdu2y+1yMxcPbc8y734i3N84IkZvJ1XKpnNBNUF
 hJQxSenpVsSWdGhPTZaO50jExqZqhEQ2CIuV+Q+7nHraSPA484FpsV9VMMD6ah7llMQF
 x2UHR8MJPPSwcT9T/J/Wr0ct8x/Ir6BWnU37T0Wu9wGxqtqmEc4ktOpZVq59WZ5s+oqH
 8nag==
X-Gm-Message-State: AOAM530369xDgSrRtjMKSf0cpTkDSVuy9QI8VqHI2exP0DXo023RQbpv
 WaHg4+ZDr3KrYMxVlZCDGSYfI34+L8R9EQ==
X-Google-Smtp-Source: ABdhPJyHFVd5X4kbIKemJJy0Cn9TGVYFAtj0CsqLxhgOqXy1Ot0+QuSQtlhQ8u2tqbMBKd7mCjLHyQ==
X-Received: by 2002:a17:906:32d5:b0:6f3:be75:8485 with SMTP id
 k21-20020a17090632d500b006f3be758485mr3953664ejk.685.1651044506160; 
 Wed, 27 Apr 2022 00:28:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gl2-20020a170906e0c200b006a767d52373sm6133846ejb.182.2022.04.27.00.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:28:25 -0700 (PDT)
Message-ID: <7bd523ca-a336-d0df-72f8-2b87ffbd9104@mind.be>
Date: Wed, 27 Apr 2022 09:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>
References: <20220414204922.866533-1-christian@paral.in>
 <55c0f7da-0907-b920-5a9b-33a82dcdb32b@mind.be>
 <CA+h8R2pJDuZhTYYp23oA4HuXyLFJe4BiGYn_GTpYn0Wmm_Bb0A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+h8R2pJDuZhTYYp23oA4HuXyLFJe4BiGYn_GTpYn0Wmm_Bb0A@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: add support for riscv64
 architecture
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 02:55, Christian Stewart wrote:
> Arnout,
> 
> On Thu, Apr 21, 2022 at 12:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 14/04/2022 22:49, Christian Stewart via buildroot wrote:
>>> +GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.
>>
>>    You SoB is missing.
> 
> Go's repository disallows signed-off-by lines.
> 
>>    Also, the reference to the upstream PR is missing. And you should probably
>> refer to gerrit instead.
> 
> Same issue: I've format-patch the exact patch sent upstream, without changes.
> 
> Do I modify it specifically for this patch in Buildroot?

  Exactly. Alternatively, you can use GO_PATCH = ... to download the upstream 
patch (cfr. how it's done in zfs). In that case, you also need to add a hash for 
it. We currently don't use that method very often but I think it's a good one in 
fact.

>>> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
>>> index e82ab6e81a..8be86103ea 100644
>>> --- a/package/go/Config.in.host
>>> +++ b/package/go/Config.in.host
>>> @@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>>>        depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
>>>        depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
>>>                || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
>>> -             || BR2_mips64 || BR2_mips64el || BR2_s390x
>>> +             || BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
>>
>>    Here you enable it both for riscv32 and riscv64, but below you always set
>> GOARCH to riscv64.
> 
> I'm not sure if it was in this patch revision, but I have in my local version:
> 
>      # Go doesn't support Risc-v 32-bit.
>      depends on !BR2_RISCV_32

  That is indeed missing from this patch.


>> Also, are you sure it doesn't need any of the ISA extensions? I can imagine
>> that Go would be using atomics, floating point and integer
>> multiplication/division. Of course, there's almost no chance of finding a
>> riscv64 without these extensions, but better be correct, right?
> 
> Probably yes.

  Is there an easy way to find out, or should we just depend on all of them?


>>   Also, does Go support all three ABI types (integer, single precision and
>> double precision)? Again, we only ever test lp64d in the autobuilders, but
>> better be correct, right?
> 
> There's only one riscv64 target for Go so I have to assume it means lp64d.

  Please add that to the BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS dependencies.

  Regards,
  Arnout

> 
> Note: I have now tested this extensively on a Nezha Risc-v CPU as well
> as a Qemu VM.
> 
> https://github.com/skiffos/buildroot/blob/e1fc20cf9/package/go/Config.in.host#L12
> 
> Best,
> Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
