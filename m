Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6777C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B739401C8;
	Tue, 25 Jan 2022 21:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qv4Le_Qs_bwO; Tue, 25 Jan 2022 21:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1AE040475;
	Tue, 25 Jan 2022 21:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BFA41BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A89F80B6E
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxXdOLzBmEi7 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:48:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2D9482974
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:48:26 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CTfqnAIGGBBmwCTfrnLa3v; Tue, 25 Jan 2022 22:48:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643147304; bh=3ItrXUh8RgQ5wF4UE6kilT+5vubNY0Xrnz9iXcew/Sw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=AKK2PFSeguww9+UyoCr/vyFymAoEEIrbLbEiy2ItEDtX1fmUiD7rszngtzVhJ4+0L
 1N4tgd4YEUlqdlotB4zpLG+Np5s8jfWlgpzko8oj2BRykWOPfqrf8r4ZR6k9Tehzm6
 ttLbInIqkJ2jEHdKwLu1WY2wzCb92zpifP2cFatuFdRuMYNG/OlEWgB4POlHUVSjVs
 JpYQbUOEY2nuLUUimX/zZ4fsvPaUYhSZp9hzy9Py9bNuM853uodlcwAMKhY5Wew46f
 kJGYb6HWHP9tTrhzPiLpoxky42+ASGH+VZLlvdITVlDFjIxsjPKSHkiCFeY2AkzI13
 7A/u4l59XuuLw==
Message-ID: <b9259f65-3436-019c-cd5d-88eaefadc022@benettiengineering.com>
Date: Tue, 25 Jan 2022 22:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220122153243.009b24ba@windsurf> <20220125205523.GH457876@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220125205523.GH457876@scaer>
X-CMAE-Envelope: MS4wfHmHlYo7RqxRQfkqa53HAWvqwMFmm0xBlosWux2cB9XH9htdZMP57lkcEiLDC9OF68NtJ3pw8OZ4miob71csjgFtYn88io4ucb5lCqNx1f5NFPpmtbFL
 hmB7GTIYb/mX6LB7v/nNDL1jT2FMcyTMU5N8/B6B7gn0rpUpla1ZlHVF6MVszMmxN7F8TCa11EX60dLcHEMZDxR43A8v0c4ORc5E8Mv4Y0LZfez0MY0WT5rV
 ne0xZ8+Ql85QC3bUrJI6uLE2hQ5kEMauhQu2iTda0onTUZL4VjVxdE4l5t+C4y0SSGzTWs7MCCzQ6q05ER4zqW8Z9X05K11xQHU7SDI6+YSIDb0yCgaHGW5Z
 bDav69lNZRkPanChND/jQbbPOHGMIrFk+DZGLQ+97wvSIJW1L1ACcHItiz6YkxoY0DpsmsyQyhf2AWE13168Cr5VI8xpgOMUDyVStfOjlp/X3wHKtjfQ4CMZ
 +tVB3X5t0mfVXNL7CPf6gucG94VhOj13oNzTNI1vuO+RIHts3DkFax6XKegBY7vA+OhdKPUa7J6wZzTE8gchwqN2cKxXNJ3SKp+RYw7fhWya/RlS+A9HnMRr
 a955oiNxsjrhcTwoVpb38l7yNlSUpXpk8xII1OQrqNCRlR9H0mgXO+Lue5mKIab0DX2NRv8IsnpFB5Uu6RUQ2dyqtT3m0v6QAg9/eiPlqc7VXvinTyx50cx3
 3NZNV4Yl7kGHeYK6vAHZEJT1FXIwkMCnwimQuv/zXSVWDgN2uOfJmw==
Subject: Re: [Buildroot] [PATCH 00/28] Use the best FPU strategies on
 32-bits Arm Cortex
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Sergey Matyukevich <geomatsi@gmail.com>, Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Fabio Estevam <festevam@gmail.com>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Thomas, All,

On 25/01/22 21:55, Yann E. MORIN wrote:
> Thomas, Giulio, All,
> 
> On 2022-01-22 15:32 +0100, Thomas Petazzoni spake thusly:
>> On Tue, 18 Jan 2022 11:43:10 +0100
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>> this patchset aims to enable the best FPU strategy for every board with
>>> 32-bits Arm Cortex actually present in Buildroot. I don't own these boards
>>> so I can't test these changes. What is about Allwinner doesn't worry me
>>> because I've tested a lot of cases with Olimex boards, but the other
>>> changes are still to be tested.
>>>
>>> So I ask to the board maintainers to test the patches that involve their
>>> boards if possible. Anyway I've checked well all the SoCs Datasheet and I
>>> think I've made it correctly, even if in some of them it's not specified
>>> if VFPv4 means -D32. I assume it like that because otherwise -D16 is
>>> usually specified.
>>
>> Do we have a good understand of what -mfpu=neon-vfpv4 does? Your patch
>> series basically converts many defconfigs to use this -mfpu value, but
>> it's not clear to me how it works. What does it mean to combine NEON
>> and VFPv4 instructions?
> 
> The gcc man page states that specifying Neon as part of the fpu setting
> has no effect, unless the -funsafe-math-optimizations is also specified,
> because Neon is not compliant zith IEEE 754:
> 
>      If the selected floating-point hardware includes the NEON extension
>      (e.g. -mfpu=neon), note that floating-point operations are not
>      generated by GCC's auto-vectorization pass unless
>      -funsafe-math-optimizations is also specified. This is because NEON
>      hardware does not fully implement the IEEE 754 standard for
>      floating-point arithmetic (in particular denormal values are treated
>      as zero), so the use of NEON instructions may lead to a loss of
>      precision.
> 
> So it is my understanding that using Neon is not a good idea overall. It
> should only be requested on-demand by people who know what they are
> doing, and most probably, be setting appropriate CFLAGS on a per-package
> basis.
> 
> Additionally, changing the default FPU setting on those defconfigs is
> not really interesting. Indeed, the base system that (most of) those
> defconfig build are probably not exercising the FPU setting much (the
> busybox login and shell are probably not using much FPU insns).
> 
> So, for me, this series is a no-go, first because it has not been tsted
> on actual hardware, second because some of the changes introduce a
> dubious feature which is actually a no-op at best, or worse will
> generate incorrect code.

I agree with you, it's too dangerous. I mean, I've tested on all 
Allwinner Axx series, but haven't check that in the end the assembly 
code corresponding. What I plan to do later, so now you can reject this 
patchset, is to use the smallest package that uses fpu instructions for 
sure, then enable for example:
-mfpu=vfpv4
check
AND
-mfpu=neon-vfpv4

This way I will have my real answer before eventually re-submitting 
while explaining this in detail.

Also, once I will have cleared this topic and it comes out that fpu is 
not use with neon-vfpv4, then I'll send patches to remove that fpu 
strategy on the boards I've set it to it.

I thought it was easier, instead this is an insidious topic.

So yes, let's drop this and thank you all for helping me to clarify.

Kind regards!
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> Regarding VFPv4 D16 vs. D32,
>> https://developer.arm.com/documentation/den0018/a/Compiling-NEON-Instructions/GCC-command-line-options/Option-to-specify-the-FPU
>> tells us:
>>
>>    VFPv3 and VFPv4 implementations provide 32 double-precision
>>    registers. However, when NEON unit is not present, the top sixteen
>>    registers (D16-D31) become optional. This is shown by the -d16 in the
>>    option name, which means that the top sixteen D registers are not
>>    available.
>>
>> So, my understanding is that when NEON is available, the VFPv4 is
>> guaranteed to have the 32 double-precision registers (D32).
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
