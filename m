Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 19:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11FA408A3;
	Mon, 12 Dec 2022 19:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11FA408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lttih49mBvK; Mon, 12 Dec 2022 19:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E627D403F8;
	Mon, 12 Dec 2022 19:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E627D403F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 066E71BF35E
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1522415F0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1522415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyEQ_9pPtH2g for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 19:47:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64EF1415C7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64EF1415C7
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 19:47:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed9d:5312:e657:8b79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 36A2D200385;
 Mon, 12 Dec 2022 20:47:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 12 Dec 2022 20:47:08 +0100
Date: Mon, 12 Dec 2022 20:47:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221212194708.GB1807803@scaer>
References: <20221212172724.4364-1-fontaine.fabrice@gmail.com>
 <20221212172724.4364-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212172724.4364-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670874432;
 bh=qOLE1xdtF6KttV5bM9OVia1WLNCiL3FEmNzX9vv1EZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XI9qfF9pa0rbOYsUVI+KJZmC7/pl2cd6DsbdrhrWjC4pARkSppEgphh3pUHvYr7X3
 ApZNrqTzDBKZZUFB9DE6hys7blepndQAlKXwicHRb/JmPj2EuI3tnUaeaSanElL3fB
 OWnjaAuJzaZV7LyGoMNMgh20lKsFYEJYC1i1hOYgaGCmX3rvNp+1ckrC26gy0O+5Bf
 ZWFzSgM5IwhIElPLl5eT3JOkC/ZJDcqLYVDQra+81mQrk3N29NCmcF7F4cu3KwyKYC
 roQbHDVJ6+Wi6DVhxrYHuYlOO9nR5PXNF7P02xjy7kYfe1mX3VtsJGtGaxPwWZekPK
 QoFM70F5sA93w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XI9qfF9p
Subject: Re: [Buildroot] [PATCH 2/2] packaeg/libmbim: fix license files
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-12 18:27 +0100, Fabrice Fontaine spake thusly:
> Commit i57bea338e95e49bf1f2405908462686306044825 forgot to update
> license files:
> https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/bb3091e2c8d44caccfb868505a730a4ac5a48b44
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/06cb9426d097657b669b7970994584592bac9868
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libmbim/libmbim.hash | 4 ++--
>  package/libmbim/libmbim.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
> index 2e2b46fcdb..8e7633cb94 100644
> --- a/package/libmbim/libmbim.hash
> +++ b/package/libmbim/libmbim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
>  sha256  cf74682c56f4c34ca4aee86de3b8c425a89fc2c0782052815295faf6a8e0a9fb  libmbim-1.28.2.tar.gz
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
> diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
> index e728cf58f9..59f55a57bc 100644
> --- a/package/libmbim/libmbim.mk
> +++ b/package/libmbim/libmbim.mk
> @@ -7,7 +7,8 @@
>  LIBMBIM_VERSION = 1.28.2
>  LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
>  LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
> -LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
> +LIBMBIM_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-or-later.txt LICENSES/LGPL-2.1-or-later.txt
>  LIBMBIM_CPE_ID_VENDOR = freedesktop
>  LIBMBIM_INSTALL_STAGING = YES
>  
> -- 
> 2.35.1
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
