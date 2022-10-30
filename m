Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC89CC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88B43403D6;
	Sun, 30 Oct 2022 16:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B43403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNFEnQvGSzsi; Sun, 30 Oct 2022 16:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A21FF40198;
	Sun, 30 Oct 2022 16:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A21FF40198
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59B621BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4272B80FAD
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4272B80FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tONbpQeLHDF for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:29:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 433DE80B3E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 433DE80B3E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:29:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 689FB13F85A;
 Sun, 30 Oct 2022 17:29:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:29:40 +0100
Date: Sun, 30 Oct 2022 17:29:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030162940.GT1058960@scaer>
References: <20221029094535.133025-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029094535.133025-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147383;
 bh=rODSR89XnTG8W+TEhEVC9AtFPF7lPkaMCySwW4VzCGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=auYqvn7HyQB8JQ8PhBUbI0crjfp1/uyP71Xy40Q6PgWd0PnhyOMbYOKodlCPI5mIt
 SH6km27Cb/SNoFUEHEYpZHZ+5pVTbKw0loWW07qB13oz6Jbljwvz55Lx5Vv5N3i/GV
 q+iRb2WCIiH3RYapbEvme8fs7nyN9oNgyrlD5eiv6afQHyfSqyHx7Dn6P3d/scdpp2
 OOkR46hh1AulgxEZQoFUllqDbm/x4gzsFL49DN/gMvPH6exiT77SWDB9o+RGHnX6EH
 A0/ce1WjxrXVp7RTMlF17sdHSbAet9Pzsc3ahvqy1G2vJ2qsHhVJsSP3y8AkOF2OF7
 D40w+lTKAmMzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=auYqvn7H
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: bump to version 2.1.5
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-29 11:45 +0200, Fabrice Fontaine spake thusly:
> https://lists.infradead.org/pipermail/linux-mtd/2022-October/095383.html
> https://lists.infradead.org/pipermail/linux-mtd/2022-January/090742.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mtd/mtd.hash | 4 ++--
>  package/mtd/mtd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
> index 481788f844..a2133e3ce2 100644
> --- a/package/mtd/mtd.hash
> +++ b/package/mtd/mtd.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.3.tar.bz2.asc
> -sha256  11305a5daf6fc6ed85120695c8593290b577effb039adbfa63d35b4418ff5630  mtd-utils-2.1.3.tar.bz2
> +# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.5.tar.bz2.asc
> +sha256  386e27fd121699b6b729bc2e8e04dda987b31cca6b16e12fb6cc6dcf26449f46  mtd-utils-2.1.5.tar.bz2
>  sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 45e7c0c61c..6e266a8760 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MTD_VERSION = 2.1.3
> +MTD_VERSION = 2.1.5
>  MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
>  MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
>  MTD_LICENSE = GPL-2.0
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
