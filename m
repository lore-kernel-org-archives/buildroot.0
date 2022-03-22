Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B54CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 17:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20198483D;
	Tue, 22 Mar 2022 17:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OFVX33aWeOt; Tue, 22 Mar 2022 17:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82B784801;
	Tue, 22 Mar 2022 17:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8703E1BF5DD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 759B041846
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 17:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbwKVfVsHWcl for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 17:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23A9D417D5
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 17:05:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ab:a478:3667:b2e8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE04A13F85A;
 Tue, 22 Mar 2022 18:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647968750;
 bh=whOVw0OGnpvnNQHUE/D4I8ET3gyC7MAqqZ4ibT+gFL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFcsTdIll+7pg5yOnZMhr7hutjNzBkfcx2woJZUmeH2fsn4rTTgUfqibHLUjlxa9K
 gBN5X1F0KrNL9OzSSIgDnRqL9wn5Gef7i6t9ugwtkUwBbaCta7cGiDr5sJ8SriYBpp
 yCGs+uEcYoo47Au3qHskm+i0LZp+9/hW6C3B5VSrD3XNwTFrETfSL2KU0m7JLupVI/
 0UUvqVo7dp2phwUIlTKJRnHIiBTcDTFnFORSk399gk1pxHTWgwFk8MDnlapr7du6aX
 31xVzLzeh4lT8Ol+ESJmnvNDPeoh2SVr6lNfk8oedy56JTu/PyfGBA2lLMcMwLgeR+
 goD3GbIX7zLPg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 22 Mar 2022 18:05:45 +0100
Date: Tue, 22 Mar 2022 18:05:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220322170545.GA3355310@scaer>
References: <20220322051448.2589854-1-christian@paral.in>
 <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qzrqF-1i9w1T0aCOp5MJCk_fPxPQFC+Uj7CsF9pgc3uA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/go: bump to version 1.18
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-03-21 22:18 -0700, Christian Stewart spake thusly:
> On Mon, Mar 21, 2022 at 10:14 PM Christian Stewart <christian@paral.in> wrote:
> > The latest Go release, version 1.18, is a significant release, including changes
> > to the language, implementation of the toolchain, runtime, and libraries.
> I should note that this upgrade also will change a lot of the Go
> package hashes...
> 
> Due to the way the "go mod vendor" step works, there's some
> incompatibility with the go 1.17 vendor format:
> 
> go: inconsistent vendoring in /build/containerd-1.5.9:
>         github.com/containerd/containerd: is marked as replaced in
> vendor/modules.txt, but not replaced in go.mod
> 
>         To ignore the vendor directory, use -mod=readonly or -mod=mod.
>         To sync the vendor directory, run:
>                 go mod vendor
> 
> We will need to update the hashes and the archives for these packages.

This is a no-go. We can't change hashes, otherwise there will be a
conflict with the hashes of the backup download we store on
sources.buildroot.org.

Probably, the best solution forward would be to introduce a version
suffix for the post-process. I quickly hacked something around:

    diff --git a/package/pkg-download.mk b/package/pkg-download.mk
    index a15e21e110..74369fc946 100644
    --- a/package/pkg-download.mk
    +++ b/package/pkg-download.mk
    @@ -22,6 +22,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
     # download backend:
     BR_FMT_VERSION_git = -br1
     BR_FMT_VERSION_svn = -br2
    +BR_FMT_POST_PROCESS_go = -brgo1
     
     DL_WRAPPER = support/download/dl-wrapper
     
    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index 7d1aea7710..e317750967 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -43,7 +43,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
     # Helper to build the extension for a package archive, based on various
     # conditions.
     # $(1): upper-case package name
    -pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD)).tar.gz
    +pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_POST_PROCESS_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz
     
     # Define extractors for different archive suffixes
     INFLATE.bz2  = $(BZCAT)

So, basically, we would need a series that does:

 1. introduces the post-process versionning as shown above, and update
    the hashes accordingly

 2. update go to 1.18, which at the same time updates the newly
    introduced post-process versionning, and update the hashes yet
    again.

Regards,
Yann E. MORIN.

> Unfortunately I don't know of any way to avoid this, other than
> re-running "go mod vendor" if there's any conflict.
> 
> Thanks & best regards,
> Christian Stewart

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
