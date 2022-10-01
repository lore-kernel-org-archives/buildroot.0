Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A86C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ACA640BBC;
	Sat,  1 Oct 2022 16:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ACA640BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTmhTtlRcQD0; Sat,  1 Oct 2022 16:47:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1C5E40B64;
	Sat,  1 Oct 2022 16:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1C5E40B64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB10A1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85388417E5
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85388417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAtE4jRSHuFu for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:47:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23494417E0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23494417E0
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:47:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 403517802D6;
 Sat,  1 Oct 2022 18:47:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:47:20 +0200
Date: Sat, 1 Oct 2022 18:47:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221001164720.GH30794@scaer>
References: <20220929233443.3353813-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929233443.3353813-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664642843;
 bh=W8L2E5TFHB1tYuAD4UxgsmDzOT3YiH2u239r04JUPlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gt60bvlHKBnAPsc0RenLKU7GvntasFBTIBWQI4kHC2fzW3lnWN5lde3ZPcT9hKH+c
 HWqOsz+hwfCwi4Oz7o2dIzj76hJFqbZopLdbs032yGuUIAGrEkT5cH6mnnpqJFSjx4
 viJb/cQ/tZ0GHyYVlAFHYSTqgPcdOOVz1VDVqSg1yGascNtrNLyghyr+iqCTuEw+A8
 r3Qfn2TIPmAx24s4q3gV/pfErS/aVkgoyoDovMmRgktmIuEyLi392E3JYsi0bHeJ5j
 cK94ESTF9IybIj6H+55ivEuZIVdNJVDSlzKoM/kz90EyLYsTK/8d7i/7u6gR19Yokv
 QGhmQ0hZuL5Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gt60bvlH
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 1.0.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-09-29 17:34 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libbpf/libbpf.hash | 2 +-
>  package/libbpf/libbpf.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
> index 23908ded7c..4305872d9f 100644
> --- a/package/libbpf/libbpf.hash
> +++ b/package/libbpf/libbpf.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  f4480242651a93c101ece320030f6b2b9b437f622f807719c13cb32569a6d65a  libbpf-0.8.0.tar.gz
> +sha256  3d6afde67682c909e341bf194678a8969f17628705af25f900d5f68bd299cb03  libbpf-1.0.1.tar.gz
>  sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
>  sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
>  sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 987d1145f1..820f1dc4bf 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBBPF_VERSION = 0.8.0
> +LIBBPF_VERSION = 1.0.1
>  LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
>  LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
>  LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
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
