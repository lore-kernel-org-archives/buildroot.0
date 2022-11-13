Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E13C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 18:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C40FE4051D;
	Sun, 13 Nov 2022 18:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40FE4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scIuCoNdeKQU; Sun, 13 Nov 2022 18:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7450404BA;
	Sun, 13 Nov 2022 18:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7450404BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8821BF37E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 18:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 733108148A
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 18:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733108148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvmz0Y3f2B5s for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 18:11:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A89881470
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A89881470
 for <buildroot@busybox.net>; Sun, 13 Nov 2022 18:11:11 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B51C44403F9;
 Sun, 13 Nov 2022 20:08:34 +0200 (IST)
References: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
 <20221111211809.5cd3802e@windsurf>
User-agent: mu4e 1.8.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Nov 2022 20:03:15 +0200
In-reply-to: <20221111211809.5cd3802e@windsurf>
Message-ID: <87h6z2u3lx.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1668362915;
 bh=bZ09qa1TSTjqYGcT07w3DxyFIt9kyjXqpKPo9nv1HIk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=mS+poTU/cTA4YcldLHyuJreF9zld6vhgeInWlwPndun0Pv95Rnykv5IO0pDbCVuyb
 RYibB4/08+uCP4TZgbCfBLzUHI7LO6H1xIL0fRGW1h6GCZ3bim/yn6D9261O6MdD0v
 k4GdzD+eBKrl0bum6UFlRkqrC/AnKgIkCGcuR+N3bLYy+ywjhzo/PZ+qxvYuHAg2Hh
 B81uBdJrlTQopmAhLzFIBiCyTKGGIVwNhO1D0O/jDPiagGmmf4SvNOncpI17JhIVFx
 Dvhve0faA/HRjDZZs4KClDMyU5rEsEAQkeTj70D09NUfuyPlqRmBiAOzeASgZbgelb
 TQ9xmBIpYmPVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=mS+poTU/
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't enable SSP
 by default
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net, Julien Olivain <ju.o@free.fr>,
 Fabio Estevam <festevam@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Nov 11 2022, Thomas Petazzoni wrote:
> On Fri, 28 Oct 2022 08:36:27 +0300
> Baruch Siach via buildroot <buildroot@buildroot.org> wrote:
>
>> SSP support requires support in ATF platform code. Not all platforms
>> implement plat_get_stack_protector_canary() hook. The result is build
>> failure:
>> 
>> (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'
>> 
>> Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
>> originally introduces this issue. But then commit ccac9a5bbbd
>> ("boot/arm-trusted-firmware: don't force ENABLE_STACK_PROTECTOR") hid
>> the problem by effectively disabling SSP for all platforms. So only
>> after commit 09acc7cbc91f5 ("boot/arm-trusted-firmware: fix SSP
>> support") the issue showed up.
>> 
>> Make SSP an opt-in for platform that actually provide the
>> plat_get_stack_protector_canary() hook.
>> 
>> Cc: Sergey Matyukevich <geomatsi@gmail.com>
>> Cc: Dick Olsson <hi@senzilla.io>
>> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
> Unfortunately, it seems like the SSP stuff for TF-A still doesn't work.
> We still have build failures on several defconfigs:
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821171
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821262
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821323
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821325
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821326
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821327
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821374
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821374
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821388
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821583
>
> Since your commit 09acc7cbc91f50305730ca0690a58fb93529034b
> boot/arm-trusted-firmware: fix SSP support, we no longer force disable
> SSP support when BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is disabled.
>
> If one of BR2_SSP_REGULAR, BR2_SSP_STRONG or BR2_SSP_ALL is enabled,
> all code gets built with SSP, including the TF-A code.
>
> Prior to commit 09acc7cbc91f50305730ca0690a58fb93529034b, we were
> passing ENABLE_STACK_PROTECTOR=0 when
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP was disabled, making sure that TF-A
> was forcefully disabling SSP, even if it was globally enabled via one
> of BR2_SSP_...
>
> So I'm afraid the fix in 09acc7cbc91f50305730ca0690a58fb93529034b does
> not work :-/

Well, the fix works in the sense that it allows to enable SSP for ATF
while previously it was always disabled.

Failing configs all appear to use ATF version 2.2 or older that lacks
commit 7af195e29a421 ("Disable stack protection explicitly").

The only solution I can think of is to pass 'TF_CFLAGS =
-fno-stack-protector' in the environment when
BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is disabled.

I'll give it a test to see how it works.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
