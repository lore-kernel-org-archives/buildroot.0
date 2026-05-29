Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9425CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76642614A1;
	Fri, 29 May 2026 21:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3zxWvtT5CFY; Fri, 29 May 2026 21:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA93D60DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780090999;
	bh=xie+B/pyPsfBv5ZtHsnj6Wh0/IT7S8mbfdc8jSkhTzA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iDdo05liES/Um/44aub9uOPCnxRvXZXrnbwuq1ajqRBVFq3feaF66IQkkn9dBvR9d
	 TRwTd/TRNo3UzF7PwM1gz68z6kSC4Rt/FNlbGvUCZ72nb+F1luEkJklyuLnrKyudUI
	 vzcwedwQiUq+fn3AEUJjo7kPRSfn183lMq4QKJKn3ewlsEr+/2Fga88y+W0ElAPF/8
	 g5zJWiEWnMGFhsL4c3hP7cb1rfcK/nSSPNQbsbg5adbeOWhwIqwmKJyTk3AwNl8169
	 f+dHlA2dyDoq9vMuSazegQqEWBj/xbI0K7i+eRVJMwc6Qz4wVJkjJaJbdLqo00h7Zf
	 pO9fDzLtu5QLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA93D60DA4;
	Fri, 29 May 2026 21:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D50BF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EAC884A9E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZU7Zf5kF04Jn for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3141384A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3141384A9C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3141384A9C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:43:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EF0F0C62464
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:43:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A008601FA;
 Fri, 29 May 2026 21:43:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D89810888650; 
 Fri, 29 May 2026 23:43:12 +0200 (CEST)
Date: Fri, 29 May 2026 23:43:12 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahoILYWZG504uIQz@windsurf>
References: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
 <20260418155515.9980-3-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260418155515.9980-3-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780090993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=q9oDZ+hCvwTYxgiOg5ByaglQIIYspNtR4RMmdZl/ETE=;
 b=1fLJlPiYsq3HotAHAM6ixpfvUM6b3Z5w7sdhyvZcw5Y1rVm0A6P+s1/gwJD1CTdpWQDmK9
 kInOScFuaifqQX0Reg1uD405er97prw4YLoTSFpSkQvNvBpZiYQ4k1Jny0AwUXbzINuhC1
 rfZBwQ3GZkirJvKBKYyMgO3p+ENTjnnPPie+dp+H1LMbopY+OUQbfqEnpzOYubuMlkW07E
 hF5Q5awEsL1wmYlYeAwJA2pUXNZwpWi/P9Kln+JjqHfEFEXLsKyW1Yd87zFjiYosb5mZbh
 AjuUwDm+azcnxKdE+gmVtjZgxB41ClmGaRBVDu+PB0OZ7eqjEGoT4gczmm718g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1fLJlPiY
Subject: Re: [Buildroot] [PATCH 3/3] package/libenca: fix C23 compatibility
 for getenv/getopt prototypes
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

On Sat, Apr 18, 2026 at 09:25:12PM +0530, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which removes support for K&R-style
> unprototyped function declarations. This causes build failures
> with strict modern C libraries.
> 
> Add proper function prototypes for getopt, getopt_long,
> getopt_long_only, getenv, and _getopt_internal to comply
> with C23 requirements.
> 
> Fixes build with musl libc and GCC 15.
> 
> Upstream: https://github.com/Project-OSS-Revival/enca/pull/97
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Thanks for this patch. Since it is a bugfix for an issue that exists
in the current version of libenca in Buildroot, this patch should have
been the first one in the series, before the version bump.

Also, this issue is visible in our autobuilders, so your commit log
should have carried a reference to the autobuilder issue being
fixed. I've added a reference to such a build failure, and applied
your patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
