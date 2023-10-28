Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906D4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AAB1408B4;
	Sat, 28 Oct 2023 21:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAB1408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxbhfWrKZJ12; Sat, 28 Oct 2023 21:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776BF42F2E;
	Sat, 28 Oct 2023 21:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776BF42F2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91D091BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A8E083D45
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8E083D45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1Ef-1T8PZEV for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:08:12 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58C8683D37
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C8683D37
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 54C102003C3;
 Sat, 28 Oct 2023 23:08:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 23:08:07 +0200
Date: Sat, 28 Oct 2023 23:08:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231028210807.GB687180@scaer>
References: <20231028205100.1220118-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231028205100.1220118-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698527290;
 bh=1RiOIe89sfVGCCEoTJ6PuQ4OiicU90hZOx1OZ4o2h3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oI9A4GSOnApEW05x3idZVlumycQTcgRlUoc+ghNEArBlvDhtkNV5h2TcsHilpox7r
 Ng5tqnNhgZdfM33rSnHgmt0VRrHYCELiISELhy/64EmpUTHHCaHXyD2zWBgmCEAieI
 nzGe+FRO+WINnkamrmnVfKcqGn3oxxr+HdnBvi4UuZ1EHsa2c2/b5Ko29TEipAn8qU
 YXSwczTFYHd8C/bs0jdY5ZoYuzmY6AtCz5I9X6tFN8HzqNsSadq5zsX+opPI+skbRK
 JTI3YQ2xOKW3FIU7bNxm6A/nH+A5bpx9bx2j809klTh/ojXr2Ot73Zxxwj+1bXmTMe
 A6KXY+f/MR+vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oI9A4GSO
Subject: Re: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.10
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
Cc: Juha Rantanen <juha@codercoded.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-10-28 22:51 +0200, Fabrice Fontaine spake thusly:
> https://sourceforge.net/p/acsccid/news/2023/04/acsccid-119-released/
> https://sourceforge.net/p/acsccid/news/2023/08/acsccid-1110-released/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

... along with the set of version bumps from tonight you sent so far.

Regards,
Yann E. MORIN.

> ---
>  package/acsccid/acsccid.hash | 8 ++++----
>  package/acsccid/acsccid.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
> index f43a7930a4..5310d78144 100644
> --- a/package/acsccid/acsccid.hash
> +++ b/package/acsccid/acsccid.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.7/
> -sha1  c0062401e5fedf3ec12c8c2d375d6e1561a8a8ed  acsccid-1.1.8.tar.bz2
> -md5  3eba7b2527aa0b14c73b1a620a1d72d2  acsccid-1.1.8.tar.bz2
> +# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.10/
> +sha1  6284a693b8edb511f2f80d9069af9b4a41fd55ae  acsccid-1.1.10.tar.bz2
> +md5  4d2b7f34414aed029084c96dd05a0e7d  acsccid-1.1.10.tar.bz2
>  # Locally computed
> -sha256  f86fd846bc88594a569ea27040cb441d933b7eca8d51d2a90bacf161e7740051  acsccid-1.1.8.tar.bz2
> +sha256  5ee112febdcac6656629025f3a85923f155f6ca150b2d24fd716f9043265528e  acsccid-1.1.10.tar.bz2
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
> diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
> index db74e9cb76..463f0f24d6 100644
> --- a/package/acsccid/acsccid.mk
> +++ b/package/acsccid/acsccid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ACSCCID_VERSION = 1.1.8
> +ACSCCID_VERSION = 1.1.10
>  ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
>  ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
>  ACSCCID_LICENSE = LGPL-2.1+
> -- 
> 2.42.0
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
