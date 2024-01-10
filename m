Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C354C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE7F843778;
	Wed, 10 Jan 2024 21:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE7F843778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOK-D5X5pCoG; Wed, 10 Jan 2024 21:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F172143765;
	Wed, 10 Jan 2024 21:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F172143765
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73B501BF94D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BBE761569
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBE761569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCkqr29jMsJU for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:57:33 +0000 (UTC)
Received: from relay3.mail.vrmd.de (relay3.mail.vrmd.de [81.28.224.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E034161564
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E034161564
Received: from [2a00:1c38:1:1:511c:e03c::] (helo=webmail.variomedia.de)
 by relay3.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rNgZm-008f53-I4; Wed, 10 Jan 2024 22:57:30 +0100
MIME-Version: 1.0
Date: Wed, 10 Jan 2024 22:57:28 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87cyu9cijk.fsf@48ers.dk>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <87cyu9cijk.fsf@48ers.dk>
Message-ID: <186213ada01489cd0b8504d5c9498644@sebastianbauer.info>
X-Sender: mail@sebastianbauer.info
X-Relay-User: mail@sebastianbauer.info
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
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 2024-01-10 16:30, schrieb Peter Korsgaard:
>>>>>> "Sebastian" == Sebastian Bauer <mail@sebastianbauer.info> writes:
>  > This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.
>  > Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails 
> because
>  > some of the symbols like controls::AeFlickerMode are not recognized.
>  > According to my research, they have been introduced after libcamera 
> 0.1.0
>  > but there is no release version of libcamera newer than 0.1.0 
> available
>  > to which we could bump.
> 
>  > Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
> 
> FYI, there is now a libcamera 0.2.0 release:
> 
> https://git.linuxtv.org/libcamera.git/commit/?id=89227a428a82e724548399d35c98ea89566f9045

Thanks for the hint. I would bump libcamera to 0.2.0 after testing, but 
I think it should happen together with libcamera-apps (now called 
rpicam-apps). IMO, patch 3/3 should to applied first to master to 
gradually switch.

Note that it appears that Raspberry Pi foundation seems to maintains an 
own fork of libcamera (https://github.com/raspberrypi/libcamera), which 
may explain the previous libcamera-apps breakage. I'm not really sure 
how to to deal with that in context of buildroot.

Bye
Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
