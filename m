Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7E8F401CC;
	Sun, 24 Apr 2022 20:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hC0J1mtd8YJ9; Sun, 24 Apr 2022 20:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A3B4019A;
	Sun, 24 Apr 2022 20:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCA41BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38DD860AA7
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jffJBvY9J1p for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D98760A6B
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:43:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e526:f26f:858a:a199])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5FFB219F4EA;
 Sun, 24 Apr 2022 22:43:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650833005;
 bh=ced3LeW/TM3wS4dDB0x5qOM+rXRCN9/SKkLTX6l+JFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvUvoZqaXOjnbZGqnL9LkwE4Voe5573AkaScnIDBTW1kL84NbQ+CxVPTUwFSO3sGO
 yHLCNS1kuvN4mGamaICgj4rOTvVPdMR6+kQI47oGHx8mttlPesBFGKZ/0xgcaw3UEx
 u/VPU5Hz0LgU90aaFlA5aHvdF3XzrFzo4qL7971eTl7VAHHiHvagKFXxjSzOg2RJwT
 04kt6Bk51n8eNAKgfG2xrx8+D5daGZM906Sj1c2Z7VXHT3q24tVyTtQcHLC1mAmV7U
 KGDmWh7yhcsqFz1juCu39svjjzgjm/GxxF5uRxe08eHJTe8ZU/Nge0OEcp4tjKqSk2
 bkENz7kml4Fjw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 22:43:23 +0200
Date: Sun, 24 Apr 2022 22:43:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220424204323.GA3624965@scaer>
References: <20220424171355.3174629-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424171355.3174629-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pamtester: fix build without C++
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

On 2022-04-24 19:13 +0200, Fabrice Fontaine spake thusly:
> Run autoreconf to avoid the following build failure without C++:
> 
> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c000aff659da024b6eef42bca824bdea7b5541c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after adding an explanatory comment above the
autoreconf line, and expanding the commit log. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pamtester/pamtester.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
> index b09e4d1cc0..2d8f1317ca 100644
> --- a/package/pamtester/pamtester.mk
> +++ b/package/pamtester/pamtester.mk
> @@ -9,5 +9,7 @@ PAMTESTER_SITE = https://download.sourceforge.net/project/pamtester/pamtester/$(
>  PAMTESTER_DEPENDENCIES = linux-pam
>  PAMTESTER_LICENSE = BSD-3-Clause
>  PAMTESTER_LICENSE_FILES = LICENSE
> +# Fix build failure without C++
> +PAMTESTER_AUTORECONF = YES
>  
>  $(eval $(autotools-package))
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
