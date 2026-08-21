Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114F8C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7ED840C2D;
	Fri, 21 Aug 2026 20:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrdsVb-mcerq; Fri, 21 Aug 2026 20:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787343909;
	bh=xa6Qt8wCD4qJ/f+E+qgdACzIZGzf7Bi3YOFhXhH5E/g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z9vAKBZe9WZ7A6TMoCXrnNscn+1QnoR9Zg9BakqIHDZ44YHAKsyX98XWy3ZPUd1nQ
	 baCu6x2U/QA4HZg/Cq/mLMa9tMSYdgyuQ+DZfgJ7xKnG2E8SmFGBgGtL6Oy+u0gB/J
	 49c30VNEybqzJo5sPd9DqqvKA6aHKoruRHVFHA0PEkCMrEIPPtPTAT5tnDNIfHaiiA
	 PvwES1qTqgHpx1j4mAzgb+awaV9mcn/4X5QEwZm4jIgrBSlSvbEgsPK0/g6YpFxSk9
	 irYxqBA0LCRmlC0MPEl9ueG8M4HSaDbb947+Pj2zKti2QAYbkVwzaVFLvC0JyWq4rV
	 v7ZvXjP1k6Ocg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D92ED40C54;
	Fri, 21 Aug 2026 20:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4C664C4
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9671A40C54
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WESBF--VXnDK for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 20:25:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF9EA40C2D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:25:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BA3621A178E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:25:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 78403604AA;
 Fri, 21 Aug 2026 20:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 841F711C77608; 
 Fri, 21 Aug 2026 22:24:59 +0200 (CEST)
Date: Fri, 21 Aug 2026 22:24:58 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
Message-ID: <aoizvh0-63Qk71KB@windsurf>
References: <aodS3qtR9YJL5U63@windsurf>
 <SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package: fix builds with
 $(PKG)_FLAT_STACKSIZE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, Aug 22, 2026 at 01:26:13AM +0800, Fengwei Tan wrote:

> Sure. I would be glad to add a test case for this, and I will send it as
> a separate patch.

Excellent, thanks!

> I am working on a fork of Buildroot for HPMicro MCUs:
> https://github.com/hpm-rs/buildroot
> 
> I have ported Linux to a new RISC-V MCU called HPM6750 from HPMicro
> Semiconductor Ltd., and I am adding board support for it to Buildroot.
> 
> I ran into this problem when trying to run FFmpeg on it. Initially, it
> failed with a "stack smashing detected" error. To resolve this, I
> attempted to use FFMPEG_FLAT_STACKSIZE to allocate a larger FLAT stack,
> which led me to discover the build failure caused by this bug.

Nice! To be honest I had never heard of HPMicro, so it's nice to
discover.

Do not hesitate to send patches to add support for your
platform(s). However, for this, we will require that the support for
your platform is also in the upstream Linux kernel: we don't want to
carry dozens/hundreds of platform-specific patches in Buildroot.

But aside from your platform-specific support, do not hesitate to
submit any noMMU fixes you might have, like the one you already
submitted.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
