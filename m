Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8186C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1918961164
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1918961164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86058379C;
	Fri,  6 Aug 2021 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzu4ixr0zqF6; Fri,  6 Aug 2021 21:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E04837B9;
	Fri,  6 Aug 2021 21:56:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF0A71BF5B5
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D687837B9
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOISWYeyA8So for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:56:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CEEB8379C
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 21:56:32 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:c8f5:7c8:e703:a96f] (unknown
 [IPv6:2a01:e0a:947:6e20:c8f5:7c8:e703:a96f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 73A02BFDEC
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 23:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1628286988;
 bh=uPIPEwItZzvb/3t6PJJrzs4f554AxTT/QnSNfU8Mc/c=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=BoR0/f2isaJl3otw4MpQZ7BDEmcnhLWrs/Nfv6qnYeY6mnlI9QNP2dX7UtwBTVmOj
 xwqfZw9SZN/fsbdF9QnROotuuMcChg8hVvEqIYMaIFm7CdOYHIZqhsfVXYEEb/Xr8Q
 gbKB4Z/bUdS47eedJCbBCU6GjCrrEd2uMXYaK9+HABbzghMDqqKXR/9/ps7tVyCDhi
 zGovx/RcD/1kKMq+oXoPWI6nwsa+jnxPeL8s3f+EMJ5xyGIC/grzgBjgwML+17ybkx
 vRpYa+6qbqmwnNmV88HEMG3A3X+2WVEtuUFvwvdU3NJ5PMIw9o+LXuZsRhAexe9LYB
 2+EiRG+F4OXNQ==
To: buildroot@busybox.net
References: <6c91caa7-cd14-38e0-2c0c-f84a534b62a8@grenoble.cnrs.fr>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <dbeb765f-837d-29a8-582d-40d3bdf55aaa@grenoble.cnrs.fr>
Date: Fri, 6 Aug 2021 23:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c91caa7-cd14-38e0-2c0c-f84a534b62a8@grenoble.cnrs.fr>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump
 at91bootstrap3 version
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

Hello!

About bug #127 of AT91Bootstrap,[1] which is revealed by binutils 2.36,
I wrote:
> I seems, however, that many defconfigs use a version of AT91Bootstrap
> affected by this bug (it is there since the upstream's initial
> commit), and none of these defconfigs requests a version of binutils
> older than 2.36.

There are 32 defconfigs using AT91Bootstrap. I just randomly sampled a
few of them:

- acmesystems_aria_g25_256mb_defconfig
- at91sam9x5ek_defconfig
- atmel_sama5d3_xplained_defconfig
- microchip_sama5d2_icp_mmc_defconfig

They all fail with the same error:

    .../output/host/bin/arm-buildroot-linux-XXX-ld:
    Error: unable to disambiguate: -nostartfiles
    (did you mean --nostartfiles ?)

where XXX is either uclibcgnueabi or uclibcgnueabihf.

I wonder whether we should forcibly upgrade all these defconfigs to a
version of AT91Bootstrap free of this bug, or downgrade them to
binutils 2.35, or let the individual maintainers handle that.

Regards,

Edgar Bonet.

[1] https://github.com/linux4sam/at91bootstrap/issues/127
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
