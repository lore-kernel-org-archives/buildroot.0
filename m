Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA7C0032E
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8567F84D07;
	Sat, 21 Oct 2023 20:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8567F84D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ltzop-5K8RR; Sat, 21 Oct 2023 20:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC47F84F07;
	Sat, 21 Oct 2023 20:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC47F84F07
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E80A71BF47F
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 20:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10CB611F3
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 20:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10CB611F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AgCscT_onRJ for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 20:36:24 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5B84611ED
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 20:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B84611ED
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 06D286012D;
 Sat, 21 Oct 2023 22:36:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Oct 2023 22:36:18 +0200
Date: Sat, 21 Oct 2023 22:36:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231021203618.GE2607@scaer>
References: <20231018141155.533944-1-vfazio@gmail.com>
 <fc416325-98e6-04e2-6ea9-e48053c2c302@mind.be>
 <20231021202525.GD2607@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231021202525.GD2607@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697920582;
 bh=v+bvTtrug4iHCHd81W6IqbKPgS/wLy+iOlMMsISEU/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M9cYdaIuf26CJP16xQZ4dhesS5CiYe5BF6pMKT9gw+1ZN0RdAopbL8RISatfhX2GO
 DtJyudk9NZX5pCygWFhQqEEUxajc8fS/Me0VPGRoDm9aDGUQW2Qk92t0XGc17PFl5e
 znjBw56CBALHaXFmT5UkGIpr5bLZ7o5Tnw0LSDJO2mEB6P/Qf89J89HI3jrG8Z4mz0
 A6qthvwC2ku8qzzTlVLccZsePOJVENjYlDLsoc3n1VYrvpK6adR5OqrLSsYwuFDw/J
 rtnzIZlLRmMf3BH3sxt3mudSG7IjOcT5yjTRkhtAILPgqDVB7awwPkzQHdI+hmjfJR
 NeIZJUew0jcGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M9cYdaIu
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
Cc: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, Arnout, All,

On 2023-10-21 22:25 +0200, Yann E. MORIN spake thusly:
> On 2023-10-18 19:43 +0200, Arnout Vandecappelle via buildroot spake thusly:
> > On 18/10/2023 16:11, Vincent Fazio wrote:
> > >GNU tar 1.35 includes a breaking change [0] that changes the tar header
> > >created for each regular file even for "stable" formats like pax (which
> > >we use in support/download/helpers::mk_tar_gz).
[--SNIP--]
> > >diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > >index e5cd83d859..d33eb2d811 100644
> > >--- a/package/pkg-download.mk
> > >+++ b/package/pkg-download.mk
> > >@@ -20,8 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
> > >  # Version of the format of the archives we generate in the corresponding
> > >  # download backend:
> > >-BR_FMT_VERSION_git = -br1
> > >-BR_FMT_VERSION_svn = -br3
> > >+BR_FMT_VERSION_git = -br2
> > >+BR_FMT_VERSION_svn = -br4
> >  Vendored cargo and go packages will have the same issue, no? Those will
> > need to be updated as well...
> Good catch, indeed. I'll try and resurect my patch to add a -br suffix
> to those...

I think it was basically just that:

     b/package/pkg-download.mk |    1     1     0     0 +
     b/package/pkg-utils.mk    |    2     1     1     0 +-
     2 files changed, 2 insertions(+), 1 deletion(-)

    diff --git a/package/pkg-download.mk b/package/pkg-download.mk
    index e5cd83d859..5ad3f2baaf 100644
    --- a/package/pkg-download.mk
    +++ b/package/pkg-download.mk
    @@ -22,6 +22,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
     # download backend:
     BR_FMT_VERSION_git = -br1
     BR_FMT_VERSION_svn = -br3
    +BR_FMT_VERSION_cargo = -cargo1

     DL_WRAPPER = support/download/dl-wrapper

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index 7c670ee615..95a8452db8 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -48,7 +48,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
     # Helper to build the extension for a package archive, based on various
     # conditions.
     # $(1): upper-case package name
    -pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD)).tar.gz
    +pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz

     # Define extractors for different archive suffixes
     INFLATE.bz2  = $(BZCAT)

Toally untested.

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
