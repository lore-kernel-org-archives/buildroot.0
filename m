Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08ABC9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 10:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41AA660689;
	Mon, 28 Sep 2026 10:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEjiBMhiH6BE; Mon, 28 Sep 2026 10:05:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 31AFE6067E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790589911;
	b=nD3bc3Rb8GM3u/QhuG9e/4K+mFnrxe5pkR+CWJrFt8O2Wk9BiDA08wBAl+EVymwwuM0t
	 dsqN9UYKUbpeWjp0HNTVjbU/ouIzHEJcyleIhr60A0d1Sqx5C8jT92+MFrKQvcHfsudwt
	 6ifaMCOpn6PHZOuGVedFQj1eRoKqUwhn+A3s1w5W79m7uqnn8a+LrEouL8/34AZYYHugA
	 QXPJG3mqAkq0GFblHDSZO/PFBaT2QbxEhDDye4KmK59xQtrQWfghuvx6015JwR27O12gD
	 gVExplBT/uiVodW2lX48vxUj9ebkqG6reS2+tSGHQIfl0dxCZ4TubMXIgpN0+/xhpPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790589911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kn7U3u0xjVsRhmPGpnKkJmenoEyzZcwLmKrZwiRwXw0=;
	b=Yewg8w1eeiv5du5UJTLENVG+2nnoi86W6fxaBP8L07RLcxwWd8yvSkktLiR3P+n5eEtm
	 /p6UU8yIZnAUTFu9LzaJvv/pp3jm3h3u5rjZ6dxck63mamDZkYX+WKibPowFVkBW0RmTb
	 vKdJKYbogSVHbbEhX/iJ40ETC1/ZaOckvNaSQst95Lp9lLefhgUqeAAmlF9lKJnR+sDp0
	 Zz60+6PHoEB2K7cCTK2wkI9u0TJNgRtgFMHcQyT6RLDTTHd96uz+8dyq1vIHrtv2X48aS
	 EKz4HsCEbuCQw0zd2BHsDuussUVMTzcn3q+wrPaGP734LdfeqvLH9dgbHEhdpzLxi3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790589911;
	bh=kn7U3u0xjVsRhmPGpnKkJmenoEyzZcwLmKrZwiRwXw0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SoHV1sXV5Nb2FvreuV913Fir5mBViFTSj7CkdeQMrLrQLw6XcVDt94k6vTQ7ORgLJ
	 AI6QDga2YJ8SkrW6xbBPtghToD1xZvM5hFaknN6g9CQOHksgn63bPHtroMP5hwc2Y/
	 5Ncgmfs7ucyf6nwsXl4HPh2m5CRzdXsaF7OEpe5nCxFnMe8iKA975gznasWSdgG/Oa
	 8hFQNdLdT+sKvhQrg06UBj7jyDXpUxH6QMOAQ2Um0r+r7DruS7VYrPLOB2kJwI4r64
	 J1urOPJL+V+d7cUPIg4nD5trxWGUbN0uTcCpSzGL7tEWpfYqu2n8yjwLzLxDgmgWpM
	 f1c4r/fUPOedQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AFE6067E;
	Mon, 28 Sep 2026 10:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 635103D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 546EF80827
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqbeBY9-mj2R for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 10:05:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0EF9580C76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790589908;
 b=bNUYCnQ+0NGQD20NEdI0aBpp2qpSSHDAsag6TGCgmdyEIiOcUxNwPN5CP57P+M2BdaMO
 IHBZ5NXCKJgWF5hDvdafCcxaEpfMtmW+KW6GJ30mcxfx7t6XSU2FItiQLnHhdJpic0F+B
 r/8k+Qy6ALeCZrnXrhLmIHjgXm9F4mBJ0xo8nubz3g6xxiFq8EgntBeQLbhaTA++rauKp
 DsGQT2tO4D81LHeAmBJyCpErx8xwFuv7aK7sAGPxokRmLzNse7dlCZCiMUj8/5zisuTBH
 PqZRmHYo1zMq6hyG/1FoRQ1hbncEXMQMs/iGrLU4ZmjjPS//Ght67FfKETma/DS7tRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790589908;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HQnqexuBY8S9AP4yGDotB/KsWk0nzq/qtPTzh/p/LA0=;
 b=BbIg/3a9j69Q7qKCvxBd5MoD7J4Le1yZFHawIZOV5NpmbeULr8iQVNmU1LwRN2erPxuk
 PSFvbEun8FCSUElVmDiSR7qy07H+lP4Q60TYWMh2GAbZPbhe8n6aj3TFX28r1iQrv1liv
 BGtHoIVojvnGmOXCuKAs65DkRcyIZpC41g0Nj0rWNWH3vbGg+FUpsQm07jFktOHbXgRO4
 B+BZn4UxOapgm4yUqD6x7nXsylnBwZQuWeifXVxGeNGhUAkpXlbbTvzqA3c7mG+kr0KT5
 TJM8MDMyYdsSQM0sNKLc3/lxl73DexXjPq2qiwaKTlI6hNUR/Yuscfi5T+MEAphI2Hg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LQwy0BzO; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EF9580C76
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:05:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E9A8A1A0D4D;
 Mon, 28 Sep 2026 10:05:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6812601BD;
 Mon, 28 Sep 2026 10:05:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24F86102F1EC5; 
 Mon, 28 Sep 2026 12:05:02 +0200 (CEST)
Date: Mon, 28 Sep 2026 12:05:02 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Message-ID: <aro7pjx9dv3NJZT7@windsurf>
References: <20260926133654.2836794-1-yegorslists@googlemail.com>
 <aroq5mq_8nTxwbYv@windsurf>
 <CAGm1_ksWtcOOUnGC=yoxJYAs09f95WEZJx_4jKPw_VHKU6LUdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ksWtcOOUnGC=yoxJYAs09f95WEZJx_4jKPw_VHKU6LUdA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: fix build without
 thread support
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

On Mon, Sep 28, 2026 at 11:08:54AM +0200, Yegor Yefremov via buildroot wrote:

> The issue was introduced upstream by commit 73c43a7ef7bd ("Added
> workaround for system clock jumps back"), which is part of v0.9.75.
> That commit added connection_get_wait() inside the
> "#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
> block and at the same time called it from MHD_get_timeout(), which is
> built unconditionally.
> 
> In Buildroot it was pulled in by commit 8ec001b467
> ("package/libmicrohttpd: bump version to 0.9.75"), so all maintained
> branches are affected (2025.02.x, 2026.02.x, 2026.05.x and 2026.08.x
> have 1.0.5, 1.0.9 or 1.0.10, which all have the same code).
> 
> It went unnoticed for a long time because GCC < 14 only warns about
> implicit function declarations. GCC 14 made it an error by default,
> and the failing autobuilder configuration uses GCC 16.

Thanks for the feedback. Then, which GCC version started considering
this as an error? GCC 14, 15 or 16?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
