Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA15BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5886B8194C;
	Tue, 14 Jun 2022 15:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0SJcfO2Gsn6; Tue, 14 Jun 2022 15:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9527181424;
	Tue, 14 Jun 2022 15:58:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12BAF1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 018B381424
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1kDtu1UKoXD for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:58:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB3078141C
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:58:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A1D71BF204;
 Tue, 14 Jun 2022 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1655222334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzWdGtjCjt/RASQ9Luwd5qX2fcsVI5qbd24+J8qSHag=;
 b=eAdpvjuXRFQqD2W73Mvp7nyJlMqaD6xi64j+Z0dNdlO38UqkjK+UlzebC1ls7INQJrmm9O
 7Y5qvzgouLqfS7pEO3z5g3NQ4z4qsb0hSFbuYNG8TT7iOKe/7Kkw/yxSZhICt2UqlbYN7k
 I/nsyIXqQ+6ZMvAsBmcnpsJPd77FgHUOuwgUUj65dd9jHF8MB5RRt68i/9NWENNsbk3rlc
 hjAcHjmoqfsAC5vFI0fCgVvy3PbGpIX2/ru5ezMIcrkqQfpFu6YawQPbdni6Iu0kVujb9s
 Ajex+6j6adSErOzvrynmd/DkDD36grXKA750hxEA1p074vDscENwuWLcFCNfnw==
Date: Tue, 14 Jun 2022 17:58:44 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220614175844.45509426@windsurf>
In-Reply-To: <12178427-e595-be4e-5da5-d4cf1718b9e2@mind.be>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
 <20220608071027.3384469-8-thomas.petazzoni@bootlin.com>
 <12178427-e595-be4e-5da5-d4cf1718b9e2@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 07/14] toolchain/toolchain-external: add
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Jun 2022 17:34:20 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   This could have been simplified to
> 
> 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
> 
> but this way is more flexible so better I guess.

Yes, I thought about this (should maybe have written it in the commit
log), but I thought: external toolchains can very well rely on patched
GDB versions that could potentially have support for an architecture
that's not supported in upstream GDB.

I agree this is a corner case, so if we decide that's not worth
considering, I would totally support using
BR2_PACKAGE_GDB_ARCH_SUPPORTS.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
