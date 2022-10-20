Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CA5C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0392F84397;
	Thu, 20 Oct 2022 20:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0392F84397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_ymoV_-NZBe; Thu, 20 Oct 2022 20:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05D98438C;
	Thu, 20 Oct 2022 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F05D98438C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6D9F1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1DC28438C
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 20:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DC28438C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQDf-N78AHcO for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 20:26:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5016D84381
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5016D84381
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 20:26:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e722:2033:afe6:a970])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9F6155FFA6;
 Thu, 20 Oct 2022 22:25:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Oct 2022 22:25:57 +0200
Date: Thu, 20 Oct 2022 22:25:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Richter Simon <simon.richter@ptwdosimetry.com>
Message-ID: <20221020202557.GA2992523@scaer>
References: <20221019161513.994988-1-simon.richter@ptwdosimetry.com>
 <20221019205236.GG3666@scaer>
 <AM0PR09MB3411C21E0EF14DF3040DCFD38B2A9@AM0PR09MB3411.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM0PR09MB3411C21E0EF14DF3040DCFD38B2A9@AM0PR09MB3411.eurprd09.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666297559;
 bh=w9l2oRguFLV0nayNjQpxuJNhLgOD8VnXnul9j2m4S0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QajJHa6SopKT4rfNTkW9x8ScLnGB7D3tHAujUAPvtdiy0uRezJE/OiHbfUAfd2+Z4
 rK+kJL+0U4QESejBQc+tJB9xZhorVQWQZr6+PgGAIAnEhpJc81KI3b6Sr1adWoMJNV
 9wW8XpkKA+ppj2lXmD8LUroG3CipmBrVQr3DuBY90hoZJYFdCo5RwhOB1AVYCpVxYb
 SF4Em5ryxOe0JXURxDaCbQeyBQ3rSeshd4tMbAw5n272FKkNaDMVbwgBG5ZgO++p7j
 WKy5oFlLQO71VCTWJs49AFfBZePjBbnRTHzGgdMW87WwMoOqbyk3oR8nTFxp3Nie+L
 dHgjAOoLKh0Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QajJHa6S
Subject: Re: [Buildroot] [PATCH 1/1] support/download/cargo-post-process:
 use cargo output for vendor config
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simon, All,

On 2022-10-20 18:16 +0000, Richter Simon spake thusly:
> Am 19.10.22 um 22:52 schrieb Yann E. MORIN:
> > Could you provide a bit more details on how this works? 
[--SNIP--]
> But if a project needs dependencies from other sources, say github,
> there needs to be an extra entry for each non-crates.io dependency.
> As an example, here is the needed vendor config for conduit - a 
> matrix homeserver.
> (https://gitlab.com/famedly/conduit
> rev cb2b5beea8a3fb27ed514ee9e46b5729aa272179)
> 
>     [source.crates-io]
>     replace-with = "vendored-sources"
>     
>     [source."https://github.com/ruma/ruma"]
>     git = "https://github.com/ruma/ruma"
>     rev = "fba6f70c2df8294f96567f56464a46e3d237a8e9"
>     replace-with = "vendored-sources"
>     
>     [source."https://github.com/timokoesters/heed.git"]
>     git = "https://github.com/timokoesters/heed.git"
>     rev = "f6f825da7fb2c758867e05ad973ef800a6fe1d5d"
>     replace-with = "vendored-sources"
>     
>     [source."https://github.com/timokoesters/reqwest"]
>     git = "https://github.com/timokoesters/reqwest"
>     rev = "57b7cf4feb921573dfafad7d34b9ac6e44ead0bd"
>     replace-with = "vendored-sources"
>     
>     [source.vendored-sources]
>     directory = "vendor"

Ok, thanks, that helps see the overal concept.

I see all the above use git repositories directly, so I suspect this is
going to cause explicit git-clone + build (that's OK). However, I was
also wondering if one could have a "registry" like crates.io, either
internal to a company, or another public resource elsewhere, and how
that would work...

> > Also, can we have a package that uses non-crates.io dependencies, so
> > that we have a test-case to ensure we have no regression?
> I'm not sure if i understood that correctly. Do you mean bringing a
> package into buildroot

Yes, I was wondering if there was a publicly visible package that we
could cary in Buildroot, so that we know the feature would be regularly
exercised. You pointed to conduit: it wouldbe good to have it packaged
in Buildrooot.

[--SNIP--]
> > Can we keep the vendoring to stdout as it currently is, and re-run it
> > right after, just to generate the config.toml file? I.e. something like:
[--SNIP--]
> While digging around i found the following solution:
>     cargo vendor \
>         --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
>         --locked VENDOR \
>     | tee .cargo/config
> 
> Cargo seems to print all progress output to stderr but not the needed
> output for the config. This goes to stdout. So we only have to tee stdout 
> to the .cargo/config file. I will update the patch accordingly.

Great! :-)

Please, also note that this has the potential to generate different
hashes, so please check existing cargo packages to see what breaks.

If we can't keep generating the same archives, then we must find a way
to dfferentiate the newer archives so they do not clash with the older
ones. Something like:

    diff --git a/package/pkg-download.mk b/package/pkg-download.mk
    index 0718f21aad..e247fd38c5 100644
    --- a/package/pkg-download.mk
    +++ b/package/pkg-download.mk
    @@ -22,6 +22,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
     # download backend:
     BR_FMT_VERSION_git = -br1
     BR_FMT_VERSION_svn = -br2
    +BR_FMT_VERSION_cargp = -cargo1

     DL_WRAPPER = support/download/dl-wrapper

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index 0945e6ed31..7486d12499 100644
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

Note: this is probably not sufficient, but that gives you a lead if
needed. Also, we'd need a comment at the top of the cargo-post-process
helper, like we have at the top of the git helper for example.

> > Finally, unrelated to your change: if the package already has a
> > .cargo/config.toml, then we irremediably override it. Is there something
> > in that file that would otherwise be required to do the build?
> 
> Yes, i noticed that too. Overwriting a possibly existing project specific
> configuration is not good.
> I think this also should be changed (in a different patch, as mentioned).

Or we can wait for until something actually needs it, so that we do have
an actual case to look at.

> > Can we simply append to the file rather than overwrite it, i.e.:
> > .... >> .cargo/config.toml
> 
> Unfortunately it is not that simple because of two reasons:
> 
> 1. cargo looks for a .cargo/config or (up from cargo 1.39) a 
> .cargo/config.toml file for configuration. If both files exist, cargo uses 
> .cargo/config and ignores the .cargo/config.toml file.
> 
> 2. if configuration entries for vendoring already exist in a configuration, 
> it is not allowed to add them again. Cargo will not build the project if a 
> corresponding entry exists more than once.
> 
> The first case would be quiet easy to address but the second one would
> need some sort of merging.

Yes, so that all calls for waiting until we do have an actual issue.

> So, speaking for this patch, i would keep the current behavior "overwrite
> every possibly existing config with the vendoring information".

Yes, because that has so far not caused an issue (at least that we
noticed), so this means it is not an actual problem.

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
