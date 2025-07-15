Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9379CC83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 13:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 510296119F;
	Tue, 15 Jul 2025 13:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x1A-9b1_jAV; Tue, 15 Jul 2025 13:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 800A360FE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800A360FE3;
	Tue, 15 Jul 2025 13:16:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57CD9DF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 498C94091F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UOPvVLnr2PO for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 13:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C8D2408AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8D2408AD
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C8D2408AD
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:16:55 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id D72E9E00366; Tue, 15 Jul 2025 15:16:52 +0200 (CEST)
Date: Tue, 15 Jul 2025 15:16:52 +0200
From: Florian Larysch <fl@n621.de>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <20250715131652.jygohupj53zv2r3j@n621.de>
References: <20250711173633.20222-1-fl@n621.de>
 <8e6d38ab-9800-4a57-b550-1810e615f5ee@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e6d38ab-9800-4a57-b550-1810e615f5ee@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752585412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7GqUQWRxvArKDrlfPMU0YBMngo6WH4gdOjtyjNC93rM=;
 b=AqHYnBg/JNTUOgcHeM7rbOfW8ojK9003fX5D3ib9KknI81SLiYjvlPjgoNXimjP6U2RGt1
 qeUmniHw+SzeINqUKkt4RcFWLqNv+Jt3TYExXdAdkoSc1R6VFW8fO1xuQdM186Sq3ii87G
 qjkyJR136lwWtki7YDXay11WQ2U48So=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=AqHYnBg/
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add support for
 pulseaudio
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Titouan,

On Tue, Jul 15, 2025 at 11:49:18AM +0200, Titouan Christophe wrote:
> In our nightly Gitlab pipeline for LTS maintenance, I notice that this
> created a dependency cycle:

Thank you for catching this! I didn't have soxr enabled in my build so I
didn't notice that.

> I personally don't use any of these so I'm unsure of what would be the best
> way to handle this case.

The problem here is that the packages are a bit too coarse-grained.
ffmpeg needs pulseaudio only for the client libraries (which get used in
libavdevice), but pulseaudio uses ffmpeg (via libsoxr) only for
providing an FFT implementation (via libavcodec) and that only gets used
in the main pulseaudio daemon.

This could be solved by splitting pulseaudio into a -libs package or
splitting up ffmpeg. I think splitting up pulseaudio would be much
easier in comparison. Also in my application I was just going to use
libpulse to talk to the Pipewire implementation of the PulseAudio
protocol - I wasn't even going to use the original daemon and this is
probably not too uncommon nowadays.

Either way I won't have the time to dig into this any further this week,
I'll send a revert for now.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
