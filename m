Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5640FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 20:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B7661017;
	Mon, 18 Jul 2022 20:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B7661017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWvVawlF_Sbs; Mon, 18 Jul 2022 20:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9165160FB9;
	Mon, 18 Jul 2022 20:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9165160FB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9461BF3D4
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69A5E60FB9
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A5E60FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tc26lb6O0eFK for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 20:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 625D360F44
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 625D360F44
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 20:21:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DB7D313F84C;
 Mon, 18 Jul 2022 22:21:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Jul 2022 22:21:03 +0200
Date: Mon, 18 Jul 2022 22:21:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220718202103.GD2249625@scaer>
References: <20220706210621.284257-1-f.fainelli@gmail.com>
 <20220718150145.4867a519@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718150145.4867a519@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658175668;
 bh=MLAeGkMlUK658GfhL5hUKS0+Sd/5a2/FKFDWIvBxHIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAMvQvbB6xMuA7autEdYo5S1p4YMRcsw3qQW/NJzXJyvvPpR7HuBvIY6w1GBZlc5M
 NKcEAPdQh6EDUcUZnrPHel8PrKJ3x5Odqv1XydMKUHLeLX/Gar5dwaYyXxXGnRnCQt
 Du7s8cT9vmLTOYsYmxMT5/d8FnwuD2nHux8El6bJIlx9w59aCmTzmnLVVE3uZZ/4ZF
 TMSsCCwQ06NN8gQTf7KURljaXAqHJ4sfK345eF9COsNqXqHU3jig90jbsT0pH14BPc
 94VcUkDzkdlukXwkfr1V2h3hSMlqvvUt4LlnqxgEVoAfTYO05cJ8PGZAq1tEc6/qMf
 eZe7i3SjPiSvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mAMvQvbB
Subject: Re: [Buildroot] [RFC] linux: Make CONFIG_LOCALVERSION_AUTO work
 with OVERRIDE_SRCDIR
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, Thomas, All,

On 2022-07-18 15:01 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Wed,  6 Jul 2022 14:06:21 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> > Linux is able to generate an automic version based upon the git tree
> > that is being used which is very useful for making sure that the kernel
> > being used is truly the one that we intend to be using.
> > 
> > When using LINUX_OVERRIDE_SRCDIR however, since we do not rsync the .git
> > folder, all of the necessary information for scripts/setlocalversion to
> > compute the exact version and git commit id is lost.
> > 
> > Add a post rsync hook that copies it over in order to allow 'git
> > rev-parse' to work and produce an usable version.
> > 
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Thanks for your patch. What bothers me is that it is a Linux-specific
> solution for a problem that isn't Linux-specific. Many other packages
> also use Git commands to generate a version string that they embed in
> their binaries. So this problem really is global and I'm not sure we
> want a Linux-specific fixup for it.

Indeed.

> To me the long term solution is to enable out of tree build of
> packages. This way, instead of rsync'ing the code, we would directly
> build it from its original location. Some initial work was done in this
> area, but it's obviously a much larger endeavor than the fixup you are
> proposing. A more immediate alternative would be to also rsync the .git
> folder instead of excluding it, but do that globally for all packages
> that use override-srcdir. The .git directory was explicitly excluded to
> reduce the amount of data to rsync.

And in any case, it is still possible to hack this for now:

  - set LINUX_OVERRIDE_SRC_DIR in your local.mk
  - define the post-rsync hook there as well

Note: it is usualy possible to add the hook in local.mk, but it is
fragile: if the package itself uses post-rsync hooks, but its first
assignment is not an append-assignment +=, then your hook in local.mk is
ignored. In practice, we have no package [*] that uses post-rsync hooks,
so it shoiuld be safe to do define one in local.mk.

[*] of course, there is one exception: uboot, and I wonder if we should
not have a better solution nowadays.

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
