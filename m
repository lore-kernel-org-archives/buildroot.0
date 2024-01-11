Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A3EC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 16:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C5C60BC7;
	Thu, 11 Jan 2024 16:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C5C60BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlGKqRSjWb3e; Thu, 11 Jan 2024 16:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235CE60B8E;
	Thu, 11 Jan 2024 16:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 235CE60B8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 770EC1BF2A6
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 501B460B8E
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 16:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 501B460B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6mFw_0MzAoc for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 16:15:15 +0000 (UTC)
X-Greylist: delayed 550 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Jan 2024 16:15:15 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635A460B2E
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 635A460B2E
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:15:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F834C85;
 Thu, 11 Jan 2024 17:04:55 +0100 (CET)
MIME-Version: 1.0
In-Reply-To: <170498901621.3227220.12602677275692733112@ping.linuxembedded.co.uk>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <87cyu9cijk.fsf@48ers.dk>
 <186213ada01489cd0b8504d5c9498644@sebastianbauer.info>
 <170498901621.3227220.12602677275692733112@ping.linuxembedded.co.uk>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Peter Korsgaard <peter@korsgaard.com>,
 Sebastian Bauer <mail@sebastianbauer.info>
Date: Thu, 11 Jan 2024 16:05:58 +0000
Message-ID: <170498915806.3227220.4621869908291079078@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1704989095;
 bh=CHuib/5+LREZhfRVoY2lUdMRn8UERqW0ABj7jBcj0Vs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lAfDbr/6e/vUAayLanSe+W+AEJjQoSMBL+EQQDtt5s3etbJmOAwrzbz/gAv7L3WRy
 9RL8EeKETi4n7MtosiV1oKVRkI0SOEtJm5OEqJCxXzMujWbn01xhgAUpCnAGNwbG2a
 QfhMN85bjrULFCKP6Ijc/PorEGjcG0qdB+K4m5H0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=lAfDbr/6
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

Quoting Kieran Bingham (2024-01-11 16:03:36)
> Quoting Sebastian Bauer (2024-01-10 21:57:28)
> > Am 2024-01-10 16:30, schrieb Peter Korsgaard:
> > >>>>>> "Sebastian" == Sebastian Bauer <mail@sebastianbauer.info> writes:
> > >  > This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.
> > >  > Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails 
> > > because
> > >  > some of the symbols like controls::AeFlickerMode are not recognized.
> > >  > According to my research, they have been introduced after libcamera 
> > > 0.1.0
> > >  > but there is no release version of libcamera newer than 0.1.0 
> > > available
> > >  > to which we could bump.
> > > 
> > >  > Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
> > > 
> > > FYI, there is now a libcamera 0.2.0 release:
> > > 
> > > https://git.linuxtv.org/libcamera.git/commit/?id=89227a428a82e724548399d35c98ea89566f9045
> > 
> > Thanks for the hint. I would bump libcamera to 0.2.0 after testing, but 
> > I think it should happen together with libcamera-apps (now called 
> > rpicam-apps). IMO, patch 3/3 should to applied first to master to 
> > gradually switch.
> 
> The controls::AeFlickerMode issue would already be resolved by moving to
> 0.2, however unfortunately another issue then creeps in ...
> 
> > Note that it appears that Raspberry Pi foundation seems to maintains an 
> > own fork of libcamera (https://github.com/raspberrypi/libcamera), which 
> > may explain the previous libcamera-apps breakage. I'm not really sure 
> > how to to deal with that in context of buildroot.
> 
> Their fork has the Pi5 support. This brings in some additional pixel
> formats, which are not yet upstream in the linux kernel. We talked to
> RPi earlier, so we're all working to resolve this, but it may take a
> couple of weeks still.
> 
> We'll do anything I can to accelerate at least the pixelformat issue
> which would fix this breakage sooner.
> 
> The goal is to get Pi5 support upstream of course. Raspberry Pi are
> actively working on upstreaming the core Pi5 kernel support, so it will
> get there - but they haven't been able to send things out yet.
> 
> Along side that - the ISP support will be posted as soon as possible.
> That would then introduce the new pixelformats, which we can then bring
> into libcamera.
> 
> Ultimately, it's unfortunate, but Raspberry Pi have 'released' a version
> of rpicam-apps which will not work with the current libcamera mainline
> tree. This gives them a working system for Pi5. And that's up to them,
> as they have full control over Raspberry Pi OS ... but causes pain for
> everyone else. I don't know how to handle that 'now' though, except
> perhaps wait for the upstreaming to make more progress.

Actually, to be clearer. I would suggest updating to libcamera-0.2, and
then make sure rpicam-apps (or libcamera-apps, if it's that far back) is
pinned to whatever version /does/ compile successfully against
libcamera-0.2 to be able to continue supporting Pi4.

Then rpicam-apps should only be updated when the Pi5 support is
completed, or at least unblocked.

--
Kieran
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
