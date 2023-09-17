Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1019CCD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB66460BB0;
	Sun, 17 Sep 2023 19:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB66460BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhPFOvlBD5Fi; Sun, 17 Sep 2023 19:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B7060E5F;
	Sun, 17 Sep 2023 19:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B7060E5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 348A71BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DE6460E72
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE6460E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wee2_vqQndLE for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:00:54 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76690608B7
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76690608B7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5BC8EB005A6;
 Sun, 17 Sep 2023 21:00:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 21:00:46 +0200
Date: Sun, 17 Sep 2023 21:00:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230917190046.GZ415981@scaer>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
 <20230914230730.697c596a@windsurf> <20230915075045.GE2693@scaer>
 <1827eef4-9007-269e-2611-e1e373865370@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1827eef4-9007-269e-2611-e1e373865370@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694977251;
 bh=zliil91KRnkMZTG27KGYTM9u/mom9RCJ5M3IdMX1SUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b6dUZlM6CN+R7qup96hJYOEudX4eVOCS68gx4E4K1a/HS4wCs8ozddW5OkgdHcXXe
 /l2N6TZar5nVtKXFdSxFZdS2FXBtO52C3qd2ktGYlJpRvsuFmCDHGvm+HnUaxDSKeO
 okFT2lBlXj5l4WVfOuYqCfr3kv4NuKCGaY1tl+6ybbc4hsbawdrIMPn4m6p4muKl9J
 RnBLStq3GnBS9OFsvzmZSv+TmoBxjARG1RnGbSTrPBDJ1iS3ebOHXJHkNc249ShVDK
 E7gxHK0ZJjwzXSoIrFvqM4szxmFoezxldvoMQz+OGuCYa/82NwN0roGfGcxo8CE0TR
 k2QB5T0w4CQsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b6dUZlM6
Subject: Re: [Buildroot] [PATCH 5/5] support/download/git: handle git
 attributes
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
Cc: Francois Perrad <fperrad@gmail.com>,
 Woody Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-09-17 19:52 +0200, Arnout Vandecappelle spake thusly:
> On 15/09/2023 09:50, Yann E. MORIN wrote:
> >On 2023-09-14 23:07 +0200, Thomas Petazzoni spake thusly:
> >>On Wed, 13 Sep 2023 00:15:52 +0200
> >>"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >[--SNIP--]
> >>>Extend the git backend to handle the export-subst attribute. There is
> >>>no git tool (that we could find) that does that automatically, except
> >>>git-archive, which we can't use. So, we do it manually with a bit of
> >>>trickery where we do use awk to:
> >>>   - identify all files that have the export-subst attribute set,
> >>>   - for each such file, iterate over all the placeholders, and
> >>>     replace them with the expanded format.
> >[--SNIP--]
> >>I am not totally convinced by this. I recognize the massive efforts
> >>that have been into these complex awk scripts, but there are a few
> >>reasons why I dislike it:
> >>(1) It's complex/non-obvious
> >TBH, we've seen more complex code (awk or otherwise) get in. ;-)
> >But I do agree that we need to asses the complexity vs. gain ratio.
>  I haven't looked at it in a lot of detail, but it didn't look _that_
> complex to me.

I noticed a little coding-style issue in there (missing semi-column on
end of line, innocuous as it's optional, but that's diverging from the
rest of the file). I'll fix and respin a v2.

[--SNIP--]
> >For that second point, we have always had people that wanted to keep the
> >git tree because their build system wanted to extract the git hash (or
> >other info) so that they can quickly identify the source *on a running
> >target*. Telling those to use export-subst can be a solution (now, we
> >just need to convince Linus to add that to his kernel tree ;-) ).
>  It would be nice if we could generate a file that git-describe recognizes
> and uses instead of the actual git tree. Or perhaps we should create a git
> wrapper that does exactly that.

In retrospect, I was thinking about override-src-dir packages. For
those, we could look into something like:

    ifneq ($$($(2)_OVERRIDE_SRCDIR),)
    $(2)_ENV += GIT_DIR=$$($(2)_OVERRIDE_SRCDIR)/.git
    endif

> >Finally, we also bumped the subversion backend version, which is now
> >-br3; that will probably have caused a lot of churn for those numerous
> >companies that still use svn. I don't see why that would be acceptable
> >for one backend and not another.
>  I expect the impact of svn to be much smaller. Also, mistakes made in the
> past doesn't mean we should make the same mistake again :-)

Sure, but svn is in fact still quite widely used in $big_corps...

> >>Of course, I can be convinced that I'm wrong, but I'm not too convinced
> >>at the moment. And of course (again), Peter and Arnout are definitely
> >>welcome to disagree and overrule me :)
> >You won't be surprised when I tell you I believe it is worth it. ;-)
>  Yeah, I do think we should do everything we can to make sure the git
> archives are reproducible.

What we currently have is *already* reproducible, and I was not arguing
that was not the case. The point was about adding support for
export-subst, not reproducibility (but adding export-subst should also
be reproducible, hence the core.abbrev=40).

So, I'll fix the little coding style issue, add a section in the manual,
and resubmit, with a conversion of luajit while at it.

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
