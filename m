Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090CFC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74BA940262;
	Thu,  3 Feb 2022 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNLucCMubN8m; Thu,  3 Feb 2022 21:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B6240180;
	Thu,  3 Feb 2022 21:38:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59DAB1BF359
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 21:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4176340160
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 21:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCz0BTwRmjZK for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 21:37:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1023E40180
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 21:37:57 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4JqX8M4WP6z4x17m
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 21:37:55 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch
 header.b="Z5/aXh1I"
Date: Thu, 03 Feb 2022 21:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail2; t=1643924262;
 bh=Xn94ESlEpzbHbDuRtze0/mcSzrh3R6KIZU+k4DVhJvg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Z5/aXh1I1AgTbwTh3VEX9Rwo2g1240NOMLDcBJNKvZogG6+aNsONArHuIBtUzw94R
 SjxUdDOcCqhv6yJ/DKAZgBhCoedkZWprzxlwvxKhaLugHmT+WHJAvDTeAmAAk4NyXd
 8Uryirpprwqb73xc51rBZt6uQUUFogYfRT865N03OW1nULVxi9qkFn9vpwZGjeQFyY
 yOmRI7aNmFfZESf05HzbgdHfsFRj6M4Bg1eJW2kPzf0GqytXjfyI6YJSNQ42NmJOwx
 UO/pFFg4g3FT6cPBC0PYZv0hBzqLrZZRx5lAoVa3lD3hX8Lh9bWc9+dN7ZjdkLfymc
 01qA8TxsJhvKg==
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <M1HJ925Vrlc5UKKd3Er28hvdnpcIq6zhIwkxj3UaM8a5YBNpnSQtz-4pMS7-kMf0GvOsrUAfZOTOvfvoa4GFwTnC-27WTz6NQUKoBWLYpz8=@protonmail.ch>
In-Reply-To: <6c85206c-139f-474d-7ca5-5f21fd606d96@mind.be>
References: <5_xofMlQqIrdAjpopLNCIYCGiqsc2UoXvUQG4GIV5Bd0dY31bw-gZ_0eoD0ix_iW-BI3-5O_RbQESkV3ybUN1zFSLY2r3PAr3ZOfxYOFmrU=@protonmail.ch>
 <ff363cc2-4eab-1b91-1933-d0fbe65aaf48@mind.be>
 <6c85206c-139f-474d-7ca5-5f21fd606d96@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] package libldns
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
From: ca0 via buildroot <buildroot@buildroot.org>
Reply-To: ca0 <ca0@protonmail.ch>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Naah - builds only for Intel.  Do an arm build and you'll find that the
m4/libtool.m4 runs a whole lot of ldconfig commands that show some error codes and the worst part is that the libc files mentioned are "blown away" (see https://dictionary.tn/whats-another-word-for-blown-away/) like taken our behind the shed and have a few bullets put in them - ie. deleted. Do you know what a pain it is not having the build fail there and then, because you have to debug a non working init, check the kernel and then find that your user space has been crippled by some Nazi collaborators (my bad, I'll stick to EU Nazi references from now on).

Are you saying that this package works for ARM?


Sent with ProtonMail Secure Email.

------- Original Message -------

On Thursday, February 3rd, 2022 at 6:49 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 03/02/2022 19:45, Arnout Vandecappelle wrote:
>
> > Hi ca0,
> >
> > On 03/02/2022 03:01, ca0 via buildroot wrote:
> >
> > > Building this package with orangepi_zero_defconfig results in an useless user
> > >
> > > system because both thee files are blown away
> >
> > What is "this package"? The subject mentions libidns, but there's no libidns
> >
> > package in buildroot.
>
> Apparently I misread, it's libldns which does indeed exist.
>
> I did a build of it and it looks OK...
>
> Regards,
>
> Arnout
>
> > What do you mean with "blown away"?
> >
> > > ./output/target/usr/lib/ld-musl-armhf.so.1
> >
> > This file belongs to the musl standard C library, but orangepi_zero_defconfig
> >
> > builds a uClibc standard C library, so it shouldn't even be there.
> >
> > You can check which libraries are needed for an executable or shared library
> >
> > with "readelf -d output/target/...". All the libraries mentioned there should
> >
> > exist in output/target/lib or output/target/usr/lib. If not, it is indeed broken.
> >
> > If you want more help, you will need to provide a whole lot more details.
> >
> > Regards,
> >
> > Arnout
> >
> > > ./output/host/arm-buildroot-linux-musleabihf/sysroot/usr/lib/ld-musl-armhf.so.1
> > >
> > > Is the ldconfig hackery needed for embedded systems and is it supported when
> > >
> > > cross compiling?
> > >
> > > buildroot mailing list
> > >
> > > buildroot@buildroot.org
> > >
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
