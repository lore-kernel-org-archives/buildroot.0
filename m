Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A04CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 148F14176C;
	Sun, 24 Sep 2023 10:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 148F14176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZCNdEO1AESj; Sun, 24 Sep 2023 10:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF56741953;
	Sun, 24 Sep 2023 10:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF56741953
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 029D71BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05A54151A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05A54151A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1DMy1m7xRE4 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:35:32 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2CA6400EC
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2CA6400EC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4118B7802D6;
 Sun, 24 Sep 2023 12:35:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:35:28 +0200
Date: Sun, 24 Sep 2023 12:35:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924103528.GL1469982@scaer>
References: <20230923114850.1477656-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923114850.1477656-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551730;
 bh=udUQf7Ooo5nm+E8Per5DpVsUCJDLsPtQLdUOiONuSxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O2LDRyh9n1krnCE1+/yX6B4BYLmbk4zdldZuUIqFn0qHmvhSq4c7jzP9rT3GL7A9K
 sZfbZJukdqXRN9mIslglKHEWZcFtgVS/LmImN4BjW1T6kcpqsDLz7yIS/S6LuFKVwl
 yTrkpjGl0zuXZHwvi95mXA/iD8A7vs0CAm/6tD6E5LtggWwbuOrGP5LJbTC3JJHoiV
 UY6iYRXW9dNRP8oavp5H3tOHmASTRRP7f8T9+LBACGJZlUXP/88qG8zbWFl+Ieaozm
 TWT35zc2U0t4spGj1GJ5uGosHCNN8YcnjGzmNf3I9Pmp+n7wI6/4anIy8sEqx2HdHy
 785Nl2XxTiSCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O2LDRyh9
Subject: Re: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.20.0
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

Bernd, All,

On 2023-09-23 13:48 +0200, Bernd Kuhls spake thusly:
> Release notes: https://github.com/intel/libva/blob/v2.20-branch/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libva/libva.hash | 2 +-
>  package/libva/libva.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libva/libva.hash b/package/libva/libva.hash
> index b9dba9e91a..2fffe8701f 100644
> --- a/package/libva/libva.hash
> +++ b/package/libva/libva.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  8cb5e2a9287a76b12c0b6cb96f4f27a0321bbe693df43cd950e5d4542db7f227  libva-2.19.0.tar.gz
> +sha256  117f8d658a5fc9ea406ca80a3eb4ae1d70b15a54807c9ed77199c812bed73b60  libva-2.20.0.tar.gz
>  sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
> diff --git a/package/libva/libva.mk b/package/libva/libva.mk
> index fd796cfd6a..9e9d5d698c 100644
> --- a/package/libva/libva.mk
> +++ b/package/libva/libva.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBVA_VERSION = 2.19.0
> +LIBVA_VERSION = 2.20.0
>  LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
>  LIBVA_LICENSE = MIT
>  LIBVA_LICENSE_FILES = COPYING
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
