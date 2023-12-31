Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEFFC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 14:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D52408B5;
	Sun, 31 Dec 2023 14:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D52408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nwXmzQOWa2h; Sun, 31 Dec 2023 14:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 943AC408BD;
	Sun, 31 Dec 2023 14:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 943AC408BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91D711BF487
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 14:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A3EB408BD
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 14:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A3EB408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1WhWrHVu5zR for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 14:25:29 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07942408B5
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 14:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07942408B5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BF286B00572;
 Sun, 31 Dec 2023 15:25:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 15:25:18 +0100
Date: Sun, 31 Dec 2023 15:25:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZF5zgJWG4wr7aNe@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZY9Ej76T9DYHuLe3@landeda> <20231230190019.434e1b4b@windsurf>
 <ZZBzIdHGdJufQNWn@landeda> <ZZEzoC30PnpTgqLa@landeda>
 <ZZFKJtLm9ko7L6se@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZFKJtLm9ko7L6se@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704032726;
 bh=VSBxqe4wQFnpskAeAS4jqhzpHIaH+o0QsKtLWG43X5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trpuOeOFUki9TEnwXCQxP+vbn/pNjDcEbuNduwRmAKoPgYdq1gZyi4c9RSeXTHn05
 Y1v5glVfPmy7OfwVdRoVqplK5PVrLzXmLYFYD1/jfmHGFwKa9U2ohy3NRMDJdxWoLL
 oDMf5sLPkFIJGcHmpsUTL7DXc72U/hiKhIhNRrONDkz1jS1nTl7ROZfMFzvmHq32no
 to9L1OwLIQOzlHdgVbJLyPF0WaUdz7BLqMW9bTYzkIy9ollgqUC17IAg134kfp6evj
 TsdPzE9BWsUoG17TaM0BdQDMOAPtdUN9H7hpnzSrxRXmIYQlsB80UvzYiR7qfQ2syZ
 ihmJ3nCbNE4nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=trpuOeOF
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, sebastian.weyer@smile.fr,
 Antoine Coutant <antoine.coutant@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-12-31 12:01 +0100, Yann E. MORIN spake thusly:
> On 2023-12-31 10:25 +0100, Yann E. MORIN spake thusly:
> > On 2023-12-30 20:44 +0100, Yann E. MORIN spake thusly:
> > > On 2023-12-30 19:00 +0100, Thomas Petazzoni via buildroot spake thusly:
> > > > Note that I also encountered some hash mismatch on some Rust/Cargo
> > > > package recently, and BR was falling back to sources.buildroot.net. I
> > > > did not have the time to investigate at the time (I was looking into
> > > > another issue, and didn't want to enter an infinite recursion of
> > > > problem solving quest). And now, I don't remember with which package I
> > > > encountered this. But yes, it seems like we have a reproducibility
> > > > issue.
[--SNIP--]
> So, we're now left with just the cargo version issue... Which is in fact
> rather good news: we do not have an unknown dependency on the build
> environment.

So, I could not resist starting a git-bisect.

I assumed that the issue was due to some rust version bump. So, now that
I had established that the conversion of ripgrep over to the cargo infra
was indeed correct, and that the bump to rust 1.74.1 (i.e. master as it
is today) produces an incorrectly vendored tarball, I started a git
bisect looking for the rust version bump that introduced the failure:

    $ cat defconfig
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_BACKUP_SITE=""
    BR2_PACKAGE_RIPGREP=y

    $ export BR2_DL_DIR=$(pwd)/trash-dl

    $ git bisect 05392a5eae6 e27a700f3e140 -- package/rust-bin/
    $ rm -rf "${BR2_DL_DIR}"; make clean; make ripgrep-source

Rince and repeat until the first bad commit is found, and... tada...
It's the bump to rust 1.74.1 that casues the build failure!

Wait, wait, no, that can't be correct: I remember that 05392a5eae6^ was
bad. And indeed, a manual test on 05392a5eae6^ yields a broken
vendoring. Damn.

OK, so e27a700f3e140 *is* defnitely correct, while both 05392a5eae6^ and
05392a5eae6 *are* definitely bad, and there was no rust version bump
in-between. So something else causes the bad vendoring.

Let's start a full git bisect on the whole tree, not limited to jsut
rust version bumps:

    $ export BR2_DL_DIR=$(pwd)/trash-dl

    $ git bisect 05392a5eae6 e27a700f3e140
    $ rm -rf "${BR2_DL_DIR}"; make clean; make ripgrep-source

Rnce and repeat, and after quite a few more tests compared to the
previos bisect, we eventually find the first bad commit.

Sorry, that's all my fault:

    768f9f80f62c1da6e298c680f0f4bfa887f38c78 is the first bad commit
    commit 768f9f80f62c1da6e298c680f0f4bfa887f38c78
    Author: Yann E. MORIN <yann.morin.1998@free.fr>
    Date:   Wed Sep 13 00:15:49 2023 +0200

        support/download: generate even more reproducible tarballs

        When we generate the taballs off a local working copy of a VCS tree,
        the umask is the one that we enforce in out top-level Makefile.

        However, it is possible that a user manually tinkers in said working
        copy (e.g. to check an upstream bug fix, or regression). If the user
        umask is different from the one Buildroot enfirces, such tinkering
        can impact the mode bits of the files, even if their content is not
        modified.

        When we eventually need to create a tarball from said working copy,
        the VCS (e.g. git) will only be interested in checking whether the
        content of the files have changed before chcking them out, and will
        not look at, and restore/fix the mode bits.

        As a consequence, we may create non-reproducible archives.

        We fix that by enforcing the mode bits on the files before we create
        the tarball: we disable the write and execute bits, and only set the
        execute bit if the user execute bit is set.

        Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
        Cc: Vincent Fazio <vfazio@xes-inc.com>
        Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

     support/download/helpers | 3 +++
     1 file changed, 3 insertions(+)

So, I am not 100% sure how to fix that...

For master, it's relatively trivial: we can bump the version and compute
a new hash, and be done with that.

But for the 2023.11 maintenance branch, which contains the commit above,
we do not want to bump the versions. For ripgrep, we have a way out: we
can chop one digit off the end of the commit hash, and recompute the new
hash, and that's going to be OK. For sentry-cli, since we use a version
string, not a hash, we don't have much choice but to switch over to
using a commit hash from github...

And more generally, we do not have a way to express the fact that our
download infra changes. For git and svn, we do have a per-backend
version, but not for the generic infra, nor for the vendoring
post-processs...

I'll think a bit more on that, and send patches as soon as I can...

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
