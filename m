Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E730BEEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D52F4033F;
	Fri,  8 Sep 2023 21:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D52F4033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5Fmd9j5AKsU; Fri,  8 Sep 2023 21:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894BE4056C;
	Fri,  8 Sep 2023 21:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 894BE4056C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B80B1BF31C
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 21:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E26881EAE
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 21:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E26881EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_sP4DumNrIf for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 21:58:24 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E2F81E7E
 for <buildroot@busybox.net>; Fri,  8 Sep 2023 21:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E2F81E7E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9f38:6a79:f13c:a703])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C139A19F57B;
 Fri,  8 Sep 2023 23:58:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 08 Sep 2023 23:58:18 +0200
Date: Fri, 8 Sep 2023 23:58:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230908215818.GB2693@scaer>
References: <20230908064944.2558686-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908064944.2558686-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694210301;
 bh=wEH5WLO+b5u9AtHS6T2+kQvP2ufFzVuuIAJU6uq7xNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+BpScY8E0id7RLKCNQVyXYwnB1Bi9X5CUVVOPg3q1FtFmlJs831QDZA3/B2co5Pl
 eu4F6aKyU+c7vwLAarsFTPGGhZ6k0zltHrJdl9pAZ1Zlw68uE/wRGygMd95AFUQp/c
 7AMxk4cqgayMIkke6kS0tAmtnWT2+8YJgSkZw31fc6S769tI+DjP3ESSEt3HqQfrmy
 LhlFeEHw7IY6/jHWanw4slOzFclPqibR1qzKS9rcOHTG07RQFwD8UQVSOL8kMjN1f3
 hrmET0k113e6xQvpZjgtlRkTbk7BiEFBUI46ByZ5QKYNAwPJ9DS1V/KXsQgPEUtZSm
 M6uioNxTm0RJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c+BpScY8
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 41fb94defa8f830ce69a8122b03f6ac3216d392a
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francois, All,

On 2023-09-08 08:49 +0200, Francois Perrad spake thusly:
> The LuaJIT project switches to a rolling release scheme.
> Now, the version contains the timestamp of the latest commit.

Containing a timstamp is not a problem per-s. The problem is that is
done with a .gitatrribute, so is replaced on the github side, and this
has proven to be non-reproducible.

The format is %ct, which is a the committer's UNIX timestamp. In
practice, that one is reproducible, but we don't want to get bitten,
so we want to use a constanto, see below...

> So, we need to switch to the SITE_METHOD to git.
> 
> The timestamp can be seen in build log:
> ==== Successfully installed LuaJIT 2.1.1693350652 to /usr ====
                                         ^^^^^^^^^^^
This is not the tiemstamp that you would have expected, see below too...

> 
> diff COPYRIGHT:
> -Copyright (C) 2005-2022 Mike Pall. All rights reserved.
> +Copyright (C) 2005-2023 Mike Pall. All rights reserved.

Please, don't write unindented diff-like blurbs in commit logs; they
screw up patchwork:

    https://patchwork.ozlabs.org/project/buildroot/patch/20230908064944.2558686-1-francois.perrad@gadz.org/

If you ant to provide a diif-like blurb (the one you provide, indented
it. Besides, a commit log is not a machine-readable section; it's meant
for users to review and udnerstand the change, so I'd prefer to read:

    Hash for the COPYRIGHT file changed, due to an update in the
    copyright years.

That is enough for us to know that you actually looked at the diff, and
that is enough to understand that the licensing terms did not change,
which is the whole point of trackign the hashes for the license files:
to detec ta change in licensing terms.

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
[--SNIP--]
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 2a27aa505..db3bdc913 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -LUAJIT_VERSION = 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
> -LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
> +LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
> +LUAJIT_SITE_METHOD = git
> +LUAJIT_SITE = https://github.com/LuaJIT/LuaJIT.git
>  LUAJIT_LICENSE = MIT
>  LUAJIT_LICENSE_FILES = COPYRIGHT
>  LUAJIT_CPE_ID_VENDOR = luajit
> @@ -33,6 +34,14 @@ LUAJIT_HOST_CC = $(HOSTCC) -m32
>  LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
>  endif
>  
> +# emulation of git archive with .gitattributes & export-subst
> +define LUAJIT_ROLLING_VERSION
> +	cd $(LUAJIT_DL_DIR)/git && $(GIT) show -s --format=%ct $(LUAJIT_VERSION) > $(@D)/.relver

This is incorrect, for two reasons:

 1. if there is a git tree, it will not be the expected one: the archive
    Buildroot generates does not have the .git of the upstream project,
    so for in-tree builds, this would be the Buildroot git tree.

 1. there might not even be a git tree available: for out-of-tree builds
    as for Buildroot release tarballs, there will be no git tree
    available.

Here, all you are interested in is probably just the tiemstamp, which is
a constant, so;

    # Tiemstamp of the $(LUAJIT_VERSION) commit, obtained in the LuaJit
    # repo, with:   git show -s --format=%ct $(LUAJIT_VERSION)
    define LUAJIT_ROLLING_VERSION
        echo 1689194086 >$(@D)/.relver
    endef
    LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_ROLLING_VERSION
    HOST_LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_ROLLING_VERSION

Regards,
Yann E. MORIN.

> +endef
> +
> +LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_ROLLING_VERSION
> +HOST_LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_ROLLING_VERSION
> +
>  # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
>  # build system uses non conventional variable names.
>  define LUAJIT_BUILD_CMDS
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
