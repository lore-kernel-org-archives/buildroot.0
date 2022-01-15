Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21CEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC81813F4;
	Sat, 15 Jan 2022 14:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OO4E69vsZze0; Sat, 15 Jan 2022 14:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7280E8139B;
	Sat, 15 Jan 2022 14:22:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5D4B1BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4E0C401FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXztxNP62irp for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1E2B401F1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:21:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 400A513F80A;
 Sat, 15 Jan 2022 15:21:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642256514;
 bh=5eX0atZXoxT/LtavE13aZCyT1+ylOuruRDqBp4y/Csk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K5zMS/LBYjnxy6ObQ6ZaEIp5Z4XtzK8XFoh5Vw2Gv0ywiIw5ttw3tIQbbBZICJf53
 wvA+abYtkdb1VJl8KyJFsBkxgpStlBR34LAnT0dqQanyw4bMxCIKMuyd3OOvvc82MO
 WXM23rbgEojLxuXEE3eaxvNnwzDDuDjHiNZmpNrUrhp4uMg9XFt1MO8emj595KfuDA
 tdhoUbeZvcyTgwsFUQueTPAO0nYfKEr3vOU7b7isHvKJ02tSnJ5XXA6QfK8HcSMcPV
 pb6iodD1Da9e2dJLVq4xx7gX0pjo0rSp7YhLxw6M0nRL9WDKiE5/sT3agSgwj0ZAt9
 ILvv1Uf02lJUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 15:21:51 +0100
Date: Sat, 15 Jan 2022 15:21:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115142150.GN1945846@scaer>
References: <20220115112403.1910619-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115112403.1910619-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/bento4: add BENTO4_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-15 12:24 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:axiosys:bento4 is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaxiosys%3Abento4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bento4/bento4.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
> index 6e17d1d53b..89ff2e4b85 100644
> --- a/package/bento4/bento4.mk
> +++ b/package/bento4/bento4.mk
> @@ -9,6 +9,7 @@ BENTO4_SITE = $(call github,axiomatic-systems,Bento4,v$(BENTO4_VERSION))
>  BENTO4_INSTALL_STAGING = YES
>  BENTO4_LICENSE = GPL-2.0+
>  BENTO4_LICENSE_FILES = Documents/LICENSE.txt
> +BENTO4_CPE_ID_VENDOR = axiosys
>  
>  # Source/C++/Core/Ap4Config.h
>  ifeq ($(BR2_ENDIAN),"BIG")
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
