Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2BFC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C46E340A45;
	Tue,  9 Aug 2022 16:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C46E340A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8dc8PgQnNxV; Tue,  9 Aug 2022 16:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD1D940992;
	Tue,  9 Aug 2022 16:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1D940992
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5145A1BF860
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 263018140C
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 16:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263018140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id be54hFieMAjz for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 16:25:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0219381409
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0219381409
 for <buildroot@busybox.net>; Tue,  9 Aug 2022 16:25:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:55f2:8e98:fc59:1d5e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 620DB13FA3C;
 Tue,  9 Aug 2022 18:25:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Aug 2022 18:25:34 +0200
Date: Tue, 9 Aug 2022 18:25:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220809162534.GE3168@scaer>
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220807001348.351cd42c@windsurf> <20220808194708.GA524369@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220808194708.GA524369@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660062337;
 bh=1vI7jjYNw6btMDtRtSs862ybXNvW2dcnCMq9k059cO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fne3zu5skXfcR9vW3EBLmeGqznjmL4w0oEeEJOeRaFIrfqDJS1wTZsZtBzR93AQPm
 Pv3c8NCfaytymwNLgNqUCdC70Tqx/Jqt7GYdC7hYOjaM23FZTory7CKt90OzUtBA35
 c3t08gApSXhIFF5AwjfqA8o1qqSTVklZz7zFmEg2PaAtBvSf54TL0PcirTjlCuF7lT
 WC+WAH9uHs6KTguD0XNFG8csL/DmHcMRW0PC3u+8No/mkuIb1McqulqeVDx9u8HYVz
 SEP7qgtRVR9p81T8f9i7VixF5i+KqvezZz3UokwhtOLYIQe7VXxV4I3+0WWQxYq0I/
 vFCA9Pl86y6/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fne3zu5s
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

On 2022-08-08 21:47 +0200, Yann E. MORIN spake thusly:
> On 2022-08-07 00:13 +0200, Thomas Petazzoni spake thusly:
> [--SNIP--]
> > Now, on to the open issue which explains why I have added Yann in Cc.
> > We are currently setting the C++ compiler and Fortran compiler path in
> > Meson's cross-compilation.conf unconditionally... even when the
> > toolchain has no C++ or Fortran support. So it means we're pointing to
> > compilers that don't exist.
> I think this is fine. They don't exist, so they can't be run, so meson
> will not inadvertently be able to build a C++/Fortran/... program and we
> will notice the issue.
> 
> > Ideally, the cross-compilation.conf should be generated with no
> > reference to a C++ or Fortran compiler, or a /bin/false reference, and
> > ditto for the CXXFLAGS/FCFLAGS when there is no C++ or Fortran support.
> 
> In the past, we used to use false as a C++ compiler (but not for meson
> specifically), and it turned out that that caused quite some
> hard-to-understand issues, see 4cd1ab15886a (core: alternate solution to
> disable C++).
> 
> I'll ask the meson guys in irc://irc.oftc.net/#mesonbuild and se what
> they have to say and suggest.

So, @eliebrokeit there said, quoting:

    If you don't have one defined, cross builds won't try to autodetect
    one, IIRC...
    [...] however setting it to /bin/false will result in it detecting
    that that doesn't work
    I guess the safest bet is to deliberately poison it with /bin/false

So, when we do not have a compiler for a specific language, we should
force it to /bin/false.

Guillaume, would you be willing to tackle that?

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
