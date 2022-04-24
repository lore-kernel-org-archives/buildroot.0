Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AF4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7AD4018F;
	Sun, 24 Apr 2022 15:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skyXey-icPjM; Sun, 24 Apr 2022 15:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B91340121;
	Sun, 24 Apr 2022 15:54:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86D731BF962
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7497460FDB
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmVODi4qId_y for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:54:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 462E960B77
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 15:54:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BF23678032A;
 Sun, 24 Apr 2022 17:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650815650;
 bh=W/jjHJSkLCh4xkN10Py0NOMONHZzWJGU4e52CCBitFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4Dzwy4vrVT78cWJxq3pxwdvSOIAJRj5TAofMutH8A9Uzv/EKhGH6zNiwhdRhFAGz
 4AVkKcBN44FZRYPbPRPtE8imHqpa/tM52h9fNWdg/rmRRQIww3X9o757CgS/VFmpdi
 y8EH4QHCU/ikcdtFDyMCf6wi1Tgkxsrw3POCQh0o3AyvuNXFE1DSIce6iODs48Nh/t
 XHCl1GbvcA5lnXWo6niUXCQ8VPbuWv4CgnKdIfzyQ8Hlc04HyVDLwcSWJBA1V22hyO
 Ym2Vr5pq9B/ljsnI6sxZFZ5VfhBcczMZfn/24QA1dSZjjq+oACHtSMXgrZa3yehexa
 uWUmMIkY1UYnA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 17:54:04 +0200
Date: Sun, 24 Apr 2022 17:54:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220424155404.GW2730@scaer>
References: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220423203924.1796541-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/4] package/zlib: add BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-04-23 22:39 +0200, Fabrice Fontaine spake thusly:
> Add BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 4 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zlib/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/zlib/Config.in b/package/zlib/Config.in
> index d6d94889a7..3a486376ac 100644
> --- a/package/zlib/Config.in
> +++ b/package/zlib/Config.in
> @@ -1,3 +1,6 @@
> +config BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
> +	bool
> +
>  config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_arm
> @@ -33,6 +36,7 @@ config BR2_PACKAGE_LIBZLIB
>  config BR2_PACKAGE_ZLIB_NG
>  	bool "zlib-ng"
>  	depends on BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
>  	select BR2_PACKAGE_HAS_ZLIB
>  	help
>  	  Zlib replacement with optimizations for
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
