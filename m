Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12BC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3068460E66;
	Wed, 17 Aug 2022 20:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3068460E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZBEFnw2yeEG; Wed, 17 Aug 2022 20:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EBA160BCE;
	Wed, 17 Aug 2022 20:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EBA160BCE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1F721BF384
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 20:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89D4D83155
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 20:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D4D83155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjDcN0ggI6rc for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 20:19:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C6481747
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76C6481747
 for <buildroot@busybox.net>; Wed, 17 Aug 2022 20:19:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1014:5f7:51e1:dc98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 82D47200472;
 Wed, 17 Aug 2022 22:19:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 22:19:01 +0200
Date: Wed, 17 Aug 2022 22:19:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Message-ID: <20220817201901.GU2854108@scaer>
References: <YvqwAHIBtqUM4M7/@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvqwAHIBtqUM4M7/@einstein.dilieto.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660767543;
 bh=1c3LE4bCgwiVqTnFnGO8aGf9Z1zkU1dnNdnVKURD3KE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CirmGhy7REq0SG2g+84g5753R9+90itQcgP0m91OMzmP3hgMcZDpa8+jqdNF3x58R
 BKXNctT4SdHkiVt8lpXxbTYtPQ5ihFlBLEW3d1x7/3F27LZIr6CLB+jecATyNLIVFU
 OI1hcwsVUWpazBu0gXpkPD3TmyDj4SZ19XZBBTGI+PFfNK3cf/KeQmdlIj51Jp/Ixr
 MsBqUaUO2NpQ+i8Hnlizz8HGT1W8nQfpSiVLSBWGYLO7aDZdejzPuGDSmmYtZyVBrx
 VH1LxmXpkqwTkjnuDvfCgKWNFL7H6W7Yi+VixnWiWbLZa2zQZ1Xy4kUPOi1rOBDyaQ
 ED7SPAMZ8xAuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CirmGhy7
Subject: Re: [Buildroot] [PATCH] package/uacme: bump version to 1.7.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicola, All,

On 2022-08-15 22:43 +0200, Nicola Di Lieto spake thusly:
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uacme/uacme.hash | 2 +-
>  package/uacme/uacme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
> index 4ae85c1c..f6246302 100644
> --- a/package/uacme/uacme.hash
> +++ b/package/uacme/uacme.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  36027a587256cbaa86650cec2a5b3eb000480e1150bd83941565661b392625ac  uacme-1.7.1.tar.gz
> +sha256  e7598e794f5ec414d993c4f2f7df39e7c72f26e41302b875ddaf040d8103ec5f  uacme-1.7.2.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> index 84e01057..24822594 100644
> --- a/package/uacme/uacme.mk
> +++ b/package/uacme/uacme.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UACME_VERSION = 1.7.1
> +UACME_VERSION = 1.7.2
>  # Released versions are on branch upstream/latest, tagged as
>  # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
>  # include .tarball-version
> -- 
> 2.20.1
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
