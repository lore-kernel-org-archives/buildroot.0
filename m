Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE00C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 16:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1C5F40104;
	Sun, 16 Oct 2022 16:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1C5F40104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIAZ7J-sY8JN; Sun, 16 Oct 2022 16:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6AC740445;
	Sun, 16 Oct 2022 16:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6AC740445
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 974E71BF471
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7159960AB3
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 16:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7159960AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaLQS02zFduF for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 16:27:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2144460A68
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2144460A68
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 16:27:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EF1FE13F892;
 Sun, 16 Oct 2022 18:26:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Oct 2022 18:26:54 +0200
Date: Sun, 16 Oct 2022 18:26:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221016162654.GL2503@scaer>
References: <20221015005611.4054933-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221015005611.4054933-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665937617;
 bh=K7dWBQ3CGqLpKKa+7/H0mMPeYo7UGdLgJZdsn5l0GdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgpELjjXV5DoB6d4bQzbECUUGStpm4Tl7czbCVCwmhjiN2MwF3diiWEklqx0eK7m2
 gaD/gTZvft2ZEJfJIzPyX6ZWT1PRWzvJlldz+CjgfuJ6Od+9KG6pF6QLJO38FX62oP
 hKApqsWt62vevff4Ux1E5aYp0XbFaVS6O86MddnRm9hPdklIrP8Mlu0N4q5WgGL1OX
 AFDhzuB1wDpldsry4JvBThC4xy+Hg/aNvdXGawHBkifdWG948g5Uul7vJ36470nA/h
 aKJ01QGItE6HEG4FWVCsZ+vHhiZZQEwl2NuSrJf+Avgc1OMwuGdh+7TXxOxxRcpYnd
 okROk5A5KD5rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fgpELjjX
Subject: Re: [Buildroot] [PATCH 1/1] package/Makefile.in: set .NOTPARALLEL
 for MAKE1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-14 18:56 -0600, James Hilliard spake thusly:
> Make 4.4 introduces a shuffle mode which randomizes prerequisites
> in order to better flush out issues with parallel builds, as this
> mode randomizes prerequisites even when using -j1 builds we must
> instead explicitely mark parallel incompatible builds using the
> .NOTPARALLEL special target which disables prerequisites
> randomization when running in shuffle mode.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 43d214bcbe..2327849a1f 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -17,7 +17,7 @@ else
>  PARALLEL_JOBS := $(BR2_JLEVEL)
>  endif
>  
> -MAKE1 := $(HOSTMAKE) -j1
> +MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:

Packages that do not build in parallel do not because their rules assume
the ordering is kept.

I don't see how replacing -j1 with --eval .NOTPARALLEL: would cause the
ordering to be restored.

Instead, I would have expected we do something like:

    # Only build one job at a time, *and* to not randomise goals and
    # prerequisites ordering in make 4.4+
    MAKE1 := $(HOSTMAKE) -j1 $(if $(findstring --shuffle,$(MAKEFLAGS)),--shuffle=none)

Regards,
Yann E. MORIN.

>  override MAKE = $(HOSTMAKE) \
>  	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
>  
> -- 
> 2.34.1
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
