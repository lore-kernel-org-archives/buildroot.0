Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9587AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 105B640E47;
	Sun, 16 Oct 2022 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105B640E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yxyRUwtkorx; Sun, 16 Oct 2022 16:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D517409F1;
	Sun, 16 Oct 2022 16:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D517409F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C64F1BF471
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3DAE409EB
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3DAE409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNkwXkxFuP8a for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 16:05:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242E1409E7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 242E1409E7
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 16:05:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AF89013F88E;
 Sun, 16 Oct 2022 18:05:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Oct 2022 18:05:05 +0200
Date: Sun, 16 Oct 2022 18:05:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221016160505.GK2503@scaer>
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
 <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665936312;
 bh=BbfrVncQRZim26zEUT7XcfMIsIICmbuuGrMBw6flf98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Se0RvMyQjpxNPy999KdVfh0yO8lkHpDZ8S3/a8x8i2pXm5KmCGimP+NYY2tbo4047
 iN/CHtv9O1sFQbdRzjyyCO1XY1GPxKWCRlM50ws5x9/UtNMVVF6cNV17tUoQX5cpD7
 HsiYzRtHyDfzXZXnIPHd+fWaBvisTqjmO+XLdDe1qxgnN4cjqOzvHoh4kAz9nqLZN1
 M2GY10EYok6w5ImnQozVHzteWGGqhUsqImhMh/gbvwjP93o9FlebTTcU+jbEpnvwpJ
 xH18D8aFVgjVp+6GgNJbMoWa9L+K+0o99ShOjpyuCO34glJo4UBY6z8yzOaktloMYZ
 FzujZlOf36t7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Se0RvMyQ
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

+Thomas, Peter, Arnout

On 2022-10-16 11:44 -0400, James Hilliard spake thusly:
> On Sun, Oct 16, 2022 at 3:51 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-10-15 19:21 -0400, James Hilliard spake thusly:
[--SNIP--]
> > > Yes, all my autobuilders were recently changed to use make master(will be
> > > make version 4.4 once released) with top level --shuffle=random.
> > By disabling parallel build because you are using ana as yet unreleased
> > version, we remove the parallel build for everyone, which is not very
> > nice at all.
> Failures with shuffle mode indicate that the package is not parallel compatible
> on existing make releases as well, it just makes those bugs more visible.

I never said they were not, and I even said (further on) that it *is*
interesting to find such bugs.

However, the behaviour so far has been ordering of prerequisites (and
goals!), and for some packages, that ordering was enough to work in a
parallel make.

For example, the bearsll parallel issue is caused by the ordering so
the mkdir is very early. Yes, it is incorrect, but it happens to always
work in practice. And yes it is easy to fix, here's a patch:

    diff -durN a/mk/mkrules.sh b/mk/mkrules.sh
    --- a/mk/mkrules.sh	2018-08-14 22:41:54.000000000 +0200
    +++ b/mk/mkrules.sh	2022-10-16 17:54:22.282069851 +0200
    @@ -531,23 +531,23 @@
     (for f in $coresrc ; do
     	b="$(basename "$f" .c)\$O"
     	g="$(escsep "$f")"
    -	printf '\n$(OBJDIR)$P%s: %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
    +	printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
     done
     
     for f in $toolssrc ; do
     	b="$(basename "$f" .c)\$O"
     	g="$(escsep "$f")"
    -	printf '\n$(OBJDIR)$P%s: %s $(HEADERSTOOLS)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
    +	printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSTOOLS)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
     done
     
     for f in $testcryptosrc $testspeedsrc ; do
     	b="$(basename "$f" .c)\$O"
     	g="$(escsep "$f")"
    -	printf '\n$(OBJDIR)$P%s: %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
    +	printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
     done
     
     for f in $testx509src ; do
     	b="$(basename "$f" .c)\$O"
     	g="$(escsep "$f")"
    -	printf '\n$(OBJDIR)$P%s: %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) -DSRCDIRNAME=".." $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
    +	printf '\n$(OBJDIR)$P%s: $(OBJDIR) %s $(HEADERSPRIV)\n\t$(CC) $(CFLAGS) $(INCFLAGS) -DSRCDIRNAME=".." $(CCOUT)$(OBJDIR)$P%s %s\n' "$b" "$g" "$b" "$g"
     done) >> Rules.mk
    Binary files a/mk/.mkrules.sh.swp and b/mk/.mkrules.sh.swp differ

And then adding a CONFIGURE_CMDS that runs mk/mkrules.sh to regenerate
the Makefile.

> I'm running shuffle with -j1 because that way it's obvious in the logs where the
> failure is getting hit, otherwise these bugs tend to be transient and
> difficult to
> trace as they otherwise are timing dependent.

Yes, this is very interesting to find such bugs, but disabling parallel
build in packages is not nice when they can be (easily) fixed.

> > Notes:
> >   - it *is* interesting to find those bugs;
> >   - it is sad that the default mode for --shuffle will be random, not
> >     none.
> Default is equivalent to none,

Yeah, I noticed the hard way after having my patch rejected in makem as
you may have noticed. :-/

> I modified my autobuilder runner to pass
> --shuffle=random.

Again, that is very interesting, but please, please, conordinate with
the rest of us when you do such changes, because that is very weird, as
Fabrice noted, to suddenly get build failures out of the blue when
nothing seemed to have otherwise changed.

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
