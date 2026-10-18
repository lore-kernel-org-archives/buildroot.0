Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEAFCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43ECE605FC;
	Sun, 18 Oct 2026 20:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZD1TohicOIya; Sun, 18 Oct 2026 20:05:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 78F046060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792353904;
	b=naJixbFvuTfbA548dviFjKyhKSW+ypbRkBKh0v1Y8en6bY5qYBm8ihsPnrV3l/KA5QEA
	 J4iE6S1KMmZWP+ujdi7wk5On2SQugpxO9aFT9XAW8IngqKYiLq83a9AST44bdvLppXpJ8
	 aMIjFDdFXneuCVDVyQAT18Zay1ElES2LCEiagm7le8RCFkj/Y/AIn0q8mz4v5OQi0684M
	 CU3vHnlIqYKAYJ23bUEsuWYof7RtQVVPYj361KjB0wfgtMq3hXLfGTe7vtr16cnYIFx2K
	 v/euGEXQE6OyKOoaxhmwlQcSZJGmsF4vqGM51EfL+KunqIxjW5YljmLXicX3HSSqfYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792353904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HeQdzWTwhV/szyqIRTwM/NJmqm3hKX9GIE/QINO7Z4Y=;
	b=fNItPhM2I9x8ut3RRzQD6Ua1gVETiyOyDqfexg1wz49Cys7/bKNuYZngTRQEGfaWQkFC
	 MRnw+cZqnPRXnkhPrVMiUMapX/eeh52TRMiwWXpP3BGyl4int76TRNxvG+B567U1nlZiS
	 mRUnyp9sHDSqqJOCudNCei+oGj0xba5QRubNOAvMjDbnxSQq3cZmUFcsT4yiskdTNu8Cv
	 giSYzUaUpe//MYbZVfwfQVAGHjtWmxbkXMsY/uXUs5bjLbMDs8w2SJtihlM4XuxnhNVOM
	 RwLOJYrYrqPgJN2f/eYApti43GBn6sHjFbTXxF9Qn2Q44deVHm6oqgcjoYKVmRrCMKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792353904;
	bh=HeQdzWTwhV/szyqIRTwM/NJmqm3hKX9GIE/QINO7Z4Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N9N5TpTJFzBJKjqf2Xjeyv3EY+/Zu6SWMVYS96YYGw9VCR4u3aYOSvGRxaJidnD9O
	 f8ugV7HeCiobR0M4tyWLFddgK/GoMc4pwULCAmnDOcAAHmLUEWDeCquSqDQT+ZpRDy
	 GOh+Brpi8AJrocRggOHPjKJwndbP3rKkPOY/sbmZgYgkwAo3KJxcWbQ4EMT8xgZvrQ
	 M6Mjspkc52CRZHGt43g37X23ytSNNXRe4cu/EDmop5i4fVR01YyfbIJ7YNAI0ErR30
	 1jgsvAxEojCFJmFdiKe/7AiXxyy8BvzAOgiBKwNuwxYhDv8TjF1ksTPjyikGVIh9dx
	 l0fO1pbRzhQsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F046060D;
	Sun, 18 Oct 2026 20:05:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE6561AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC03D6060D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TozUsE_sZQMN for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:05:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3AC3A605FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792353901;
 b=O0E3m4JhKJYIHAz7FIAG3AfeIXaCbnvUWj2QNcrjHW9admtelhTTWVrlHagqnuoEN8Ko
 drKTRrS5bd2wtP67l9KZ0SEF/W7e60FZCvlBnpG0MXz5dU5Oii2bAchf/EbozQ/EX1Hdw
 Cz0u3j72OuvFar9l4cXNoOUFDuNuqJQaysWsxEjmUYmcawVf/allm2otH26lP+Gx4DX3C
 6LMcazu56MJeXEZj9yI8cxrXOztRBzuC20kqFivcm+Gqio7tA0LKIUxTsjVEASFO3jFdE
 LClN4oxZGAFfdMRXYi5VDGYEyGwK0b7iUYvLcjr7SXkQ2/R5+h2R5ltnZXgy/oSL4UQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792353901;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=47Ac0Fhr+T2TmiaEc+CWr6LbretpKYBY9KO4vsK9woU=;
 b=SL68KtxOlTMXgTkdEqthzgNohuq9uR90OhmSgm14xp8dU5F0T7LY3e5nmqec8YhwABnV
 N78LwMhcJqNVMvXWmgNOPkJUgYtvQ0a4+GS+ef0xMEhR7t61KTMlDegaphmj8p7iT1EyL
 AWJ+7Fiuef1/SZlnvtSUnU9yHfwSEgH/4EXKQYXPozW9mxSXOfoXYuaWXjydytut0KiDH
 i5BWchhJNqBXMskppRChPKBcapl1JbWQAcVc9LCpOYyEBMbbeHGZ5X0K219Gmu37mX1Yn
 c+dQhKbOqnYKLFl/2/jjikLLUkI4tFGg42PBvAXLkBv7b97XeF9p3FdjqFBcbvhS+SQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wkH94KPJ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AC3A605FC
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:05:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B951FC653FB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:05:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C98A160582;
 Sun, 18 Oct 2026 20:04:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 713211032868C; 
 Sun, 18 Oct 2026 22:04:54 +0200 (CEST)
Date: Sun, 18 Oct 2026 22:04:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <atUmI8OxxtNKyPB3@windsurf>
References: <20261013215029.317512-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013215029.317512-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/5] package/gerbera: fix build with ffmpeg
 7.0
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

On Tue, Oct 13, 2026 at 11:50:25PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Entire series applied. I tested it using the following defconfig which
enables a good number of packages that use ffmpeg:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PIPEWIRE=y
BR2_PACKAGE_SQUEEZELITE=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_FREERDP=y
BR2_PACKAGE_AUBIO=y
BR2_PACKAGE_OPENCV4=y
BR2_PACKAGE_OPENCV4_WITH_FFMPEG=y
BR2_PACKAGE_LIBHEIF=y
BR2_PACKAGE_DLIB=y
BR2_PACKAGE_MINIDLNA=y
BR2_PACKAGE_SHAIRPORT_SYNC=y
BR2_PACKAGE_TVHEADEND=y
# BR2_TARGET_ROOTFS_TAR is not set

It doesn't build _all_ packages that use ffmpeg, but the fact that it
built fine gave me a good enough confidence to apply the patch series.

Thanks for this work!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
