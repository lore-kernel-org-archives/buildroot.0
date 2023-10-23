Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7791C25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D974263A;
	Mon, 23 Oct 2023 20:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D974263A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3tNQJL8EcVI; Mon, 23 Oct 2023 20:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A7242597;
	Mon, 23 Oct 2023 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A7242597
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 624471BF41D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 20:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AAAB83AA0
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 20:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAAB83AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHGGO8VvlomJ for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 20:24:03 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 583B483AAF
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 20:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583B483AAF
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118] helo=[192.168.1.10])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qv1Su-005uFJ-61; Mon, 23 Oct 2023 22:23:56 +0200
Message-ID: <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
Date: Mon, 23 Oct 2023 22:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Organization: Igalia S.L.
In-Reply-To: <20231023162506.GV2607@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r0EakmVJ4kg5efv64Hh/g3gDWYx1DM2ODzCI378w8fA=; b=jH4gLzJ2ApbogFB/zXM2q9dME1
 MBVuomijAoTsLBhAahVk9B6PmyQmSeB33kxRo2GY7HlQGMLP6Ne8hHoBpbJc9W/thdvlp7NG1vQ2g
 8KRfsJR7SZ5sAbkLwaWDFfHv7KsqvS6Cgenyq3W+f7Gr8Qku01MNnORONuOPofeSYK5ykwoL3yok8
 lmcM2DKQ+Nn+WZrG6QsECQ/cjtV/wLGZVV3fFKpxGH5AiesStpKLCcBkRAylT15DNPrIbmu9081Y/
 IyuFnahx7/2mSiy4D2lw/HqjU+j3h+LPPi4QQx1e4yBi6Yhy3bnkOIrKOx3v9waG7hG5peaniZuIa
 7Q6GtNQw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=jH4gLzJ2
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*: stop setting
 powersave as the default CPU governor
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/10/2023 18:25, Yann E. MORIN wrote:
> Marcus, All,
> 
> On 2023-10-23 14:40 +0200, Marcus Hoffmann via buildroot spake thusly:
>> On 21.10.23 23:38, Yann E. MORIN wrote:
>>> Carlos, All,
>>>
>>> On 2023-10-20 15:20 +0100, Carlos Alberto Lopez Perez spake thusly:
>>>> * The defconfigs from the RPi Kernel set `powersave` as the default
>>>>   CPU governor, which is a bad idea as that reduces performance by
>>>>   setting the CPU frequency to the minimum one.
>>>>
>>>> * In case of a buildroot build user-space is not configured by default
>>>>   to change the CPU governor, so `powersave` will remain the CPU
>>>>   governor and it will slow down everything.
>>>>
>>>> * I submitted a fix for those defconfigs to upstream here:
>>>>   https://github.com/raspberrypi/linux/pull/5666
>>>>   However, we shouldn't wait until that is accepted and backported
>>>>   to all the stable branches (if ever is).
>>> Unfortunately, the rpi folks have rejected this change:
>>>     https://github.com/raspberrypi/linux/pull/5666#issuecomment-1772531097
>>>     We're not changing it.
>> The upstream situation is that the governor is changed by default to
>> 'ondemand' during boot though, which I don't think the rpi buildroot
>> defconfigs do?
> 
> The defconfigs are basic configurations that just demonstrate the basic
> behaviour of a board, with minimal to no tweaking to deviate from
> upstreams.
> 
> Users are suposed to take those defconfigs, and adapt to their needs. If
> they want to change the governor, then they can provide a startup script
> that enables the required governor. Maybe we could cary such a script in
> an overlay in board/raspberrypi/, though. Just maybe...
> 

Who is upstream? mainline Linux or the Linux RPi-OS fork?

Because the default governor for Linux is schedutil and is what any user
would expect to get on their build (IMHO).

The RPi guys are the ones changing the default CPU governor of Linux for
some obscure feature of RPi-OS.

I have argued with them that the place to do this change is not on the
Linux Kernel defconfigs but on their repository for RPi-OS because other
projects (like buildroot) depend on them. But they are not willing to
change this.

So I think Buildroot should undo that change in order to keep the Linux
default CPU governor to the Linux's default one (schedutil)

It is actually a bit surprising to me that we have to argue about this
at all. I thought this change would be uncontroversial. I don't know why
anyone would want to have the powersave governor by default or think
that is a good idea.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
