Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D86EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51694013C;
	Sun, 25 Jun 2023 14:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51694013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joDDvh7dq5gU; Sun, 25 Jun 2023 14:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB414016B;
	Sun, 25 Jun 2023 14:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB414016B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 660CF1BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D40D81E1C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D40D81E1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aO6XIBUd8SBa for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07FAB81E19
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07FAB81E19
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:33:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f9bdb01ec0so30116745e9.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687703587; x=1690295587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ShsCP93/C3I2YPHRwUeEE8xIUGGI90cuJvFWE9ShcI8=;
 b=WINkkx6Gk4/7CjhJSia8/SAUG8eKEeInWuO30lKwsocOv5MhUUY60k+vZl8z8o+nVt
 NdVQr3QYgeHi4mREHN6L6+MBxxqGQlbsaTDVFLtFRKOoM3wf3xjtw3EIT/R2gXqWBLGz
 nMaBFWWhb0Vkg+6okXVWd0pUNSewby5VdvcmefalOzP9+wqCABKhJvMkhJtykCe3WwoB
 iYoPsZ+Uxncq3VlBa6DA5RUvg815CX9n3xiHxMkXzJ5i3/ZlTgfjiV5m9vQ3HSzE4jGx
 D2Jja1Pq43B/fwi9tNjP5771dk5TUcscQGlw7owlfNF0B47x/2eGP2oPLg5Osx9YlGFO
 sY1A==
X-Gm-Message-State: AC+VfDybhO2m12zr8wAaO0njhjqKDGW02NrOI/EWW4YU218110kdmHSo
 X978xZ5Gp5nQVUDbZqgE/mLdZITlHqWN5Ewq4Ww=
X-Google-Smtp-Source: ACHHUZ5n0uXkBfV/0pnO4EyjAk1hmKxyJAKKDqabqakok/HraCWcU5n7iubACGfGvlM/aPoakE66Tw==
X-Received: by 2002:a1c:7212:0:b0:3f5:146a:c79d with SMTP id
 n18-20020a1c7212000000b003f5146ac79dmr21778882wmc.15.1687703587469; 
 Sun, 25 Jun 2023 07:33:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d6ad2000000b00313e90d1d0dsm2769778wrw.112.2023.06.25.07.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 07:33:06 -0700 (PDT)
Message-ID: <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be>
Date: Sun, 25 Jun 2023 16:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andreas Dannenberg <dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-7-dannenberg@ti.com> <20230625135435.GC589277@scaer>
In-Reply-To: <20230625135435.GC589277@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687703587; x=1690295587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ShsCP93/C3I2YPHRwUeEE8xIUGGI90cuJvFWE9ShcI8=;
 b=d3x64ewLIN7O6TOfgovg/NK99S/Oyx3do7kS+/iQvljfJKgFdbrT4OawqiwdEoB2DI
 7Zb6A0utNENCJNNTU3m1FXpRWA15k8TeXLJux2pFpyBczmh5Md1tasB10uUwdhwLWAXI
 MWaXSgTFyKm1ypMlKo3mF/YZXt3fVmYym9VH4jXnbhq1tvrhnbyhaVOn80Vc6sdPw/3c
 57xfionyItNLswgckOFu5Te7kcbPeVHbH1pae+fvv0KfmCCyaBIjBzHherI3JCoJcmBd
 Jqd+s4w/bg+8eo2O2gB03qt9ve7EJ0BvU7nclx30BZsukAt3a4st6ttFEPiO62DPkkDK
 fpuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d3x64ewL
Subject: Re: [Buildroot] [PATCH v9 06/11] board/ti/am62x_sk|am64x_sk: switch
 to TI SDK v8.6 sources
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 15:54, Yann E. MORIN wrote:
> Andreas, All,
> 
> On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
>> Switch the following projects to using the same Git source repos and
>> commit IDs that are used to build the TI SDK v8.6 for AM62x and AM64x
>> devices to establish a baseline for comparable functionality:
>>
>> * TI Linux Kernel v5.10
> 
> So this means going from a 6.3 kernel back to a 5.10 (the current latest
> if 6.3, which is what is used in the defconfigs from the two previous
> patches). That's a bit unfortunate.
> 
> Do you have plans to update to a more recent kernel in the (near)
> future? Can't we keep using 6.3 anyway?

  We don't actually have a clear policy on whether to use upstream or vendor 
kernels for the defconfigs. We have a few boards with both, but IMHO that's not 
a great approach either.

  Personally, I think it makes sense to focus on vendor kernels for the 
defconfigs. Using upstream is generally easy, you just have to find the 
appropriate device tree. But for the vendor kernel, you have to find the 
repository, which branch is "current", and often also make sure you sync up with 
U-Boot and OP-TEE etc. versions. @Andreas don't take this as law, though, it's 
just personal opinion.

  That said, I think for each board we should look at what the vendor kernel 
really brings. If everything, including GPU, is working with the upstream 
kernel, it doesn't make sense to use the vendor kernel. I don't know if that's 
the case in this specific situation.

  Yann, Peter, Romain, Thomas, what do you think?

  Regards,
  Arnout

> 
>> * TI U-Boot v2021.01
>> * ARM Trusted Firmware
>> * OP-TEE
>>
>> For the Linux Kernel this also includes switching the defconfig to a new
>> one that is generated with the ti_config_fragments/defconfig_builder.sh
>> tool that is part of the respective ti-linux-5.10.y repository.
>>
>> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> ---
>>   .../ti/am62x_sk/ti_sdk_arm64_debug_defconfig  | 1991 +++++++++++++++++
>>   .../am62x_sk/ti_sdk_arm64_release_defconfig   | 1894 ++++++++++++++++
>>   .../ti/am64x_sk/ti_sdk_arm64_debug_defconfig  | 1991 +++++++++++++++++
>>   .../am64x_sk/ti_sdk_arm64_release_defconfig   | 1894 ++++++++++++++++
> 
> Those are really big defconfigs... Why can't we use the defconfig
> anymore?
> 
> Also, for each board, you are providing two defconfigs, one release and
> one debug, but only one is used. We don;t want to carry files that are
> unused, because they are going to bitrot sooner than later.
> 
> Just add the two defconfigs that are needed, one for each board.
> 
> Also, I think it would be preferrable that the files be named
> linux.config (.config even though it is a defconfig, yes), like we do
> for the other boards (there are slight deviations, like adding the
> lernel version, or a 'nommu', but only one is named after the board).
> 
> Regards,
> Yann E. MORIN.
> 
> [--SNIP--]
>> diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
>> index 083720f512..0b196f4cce 100644
>> --- a/configs/am62x_sk_defconfig
>> +++ b/configs/am62x_sk_defconfig
>> @@ -1,8 +1,12 @@
>>   BR2_aarch64=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> 
> This is out-of-order.
> 
> Either you have manually-edited defconfigs, and then you should provide
> comments in there, like (see existing defconfigs for exampleS):
> 
>      # Linux headers same as kernel, a 5.10 series
>      BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> 
> or you have a defconfig that is fully auto-gemnerated with
> save-defconfig.
> 
> I prefer the latter, but other maintainers may prefer the former..
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
