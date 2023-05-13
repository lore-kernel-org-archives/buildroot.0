Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE3C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB603845BC;
	Sat, 13 May 2023 12:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB603845BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQinXwGDC8YH; Sat, 13 May 2023 12:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70918471A;
	Sat, 13 May 2023 12:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70918471A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4D241BF3EB
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 997A941F91
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997A941F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFDqtUmNfxi0 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC8241FAA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC8241FAA
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:40:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BAEF119F749;
 Sat, 13 May 2023 14:39:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 14:39:59 +0200
Date: Sat, 13 May 2023 14:39:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20230513123959.GS2582048@scaer>
References: <20230511130421.60538-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511130421.60538-1-thomas.claveirole@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683981601;
 bh=9Tj60B0wX0lJ6PQZNRYU72gYXPMwpV5Qzh5QPhhGu5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGbzvaawNnwxRqez3POB90rxrjRlfgUt86qBI1cqA1jYFkUnd3leQx3PTaqxtVK0a
 X4SprtHAIcs64A4lQO9NoTjy96PAFCSOwsuGTNLFQnibwJpC2PkCyztpuQ3iHztOK7
 k3oeCEOjdnajjUQXjscC5pYk4vZ2Deyyn9bhrnC9PIVq5JU4/kAmBricHWmsMA/nzw
 jboi0aM3Jjb5jB2zztZumq8y3MB9NMWLl/D/8SKax8D/PwVeE6YkbpShZilLmm6coy
 K4OlI1VQR/6Mra7whH/ThDPqFFZ4oli9iZe5q8Dzyxzw+qucO5cqafSKCKYw/1xppR
 uVs4O+oaxHV4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kGbzvaaw
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 7.3.0
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

Thomas, All,

On 2023-05-11 15:04 +0200, Thomas Claveirole spake thusly:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openlayers/openlayers.hash | 2 +-
>  package/openlayers/openlayers.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
> index 7e33716f78..61fe8aea2a 100644
> --- a/package/openlayers/openlayers.hash
> +++ b/package/openlayers/openlayers.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  31b848cc55967c7de63fece8cd1699fc51152421d04653b859103c7391ad5bbe  v7.2.2-package.zip
> +sha256  5d89c7017ca85b53bea6402a1222909dc49a061ffa351d3d1e0ac40b94dd2d38  v7.3.0-package.zip
>  sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
> diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
> index 852f5f1dcf..37e530220a 100644
> --- a/package/openlayers/openlayers.mk
> +++ b/package/openlayers/openlayers.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENLAYERS_VERSION = 7.2.2
> +OPENLAYERS_VERSION = 7.3.0
>  OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
>  OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
>  OPENLAYERS_LICENSE = BSD-2-Clause
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
