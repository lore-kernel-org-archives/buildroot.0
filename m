Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111E1C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A2E440AA0;
	Sun, 17 Jul 2022 21:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A2E440AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWqVhSWHC6b8; Sun, 17 Jul 2022 21:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9646440A95;
	Sun, 17 Jul 2022 21:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9646440A95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83FE41BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C8D041681
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C8D041681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a34tS4oq9ms for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:22:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D823340028
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D823340028
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:22:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C111F13F8B3;
 Sun, 17 Jul 2022 23:22:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 23:22:13 +0200
Date: Sun, 17 Jul 2022 23:22:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717212213.GZ2249625@scaer>
References: <20220710212822.876720-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710212822.876720-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658092936;
 bh=9XYu51QSQJhVtXIILwWrevGVhFqKSq7MM6PLvps7ga4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QBWDAxHwIWhAYRUVn3H8bvdkeClpHIw0xPJGXPbtDyrJASyl11JQC0ZWN5Q+htMCl
 /4lH4iRPqSNg1OUs/bh5sascO/IqVm41rk2TSdTisiG7aJntw5urV5rEoD1C1mHR/l
 tghb68QFKzuVsdrW0AwGSe8yc34o6OWFHKEGjQZOKlYW3kJ/fKy9yzicEWUDjeQNto
 hXGR0P+e5005/RG8F8UKT6hX3WZ51mFBLJfLlkVkiGDgMJOqaX/QFvRWvBdTmK3B40
 A+N0OO+gigqBfVyHCrL1slFQipEBxnknhcwd0Y7F9vSmUZ5Ulguo3P86wDCa5I4dZp
 v/pwftKK6ORrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QBWDAxHw
Subject: Re: [Buildroot] [PATCH 1/2] package/kvazaar: bump to version 2.1.0
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-10 23:28 +0200, Fabrice Fontaine spake thusly:
> - Use official tarball and so drop autoreconf
> - License is BSD-3-Clause and ISC since
>   https://github.com/ultravideo/kvazaar/commit/57883369ca05bee0dbc0b36fb2c78985f906a523
> - Update indentation in hash file (two spaces)
> 
> https://github.com/ultravideo/kvazaar/releases/tag/v2.1.0
> https://github.com/ultravideo/kvazaar/releases/tag/v2.0.0
> https://github.com/ultravideo/kvazaar/releases/tag/v1.3.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kvazaar/kvazaar.hash |  6 ++++--
>  package/kvazaar/kvazaar.mk   | 10 +++++-----
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
> index fe3255a6c7..20b8e5918e 100644
> --- a/package/kvazaar/kvazaar.hash
> +++ b/package/kvazaar/kvazaar.hash
> @@ -1,3 +1,5 @@
>  # Locally calculated
> -sha256 480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9  kvazaar-1.2.0.tar.gz
> -sha256 531712277c3543b9ee86c4c4e0e424f531b893a44cc021c74a24b038d8de4d2a COPYING
> +sha256  a76998462924ab8409cf8de4947ba5a5023daa33207676e9c4eefc2bbd46c834  kvazaar-2.1.0.tar.xz
> +sha256  4caf7852236f62bfd77aac10a7b9a42372b00aa461ad8912780cd865a39062ff  LICENSE
> +sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.greatest
> +sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.x264asm
> diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
> index 29433d6eb3..e2ab132203 100644
> --- a/package/kvazaar/kvazaar.mk
> +++ b/package/kvazaar/kvazaar.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -KVAZAAR_VERSION = 1.2.0
> -KVAZAAR_SITE = $(call github,ultravideo,kvazaar,v$(KVAZAAR_VERSION))
> -KVAZAAR_LICENSE = LGPL-2.1+
> -KVAZAAR_LICENSE_FILES = COPYING
> -KVAZAAR_AUTORECONF = YES
> +KVAZAAR_VERSION = 2.1.0
> +KVAZAAR_SOURCE = kvazaar-$(KVAZAAR_VERSION).tar.xz
> +KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAAR_VERSION)
> +KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
> +KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
>  KVAZAAR_INSTALL_STAGING = YES
>  KVAZAAR_DEPENDENCIES = host-pkgconf
>  KVAZAAR_CONF_OPTS = --without-cryptopp
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
