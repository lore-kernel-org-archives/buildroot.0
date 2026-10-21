Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308B606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E32O8cdk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74ADC41101;
	Wed, 21 Oct 2026 19:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP3ILwMxqPS5; Wed, 21 Oct 2026 19:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1AA21404DE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610888;
	b=H+ejDl8IIj5pXrHaqdgJhWe+cpQ34v6FxoiokB3dA5tJd3A5h9C3MJrJg/eVWhUCtoA/
	 XDUHiQJAWPpPSVG0lH02bgy4q4Goemyh7JJD99iUAN99k7FFzuwCx1Us9fHGw0wsr6d7Q
	 svm77KHJRdCnYrv3uuDjDQG/smAGTbwu9k5775v6JRpZvE42441w/YjAZgZffkSD0gtZB
	 iTPZm83zOuWtKa73KkyPeHGDNPfGvddHx+7WUxj1uPZjTzM5csAPsXopel/fun47jttFJ
	 fEujRzdqFg2NqhIghm8DwHYZVAGqVQdIvAZz3jO4FNFR5tVHT+YJ71F6l0waFSby0UA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=72vx+Fk4SqSf2ytdpIaVV2vQ88NT1JCYq86hGRrQ+fk=;
	b=l4vH9wJOt88tL0g36lDzM1ZgRGj8PZcdEGO22SM4GaXaw50execNAgxakqB/c7NNDEZO
	 Q1YiOMyEpFV3r/3ScAGzYVKTQxQbk8sXmi5CGvkew7uxZnYFg4lBPfHsC46vARLBBpeBP
	 wiZ2P0qUiKfDOkz8GnTu9g4QJxNQ5i/5UxUy2PoDMmbHy5Gvq2moHBe4WEi6cGarB/7Ml
	 vPeFbvrre32I4A/mzjbn20aOT1r70/YrySL1fXT+tWB35EtTbCAj8UFk8UE7O8TD+F+7g
	 fEiUb4Hw+bPqJZOY0HPfysO5PLhrZhWsXfnRjkjQTY7gYT5jpCAwZJFn35TvOpA5l8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610888;
	bh=72vx+Fk4SqSf2ytdpIaVV2vQ88NT1JCYq86hGRrQ+fk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E32O8cdkkX8UYws9xCF3oPqluDYMel1WbA0+Wxw5bocy8xjR/M21O2ajlHtiqUzf9
	 9ei+sVTwDWpc4hv9/VSSj0qPrqYL7jMB3PkkI+BFW8f8YCX4ZPYWGlC+h/aZHPoKrS
	 h++C9JmIfdvTyNPBnUW+6d6SJX3HmjgD+uiE7ZWsSSUcExydW8Ep5oCzSHI2bYpIt1
	 +B5anKl3b4KMGRjRhRIb67bDVC7VankRszqee8pgkE9x/AIz9FiKqO0RqSnbBsopqV
	 J5ZVqIjFQ/9xIlVysTjmQapsqNYQg6wsuPWB46CzStrDcGV+01ZtWfA2R1sxXvcyPz
	 lXrCNkne7fA7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA21404DE;
	Wed, 21 Oct 2026 19:28:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93EC53C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 797EF81E8D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLPQ3C8Y-g-B for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:28:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFAD481E3A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610885;
 b=AlE1W1cIBrjmebss0oTMb3Uts8zKT/n/0ZKhzocrJossuSRcqn60Yvh1Tz0kIGalNpc+
 4P0iMolgGpaBzPnCRsZvVwodikeU1BKdfl/JsKAit1IxQq5WDzv+OQMWcxCzMjwcaJqQr
 xXzZEyqoWQhEtsV7M+WTyHpI3J+1Dxt45ype5JCD0mlyDLBSvvYG3VjxytcP5zJNHIgdG
 0OdOQ4IXmB6E01NmIT7eIDH6FOV6b/eDJHA7UnmWKwZoD9rBjTYaJQlbT+5QTgADsIRnn
 9/zhLA2A/koK8gWk5xTcHG9Q/anYXM0+CVwNs90Cbp1LCXLqKO9r5AC9/1j0xKcpGwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610885;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=nz3+FWEhHh4bVVfgiHhT1gaWN68tdpQLn2p8BVERUio=;
 b=L5vYTJIgyBz7LGAvj41E8FZdBSrN8BX52XPPubc6n59C3XQk3VrlYTk9hhoV3tJczfbH
 ijG4fp+B1560/tMDgJldio1qeJ399WUsQC2cTI7fdfgI2d7e4OU9A5tp78oR+nk3A+1rp
 B4d3rFr11kmEEDZ+RoSKAIBfINjgD1F5z5cP1VwuCYwoOMmNkoiAn1/7qqrAlklFpGt5T
 +7r9hXEX5hAVfse0T9gZJqpgFrMHm7XiMQA3NDIW97mEJ4pja+aZeAxTBvdQUyRhLm867
 sUuDGHuYSSWIy0La/VTbRWnBwCseHCeHDyhr8qv+uvthyo3GpYF3R7iKensjNElyp+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hP4AfVOI; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFAD481E3A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 33D274E41296
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1D92606E3;
 Wed, 21 Oct 2026 19:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85D5B103289F5; 
 Wed, 21 Oct 2026 21:27:56 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:27:55 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Message-ID: <atkSNU1Vqql3FYDf@windsurf>
References: <20260926133654.2836794-1-yegorslists@googlemail.com>
 <20261021125214.141014-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021125214.141014-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libmicrohttpd: fix build without
 thread support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 02:52:14PM +0200, Yegor Yefremov via buildroot wrote:
> When the toolchain has no thread support, libmicrohttpd is configured
> with --with-threads=none. In that case connection_get_wait() is not
> compiled, because it is defined inside the
> "#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
> region, but MHD_get_timeout64(), which is built unconditionally, calls
> it:
> 
> daemon.c: In function 'MHD_get_timeout64':
> daemon.c:4524:18: error: implicit declaration of function 'connection_get_wait' [-Wimplicit-function-declaration]
> 
> Add a patch, submitted upstream, that moves connection_get_wait() out
> of the threads-only region.
> 
> The faulty code was introduced upstream by commit 73c43a7ef7bd ("Added
> workaround for system clock jumps back"), first released in v0.9.75,
> which added connection_get_wait() inside the threads-only region and
> at the same time called it from MHD_get_timeout().
> 
> This issue has been present since commit 8ec001b467e2
> ("package/libmicrohttpd: bump version to 0.9.75"), which pulled in
> that upstream code. It therefore affects 2022.02 and later, and all
> maintained branches (2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and
> 2026.08.x). However, it only turns into a build failure with GCC >= 14,
> as implicit function declarations are errors by default since GCC 14
> [1]; with older GCC versions only a warning is emitted.
> 
> [1] https://gcc.gnu.org/gcc-14/porting_to.html#implicit-function-declaration
> 
> Fixes:
> https://autobuild.buildroot.org/results/10f33829552059264104623353a9ec1584b08e4f
> 
> Fixes: 8ec001b467e22904c0a7ec5780d83afd44ad78f3 ("package/libmicrohttpd: bump version to 0.9.75")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
