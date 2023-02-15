Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70377C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 05:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEEB340B8E;
	Wed, 15 Feb 2023 05:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEEB340B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YO6dtRmUERNS; Wed, 15 Feb 2023 05:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8F7D404ED;
	Wed, 15 Feb 2023 05:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F7D404ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27CB41BF836
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 05:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C8F404ED
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 05:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C8F404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ybyk0hgAoGYr for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 05:27:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E8A40017
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E8A40017
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 05:27:49 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id DFCDE44057D;
 Wed, 15 Feb 2023 07:23:33 +0200 (IST)
References: <SY2PR01MB277812C5F0180DAA6B2A1D2994A29@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <87v8k40wok.fsf@tarshish>
 <SY2PR01MB27785A7F0A589B49D0ABE42994A29@SY2PR01MB2778.ausprd01.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
To: Afshin Pir <Afshin.Pir@gallagher.com>
Date: Wed, 15 Feb 2023 07:20:10 +0200
In-reply-to: <SY2PR01MB27785A7F0A589B49D0ABE42994A29@SY2PR01MB2778.ausprd01.prod.outlook.com>
Message-ID: <87r0ur1ory.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1676438613;
 bh=fp6DES+ctQlvx2LuYtal627ASlFa0mJ0OAqRZg/Kct8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=aVMrbZpz1M0C1ons09hKAxnGKAyKM9a9ZPr3Z8fWYg+GRW7KTG9vDhPrIpd0lcB/h
 /8/GEVEgVjUbGN0MN6G7Gqcmx/g2L04JehM50pHAlEr63d+XPw7As+pWJAHiHbUPoV
 WVmioKNCPtM699LEwGMT4Kz9QcW34BhjpHbg86dE4B5JY9ev6mhADu41xwfgJFpENO
 BHhARSpYLbrCwArVZnTv1Aq2d8wf32ZasROBROjTsCDzNqbKgscf3eXTq/uUWyIk8P
 UY8vk4mrj8iilcEUCvYubg6PBp8pzmfx4Hz9PzZv3Vd34gM8aGDr/WUOLGl4QwHJ+D
 nHlj0QcH82Z/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=aVMrbZpz
Subject: Re: [Buildroot] Define dependency package only in staging
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Afshin,

Please keep the list on Cc.

On Tue, Feb 14 2023, Afshin Pir wrote:
> You mean will it work if I add that in package "A" configuration like this:
>         B_INSTALL_TARGE = NO
> Because normally each package its own configuration.

That should be

  B_INSTALL_TARGET = NO

But now I see that you want B out of target only when A selects B, not
for the general case, right? There is no direct support for that in
Buildroot. You can always use a post build script to remove whatever you
like from your target.

Alternatively you can add a blind config symbol to package B Config.in
that adds 'B_INSTALL_TARGET = NO', and then select this symbol from
package A.

baruch

> -----Original Message-----
> From: Baruch Siach <baruch@tkos.co.il>
> Sent: Wednesday, 15 February 2023 10:20 am
> To: Afshin Pir <Afshin.Pir@gallagher.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] Define dependency package only in staging
>
> Hi Afshin,
>
> On Tue, Feb 14 2023, Afshin Pir wrote:
>> I wonder if it is possible that to force the dependant package to be
>> installed only in staging folder. For example, I have written package
>> A which depend on Package B like this:
>>
>> config BR2_PACKAGE_A
>>                bool "my-a-provider"
>>                select BR2_PACKAGE_B
>>                help
>>                        Test A Package
>>
>> The problem is that the above configuration installs B in the target,
>> but in reality, it is enough to be installed in staging directory
>> (since it provides a header-only version). In there anyway to define a
>> dependency for staging only?
>
> '<PKG>_INSTALL_TARGET = NO' might help you.
>
> baruch


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
