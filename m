Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97362C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:08:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DDD560EBC
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DDD560EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C1F40474;
	Sat, 31 Jul 2021 22:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrKoDJqPHLT9; Sat, 31 Jul 2021 22:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEFD40440;
	Sat, 31 Jul 2021 22:08:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 357C01BF2C1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30FC4402AA
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrcSKEzcWM_D for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:06:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFF094014C
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:06:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B2147240004
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:06:30 +0000 (UTC)
Date: Sun, 1 Aug 2021 00:06:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Message-ID: <20210801000629.26c490fb@windsurf>
In-Reply-To: <20210731220008.67DFE8A39F@busybox.osuosl.org>
References: <20210731220008.67DFE8A39F@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit branch/2021.02.x] package/util-linux:
 bump version to 2.36.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, 31 Jul 2021 23:59:39 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=9c76f35500d88c75949c0bab64621b7eb79efa9f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x
> 
> For details see [1].
> 
> [1] http://lkml.iu.edu/hypermail/linux/kernel/2102.1/07236.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

If you wonder why I backported this on 2021.02.x: it fixes a build
issue on RISC-V 32-bit:

  http://autobuild.buildroot.net/results/af9/af9df629fba7bccd095fbd7d3612195b980c9893/build-end.log

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
