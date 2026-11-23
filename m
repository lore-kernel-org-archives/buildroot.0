Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131F4606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lJEnoFGd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04F16069E;
	Mon, 23 Nov 2026 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tPkKGJ39DBs; Mon, 23 Nov 2026 21:01:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EB4756067E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467668;
	b=c2lqOcIcepIwj6rVzESVvz3FarFBh7b7IS2W62tXyKrA52XlnGIJAMah91MoejDnU5Hk
	 FaGziwIbi3R4vEUADQL75ak6xtUvjIAw63ktJhwNwDPuowVEsX6S5s+f5NzWD04vTa5jN
	 rDIW1KOJa9PSlZa2MuwzONxlnqEu2nEur6WUmt7gG+fLvLaSUXQWhQt4Ogsoq0TSa4QaA
	 IMceAf1fwK5DlGl82NukVOhGgh8PBa1aehW4NdQ020foDL5W7Kxh97pO+/2hxrPWUv6B0
	 mKNxwKiwRO7QlKImzPx5sFeUJfArdLh1ldcI4a78wMxV1aAffR26eH808Sp6waVvkZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kRFvlkfyW+60dDut+tWJzCEXuIATBV+UlRHBY5EJRYs=;
	b=kBRl2ORZReUCuJ/J2CHg27hZ9KSQ1U65FvLZlZuLj5LRkdLqPCCFi1MuCHPM+GFF9L6b
	 s83+a5JWqTn+0uHRqHr73W9nZ8aPqHyVT7QDYRKeSPMMMf3ccAyOYk4nGmwrqFv3mgwl1
	 r/Awoypxf4FcnoQDLQwanFBjBssYyEmg5/NTg5SxaHdBXLqDax7T1FUV/e9imbFbbEPxp
	 sYWTjhMl827+YM85/E6WGwueHqb89cyc221G9Nf3mcbXWdyGziq691F0SfEz5sashzl5e
	 Z6tyUoF9mI/PMmjRiOy7c5WUBhCpG+sWlPzRB5tGC4w9EsuTm7LjFuPQSOenpjXk3SA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467668;
	bh=kRFvlkfyW+60dDut+tWJzCEXuIATBV+UlRHBY5EJRYs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lJEnoFGdFV52kk1DLQndy8EG0U9nQNN0UO0hgAElL5BV1w/tVBaCdPL4vQSmPcezK
	 5z/fXxN/RA8LlA0FIk1lX/fYh8DTGIvmCefIiKOa7ZyCszflyuqhzc+C1l7mB0i5r1
	 6hyXqMg80/QA1mi86PnNlYx578CP6MWFDxfMazSiJTmiC/4UFJUILGaJVLNNuXPp21
	 SSlhdSkL/1tPFAJIdaeEhwGJu/I4EEj9JUCSU4IVlwYv1qM0qpP64WdOE9oMwHT4xV
	 f6nQYG0ygJ4fjc0MGBT9srVC+FW53e48czGRmoWlYsPwRmlHXzezHAox38txpV+OcW
	 wsCz5va87vPJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4756067E;
	Mon, 23 Nov 2026 21:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A70371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0E454065C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lVZTrJVWso3 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:01:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A10D940567
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A10D940567
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:01:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 68C45C4EFD7;
 Mon, 23 Nov 2026 21:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2A63B601E1;
 Mon, 23 Nov 2026 21:01:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0401911E6A9EF; Mon, 23 Nov 2026 22:01:00 +0100 (CET)
Date: Mon, 23 Nov 2026 22:01:00 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <awSpW619nbD6KNhg@windsurf>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/2] package/qt6: fix license information
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 09:54:02PM +0100, Angelo Compagnucci wrote:
> This series fixes the license information of some Qt6 packages.
> 
> - Patch 1 drops hashes of license files that upstream removed from
>   qt6languageserver, qt6mqtt, qt6opcua and qt6websockets. These hashes
>   were never checked.
> - Patch 2 completes the license information of qt6multimedia, with the
>   third-party code it bundles: tlsf and dr_wav, always built,
>   signalsmith-stretch with the ffmpeg plugin, and resonance-audio,
>   pffft and eigen with the spatial audio module.
> 
> Both patches apply on master, with Qt 6.11.3, and on top of the Qt
> 6.12.0 bump series. The license files they use are the same in both
> versions.
> 
> Angelo Compagnucci (2):
>   package/qt6: drop hashes of removed license files
>   package/qt6/qt6multimedia: fix license information

Thanks, but those being fixes, we would like to have a Fixes: tag on
them pointing to the commit that introduced the issue. That will help
our LTS maintainers figure out whether those fixes need to be
backported, and how far back.

Could you add these tags, and respin?

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
