Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894A1C47258
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 16:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27A18419C9;
	Mon, 15 Jan 2024 16:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A18419C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SeOCIGprB3x; Mon, 15 Jan 2024 16:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F11741829;
	Mon, 15 Jan 2024 16:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F11741829
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0321BF370
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 16:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5314402F6
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 16:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5314402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qQLUM2_Efr3 for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 16:24:21 +0000 (UTC)
Received: from relay3.mail.vrmd.de (relay3.mail.vrmd.de [81.28.224.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90242419C5
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 16:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90242419C5
Received: from [2a00:1c38:1:1:511c:e03c::] (helo=webmail.variomedia.de)
 by relay3.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rPPl5-00BJIl-18; Mon, 15 Jan 2024 17:24:19 +0100
MIME-Version: 1.0
Date: Mon, 15 Jan 2024 17:24:16 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
In-Reply-To: <170498915806.3227220.4621869908291079078@ping.linuxembedded.co.uk>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <87cyu9cijk.fsf@48ers.dk>
 <186213ada01489cd0b8504d5c9498644@sebastianbauer.info>
 <170498901621.3227220.12602677275692733112@ping.linuxembedded.co.uk>
 <170498915806.3227220.4621869908291079078@ping.linuxembedded.co.uk>
Message-ID: <26eb70280858bfda24440c933edb6b8b@sebastianbauer.info>
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
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 2024-01-11 17:05, schrieb Kieran Bingham:
> Actually, to be clearer. I would suggest updating to libcamera-0.2, and
> then make sure rpicam-apps (or libcamera-apps, if it's that far back) 
> is
> pinned to whatever version /does/ compile successfully against
> libcamera-0.2 to be able to continue supporting Pi4.

Sounds good to me. I can try to come up with something, unless someone 
would like to steps forward.

We are using this RPi4 setting with cameras in some courses at the HTW 
Berlin in the programme Computer Engineering, and I ideally would like 
to base everything on plain Buildroot.

Thanks a lot for your clarification.

Bye
Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
