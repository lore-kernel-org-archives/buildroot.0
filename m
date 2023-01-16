Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC77C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 21:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6226240B9D;
	Mon, 16 Jan 2023 21:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6226240B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4V4xgqbf0Hto; Mon, 16 Jan 2023 21:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CAEC404F6;
	Mon, 16 Jan 2023 21:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CAEC404F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4986A1BF956
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25C6060E64
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C6060E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yXaH25yAjZP for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 21:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B86760E79
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B86760E79
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 21:26:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B4F6F5FF67;
 Mon, 16 Jan 2023 22:26:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 22:26:01 +0100
Date: Mon, 16 Jan 2023 22:26:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230116212601.GI2770@scaer>
References: <20230116070838.4011964-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116070838.4011964-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673904366;
 bh=ix0G+O07jZ5pVRxXoHE2jVTCQcITdIv8mukaUXJ8I24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BL5Xeu8PGfVnaSTR9J+FeTU+SO59WN/TcTcrg8KCe1mScLbvnm//4nu+NiW05KO+b
 aRlElwzTv245fglsCGBItsLmk0L26wSIp0JEiKrMLpmjcfCJCPFZBQm51HpoEe/c+4
 uE64T9iL8jKknw+3e9dEMO7FqvzgrHhtiVW9VBogRbFVeh/pUbfe1wSH0zo4rYci9n
 RUzydU7ijRNNgGWXpSBRrr3Yyug3BbRFuo5ZH4v61UklyWkMo4iu6ipImQMQ0YyOC4
 0sND3CzwguGnk79BS+3W38CtumUqXR9kc0Y5LLVvkFtn3lkToBq4eRUg+vR+rgeT7y
 L9kELR825ksWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BL5Xeu8P
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.4.2
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2023-01-16 08:08 +0100, Joachim Wiberg spake thusly:
> Changes since 8.3.1:
> 
>  - https://frrouting.org/release/8.4
>  - https://frrouting.org/release/8.4.1
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/frr/frr.hash | 2 +-
>  package/frr/frr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/frr/frr.hash b/package/frr/frr.hash
> index 87ade19c16..836f130b93 100644
> --- a/package/frr/frr.hash
> +++ b/package/frr/frr.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9b0430d01f8da2d780ac5e41de2cf4e53abff0ed06a0cc75d745f4b1f29e5b9e  frr-8.3.1.tar.gz
> +sha256  8a6b0e0fa1e89493ba84cf176674e55c7a814821fd02a7188095b76c37c3935f  frr-8.4.2.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 72c46ba4aa..abae784c40 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FRR_VERSION = 8.3.1
> +FRR_VERSION = 8.4.2
>  FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
>  FRR_LICENSE = GPL-2.0
>  FRR_LICENSE_FILES = COPYING
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
