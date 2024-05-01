Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E28C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FE980C41;
	Wed,  1 May 2024 21:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAo7N6T5U324; Wed,  1 May 2024 21:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 612C480E81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 612C480E81;
	Wed,  1 May 2024 21:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7CEF1BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1ED160805
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TREZNpIp514F for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF78660608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF78660608
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF78660608
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:19:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EF09513F879;
 Wed,  1 May 2024 23:19:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 23:19:23 +0200
Date: Wed, 1 May 2024 23:19:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZjKx24cshg4qH8dD@landeda>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
 <41552f4a1dc68983bb3edfd6a2b466581f5f91e5.1714243078.git.yann.morin.1998@free.fr>
 <fc1cd1f1-de23-44a5-b27f-471d468445df@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc1cd1f1-de23-44a5-b27f-471d468445df@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714598368;
 bh=Jjy4B3s2GpneySJDpwyfsonvUrNeYv8UAYBN4h5Pai4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GJgBIM/6Y0tVZzLMQw/T1F1uK2Vjt0HKN1PXCL53wnUuE4f3i1ANx5XcKitilM25v
 Kjky7ckt65knAKPrPYTNYsEecGGv1gwSCXjCLczz2EEiy+rCbuTF/wj2KcaVKhqw4P
 TleDDngc4wsdYrsDq72MjneZ5jQlP01AZB5VvEzIQXjaVBza37NQsLInV+6uJFG6vq
 lgq32CoO5p0M+OpNT31CsZn7t2wLpKgbpjAtKinw04/rd8566Alvch57Ld737+zHh2
 A3qkAzTbmKe0bYsnAKxU2wGrr7Rkx3sJ0Rf1dzx2KsvvYbCFblOb+/3sis7IlFYmyf
 NuNENyc6v69TQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GJgBIM/6
Subject: Re: [Buildroot] [PATCH 06/15 v2] package/luajit: use the git
 download for known-reproducible tarball
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2024-05-01 22:53 +0200, Arnout Vandecappelle spake thusly:
> On 27/04/2024 20:37, Yann E. MORIN wrote:
> > Since version 2.1, LuaJIT follows a rolling-release scheme, which means
> > that any commit is as good as any other; LuaJIT uses the comitter's UNIX
> > timestamp as its semver patch level. It uses the git-attribute
> > export-subst for the .relver file that contains the %ct placeholderfor
> > git-archive to expand it.
> > 
> > We have had various instances of GitHub changing the way it generates
> > archives on the fly, and although it is hard to foresee a way the UNIX
> > timestamp could change (it's clearly defined as the number of seconds
> > elapsed since 1970-01-01T00:00:00Z), it's not inconceivable that GitHub
> > may decide to no longer expand the export-subst attributes in the
> > future...
> 
>  Although I don't really disagree with the principle, I think we should
> instead stop using github-generated tarballs entirely.

100% agreed. I was contemplating doing a mass conversion one of those
rainy days...

> Or, put differently:
> I think the risk of a github-generated tarball to change hash for _other_
> reasons is much higher than that it would stop expanding export-subst.

Yup, export-subst makes it only slightly more likely. :-]

>  So I will not apply this patch of the series.

This patch is mostly for correctness, and did fit with the purpose of
the series. But it is not strictly needed. So ACK.

Thanks!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > To avoid any confusion, and to be future-proof, switch over to using the
> > git download helper, which now has support for handling export-subst in
> > a reproducible way. Drop the post-extract hooks as they are not needed.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Francois Perrad <fperrad@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >   package/luajit/luajit.hash | 2 +-
> >   package/luajit/luajit.mk   | 3 ++-
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
> > index 578bb7a3e2..da243d8c2a 100644
> > --- a/package/luajit/luajit.hash
> > +++ b/package/luajit/luajit.hash
> > @@ -1,5 +1,5 @@
> >   # Locally calculated
> > -sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
> > +sha256  df50bfe78919691ce9a630c8312386a8cb6ca49f327922a833e77656e82ef6c6  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-br2.tar.gz
> >   # Locally calculated
> >   sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
> > diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> > index 693e22630b..6b1c6b3386 100644
> > --- a/package/luajit/luajit.mk
> > +++ b/package/luajit/luajit.mk
> > @@ -5,7 +5,8 @@
> >   ################################################################################
> >   LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
> > -LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
> > +LUAJIT_SITE = https://github.com/LuaJIT/LuaJIT
> > +LUAJIT_SITE_METHOD = git
> >   LUAJIT_LICENSE = MIT
> >   LUAJIT_LICENSE_FILES = COPYRIGHT
> >   LUAJIT_CPE_ID_VENDOR = luajit

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
