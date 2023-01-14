Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9324DC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F60260ECD;
	Sat, 14 Jan 2023 20:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F60260ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUZWHWjP1GQD; Sat, 14 Jan 2023 20:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A2E060BD4;
	Sat, 14 Jan 2023 20:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2E060BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B22431BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB7A415A9
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CB7A415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVYCTSHu8wYe for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75806410CB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75806410CB
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:49:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6CE8E5FFA5;
 Sat, 14 Jan 2023 21:49:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 21:49:23 +0100
Date: Sat, 14 Jan 2023 21:49:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Carrier <Nicolas.Carrier@orolia.com>
Message-ID: <20230114204923.GD199036@scaer>
References: <d7d0dede27d4b3a026071a3019b58c5e8df9fe7b.camel@orolia.com>
 <20230114203859.GC199036@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114203859.GC199036@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673729366;
 bh=Zi4I/mhlqdvHAkJiHwrxW+ianCgxYAOdKK+nnuXKtVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BymiKF6xvgNiHZTJG4ksMToryUlr3JgVQ5ohLSNI+sNQG0SWOqAhQe5pxRJEOcUGJ
 9g41HZ1m6W85r9T/taYYgJteYXIPdQsB55xRegyPbbHKLYyU9LO5VHqmw+EXSHBM21
 EwAwYaOuSFMudc3BT0PXpYm3yAXwPQxGIFxupChzfNnI6pwYV6BwW1hxobPB48H8Bq
 fz8KZYpuCL7FMiV5ix3GLxZiUgXXPy/UnTuPvBLD55RZz2ZnoaHW599rf18Ngr2lIY
 iRTgv8Yjj/RIQUO25XeShKDs0UtncidpxOkquZF5qtpFVwYEdGUjjJvVYutTcXPTKK
 VAl2yI4dM754Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BymiKF6x
Subject: Re: [Buildroot] package/pkg-generic.mk: no legal info WARNING if
 REDISTRIBUTE = NO
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,

On 2023-01-14 21:38 +0100, Yann E. MORIN spake thusly:
> On 2023-01-13 13:20 +0000, Nicolas Carrier spake thusly:
[--SNIP--]
> > But in the situation where the packages has explicitly defined
> > FOO_REDISTRIBUTE = NO
> > in its .mk file, it makes no sense since the sources wouldn't be saved
> > anyway.
> Yes, it makes sense.

I now realise that my comment was ambiguoug, given what I was commenting
on. So, let me rephrase:

Indeed, emitting the warning does not make sense. Indeed, what you
explained does make sense.

There, ambiguity resolved. ;-)

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
