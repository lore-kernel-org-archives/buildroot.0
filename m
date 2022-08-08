Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0408FC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 19:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E92804087E;
	Mon,  8 Aug 2022 19:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E92804087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMFfSO-TCffw; Mon,  8 Aug 2022 19:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F4740882;
	Mon,  8 Aug 2022 19:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F4740882
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0A1B1BF2B4
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB3A98141B
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 19:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB3A98141B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rnmf1GfI1vBX for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 19:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BEB181328
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BEB181328
 for <buildroot@busybox.net>; Mon,  8 Aug 2022 19:47:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a1b7:a43e:e82c:599c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7A13E6012C;
 Mon,  8 Aug 2022 21:47:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Aug 2022 21:47:08 +0200
Date: Mon, 8 Aug 2022 21:47:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220808194708.GA524369@scaer>
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220807001348.351cd42c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220807001348.351cd42c@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659988031;
 bh=K9SKdYDHftx8TF9SgYG/RIXYV883jrnFbzRyo7TdSzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljoNFC12u3qTlnodGWnAo8lo1QKE4XPkGZG84lkp23luuut8Q87nWj4SgngAACNfG
 7odqZ/dDw4x5jdKQ4uNKtGkPDOqG7bZ02ej+d8e+o63W5JbpbB+LHP+X/YvqN1OaoT
 f8pnbWU/ByQLnMq3XS0WNaj8/TEs/Xpe0Z0OckW8Oe/YhF6zdbLAmcWf88GGiWdMXW
 nfB5PzQukEaSEOKe09x/7nj6GSj2WQ9UdUEIS8qZCNcm+7seT2bmpfFIcPj6KGwTGw
 IWovGPTURK72IpkllCfeVeGs/LOVC7g97MRQIEQQTqX4+oqULEfENEDUs1Yu0gHOWv
 9UKG8RUCjhbgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ljoNFC12
Subject: Re: [Buildroot] [RFC v3 1/2] package/pkg-meson.mk: support fortran
 cross-compilation
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
Cc: buildroot@busybox.net, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-07 00:13 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> Now, on to the open issue which explains why I have added Yann in Cc.
> We are currently setting the C++ compiler and Fortran compiler path in
> Meson's cross-compilation.conf unconditionally... even when the
> toolchain has no C++ or Fortran support. So it means we're pointing to
> compilers that don't exist.

I think this is fine. They don't exist, so they can't be run, so meson
will not inadvertently be able to build a C++/Fortran/... program and we
will notice the issue.

> Ideally, the cross-compilation.conf should be generated with no
> reference to a C++ or Fortran compiler, or a /bin/false reference, and
> ditto for the CXXFLAGS/FCFLAGS when there is no C++ or Fortran support.

In the past, we used to use false as a C++ compiler (but not for meson
specifically), and it turned out that that caused quite some
hard-to-understand issues, see 4cd1ab15886a (core: alternate solution to
disable C++).

I'll ask the meson guys in irc://irc.oftc.net/#mesonbuild and se what
they have to say and suggest.

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
