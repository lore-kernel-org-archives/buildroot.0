Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B840EE6431
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 07:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052CF83312;
	Fri, 15 Sep 2023 07:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052CF83312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VuHYhRjmT6f; Fri, 15 Sep 2023 07:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213A983807;
	Fri, 15 Sep 2023 07:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213A983807
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FCF21BF271
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 07:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD41B83807
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 07:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD41B83807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SG4mmQQiII6Q for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 07:50:53 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4448F83312
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 07:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4448F83312
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c887:df90:5edf:840])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 03CD060135;
 Fri, 15 Sep 2023 09:50:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 09:50:45 +0200
Date: Fri, 15 Sep 2023 09:50:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230915075045.GE2693@scaer>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
 <20230914230730.697c596a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914230730.697c596a@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694764250;
 bh=dkr/+DReuE+8BZvlkOfTF9sCqId3i/hEsUr9Rwbv9/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsFLcdIrkYTbXry0VvGglV8lggYKer2QyiT4NPM5GZlrIfPTnOjT4PlKiNrGpT7B7
 7uC0joJN+bRwqylfb97ECZONja7EX4QKYl2fC6yhxe7gYIP1wlY1xnSf2ZnL2wzepG
 taD2zhrb8bEz8YmbLchsJzV2qWY0tHZT6BX/ty3yX9uEnwTe6AnqfDS9qOgBFGiN1h
 BBGy0g52vcrsaUwXfcUUNWY40F84JpfDear8y09S5h0EnJPqd00E5su64sdmBFFBtC
 8HTyy+GYmNJmkejvGgrwKUS0mEkB/Zekqrof85EP8K8CfCLjcALYa1XPD+o2/4ai8O
 SCrHlQSzLEqjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DsFLcdIr
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
 Woody Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-09-14 23:07 +0200, Thomas Petazzoni spake thusly:
> On Wed, 13 Sep 2023 00:15:52 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Extend the git backend to handle the export-subst attribute. There is
> > no git tool (that we could find) that does that automatically, except
> > git-archive, which we can't use. So, we do it manually with a bit of
> > trickery where we do use awk to:
> >   - identify all files that have the export-subst attribute set,
> >   - for each such file, iterate over all the placeholders, and
> >     replace them with the expanded format.
[--SNIP--]
> I am not totally convinced by this. I recognize the massive efforts
> that have been into these complex awk scripts, but there are a few
> reasons why I dislike it:

I am not too surprised by your reply, indeed! ;-)

> (1) It's complex/non-obvious

TBH, we've seen more complex code (awk or otherwise) get in. ;-)

But I do agree that we need to asses the complexity vs. gain ratio.

> (2) It fixes a problem in only one single package, which is already
>     fixed in a package-specific way, and we don't have visibility on
>     many more packages adopting this.

Plus luajit that you applied just moments before (and was identified in
the commit log), which makes it two.

For those two, I am afraid that bumpers will simply forget to update the
post-extract hook with the appropriate data, especially as there is no
hint, close to the _VERSION setting, that another value has to be
updated in lock-step [*].

Plus the 4 qt5-related package (for which that has no impact on the
build, I'll grant it).

[*] we also recently ensured that the erlang API version is no longer
hard-coded, see b574a9606e62 (package/erlang: do not hard-code the
Erlang Interface Version (EI_VSN)) because, in the long run, people
forget about such things... And even so, even with hints, people just
don't follow them, like we had meas3d bumps that did not update
mesa3d-headers in spite of the hint right above MESA3D_VERISON.

> (3) It bumps the Git tarball version, which is going to cause breakage
>     to *all* downstream users of Buildroot which have custom packages
>     retrieved from Git (and there are probably thousands of these in
>     the numerous companies using Buildroot). So causing so much hassle
>     to our users for the gain of fixing one package in Buildroot is IMO
>     not a good trade-off.

So:
  - if the package does not use export-subst, then only the filename
    changes, and it is easy to s/-br1/-br2/; that can be added to
    release notres and in the "updating" section of the manual;

  - if the package uses export-subst, then that will actually help those
    out-of-tree packages because they will no longer have to deal with
    it manually in an ad-hoc manner.

For that second point, we have always had people that wanted to keep the
git tree because their build system wanted to extract the git hash (or
other info) so that they can quickly identify the source *on a running
target*. Telling those to use export-subst can be a solution (now, we
just need to convince Linus to add that to his kernel tree ;-) ).

Finally, we also bumped the subversion backend version, which is now
-br3; that will probably have caused a lot of churn for those numerous
companies that still use svn. I don't see why that would be acceptable
for one backend and not another.

> Of course, I can be convinced that I'm wrong, but I'm not too convinced
> at the moment. And of course (again), Peter and Arnout are definitely
> welcome to disagree and overrule me :)

You won't be surprised when I tell you I believe it is worth it. ;-)

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

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
