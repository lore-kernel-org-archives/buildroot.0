Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FCFC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5902B40189;
	Fri, 11 Nov 2022 20:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5902B40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ki0j-IhV2N7M; Fri, 11 Nov 2022 20:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 859B54013E;
	Fri, 11 Nov 2022 20:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859B54013E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A56571BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A0604013E
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A0604013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Na3UuYOQcAIr for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:43:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEFE40132
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBEFE40132
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:43:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C94171BF207;
 Fri, 11 Nov 2022 20:43:46 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:43:45 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221111214345.419477ef@windsurf>
In-Reply-To: <20220506191229.6154E85C61@busybox.osuosl.org>
References: <20220506191229.6154E85C61@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668199427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezNNACldBBBsJ48AmP6Y0FGqcqyOFC+D8Q3jP23+u+w=;
 b=V0Z5vAqHI7cKzmPP1wskcbQ5BIVa5IuDEYd/pGhHT/zHbTuXTs3tMO1AU4sek2t0baeN3J
 4g53jkTvMGj2A1uRiX50E62VW7xiMD0qg7GU7VD+a0xhCjPotLVtedvNvIuvThHeHlY+or
 ZFZaMnReGXSdRVmpT8xcWdSgRfkkztISeWCW8aQYfWdVtLelOBPl1tihw8zrr9lp6c2Zem
 8YmOw66YXqULPuKEO5sXsIRkkGp4YENm+5tk12OFQyy63/J5D76sYPHldk7sSNp2XdSrXh
 reGS8Vtd4DwoLrqBIlepF8Pa2/Dkyd3vILvvAgvP49XwKiiJf5TnANo6NQhULQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V0Z5vAqH
Subject: Re: [Buildroot] [git commit] add configs/zynqmp_kria_kv260_defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Fri, 6 May 2022 21:19:30 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=b73f5c32af8a5bfc4af9b38dc691d01057f73443
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This patch adds support for Xilinx Kria KV260 starter kit.
> 
> KV260 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/kv260.html

The build of this defconfig is currently broken. The failure can be
seen at https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281.
Full build log is at
https://buildroot.org.gitlab.io/-/buildroot/-/jobs/3310463281/artifacts/build.log.

The error looks like this:

  MKIMAGE u-boot.itb
FATAL ERROR: Couldn't open "fit-dtb.blob": No such file or directory
./tools/mkimage: Can't open u-boot.itb.tmp: No such file or directory
make[2]: *** [Makefile:1431: u-boot.itb] Error 255
make[2]: *** Waiting for unfinished jobs....

Could you have a look?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
