Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FC3C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460B160F33;
	Wed, 17 Aug 2022 20:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460B160F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnCQao2TaO9v; Wed, 17 Aug 2022 20:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7131A60C1F;
	Wed, 17 Aug 2022 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7131A60C1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3AC1BF384
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 20:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1411960C1F
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 20:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1411960C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jkMjB57zb9z for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 20:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCD960B2F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABCD960B2F
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 20:10:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1014:5f7:51e1:dc98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F00D2200472;
 Wed, 17 Aug 2022 22:10:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 22:10:01 +0200
Date: Wed, 17 Aug 2022 22:10:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220817201001.GT2854108@scaer>
References: <20220817153745.45762-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817153745.45762-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660767005;
 bh=tx1hXmOv8kzrZw92gfJojLmBxzgAlx9oqBXg6bbbG5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDJHECTO0ozACyO6r1T0L/63XzSZVGomMNAuXwHuhcYaCznuZ+raTqluRUbIcIf4Y
 cxidqrsgmWt/SuPSZ5Z4tjoh+agdr+6ZsND6blN3fXCYM+qfDRGnvqjE8lmj+NjER7
 skaQzMoaoijPbBWOblCWbaAPSUfg2/YKG7RhrxOAAjQEULeNzVH4tCDrKWtCaDa0Qr
 ssMSzFnlosxZci/51TYe65mtzNNpKZL9sKCK7bA27cQLJ7YXIOjyJK0Irz7x2my7lJ
 Xd8BnjjjKBmyUXRXhEaeOsRVCajnWD+fSPJkmWOyZZZYA9099UyAxi3j8bPG9FU9G+
 jPkKvng7u4lQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eDJHECTO
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 14.5
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-08-17 17:37 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-145-138-1212-1117-1022-and-15-beta-3-released-2496/
> 
> Fixes CVE-2022-2625:
> https://www.postgresql.org/support/security/CVE-2022-2625/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/postgresql/postgresql.hash | 5 ++---
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index b2e94195e1..8fdaadde99 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,5 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v14.4/postgresql-14.4.tar.bz2.sha256
> -sha256  c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a  postgresql-14.4.tar.bz2
> -
> +# From https://ftp.postgresql.org/pub/source/v14.5/postgresql-14.5.tar.bz2.sha256
> +sha256  d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30  postgresql-14.5.tar.bz2
>  # License file, Locally calculated
>  sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 38746eaf76..631a959122 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 14.4
> +POSTGRESQL_VERSION = 14.5
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> -- 
> 2.30.2
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
