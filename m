Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A2FC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503FB6066A;
	Thu, 17 Jul 2025 19:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06wB06-NDq3k; Thu, 17 Jul 2025 19:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C22607CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C22607CC;
	Thu, 17 Jul 2025 19:18:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C18AF117
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE32883A6C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mr7bNGgCgnJu for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 477B983C95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477B983C95
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 477B983C95
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:18:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BB11F2003C1;
 Thu, 17 Jul 2025 21:18:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 17 Jul 2025 21:18:05 +0200
MIME-Version: 1.0
Date: Thu, 17 Jul 2025 21:18:05 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Titouan Christophe
 <titouan.christophe@mind.be>
In-Reply-To: <20250715132715.21766-3-fl@n621.de>
References: <20250715132715.21766-3-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <3168cbc8a86109d41980bb02e7a16e17@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752779890;
 bh=gfbdbMg/wpNoQ0UoWczOHZaKHwCIz752oYjPkc0AsYw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fQ/lFP02Un4jReSKIuOBsZixfI1LGDIzo37bL8oUHlqpm3lh/lq4mi5MPcrL3r+tI
 dqm8ANl3+E4rogU5TTO+Tbe0xlLfUt/vgKOaLfeSxYImrhurDUbEd2YfbbTDeT08e8
 xl9T9uxg/fZ2zvc/Jfabza4x35x4ovdU0/YEAicGFnqrLUOe1wxs3P7ZRdp97iChO4
 H2BY8r8E0/At9Zx7amQ+AApAcNcWNDGUgY+QqLJQQ5L45hrWyfSfHN+MJPnXCMC7NV
 aMVKHWLxdlmLWCJRXzhgzqfXQkdBox1T/6pgXMXF+AAVNrfpjrTKgFg/n5v/Ncntl2
 n5Y0yP325fBXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fQ/lFP02
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/ffmpeg: add support for
 pulseaudio"
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/07/2025 15:27, Florian Larysch wrote:
> This reverts commit e44aff6b1b1a5237b3f5cae019982370671dbd42 which 
> added
> support for linking ffmpeg against libpulse if it is present to provide
> libavdevice support for the PulseAudio protocol. However, it turns out
> that this creates a dependency cycle when BR2_PACKAGE_LIBSOXR is
> enabled, since the pulseaudio daemon can use libsoxr for resampling and
> libsoxr can use the FFT implementation from ffmpeg.
> 
> Resolving this would probably mean breaking up the pulseaudio package
> into the client libraries and the daemon proper (a standalone libpulse
> without the daemon is still useful since it can talk to a remote daemon
> via the network or more likely today talk to a local instance of
> PipeWire, which also implements the PulseAudio protocol).
> 
> For now, break the dependency cycle by reverting to the original state
> (no pulseaudio client support in ffmpeg).
> 
> Reported-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
