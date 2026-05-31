Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E159CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3133F84A5B;
	Sun, 31 May 2026 06:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsrKDNzIBHwA; Sun, 31 May 2026 06:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AB5084A59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208444;
	bh=gbPjbMPqw5dYFYB7LrHTrceOexw2WWn/v3L4t72QKRU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UrP67UoEvrrxY45IgIFFEy+ga/X2LOJ05hCOBV1OK7+1ey+klV9ndPjrayCjnY1iF
	 R88vwRZBNk0EEyNw3MZgGfMfLH2FdL22BqDf2uUpxRVNhQD3Bz8Pyf3xYXQ+Wag43p
	 S6CCi+/niHSOVJQjj+9qDAPLuFtirWh5rGtsXwG7tbsDismsSKvxEyiurxz3DvKotm
	 76JpNuAJ7lndtZOOLspp3rNQvKYTrNe2yoz4C3JRpQ0qaIDmg+AipiBgM/yrLTL4SP
	 fm+lP8yrB9wntq7KmuK1Sp9qKLY8Dd9u8jHkhgQ0MXL1KwMwGMZcu+9RUE7KUWCsdB
	 IB+tJP0+Azz6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AB5084A59;
	Sun, 31 May 2026 06:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A91C257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FD5684A59
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZJ6-ScVYIps for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E476811C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E476811C9
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E476811C9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:20:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6304E1A3764;
 Sun, 31 May 2026 06:20:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 35C6D604EC;
 Sun, 31 May 2026 06:20:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53AA110888CC7; 
 Sun, 31 May 2026 08:20:38 +0200 (CEST)
Date: Sun, 31 May 2026 08:20:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahvTE6qnCu2M6tp3@windsurf>
References: <20260501171432.1701736-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501171432.1701736-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780208438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=piSWf3fyoSOf/ZQzwHFxsoCzTTYBTSp+Of+e/ZgHvU8=;
 b=rPcfZBdLuy7eRyi+A5LfcaP7grYuJcfH7cGaYnhiPBRoD1jXvds71XtTyp/hKOO2kg+hXD
 Pw0e7HiFLY6Ll/qAeEN+216OHUA5f+Ze0UZq/zjc1+Pw21hmlRGZaPcFBIEhJ/c8sgYYRK
 +9AqM87Q2sMkaQAkIifU8uMIspfit2C8/x3cWTxXi7O7FoZyEHrHstYa+RmM+O4gOOgFa0
 m47rl9RL60I/bILpXT10ZNwAe6pvd149nJi5eeSAXss2dzb364/vEopnjug3mYZZmT75B1
 VIAOE+gf7PGMiS8qFo/R4UsVnbjjFaPB6UAaZBVQMHm6kgkIdZz7pvz7bguZIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rPcfZBdL
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: add upstream patch to
 fix build error with glibc 2.43
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

On Fri, May 01, 2026 at 07:14:32PM +0200, Bernd Kuhls wrote:
> Seen with this defconfig
> 
> BR2_x86_64=y
> BR2_GCC_VERSION_15_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_PICOTOOL=y
> 
> output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/struct_mutex.h:35:9:
>  error: declaration does not declare anything [-fpermissive]
>    35 |   short __unused;
> 
> No related autobuilder error was recorded.
> The build error does not occur with glibc-2.42 on the 2026.02.x branch.
> 
> The build error was reported to picotool upstream:
> https://github.com/raspberrypi/picotool/issues/300
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master. Do you happen to know why glibc upstream
didn't include this patch in its 2.43 maintenance branch, if it fixes
a bug? Maybe something to report to them?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
