Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B756C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A99984DFB;
	Fri, 17 Dec 2021 22:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIC9NNvtbfa3; Fri, 17 Dec 2021 22:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E336984DF6;
	Fri, 17 Dec 2021 22:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A308B1BF5AA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91DD484C71
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKascw_D6H-K for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:28:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp1.osuosl.org (Postfix) with ESMTP id 986DF84C42
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 22:28:16 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id A4A1242825F
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 23:28:12 +0100 (CET)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 6BF6B780326;
 Fri, 17 Dec 2021 23:28:07 +0100 (CET)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtp (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1myLhv-0004LD-53; Fri, 17 Dec 2021 23:28:07 +0100
Received: from ig by zenon.in.qult.net with local (Exim 4.94.2)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1myLht-001HsW-Cq; Fri, 17 Dec 2021 23:28:05 +0100
Date: Fri, 17 Dec 2021 23:28:05 +0100
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211217222805.k2wabmrqiiiogbuv@zenon.in.qult.net>
References: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
 <f1f9e092-9b0d-880b-bdd7-7e6a50f2382d@mind.be>
 <20211216210808.GH2603@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216210808.GH2603@scaer>
Subject: Re: [Buildroot] [PATCH] package/fakedate: fix finding the right
 date executable
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Dec 16, 2021 at 10:08:08PM +0100, thus spake Yann E. MORIN:
> Arnout, All,
> =

> On 2021-12-16 21:03 +0100, Arnout Vandecappelle spake thusly:
> > On 15/12/2021 18:34, Ignacy Gaw=EAdzki wrote:
> > >If the PATH initially contains host/bin, then the right date
> > >executable is to be found after the *first* occurrence of fakedate in
> > >normal (forward) PATH order.  Fix the wrapper so that that first
> > >occurrence is found indeed.
> >  Just to be clear: the problem is that if you do
> > PATH=3D$PATH:$PWD/output/host/bin make
> > that it doesn't find the real date program, right?
> =

> This is very not nice to do sto, indeed... :-(
> Unless this is again this SDK thing that is bitting us back?

In a nutshell, I have host/bin appended to my PATH because I often use
the buildroot-built cross-compiler chain.

> > >Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications=
.fr>
> > >---
> > >  package/fakedate/fakedate | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
> > >index 9bef113357..03a4f04079 100755
> > >--- a/package/fakedate/fakedate
> > >+++ b/package/fakedate/fakedate
> > >@@ -21,13 +21,18 @@
> > >  DATE_BIN=3Dfalse
> > >  # Do not call any 'date' before us in the PATH, or that would create
> > >  # an infinite recursion.
> > >+last_date=3Dfalse
> > >  for date in $(which -a date |tac); do
> > >      if [ "${date}" -ef "$0" ]; then
> > >-        break
> > >+	DATE_BIN=3D$last_date
> > >      fi
> > >-    DATE_BIN=3D"${date}"
> > >+    last_date=3D"${date}"
> > >  done
> > =

> >  Although this works, wouldn't it be simpler to throw away the tac
> > invocation and instead just take the first one after ourselves? I.e.,
> > something like:
> > =

> > found=3Dfalse
> > for date in $(which -a date); do
> >     if [ "${date}" -ef "$@" ]; then
> >         found=3Dtrue
> >     elif [ "$found" =3D true ]; then
> =

> You can simplify the elif test with (after all, that's the whole point
> of using false/true instead of 0/1):
> =

>     elif ${found}; then
> =

> >         DATE_BIN=3D"${date}"
> =

> And then, you can break the loop because we did find it.
> =

> >     fi
> > done

The problem with this version is that it won't choose the first
non-fakedate date following fakedate in the PATH, but the last.
Moveover, if, for any reason, fakedate is not in the PATH, it won't
find any date.

This is mostly why I kept the reverse iteration, to find the first
non-fakedate date that follows the first fakedate in the PATH, and to
fall back on the first date in the PATH if fakedate is not found at
all.

Regards,

Ignacy

-- =

Ignacy Gaw=EAdzki
R&D Engineer
Green Communications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
