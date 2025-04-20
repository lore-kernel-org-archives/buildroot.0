Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC70C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 08:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B176079A;
	Sun, 20 Apr 2025 08:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkvwFpIGwsXT; Sun, 20 Apr 2025 08:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB9F76083A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB9F76083A;
	Sun, 20 Apr 2025 08:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4DDC68
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 08:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB36C400D0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 08:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_iSimrYhU0A for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 08:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD4C240449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD4C240449
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD4C240449
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 08:09:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4A43F19F593;
 Sun, 20 Apr 2025 10:09:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Apr 2025 10:09:14 +0200
Date: Sun, 20 Apr 2025 10:09:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aASrqq79CcbjeIJZ@landeda>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <20250419171732.356b2676@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250419171732.356b2676@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745136563;
 bh=kJTirHrqzfKD5hUkPPLgfY8uhswU1TSXZEIxnLuJIqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6qOBl3RNwPDr7zJ9igNTgrUd2H95aawJdeCcFgYCsC1o8MBV6fxmXiY6Ml5bl5i4
 HmXqs8fKUZZ7k9VDxjVqdlVMYOssXgzTPx/dXgvsE1Hgbc+lITeAr5O8mBpT2IgDxZ
 PW+M+KVBXTsMeXKJ4NdiJeG69VSijrYWkCELcW61qdVh4hsawWF1PEftOxGOomb7bk
 We1msZaFpuWSMw5lIIDlLOTRGTNg5d5QhFWJuZ09w28UYGhQQTiO1bKPxhJrxAuICB
 MOtMocyVZg5coD+2fEC9d2TRfuSux506JMJuIC1rN+uX+VZIAzH28yUuN32gvfCPiC
 XC4jCTrKobx7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N6qOBl3R
Subject: Re: [Buildroot] [PATCH 00/29 v2] package: improve for better
 pulseview integration (branch yem/sdcc-fx2lafw)
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2025-04-19 17:17 +0200, Thomas Petazzoni spake thusly:
> On Wed,  9 Apr 2025 22:03:42 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > This series aims at making the pulseview and other sigrok-related
> > packages more integrated. The series is articulated around three main
> > goals, the details of which are expanded later:
> >  1. cleanup and extend pulseview dependencies, notably the need for
> >     fonts;
> >  2. extend the boost package, for a better host variant, and better
> >     maintainability;
> >  3. introduce sdcc and fx2lafw, to allow use of Cypress FX2-based logic
> >     analyzers.
> 
> Wow, this is a large series doing a lot of stuff.

Yes, but it is all related and triggered by the f2xlafw package coming
last in the series... So, a lot of different things, but to an ultimate
common goal.

> I already applied a
> few of the preparation patches in order to reduce a bit the size of
> your series.

\o/ :-)

> Now, I have several concerns about different aspects of the series.
> Nothing I am entirely against, just topics on which I am not 100% sure
> on how we want to deal with them.
> 
> First topic is the some-font package and this whole idea that all font
> packages should at least install some font. One thing that bothers me
> is that fonts can be provided in different formats, and "some-font"
> doesn't say which font format will be used/available. Should we make
> this "some-ttf-font", or something like that? Is that even a mechanism
> we want in Buildroot at all? Arnout, Peter, Julien, Romain, any opinion?

Yes, the some-font stuff is not what I am most proud of. If you have a
better idea on how to allow applications to request that some font be
available, or some refinements on my solutions, I'm all ears and eyes.

As for TTF vs fixed-width, I don't think that makes a difference.
Applicaitons usually use a font rendering library, like fontconfig and
harfbuzz et al. which would load and render text from whatever font they
are told to load, or that is available... In the very limited use-case I
had, running pulseview full-screen on framebuffer on rpi2, it was
working very well whatever the fonts that were installed (the text would
look slightly ugly/weird at times, but was rendered OK).

But I'm by far not an expert in fonts, so I may very well be talking
bullshit.

> Second topic of concern is how you handle the host-boost dependency.
> You add a "select BR2_PACKAGE_HOST_BOOST" to all packages that need
> host-boost, adding hidden Config.in.host options for all of them. Is
> this really what we want? So far, we have never required
> BR2_PACKAGE_HOST_* options to be selected (think
> BR2_PACKAGE_HOST_PKGCONF for example). So to stay consistent, I would
> rather suggest that the BR2_PACKAGE_HOST_BOOST_<something> hidden
> options that are needed get added and selected by whoever need them,
> but BR2_PACKAGE_HOST_BOOST isn't needed, nor it is necessary for
> packages to select it.

The thing is, if you look for example to the package host-odb, it does
not itself need host-boost, but it depends on libodb-boost, which does.
Today, libodb-boost does not need any of the boost extra libraries, but
if tomorrow it does, then without a host-libodb-boost Kconfig symbol, it
would be host-odb that would have to carry the selection of that extra
boost library; that does not sound too nice to me...

Second, if a package selects HOST_BOOST_BLAH, it is not too much of a
burden to also select _HOST_BOOST, I believe. I modeled that from the
host-python3 package: there is a main symbol that has to be selected
before sub-options can also be selected. Granted, host-python also has a
prompt and can be enabled on its own, which is not the case for
host-boost. However, I think it would be a little bit awkward to have
symbols for sub-options of a package that has no main symbol for
itself... (but if the consensus is to just drop the main symbol, and
just keep the rest of the symbols as-is for a configurable host variant,
I will not argue further, that would be fine for me as well).

> Of course, unless we decide to bite the bullet
> and have Config.in.host options for all host packages, always selected,
> but that's a huge effort and complicated one (think host-cmake, which
> may or may not be built depending on whether there is a suitable CMake
> version on the host machine).

We already talked about this and we already tried, but it really is way
too much to do; let's concentrate on those packages where that is
actually needed and/or makes sense and/or is not too much trouble...

However, to be honest, that is not the part of the boost changes I was
expecting the most comments about; I had rather expected some (very
needed!) questioning on that subset:

    utils/check-symbols: allow ignoring some defined-but-unused symbols
    package/boost: commonalise list of libs
    package/boost: check that known libs match Boost's list

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
