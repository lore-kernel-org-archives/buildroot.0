Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E426C4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 08:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8052608A5;
	Mon, 26 Dec 2022 08:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8052608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxMCy3pV2Tx4; Mon, 26 Dec 2022 08:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBCE0607CE;
	Mon, 26 Dec 2022 08:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCE0607CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D30E1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 08:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 428D5607FE
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 08:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428D5607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEixje7pnZxx for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 08:37:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D002F607CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D002F607CE
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 08:37:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc00:ef48:c4a5:90b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 938D5B00571;
 Mon, 26 Dec 2022 09:37:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 09:37:53 +0100
Date: Mon, 26 Dec 2022 09:37:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221226083753.GB2893@scaer>
References: <20221225224824.814957-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221225224824.814957-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672043875;
 bh=bWl+4DlRwzlt8Q0d0Kz6QFK8cTsFTvAn1kapu1BQcy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDc1KOG4klLSvkqo4mEqiKrB6Gw2QIUD7iSjQuOUgFTINOyiVXMDmsNLneKKH62l6
 6xDKYyReKfQ2pl771weBwyXTzFqPBH8Ztf4Y1QM9SspMFLbivJFssh2pAsLpLfIkPr
 8oGl5Juk70UH28VMlpVMF8SfnRCKnKI9AnCveCzv4xj/l/DZLhcSazDpR96V0U5OZf
 ccwYPR7tyyURa2O99ITQwafo7NSDkF8wj3Poa/bkuEhqLg0Uprj0/JkDkn5HR4+cCj
 WUPLqvglzXkp6N8TljyZKYvvIt2VdU5MaXhb6PUvFAq4d0b+eB9FlYUti5TqRdEcaf
 jQu2PtD5WRL3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EDc1KOG4
Subject: Re: [Buildroot] [PATCH 1/1] package/ncurses: fix legal info
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

Fabrice, All,

On 2022-12-25 23:48 +0100, Fabrice Fontaine spake thusly:
> Commit a38a30eb3a46570705642dc37235ddcc1471b434 forgot to update hash of
> COPYING (update in year)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/18ed032d1b7e0492ed90f09873cd260997c1deae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ncurses/ncurses.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
> index 1029c1ddcb..c72a2abf46 100644
> --- a/package/ncurses/ncurses.hash
> +++ b/package/ncurses/ncurses.hash
> @@ -62,4 +62,4 @@ sha256  32dc21b671ead8b199d66111ebd3404e8cd5f8c4ca5587cfeb5c6a4913b2d103  ncurse
>  sha256  8fe3bcacaea784ac7971e102a8eb8ca58c4c2c4c13c1ec33f32334600b9e4f56  ncurses-6.3-20221203.patch.gz
>  
>  # Locally computed
> -sha256  4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87  COPYING
> +sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
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
