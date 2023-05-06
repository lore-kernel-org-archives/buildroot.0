Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB85C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD2A61159;
	Sat,  6 May 2023 14:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD2A61159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfQObvQSXG62; Sat,  6 May 2023 14:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9631761131;
	Sat,  6 May 2023 14:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9631761131
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 639991BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B747416CC
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B747416CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzmR9dQr9o8r for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:45:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0448441506
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0448441506
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:45:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 55193B0056B;
 Sat,  6 May 2023 16:45:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:45:26 +0200
Date: Sat, 6 May 2023 16:45:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Serafini <nicolas.serafini@ik.me>
Message-ID: <20230506144526.GI2661@scaer>
References: <20230320120101.595396-1-nicolas.serafini@ik.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320120101.595396-1-nicolas.serafini@ik.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384328;
 bh=KfjdvPEnxRI/OFvlbf83ouN2hfLhshsKXtLjSZ5qjgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bl0IRIXFFnSB6jpKUFLu+qYeLKpF27xpgokszwI4UV+skJmMa3CrtyZ0tNfsDwTNo
 sUbeHVi5PK+ZXfPxFcH9cLHgYHn8mMTIYShza4ZGkg5iELVZQYRMCxkUcMBo4n6+CC
 sOZuDVI7902mTfg+m1HZZFDRAWLyR9jqvDQ+dkx3jJ3/nRRatIx79xaCfQNpkKodpK
 EwKBYEJ3wZXmKRuC2iN+V2ZXdcPaY9jDJA3CMzN/rTUYgqM3B61EXWTGf6x9+9n4l6
 GEXnCnE9Xm1eO1qpEa4qLndrLrtMSIPGQSd0YVycOwl8F1qlaKwJD+IdQtvsO3uQOO
 BUpP1qoZFM5mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bl0IRIXF
Subject: Re: [Buildroot] [PATCH] package/exiv2: bump version to 0.27.6
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

Nicolas, All,

On 2023-03-20 13:01 +0100, Nicolas Serafini via buildroot spake thusly:
> Updated the link to the sources on github, the previous link no longer
> exists.

It's also just because upstream now pushes their releases on github.

> Release notes:
> https://github.com/Exiv2/exiv2/releases/tag/v0.27.6
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@ik.me>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exiv2/exiv2.hash | 2 +-
>  package/exiv2/exiv2.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
> index a405d2611b..c871277801 100644
> --- a/package/exiv2/exiv2.hash
> +++ b/package/exiv2/exiv2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  35a58618ab236a901ca4928b0ad8b31007ebdc0386d904409d825024e45ea6e2  exiv2-0.27.5-Source.tar.gz
> +sha256  4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6  exiv2-0.27.6-Source.tar.gz
>  sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
> index 2a91c71c8f..869f8e48dd 100644
> --- a/package/exiv2/exiv2.mk
> +++ b/package/exiv2/exiv2.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -EXIV2_VERSION = 0.27.5
> +EXIV2_VERSION = 0.27.6
>  EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
> -EXIV2_SITE = https://exiv2.org/builds
> +EXIV2_SITE = https://github.com/Exiv2/exiv2/releases/download/v$(EXIV2_VERSION)
>  EXIV2_INSTALL_STAGING = YES
>  EXIV2_LICENSE = GPL-2.0+
>  EXIV2_LICENSE_FILES = COPYING
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
