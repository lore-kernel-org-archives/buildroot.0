Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A00C6FA82
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 18:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7040A40591;
	Fri,  2 Sep 2022 18:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7040A40591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPGnlZo-x-W4; Fri,  2 Sep 2022 18:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6677140179;
	Fri,  2 Sep 2022 18:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6677140179
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 495601BF5DA
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 18:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 240276064D
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 18:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240276064D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFsz59yfzQji for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 18:43:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA5960592
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFA5960592
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 18:43:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:111e:602e:5100:6c00])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5DA1E200390;
 Fri,  2 Sep 2022 20:43:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 20:43:44 +0200
Date: Fri, 2 Sep 2022 20:43:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gary Bisson <gary.bisson@boundarydevices.com>
Message-ID: <20220902184344.GO68979@scaer>
References: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-10-chris.dimich@boundarydevices.com>
 <20220828154432.GF2569@scaer> <Ywy2Ro7fQtQ/lKUM@p1g2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ywy2Ro7fQtQ/lKUM@p1g2>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662144234;
 bh=6XqlBcAk6ipzuYjBR3MDwg64YxMpu/VKeZYedm4AQmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pgxDHTBtR7mUC1UfWoG1VtIaQNaEwuhRfLfDfTnBcWDY2H4N2Elc1YT9iItqCfDro
 yQ6Z/QxMKH3BrUoaxQZuiWTQ5+NIVohOGfIWJITWFNTlUd6SvS3rg7WBBqTA9dNzD6
 lY0S1TSV8KvVkQiR2jZOq6Cggy+4OISzmxCRyvAmVssMOyEQGQSgQGcpGdIK9BmwV9
 vWqnMfnE0dcyGu8pQUGv478k7WXiX/eICaspgHdbxTckuchEe0X9Z5FqCUzA3A7XYK
 1gzVbf0xncmkaqpldLhGRfcuhAbHjLXQx3uIy7711d49JGf5DUNpYacrJO4/rD1p4Z
 IalJfYZIn44Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pgxDHTBt
Subject: Re: [Buildroot] [PATCH 3/7]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gary, All,

On 2022-08-29 14:51 +0200, Gary Bisson spake thusly:
> On Sun, Aug 28, 2022 at 05:44:32PM +0200, Yann E. MORIN wrote:
> > On 2022-08-24 12:26 -0700, Chris Dimich spake thusly:
> > > To match NXP 5.15.32-2.0.0 release.
[--SNIP--]
> > I also have some relatively minor concerns with this package (not
> > specifically due to your change, but prompted by it):
[--SNIP--]
> > So, basically, we are using the commits on the master branch, but all
> > that differs from the corresponding tag is (by running:  git diff -p
> > c897a6c..82c6cb6):
> >   - there is an added 'fscl' (or variation thereof, like '+fscl') in 4
> >     locations, all appended to the version string;
> 'fslc' means that it is maintained by the community (fsl community) so
> the purpose of that tag is to show we're building from the external
> module source code from github/freescale (which is entirely maintained
> by the community).

Arf, and of course, I could not copy a 4-word acronym without making yet
another typo... :-/

> >   - there are two macros that are removed (specifically by ae0f3be).
> Yes this is for Yocto builds in order not to break reproducibiliy of the
> build/module.

Ah, but they are also nice for Buildroot, for the same reason! We also
want to be able to do reproducible builds, which is the reason I
suggested backporting that patch.

> > So, can't we use the tag instead of a sha1, and carry the patch from
> > ae0f3be localy?
> 
> We could but this approach considers there's only that patch that
> matters.
> In the past, the community-maintained module had more features than the
> driver from NXP, for instance it was supporting PREEMPT_RT when NXP
> didn't [1]. But I agree both branches are now very close.
> I don't have any strong feelings to be honest, whatever you think is
> better for BR will do.

OK, so using the master branch is the best solution overall, then.

> > Otherwise, Chris and Gary: could you add tags on the master branch,
> > maybe?
> We could add a tag on master if needed. Would need to run it by the
> project maintainer (Otavio). Just let me know if you want to go that
> route.

Given that there is a tag for the upstream import, it would be nice to
also have a tag for the community-merged result, but I can't impose that
burden, now that the reason for the master branch is better explained.
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
