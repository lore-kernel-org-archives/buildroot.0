Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B56C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5DFD4046B;
	Wed, 10 Jan 2024 22:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DFD4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNecS0RPYVet; Wed, 10 Jan 2024 22:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8359943765;
	Wed, 10 Jan 2024 22:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8359943765
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA9A01BF304
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0CF06156E
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0CF06156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INyqcDohx2Cb for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:05:37 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE9D8614BD
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9D8614BD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 173D5B00548;
 Wed, 10 Jan 2024 23:05:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 23:05:30 +0100
Date: Wed, 10 Jan 2024 23:05:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZZ8UqtSUB__HygtP@landeda>
References: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
 <20240110211223.791548-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110211223.791548-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704924335;
 bh=tKkdH1DALN8+78YuNPXAp0B4w+tvlrO/770c/C1Q+WM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJbf34T8Zzxy1KLZGhtskoOBScCghVpBD3Avrhj8l26dIthtVbljDUkb6wlr+iqVH
 OJqC5RJQb3NZrQwza3RJvOkc2rW0uuPaFZNEu16r1nvtp6jOIZEYi5hQxuALD63qWT
 zAABdvyMxo3bTN+BF7IMYxhO1Fjy1/MqZ5fWoDyxrl/rAjKcjMWI6VLWL/SEdLKrny
 X5klhn2zAF4ENcJnYXb2p/SkM57Xoqx1R7iIi+rWRqEpYjE4Zl198Oj7GpeW53gpmt
 9uOD+rRP24nhgabAYpS64b2TYWGaT/9RbsJANUdEO2WUEzutY4+YSPzc65vw+tvwRC
 saFZRq0vj5jaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cJbf34T8
Subject: Re: [Buildroot] [PATCH v2 2/3] package/libtraceevent: bump to
 version 1.8.2
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2024-01-10 22:12 +0100, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> V1->V2:
> * add new patch
> ---
>  package/libtraceevent/libtraceevent.hash | 2 +-
>  package/libtraceevent/libtraceevent.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
> index 14dcf54c67..c338491f26 100644
> --- a/package/libtraceevent/libtraceevent.hash
> +++ b/package/libtraceevent/libtraceevent.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  1801f416b317e2ae0430ce964cf22b9ecb9fb5cd9c6c2d1073b29953c3309bca  libtraceevent-1.8.1.tar.gz
> +sha256  919f0c024c7b5059eace52d854d4df00ae7e361a4033e1b4d6fe01d97064a1b9  libtraceevent-1.8.2.tar.gz
>  sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
>  sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
> diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
> index d348fc51f6..da0aa575d7 100644
> --- a/package/libtraceevent/libtraceevent.mk
> +++ b/package/libtraceevent/libtraceevent.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTRACEEVENT_VERSION = 1.8.1
> +LIBTRACEEVENT_VERSION = 1.8.2
>  LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
>  LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
>  LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
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
