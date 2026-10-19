Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8B606A322
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xb34Bun6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5D86068B;
	Mon, 19 Oct 2026 16:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfH7-yPdFeU7; Mon, 19 Oct 2026 16:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BECE860613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429044;
	b=QNzrchRmglhyvAggnM1jY43B0dLP1LjsveFkczW8CNZwyULt6mfuLaHMMor4/BggcRtB
	 UQUg8Qy4xbkfGcXwm5ByskmWBUrV7SUI7oPkxGEZLDTdlF5K8UZZW+nSPWLUD/CrDdV02
	 Jy49Hd2i/j0fi8qjJynI3RomyQNSaluh4JZ0WnyAKTtF1qQQWd6DAfVpY3cwUwC1IPoyL
	 rAbci3xfn9FcTzwz1+3nO10fxkGk6DgqRWZG4MHAWLEuqTQzCbj2bMKWy6w2fBvkOuJ37
	 H9ruO8Ng5pIg5oQZRfCO8UY+Ocl2SJPrVf9W4yE90ODI2Q/1+y8VLIU2jv3nIWcvTeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WsUsUUWa0uSp/ck+wTXK3Gih5EPWFKF9sRj/4ZomUsk=;
	b=nsYAyvGRy9jYY0FQtG8+Jczw5xV9wVYAI/xWd8ua9FjDDkYx8OlmRSnUDXQUVthHphZB
	 07bmAAXW3+ohPuvhdka2uPPAc4cuJSLI3eOJaY0Kuk8BxJsZGMDiPD/y42cmGqTVZO2PK
	 eKC8VYipeS6MfS2cUhv9XLD294RsNMyFjkPhzrXJRRoAqPTsjw/pTMS1Uh6WoSeQvOMnx
	 /74rAtBG6Q/QZFw0u8kCIDrl4Ngbkyq+OoZqb81ggDNqGYyz2gMt/4QWzjmzG11yqiO+r
	 50M3d1c31CFPCSv7cQZlSQU5hUyhdxGLPnjaxYuiX59/2z/RgG++U9a5Xj8yKxypSdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429044;
	bh=WsUsUUWa0uSp/ck+wTXK3Gih5EPWFKF9sRj/4ZomUsk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xb34Bun6QvTuU+WQhxT1/yOqhdVQsXXFHn/3daN5Y79v39W4EX/YAfRf1F+dczXkG
	 LKfuqNq0uYB/LeM6/xTjnUwkge3yA8VqeCPKZYi76QAnjPn9dHk6rzEXELzby6YoYS
	 Ck2RE9i4Y7LOeWiaiRBIN8LSdyWYeIYK1cLdbbLCM8nguc0fe32+VKPERl5hndYGfW
	 Boxp83A9nTr4y5so9DVm067hlGF+0Ug8oRkdxR7wteFaKwcP5xRGwVRnXD1WwpUfM7
	 M9apHWXTpb0x/3bLT337DvLFTWmKuuNDm+w7Hi2/o8F0T+DiArTkJpFH/flb0uay4L
	 5JEMndQ3X4SVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BECE860613;
	Mon, 19 Oct 2026 16:57:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6566812F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B44A40179
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39IqCNfBfjji for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D05BA400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429042;
 b=knTi1nVCsmavT/JQN9DwTDMKbVNPdACRqT7CsASDGVGIDTrL67Un7qoBgk1RgafH9vAN
 DO82V4nt+Vq97ILNIEC8+I61lOflS2iWzzA/4Uaycv77r+Fo7ApNdIPnbE0fNVIP1R4Xx
 5IrWG4wJEONl250W2ASnZfsRX+QsR4782JO66DzgEQw5V5PsrosTh9PaZi4m79PKpikZH
 AhdQsk3/4Xxnnb6I/hOQ342nvDYXgbDErnaD6HESt3sHdgWI5waDnBMRtGS6DIZjm0y74
 p+WFVN4MuiPxY5sqEvI3QcYeZAwfmfR3+WWRAV/xtpZLNz9ak9zMCYGgrmGH5MCRHrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429042;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=I8y9nWP+t6twPYJ74wfhJVi+DsWg1GhG5iJM7FhLD5Q=;
 b=DPeDFGd/qZBea4+Xg1US9mL0rz1/LTr/FOojNsisnYd+hbI061yKeyFyBjTQznCzefNK
 OiWUNUiCAS/q77wNF5Lz4Wd7sHA2liDI6t76/4aNl1KwzR1NHqmSJVB3Le9yVjtbTSv8o
 hwMFqh2y3zEm29ETwEa91ATfodiJbQbtIuhw9uV+fGfmprC5r8QoXCRwFbHu1h4EqyjY3
 IFuhsFXRYd30fp7oynilaxLNco/sToKcPK6WnwEI3OSpYYM8G2HW4vK5VyhltdY9tLAaD
 hgBTbe6BxVpR4gJzoZWoCyERiuTVqTYz01NXKy6j20M3IZq1TnIH69Ulf/mEFWHk90Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VSkHgGPJ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D05BA400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5F58E4E4127B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2783A60582;
 Mon, 19 Oct 2026 16:57:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 540D010328D55; 
 Mon, 19 Oct 2026 18:57:13 +0200 (CEST)
Date: Mon, 19 Oct 2026 18:57:12 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atZL4w36kHKu8Y47@windsurf>
References: <20261019060028.1078791-1-yegorslists@gmail.com>
 <20261019141801.1653017-1-yegorslists@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019141801.1653017-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] package/ncftp: fix cross compilation
 detection
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:18:01PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> ncftp still ships a configure script generated with autoconf 2.13, which
> determines whether it is cross compiling by simply trying to run a
> trivial program built with $CC, instead of looking at --host/--build.
> That heuristic breaks when the build machine is able to execute the
> binaries produced by the cross compiler, which is typically the case
> when building for x86/x86-64 on an x86-64 machine:
> 
>   checking whether the C compiler (...) is a cross-compiler... no
> 
> configure then takes the AC_TRY_RUN path for the remaining tests. Those
> tests link against the target libraries but are executed on the build
> machine, so they fail as soon as more than the bare C library is
> involved. The most visible victim is the curses detection, which links
> the test program against the target libncurses and then runs it:
> 
>   checking for curses library headers... checking for ncurses.h... yes
>   checking for curses.h... yes
>   checking for curses library... no
> 
> With no curses library, ncftpbookmarks is silently dropped from the
> build and installation later fails with:
> 
>   install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory
> 
> Other checks are mis-detected the same way, e.g. the 64-bit integral
> type checks, which end up breaking the build itself:
> 
>   checking how to scan a 64-bit integral type... cannot scan
>   io_get.c:763:96: error: expected ')' before 'PRINTF_LONG_LONG'
> 
> So add a patch making the generated configure script follow what
> autoconf has been doing since 2.50, and consider the build cross
> compilation as soon as --host is given and differs from --build,
> regardless of whether the produced binaries happen to be runnable.
> 
> Regenerating configure instead is not an option: the macros in
> autoconf_local/aclocal.m4 rely on autoconf 2.13 internals (AC_LANG used
> as a value, AC_FD_CC, __oline__, ...) and upstream generates configure
> with a patched autoconf 2.13 (see autoconf_local/acgeneral-2.13.m4.patch
> and acspecific-2.13.m4.patch). A modern autoconf fails with:
> 
>   configure.in:53: error: AC_LANG: unknown language:
> 
> This regression was introduced by commit
> f8bc27111531e9607f79121414f61c0c2d5f83c0 ("package/ncftp: bump to
> version 3.2.9"). Before it, a pre-configure hook regenerated configure
> with autoconf precisely because the bundled script "doesn't detect
> cross-compilation correctly". With 3.2.9 that regeneration started to
> fail, so the hook was dropped, which brought the broken detection back.
> That commit left the host-autoconf dependency behind though, so drop it
> now.
> 
> The issue is present since 2025.05, and in 2025.02.x since 2025.02.1,
> where the 3.2.9 bump was backported as commit
> 6b0e4d82c31ee04e8a6abb48323252a7cd97c177.
> 
> Fixes:
> https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc/
> 
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
