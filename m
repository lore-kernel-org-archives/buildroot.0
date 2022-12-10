Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8ECC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB6660B3B;
	Sat, 10 Dec 2022 21:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB6660B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynQhXGGP-lXr; Sat, 10 Dec 2022 21:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE29260AE4;
	Sat, 10 Dec 2022 21:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE29260AE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0901BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D4D404A1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D4D404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2vuQ_clsxyu for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:10:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA04404A0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BA04404A0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:10:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 643E25FF9A;
 Sat, 10 Dec 2022 22:10:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 22:10:35 +0100
Date: Sat, 10 Dec 2022 22:10:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221210211035.GF1044805@scaer>
References: <20221210201240.3504734-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210201240.3504734-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670706641;
 bh=HH3ILE+KWuEZQj8UKVHG2zR1891eZoglFo0D46cbDmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjXRbXy9JLmCXBkW8yZhR0GXm2+PDy2cFbPaWWlcWmCSiJwXX3GVJh3ZSCklEgPaU
 +K+xj3gZ1LuXdxaiosa2ALICJGl3h2QioRUyeZFqvpWtMj9hZeKiEQ6x1B5cOKL+jP
 qdHxGyVg/BaBpFgQ18lEiXqKwqIov48TljT8am2ICIJgdR51XilHaioU4fDqE1b0k8
 U1gxzZJB2WXyjl2RDjLvyk7Dhkqw8RisIY+jHOTbspyjIyy/dCdcCVmjIEruswWXdE
 TtVYUiTgX/qpWs3sWtp2nprWhcV+Q4C6Oj+O1U68Sln9u6scUrsRd21pvuLSDoXq0Q
 f1OnRw3guVTKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IjXRbXy9
Subject: Re: [Buildroot] [PATCH 1/2] package/mupdf: bump to version 1.21.0
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
Cc: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-12-10 13:12 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mupdf/mupdf.hash | 4 ++--
>  package/mupdf/mupdf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
> index fa24e741c7..6785aa163a 100644
> --- a/package/mupdf/mupdf.hash
> +++ b/package/mupdf/mupdf.hash
> @@ -1,8 +1,8 @@
>  # From https://mupdf.com/downloads/index.html:
> -sha1  f27108668e876b47d7438e2a8b2295654e66f42d  mupdf-1.20.3-source.tar.lz
> +sha1  27d75cae256450abb9f50cd00b3e5a895fc684cf  mupdf-1.21.0-source.tar.lz
>  
>  # Locally computed:
> -sha256  6f73f63ef8aa81991dfd023d4426a548827d1d74e0bfcf2a013acad63b651868  mupdf-1.20.3-source.tar.lz
> +sha256  f23fc1ad9081375d9c5f2318d6e6e5c5be490ecb70b10ed7167932afbe1ccfb5  mupdf-1.21.0-source.tar.lz
>  
>  # Hash for license files:
>  sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 1fc54b2d35..e93a41bd00 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # python-pymupdf's version must match mupdf's version

As the comment states, both packages must have the same version, so they
must be updated in the same patch.

Applied to master as a single patch, thanks.

Regards,
Yann E. MORIN.

> -MUPDF_VERSION = 1.20.3
> +MUPDF_VERSION = 1.21.0
>  MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
>  MUPDF_SITE = https://mupdf.com/downloads/archive
>  MUPDF_LICENSE = AGPL-3.0+
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
