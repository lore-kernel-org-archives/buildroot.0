Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A05C5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 19:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE57280E66;
	Thu, 20 Aug 2026 19:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9x4wnPFIyiDR; Thu, 20 Aug 2026 19:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787253611;
	bh=W19bYQkRD3PKTdqFwTe12TYYNbCTaYiWm4iIzWiZmC0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G/LrV1ssnKNNXVMLJQ3dgcqV45DU13TXCMTvHv3lyrQpC7ok8X61ziUbMaFyuc/KS
	 PGSEf/PojFEVVL4Uzvn6g5hdqiIPGuj9ekBnyYqidhtcBpLaXUx9sz9za0MCVICj47
	 Pb26GkVl+s6lIDdMqlC+yiaypk7j0mhFjQIcmjYGU8JaMnrq1HceO48t44qG4g4JQC
	 pzfunSfKnxUOl82W0hpJ0iaw8Xh7rFcCNe5voGN+jKQnjNvww9CZfUsOBzyXdrsC1b
	 0RAX6eO9partLgyV7B0FfihLw1drD4bq3WopKKHO7esH3Y7nCRMNMvgrhJ0BBeMx3j
	 4wnvx0S4J5vKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3979480E6A;
	Thu, 20 Aug 2026 19:20:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 191F5198
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 090A780E6A
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMHr6F985rKm for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 19:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AC3F80E66
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:20:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1D0384E41306
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 19:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E5EE95FF59;
 Thu, 20 Aug 2026 19:20:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F09711C76733; 
 Thu, 20 Aug 2026 21:20:00 +0200 (CEST)
Date: Thu, 20 Aug 2026 21:20:00 +0200
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
Message-ID: <aodS3qtR9YJL5U63@windsurf>
References: <SY8P300MB0041B37C6A3A259B05B0404DF8A72@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8P300MB0041B37C6A3A259B05B0404DF8A72@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
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

Hello!

On Tue, Aug 18, 2026 at 02:17:29AM +0800, Fengwei Tan wrote:
> When a package defines $(PKG)_FLAT_STACKSIZE, ELF2FLT_FLAGS contains
> -Wl,-elf2flt="-r -s<stack-size>". The embedded quotes are needed to
> keep both elf2flt options in single linker argument.
> 
> However, many package Makefiles wrap $(TARGET_CFLAGS) in double quotes,
> for example:
> 
>   CFLAGS="$(TARGET_CFLAGS)"
> 
> After expansion, the embedded quote terminates the outer CFLAGS quote.
> As a result, the shell interprets "-s<stack-size> ..." as a command
> instead of passing it to the compiler.
> 
> Pass -r and -s<stack-size> in separate -Wl arguments instead. This
> avoids embedded quotes; GCC forwards both -elf2flt options to
> ld-elf2flt, which collects them before invoking elf2flt.
> 
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>

Thanks a lot for your patch, well spotted!

One thing that was missing from your commit message is the indication
of which commit broke this, so I added that and applied your commit to
our master branch.

This feature is not actually used by any package in Buildroot, which
explains why this problem remained unnoticed. Would you be willing to
work on adding a simple test case in support/testing/ for this? I
guess it could be a very simple br2-external, with a very simple
package that uses <pkg>_FLAT_STACKSIZE.

Aside from that, no many of our users use Buildroot for noMMU
platforms. Would you mind sharing your use case? Which platform are
you using, in which context, how did you end up running into this
<pkg>_FLAT_STACKSIZE issue?

Again, thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
