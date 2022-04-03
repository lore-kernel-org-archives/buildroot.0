Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8870DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C6560A6B;
	Sun,  3 Apr 2022 20:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpzFMSRcBZ8l; Sun,  3 Apr 2022 20:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 498D460773;
	Sun,  3 Apr 2022 20:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C12791BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFF574092D
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-xJioUTV--q for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:28:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CB154092A
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:28:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CB01113F880;
 Sun,  3 Apr 2022 22:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649017719;
 bh=Ja8dFWcAi1MuCHHWw1DsQRHCM6eliTKLbdeaDNmJBIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LwUfJoviBFaoKurnSi0OFsD9bmB/lz03EWVn9m7H5C0vKO8hIiUTq4gimi0hdyVd2
 E2p0BcWIre9W4lOGsM4sFzmK78DHEPSfgmI6ZoDhAlTeT+SucolGB8x27uFJv20wWJ
 q21Qnkkbvls4NT/DvsB1ughqVJKlHeIOFMwUVxYGnxUAvfkRxkwnCRN7VURsEaZhYf
 qX0fbyEj/KDvj5HPLh4dkMpgPUZL8DpMVtnpVU17wXDg93hEnCqV+NOC23HbocN9Dr
 ZTL//kLqIBU+Bn0cmFVwAZhpDk1zSdzCaiKBgeFsjW3pJAmsrepehjt9O9LD+c2h5r
 b3YxtVbI6jB9A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 22:28:35 +0200
Date: Sun, 3 Apr 2022 22:28:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403202835.GE2354230@scaer>
References: <20220403161751.204523-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403161751.204523-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: needs C++
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

On 2022-04-03 18:17 +0200, Fabrice Fontaine spake thusly:
> xmrig needs C++ since its addition in commit
> 6f70990ccf6cb993fc31519337390e436d15493b:
> 
> CMake Error at CMakeLists.txt:2 (project):
>   No CMAKE_CXX_COMPILER could be found.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/48f4ff6dc8281ffa99a45401b5941b28f2c94bc2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xmrig/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
> index 7024241017..c5c6b3e37b 100644
> --- a/package/xmrig/Config.in
> +++ b/package/xmrig/Config.in
> @@ -8,15 +8,17 @@ config BR2_PACKAGE_XMRIG
>  	# xmrig needs fenv.h which is not provided by uclibc
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on !BR2_STATIC_LIBS # libuv
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_LIBUV
>  	help
>  	  RandomX, CryptoNight, AstroBWT and Argon2 CPU/GPU miner.
>  
>  	  https://xmrig.com
>  
> -comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library"
> +comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
>  	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> -		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS
> +		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS || \
> +		!BR2_INSTALL_LIBSTDCPP
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
