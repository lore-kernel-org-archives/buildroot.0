Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5A5C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 16:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1990D6F589;
	Thu, 11 Jan 2024 16:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1990D6F589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSpK-wT2fFRi; Thu, 11 Jan 2024 16:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AA3A6F55E;
	Thu, 11 Jan 2024 16:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA3A6F55E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7D31BF3FD
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 16:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31705401DD
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 16:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31705401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRWcPq13MZRl for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 16:10:17 +0000 (UTC)
X-Greylist: delayed 394 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Jan 2024 16:10:16 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4020405FD
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4020405FD
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:10:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 465FC896;
 Thu, 11 Jan 2024 17:02:34 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <186213ada01489cd0b8504d5c9498644@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <87cyu9cijk.fsf@48ers.dk>
 <186213ada01489cd0b8504d5c9498644@sebastianbauer.info>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Peter Korsgaard <peter@korsgaard.com>,
 Sebastian Bauer <mail@sebastianbauer.info>
Date: Thu, 11 Jan 2024 16:03:36 +0000
Message-ID: <170498901621.3227220.12602677275692733112@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1704988954;
 bh=IjcUA8xiIFXq3rQ5vNvSORCpppHyot8xDazm+IejFS4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=D7sE5ACcxIjD2hVEedA5dyN6s3gs2pozcMHKia6tX8RqyKw0VHmM02oBGw7KY7Njd
 dV/4nLXt89/6L9ptLreSXUlPI0WLRoyBBpqupbAqY8pplEsqap8nlUlFTIccNRbfkk
 SEpMvTFM4AC1ml5HsuvSzDQmJw2gieXWM9UAxomQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=D7sE5ACc
Subject: Re: [Buildroot] [PATCH 1/3] Revert "package/libcamera-apps: bump to
 version 1.3.0"
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Sebastian Bauer (2024-01-10 21:57:28)
> Am 2024-01-10 16:30, schrieb Peter Korsgaard:
> >>>>>> "Sebastian" == Sebastian Bauer <mail@sebastianbauer.info> writes:
> >  > This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.
> >  > Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails 
> > because
> >  > some of the symbols like controls::AeFlickerMode are not recognized.
> >  > According to my research, they have been introduced after libcamera 
> > 0.1.0
> >  > but there is no release version of libcamera newer than 0.1.0 
> > available
> >  > to which we could bump.
> > 
> >  > Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
> > 
> > FYI, there is now a libcamera 0.2.0 release:
> > 
> > https://git.linuxtv.org/libcamera.git/commit/?id=89227a428a82e724548399d35c98ea89566f9045
> 
> Thanks for the hint. I would bump libcamera to 0.2.0 after testing, but 
> I think it should happen together with libcamera-apps (now called 
> rpicam-apps). IMO, patch 3/3 should to applied first to master to 
> gradually switch.

The controls::AeFlickerMode issue would already be resolved by moving to
0.2, however unfortunately another issue then creeps in ...

> Note that it appears that Raspberry Pi foundation seems to maintains an 
> own fork of libcamera (https://github.com/raspberrypi/libcamera), which 
> may explain the previous libcamera-apps breakage. I'm not really sure 
> how to to deal with that in context of buildroot.

Their fork has the Pi5 support. This brings in some additional pixel
formats, which are not yet upstream in the linux kernel. We talked to
RPi earlier, so we're all working to resolve this, but it may take a
couple of weeks still.

We'll do anything I can to accelerate at least the pixelformat issue
which would fix this breakage sooner.

The goal is to get Pi5 support upstream of course. Raspberry Pi are
actively working on upstreaming the core Pi5 kernel support, so it will
get there - but they haven't been able to send things out yet.

Along side that - the ISP support will be posted as soon as possible.
That would then introduce the new pixelformats, which we can then bring
into libcamera.

Ultimately, it's unfortunate, but Raspberry Pi have 'released' a version
of rpicam-apps which will not work with the current libcamera mainline
tree. This gives them a working system for Pi5. And that's up to them,
as they have full control over Raspberry Pi OS ... but causes pain for
everyone else. I don't know how to handle that 'now' though, except
perhaps wait for the upstreaming to make more progress.

--
Kieran
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
