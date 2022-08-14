Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55EFC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCF560E78;
	Sun, 14 Aug 2022 19:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCF560E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jF4DQx5zN-_f; Sun, 14 Aug 2022 19:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5176660E56;
	Sun, 14 Aug 2022 19:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5176660E56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9286D1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C69E60E65
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C69E60E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9bdag5eRg6V for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:26:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C59360BB5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C59360BB5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:26:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B44DF6012B;
 Sun, 14 Aug 2022 21:26:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 21:26:33 +0200
Date: Sun, 14 Aug 2022 21:26:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814192633.GJ2854108@scaer>
References: <20220814192122.3189556-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814192122.3189556-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660505197;
 bh=299LJfpKV4k4Rf46FHZ40552YrqH/ff+0MYXuw6B75k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=keW11O/rf8VS6Gt5ogBqRs2ew5RxPOIDuHjHlWsBzPtA71s6BXpxhoRBJaiiLfrP1
 zpp8BjqWOYHhld/EY/vUG/80XOz4d4d696pFrsyIV7/zoaMLbpol4Ft9z++0qTg+/y
 nnTpgOUIbo2eQUmCuSEvY62/FIa4vlWmniYFQqfyx2/Lmm9qJIWcdAsiXcwISqk5Fu
 iCYvlz+x2kdpykbL77sL71n6Me6P2Vylr21rbZcGhXAD7vZsxacLK7erYrY6o+GweT
 b9nKKTNTFCxyETFTrYH8n3GgKAxKuiV9TSUzFNn7WQlvV/uC73IxlMpcPoFhmswhbD
 z71zzgSt0GnUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=keW11O/r
Subject: Re: [Buildroot] [PATCH 1/1] package/python-txdbus: drop comment
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
Cc: Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-14 21:21 +0200, Fabrice Fontaine spake thusly:
> Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

> ---
>  package/python-txdbus/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
> index f3ea4c78d6..e299596611 100644
> --- a/package/python-txdbus/Config.in
> +++ b/package/python-txdbus/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_TXDBUS
>  	bool "python-txdbus"
>  	# python-twisted -> python-cryptography
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> -	# python-twisted -> python-cryptography
>  	select BR2_PACKAGE_PYTHON_TWISTED # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
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
