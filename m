Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46058C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 17:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4355840E4;
	Thu, 31 Mar 2022 17:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QCUHFFBjzlS; Thu, 31 Mar 2022 17:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2531840E0;
	Thu, 31 Mar 2022 17:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A95F21BF9AC
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 17:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C08840E0
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 17:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaLdQbqV7f6g for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 17:11:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E0BB84067
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 17:11:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AA1D200009;
 Thu, 31 Mar 2022 17:11:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZyKs-001CoY-6H; Thu, 31 Mar 2022 19:11:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
Date: Thu, 31 Mar 2022 19:11:50 +0200
In-Reply-To: <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 (Jason A. Donenfeld's message of "Wed, 30 Mar 2022 13:13:08 -0400")
Message-ID: <87bkxm2gix.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

Hi,

 >> As discussed on IRC, I think it would be nicer to just add a normal
 >> seedrng package and depend on that from urandom-scripts, so the standard
 >> version/license info/.. stuff works. I can do that change if needed.
 >> 
 >> You mentioned something on IRC about this containing differences from
 >> what it is seedrng.git. Those changes/fixes are presumably not specific
 >> to Buildroot, will you add those changes to the git repo as well?

 > Absolutely not. This 100% does not work for me. I have made it
 > abundantly clear to you that seedrng is code that's meant to be copied
 > into individual distros and tweaked as needed, which I've done for
 > Buildroot. Do not attempt to package it from any repos I may have. If
 > you try to do that, I will intentionally interfere with those
 > operations server side, and take whatever other adversarial steps to
 > ensure my server is not misused for that purpose. I also will not
 > incorporate buildroot-specific tweaks into the sample code repo.

 > That repo supplies sample code. After Yann's absence, I took the
 > necessary steps that a maintainer like him would have done to
 > customize it to Buildroot's needs, incorporating it into the project,
 > and taking into account James' comments. You now have the result of
 > that work here, and I think it'd be silly not to take it.

 > I am offering to maintain this code inside of Buildroot for you. I'm
 > generally very much on top of things in that regard. I'm not offering
 > to start and maintain an external project at your request, no matter
 > how much pressure and conditionalization you apply on this mailing
 > list or IRC. That's not work I'll do for you. However, again, I am
 > offering to maintain this for you inside the buildroot repo as this
 > patch does.

 > That's my offer; take it or leave it.

Then I'm afraid we'll have to leave it. Sorry about that.

I do have a lot of respect for your various other open source work, but
your aggressive behaviour here is not OK.

Not having the entrophy credited by this script is not great, but it has
been like this for 20 years already, and it only affects a small subset
of users, E.G. people using a combination of writable and persistent
/var/lib, the classic initscripts and on a platform without a suitable
entrophy source. In the 15+ years that I have been using Buildroot, I
have so far never used it. In fact, perhaps we should drop the default y
from the package.

This can be revisited if something like this ends up in Busybox and/or
something similar gets packaged,
E.G. https://github.com/jumpnow/rndaddtoentcnt

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
