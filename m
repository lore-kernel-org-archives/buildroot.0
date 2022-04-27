Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA91CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 21:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E6F640B4A;
	Wed, 27 Apr 2022 21:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDG9RZKH8tgd; Wed, 27 Apr 2022 21:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5393A40A19;
	Wed, 27 Apr 2022 21:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B19BD1BF5A6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 21:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F51361043
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 21:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-uI89HFPgNe for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 21:45:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 073BF6100E
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 21:45:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8d9a:c8d:7cf:ba48])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3B705780316;
 Wed, 27 Apr 2022 23:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651095934;
 bh=D2tKDTacHQNDKm2eHJ+Rqukf/8lrd5MxHxl11IpXc6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myrXUnpe/X9uAlPRNQCspcvm5y5Je7klxvfP109qUX0qBbUHR26J7rXYQZHruhe01
 yfiQrV0OQ2wLmdqBO+NE/cC84Ox4rSxhNWH7odMGObfo+WIifx3epnPqVw7K1qCMw0
 TZFRPSwK9Cq2+VHLc6dm7Fm+vdukkCY8udpnZ0EgIBmEsxUAx6Gm075jxkT+d8vXOG
 9rNQuGFcdeFR5rb+hgKHG8xKQ8A1ejARRtfZNQpzsQBmSX28xIHC+Tf81Bco0u2fOJ
 jpbPF8BQ7CP6LSuzZK97ZclM6qE7ENgcsy8uL60CYDnZ67356yQcbuCn3Krmfme/Sd
 3MJuzwhvyEhLA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Apr 2022 23:45:29 +0200
Date: Wed, 27 Apr 2022 23:45:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220427214529.GC3624965@scaer>
References: <20220426215315.381964-1-thomas.petazzoni@bootlin.com>
 <20220426215315.381964-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426215315.381964-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 3/3] package/binutils: drop version 2.32
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

p
Thomas, All,

On 2022-04-26 23:53 +0200, Thomas Petazzoni via buildroot spake thusly:
> Now that recent versions of binutils work with FLAT binaries, we can
> drop the old 2.32 version, which was kept only to keep support FLAT
> binaries.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

As seen on IRC: binutils-2.32 is the latest version that can still build
afboot-stm32. binutils-2.36.1 onward break the build.

As you noticed, this is because of:
    https://github.com/mcoquelin-stm32/afboot-stm32/commit/0f3e61c9dd48fd8b4248ce4672c044c2562e4de1

That change is wrong: -nostartfiles is a gcc option, not an ld option.

Older ld version seemed to somehow ignore it, while at least since
2.36.1 it is now an error:

    ...ld.real: Error: unable to disambiguate: -nostartfiles (did you mean --nostartfiles ?)

This is because, starting with binutils 2.36, ld got an improved flag
parsing that now generates that error (but that's incorrect too, as
--nostartfiles does not exist either). -nostartfiles is a gcc option,
but afboot-stm32 directly calls the linker...

A similar issue was raised fot at91bootstrap, and fixed by removing
-nostarfiles:

    https://github.com/linux4sam/at91bootstrap/issues/127
    https://github.com/linux4sam/at91bootstrap/pull/129

So, as you said on IRC that you'd send a followup eries with a fix to
afboot-stm32, I've marked this series as changes requested in the
meantime.

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
