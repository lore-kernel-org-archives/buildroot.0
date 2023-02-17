Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B29C6379F
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 15:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F6C81E38;
	Fri, 17 Feb 2023 15:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80F6C81E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oxehLkPvEYL; Fri, 17 Feb 2023 15:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C363981BE3;
	Fri, 17 Feb 2023 15:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C363981BE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84CB41BF34A
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56DA5404D5
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DA5404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C38_xtMK1dWp for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 15:01:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155B240191
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 155B240191
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 15:01:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB37DC0004;
 Fri, 17 Feb 2023 15:01:11 +0000 (UTC)
Date: Fri, 17 Feb 2023 16:01:10 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230217160110.60c3b66d@windsurf>
In-Reply-To: <20221025190109.320525-1-buildroot@heine.tech>
References: <20221025190109.320525-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676646072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99ONPUPNwqXQ6UeAnEKQ/8TZo+BKrFZk+lq7lllVnfE=;
 b=DgKsnZPgW+oiZWrqfwMkHXQe+tYKH7xXHzUn3S33J5jcxaaRr1ynUri8X+zXx3X4TKfX1W
 wiS3nzuvlJIrEXO1C4VlQyw6pCT1Vs+mrTGo1w1k11/rSCXYyrEUoDPFDhlVHhFb2Gc4l6
 G61RO6C780MOIX9j8d9h2tYOUkyT6iPGEXmNGqgDa3rGS0Z9QU+JdNLUDNfOJ/6F7EoNW1
 OGuWC6s+0ZXWjHK+GpqKokhy4EamgrbvRWVgJ0VBe2DKHtfq7HK8vH6S0grcdaChacEmnY
 8fxDObE2UA3SYr/jVFxcje/74ZsKAOlFJ3EHa0orFamAQbOQtvoj/yTPdP8VdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DgKsnZPg
Subject: Re: [Buildroot] [PATCH v3] package/catch2: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Tue, 25 Oct 2022 21:01:09 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Catch2 is a modern C++ unit testing framework which is
> increasing in popularity.
> This package is staging only and allows to build tests
> to be run on the target.
> 
> - https://github.com/catchorg/Catch2
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Sorry for the huge delay. I have applied your patch to master, with two
small changes, see below.

> +CATCH2_VERSION = 3.1.1
> +CATCH2_SOURCE = v$(CATCH2_VERSION).tar.gz
> +CATCH2_SITE = https://github.com/catchorg/Catch2/archive

I've used the github macro instead, because you're anyway downloading
the auto-generated tarball from Github here.

> +CATCH2_INSTALL_STAGING = YES
> +CATCH2_INSTALL_TARGET = NO
> +CATCH2_LICENSE = BSL-1.0
> +CATCH2_LICENSE_FILES = LICENSE.txt
> +CATCH2_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +CATCH2_CONF_OPTS = -DCATCH_INSTALL_DOCS=OFF \
> +					-DBUILD_SHARED_LIBS=OFF

I fixed up the indentation here, and added a comment to explain why we
unconditionally disable shared libraries.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
