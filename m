Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C9C00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 223E884AE6;
	Tue, 24 Oct 2023 14:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 223E884AE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BFAVqZTczjD; Tue, 24 Oct 2023 14:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AF6E84B0D;
	Tue, 24 Oct 2023 14:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF6E84B0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC991BF377
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44467432FC
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44467432FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ot5PiAz-Ds-y for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:28:50 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BD6C432F4
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD6C432F4
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118] helo=[192.168.1.10])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qvIOf-006WAo-Le; Tue, 24 Oct 2023 16:28:41 +0200
Message-ID: <4528d9f7-78ee-1576-37d7-236476d3874f@igalia.com>
Date: Tue, 24 Oct 2023 16:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
 <20231023162506.GV2607@scaer>
 <6024766d-548e-c9ce-a0a0-2aaeb4396461@igalia.com>
 <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Organization: Igalia S.L.
In-Reply-To: <PH1P110MB1603AA64767C75F0971FFB339FDFA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7NQtsZYSnTJ0oyiPg49Q0evOO5Aukvd1mHXYAlNnY4=; b=e3ArMgpXcJTwjxzSnuu/LX3YAG
 hsCPSMJwNyOOqio1xj4bLkFnXUKT/zWK2W90VPTXBrtphQJ4oIcbo7z6aoPO9k+P4Qo5Yr4Sypta7
 7aQaUfAXmFhtv9fevpOF/+xp0AXFICN5PWqM8frJzvUEtp08X7eznEvl/KkDF9VhKsXEUuGcVicMs
 ZiPGmV3OUt7sNLGHJ03gN5NUCwUUVucq1UuuyHOgUNqCdGq0Yn311lqU6zVQwkJo0U3t6fTjRbNQw
 JpyW4fLVp7qhRmwgJuyBZX3Edz7o8slFmabGtuI+CW9j8OgRHH8GqQnl2h7VYyuzOVUhSniG3pMU/
 3icQMjAQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=e3ArMgpX
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] configs/raspberrypi*:
 stop setting powersave as the default CPU governor
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
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/10/2023 16:01, Vincent Fazio wrote:
> Per Phil:
> We default to powersave to allow boards to be booted successfully when higher clocks speeds are causing problems, e.g. with an inadequate power supply.
> 
> I have personally had issues booting CM3+ boards with ondemand governors with ethernet plugged in when the CPUs don't have heat sinks on them.
> 

I don't know why the rest of users should inherit a default that is
meant to address a corner case (CM3 boards without heat sinks) and that
slows down everything for them.

What is worse, they likely won't notice they are running with the lowest
possible frequency.

On the other hand, if we default to the Linux default scheduler
(schedutil) then the (minority of) users with overheat problems will
notice something doesn't work as expected (board stops working or the
kernel-log prints errors) so they can change the governor or put a
hetsink if they suspect overheat issues.

>> I have argued with them that the place to do this change is not on the Linux
>> Kernel defconfigs but on their repository for RPi-OS because other projects
>> (like buildroot) depend on them. But they are not willing to change this.
>>
>> So I think Buildroot should undo that change in order to keep the Linux
>> default CPU governor to the Linux's default one (schedutil)
>>
> Can't this be done by one of the following:
> 1) provide your own kernel defconfig file
> 2) fork the RPi kernel with your own changes and use that ref
> 3) add a kconfig fragment to switch the default governor
> 4) adjust the kernel commandline in config.txt with your chosen governor
> 5) use a startup script to change governors post boot (obviously doesn't fix the "must boot fast" issue)
> 

Yes, I know how to fix this on my build.

But I'm trying to do a service to the community and change the default
to a more sane option. I'm actually not changing the default, just
resetting it to the default Linux mainline option (undoing the change
that the RPi-OS guys do for their product)

The RPi-OS guys do option 5) for this, so its ok for them to default to
powersave. But Buildroot doesn't have anything like that and I'm not
going to work on it.

The reality nowdays is that all buildroot RPi users are actually running
with powersave governor by default and I bet 90% of them don't know it.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
