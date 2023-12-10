Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC72C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 18:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 668F2400D0;
	Sun, 10 Dec 2023 18:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 668F2400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Efn1fQhROgpA; Sun, 10 Dec 2023 18:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F12E840116;
	Sun, 10 Dec 2023 18:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F12E840116
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 777F01BF358
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5070A60E64
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 18:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5070A60E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvhdaPLFX047 for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 18:46:57 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B627560784
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 18:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B627560784
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BDDF913F8B9;
 Sun, 10 Dec 2023 19:46:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Dec 2023 19:46:50 +0100
Date: Sun, 10 Dec 2023 19:46:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZXYHmno22XaXknlR@landeda>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf> <ZXXBnuTeg_LcSWgZ@landeda>
 <20231210180247.24316308@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231210180247.24316308@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702234014;
 bh=r+PtFFYVK6WikaDYyZ6quygFa+qFt5GvxHFipWa7AVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZXVsCc0G5KnOUBYIc39WY1mIYvm+HJhwEL/X2NtoicVge8/aZ09Qh/RwQc2FImuO
 7tAC44BHxCs+eNMtH4xYzvem8af5pvaIgJmkuFZgC6Vaout8plko0jGiLiO/E3cgN5
 lhVCjLtM9TT2zNd/VmjH2hhaDviM9h6ORws5im274PXojuOOiwSZEA02S3jZyl0p1t
 DspiyXFxp9b1Ba7gLgXuDHQGXJVKj5tpTX56iD0Vzi4o3CYTb6rvI7Ji/tZTdX/KgZ
 6sN/zS0Bm+GnZqVNxoHD/WTEFmesNrX9f/4BDC6tPMAJYAIMPhPssDoOWLf9cpGYvw
 VuJ1qp2JAUG9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KZXVsCc0
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-10 18:02 +0100, Thomas Petazzoni spake thusly:
> On Sun, 10 Dec 2023 14:48:14 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > M: strictly mandatory
> > T: optional, but helps use pre-built toolchains
> > S: optional, speeds up the build
> > C: needed to run check-package et al.
> > R: needed to run the runtime test-suite
> > 
> > Bazaar, mercurial and subversion are optional, and only required when a
> > package is bzr-, hg-, or svn-hosted, but if we want this image to be
> > usable generally, it should have all three.
> > 
> > Since mercurial is a python package, we can't drop python3, and the
> > remaining modules are relatively small in comparison to the rest.
> > 
> > Getting a more minimal image would be just about dropping qemu. That
> > would make for an image that we could not use in the CI, and that would
> > not be usable to test the changes done to Buildroot. I don't think that
> > would mkae for a good image.
> 
> It's mainly Python3 that is important to drop. Python3 is not part of
> our mandatory requirements, and it's a very frequent sources, as people
> don't have an easily accessible container to test Buildroot builds
> without Python3, so they forget BR2_TARGET_UBOOT_NEEDS_PYTHON3 or
> similar options.

Sure, but removing python3 means removing all the testing infrastructure
as well, and the ability to run check-package and flake8, and then we
would complain people are not running the linters (or are running them
on their host system without the proper versions).

Note also that, if we go the route your suggest, which is:

  - base image without python3 et al. for people to test-build,

  - CI image based on the above, plus all the testing infra;

then the CI would not be able to catch the issues such as a missing
BR2_TARGET_UBOOT_NEEDS_PYTHON3, because python3 would be part of the CI
image.

Also, I believe it is very optimistic to expect all contributors to
build-test in the docker image before they submit their changes. Some
will do (and some already do!), most won't.

> We have exactly two packages that use Mercurial.

The goal of that base image was also supposedly for people to reuse for
themselves, possibly with their own packages, not just for Buildroot.

So, we need three images:

  - an image with only the strictly required tools, which means some
    features will not be available: none of the VCS tools are mandatory,
    so they all must be excluded, yes, that also means git [0]: we can't
    exclude Hg and include git. Either the image is exactly right just
    the minimal with only the mandatory packages, or it is not;

  - an image that has all we need to run our tooling in the CI [1];

  - an image that people can reuse for themselves as a reference image
    that "just works".

I'm arguing that the two latter images are exactly the same, in fact, and
are the image we already have.

I am also arguing that the first image, without all of the optional
packages, is not going to be very useful in practice. Indeed, let's
take uboot as an example: one can chose an arbitrary version from an
arbitrary git tree, and thus you need git, so we can't build a lot of
our defconfig files in an image that has only the strictly mandatory
packages, and this is the image that would be able to catch the python3
issue...

Of course, we could make git part of the mandatory packages. Or we could
introduce host-git and treat it like host-lzip; and so on for host-svn,
host-cvs, host-mercurial, host-bazaar...

And maybe that is what we should do:

 1. promote git from optional to mandatory, like wget is: indeed, it is
    so common and pervasive that it does not make sense to keep it
    optional; then, and only then, it would make sense to have the first
    image with only the mandatory tools;

 2. add host variants of the other VCS tools (where that is not too
    difficult), so that we can use them if missing on the build machine.

[0] the manual states that rsync is both mandatory and optional, I'll
send a patch to fix that.

[1] ideally, it would also be used by the autobuilders, but that's
another topic entirely...

Regards,
Yann E. MORIN.

> pygame has the comment "stable 1.9.1 release requires V4L which has
> been wiped out of recent Linux kernels, so use latest mercurial
> revision until next stable release is out.", but there's a recent
> pygame 2.5.2 release from September 2023. And pygame is now on Github:
> https://github.com/pygame/pygame.
> 
> The other one is dvb-apps, which hasn't seen a single commit since
> March 2014: https://linuxtv.org/hg/dvb-apps. We could consider it
> obsolete/unmaintained maybe? :-)

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
