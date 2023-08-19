Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFDCEE49A3
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 14:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0862817A3;
	Sat, 19 Aug 2023 14:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0862817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUlCUzoo5NPp; Sat, 19 Aug 2023 14:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D7F81C11;
	Sat, 19 Aug 2023 14:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D7F81C11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4D61BF310
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50D6581C11
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D6581C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAgrmHFX1stE for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 14:33:52 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DD7817A3
 for <buildroot@uclibc.org>; Sat, 19 Aug 2023 14:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DD7817A3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E0ADC20041F;
 Sat, 19 Aug 2023 16:33:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 16:33:46 +0200
Date: Sat, 19 Aug 2023 16:33:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230819143346.GB1778688@scaer>
References: <20230818144231.976762-1-bernd@kuhls.net>
 <20230819125702.GG1134940__46104.2901662708$1692449855$gmane$org@scaer>
 <pan$1d20$6ee79d5d$c31858a7$6979945c@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$1d20$6ee79d5d$c31858a7$6979945c@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692455629;
 bh=gma8Jm7isTGqC1gmh37mk6VGnozqAGzpkS/N0pi1hLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lJ9JHEEICqosxQoxcevwxWBqs2oB53jpGyIJh5AnkHHSAbj6YGz6n3zEXqN0P/PrQ
 zGtZW/8OBK0Jo6QViXeWP5XPZuKvd3l8Z7vN9kFDzUPQyKh247V6HtSP4znO/1GhEL
 Mxf3zWLx1fEiT1QLYmkixRySKYqaT9m23MtJTii2PS6q99+mAxs+ah3v+aw1kQcXl0
 Iep4IZOc1OOTtyC8V/Amx8OtV7xObrVYZH9jzDsj97/f1MJM6LyV3nHol+sdsl4z2k
 owFuDIwScge+Z4wgJj5NP6sfvCAic3Ec86eMwkDBbQX1NDo7XOrE39PgXTSLZbY+vv
 0DKKqIT0ZwtPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lJ9JHEEI
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/{gettext-gnu,
 libtextstyle}: bump to version 0.22
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-08-19 16:03 +0200, Bernd Kuhls spake thusly:
> > You're mixing the target _SUBDIR with host build; that's not clean.
> after seeing the discussion[1] about the build-time improvements,

He, things can change in 9 years! ;-)

> > If we can't have proper separation of tiools and runtime for the host
> > variant, then let's just stop this dance and build host-gettext at the
> > root of the package (e.g. let's just drop HOST_GETTEEXT_GNU_SUBDIR).
> +1, and thanks for starting the discussion ;)

Note that we can't just drop the HOST_GETTEXT_GNU_SUBDIR assignment,
because the host variant inherits the target setting, so if we drop
HOST_GETTEXT_GNU_SUBDIR, it's gonna be set to "gettext-runtime".

Instead, we'll have to override it with:

    # Don't inherit the target setting; build the whole package:
    HOST_GETTEXT_GNU_SUBDIR = .

> > As far as I understand, this installs stuff into $(HOST_DIR) at build
> > time. That is definitely not correct.
> You are right, it's hackish.

But it had merit to trigger reviewing the current situation.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
