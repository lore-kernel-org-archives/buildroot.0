Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B4DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F38960C1F;
	Tue,  1 Feb 2022 20:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPcD6c5HDRKJ; Tue,  1 Feb 2022 20:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF9E60AAD;
	Tue,  1 Feb 2022 20:51:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 491D11BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35F594019F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7IpW0XlGJwb for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE9C4400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:51:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w25so36149133edt.7
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mEiZjP6wiD4v1Fd9KP/t3eL+Byeh5eNYfpUBLegbTvg=;
 b=O8lT+koghZ2wZOQOxO6HtSZbS6z9PLrOlRxBM1umRRwHDrAyECUMbIrERLEU7Czl56
 W5SvnXUvIwfYbUFQDGw+LDUyGvN8+AySqPN+dt+Ov8rCAo99Qql7EZ0N58+hNjQCsyc5
 bgvuSqjHVYcZXWxKQrENay7QUbko/fa6G6n3L53KZPFzuZH3PkfxAoDI9wLgTP57t1zw
 F+Na7EPiFDTSUqSS/2gtj7Jn+5z+ttpS9WmgxyMxc+kHo9ZSsBDF6qgvn4UIUx9ZaIir
 3+Rrv4r61h1ybXY7gmrrumAQAkBWPjIQb2nf/9307T9zTTmVs1K3b5qbLcJ+mvWuKXn5
 ZApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mEiZjP6wiD4v1Fd9KP/t3eL+Byeh5eNYfpUBLegbTvg=;
 b=f5rBGtsE6sNZ79shVkd6oFLE4nh9lpuOvkJCuAXjc6ZAX1CPw+hqXdhIeGYoC8VEPs
 UwoJXaWJIoSavZuOWgPNUsAmK/zCwZAoG2WuS0B/3xkIEH/4O7BiAgoH3dsEsI2cL9H1
 lNb35k6kBoiz+q76crDLFpwiGJ3Mc28bmk9qwyi21RRotZLdxV2CC2IPjMS+gT7rY2jr
 mBAdClM+VulCq3IwaL61gVlWtISXvfteGWY9eyoPwcTSD5aJHK9tadCBuUEtUhE9jqBn
 HFHNkF70kQUadDQdEQuTZ2b60Sz1Zb/RHIkTynX061h82h/r4KjwYC8zhbjY0D/Yvzmz
 NbgA==
X-Gm-Message-State: AOAM531Vitrh1YU65cbphDpyBCDqJ/ZpsPKl7LoT+DTaEZGdYjpS4Mcp
 FSS12IckQojXs5RGtXc9EcZYlEwYq8FfmA==
X-Google-Smtp-Source: ABdhPJzpcNG7Pcih3irLKvrza/2q3fqiXWOjzdUTnr6kHz92TXalJoVpWANZxsyzNgf0xeb3f0fVSg==
X-Received: by 2002:a05:6402:278f:: with SMTP id
 b15mr27643729ede.103.1643748667025; 
 Tue, 01 Feb 2022 12:51:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fv33sm5772711ejc.207.2022.02.01.12.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 12:51:06 -0800 (PST)
Message-ID: <17628e7b-51cc-a075-196d-e45720089a12@mind.be>
Date: Tue, 1 Feb 2022 21:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220131153022.351662-1-heiko.thiery@gmail.com>
 <CAOf5uwkFjQCGBOD4JMn4MG_SR74-bW1SHoDFiEC7mqH_C8Xq7w@mail.gmail.com>
 <CAEyMn7aDyH24AYVMZaLvt9SQMtVu9yhzftPqbSsuJ671tY-kNQ@mail.gmail.com>
 <12be81a6-7f2e-35b8-4f44-d8a20fce74f1@benettiengineering.com>
 <CAOf5uwmeT8WVUc3xvP0DjrVDLj9egvJz0+JEvWhgojnEVhyTyw@mail.gmail.com>
 <86bf975a-1599-005a-5ebc-a149cc973da4@benettiengineering.com>
 <3ea22a9d-938a-5086-66c6-a8f5510c8573@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <3ea22a9d-938a-5086-66c6-a8f5510c8573@grinn-global.com>
Subject: Re: [Buildroot] [PATCH v5] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 18:45, Bartosz Bilas wrote:
> Hello,
> 
> On 31.01.2022 18:11, Giulio Benetti wrote:
>> On 31/01/22 17:42, Michael Nazzareno Trimarchi wrote:
>>
>> [SNIP]

  Thank you for the snip. My arm was getting tired of scrolling through all the 
quoting :-)

[snip some more]
>>>>>>> +# Required host tools to create the SD/eMMC image
>>>>>>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/bl-imx8mm/post-build.sh"
>>>>>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>>>>>>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>>>>>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>>>>>
>>>>>> I have seen that some people like to have this organization but it's
>>>>>> not really nice to maintain. I would like
>>>>>> to savedefconfig and use that one instead of having nice commented
>>>>>> part. Is this mandatory?
>>>>>
>>>>> As far as I know there is no rule how to do that. For me it seems to
>>>>> be more readable and clean. But this is only my opinion.
>>>>
>>>> As Heiko pointed it's a very good habit.
>>>>
>>>> One thing that must be taken into account while doing it, is to keep the
>>>> various BR2_* configs ordered as they are ordere inside the various
>>>> Config.in
>>>
>>> There are good information indeed but even those information must be
>>> keep updated. Daily work show me that work on
>>> savedefconfig make things nicely. Some of your option can be at some
>>> point autoselect by another one and so on.
>>
>> Yes, you're right, I've noticed that too. It's "not that automatic", but if 
>> you check the first 25 defconfigs you can see that more or less the 70% use 
>> the "descriptive" way. So basically one should savedefconfig to another file 
>> and compare to the configs/*_defconfig and eventually modify.
>>
>> Anyway there is still not a standard decided. So maintainers will accept both 
>> ways.
> 
> The global sync via `savedefconfig` for all existing configs should solve 
> everything. Besides, it should be impossible to edit those files manually.

  The in-tree defconfigs should *not* be generated with "make savedefconfig": we 
want to explicitly set some options even if they're at their default value. The 
reason is that on master, the defaults can be updated. The typical example is 
the kernel headers version (cfr. [1]). But also arch options can change default 
(a few years ago this happened for ARM floating point), and others as well.

  We're not very good in making sure that options are properly set. For sure, 
however:

- global sync via savedefconfig is *not* what we want;
- a defconfig with comments makes it easier to be sure that options are set 
explicitly.


  Regards,
  Arnout


[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220201183331.4009320-6-giulio.benetti@benettiengineering.com/


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
