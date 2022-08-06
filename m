Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B05C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 14:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE93060B25;
	Sat,  6 Aug 2022 14:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE93060B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id durLd9ZO7CFs; Sat,  6 Aug 2022 14:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B95C960ACB;
	Sat,  6 Aug 2022 14:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B95C960ACB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6141BF2F0
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 14:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E95F8605AE
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 14:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E95F8605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSBd6U7Xr31W for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 14:15:51 +0000 (UTC)
X-Greylist: delayed 05:07:23 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFA260ACB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EFA260ACB
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 14:15:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cd3:e89a:3ed2:2a65])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8D8A02003DC;
 Sat,  6 Aug 2022 16:15:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Aug 2022 16:15:44 +0200
Date: Sat, 6 Aug 2022 16:15:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220806141544.GA3914085@scaer>
References: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
 <20220804203555.29029-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804203555.29029-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659795347;
 bh=OUaBVCDcQUJ+jXLs1EH3n2TM2yuP2MgBAHjQCK7+Jms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hTte0DjINcNU35IC9l0JVfdsyF5+5bHo/cKABSyME+5bOoar1fBMUXq6q467GuiVl
 ZpC0KC8e2i2rkpvvWLGDPOuQncnLAE50EGkyACdgbqegZ/al1thvedIb+EHbPkFeKr
 dBBgk7UYP8jUpT5FbV/xfbYbYi1cA04uBatridlxpjuPf9K7uskhYyGcyhLnkcCCwj
 6o8apsi3MkkU+kO2n4lvJjXY+B9SOzZcBYmobo+g4yYRvaqaYCmxpzv+h6Uahrd/R+
 8HjCACgT50jRQWNO1nXoNelW1GxabKES99UytjVz8Fj1of0ijQEXMV6xCsnwBV0Cvz
 tdsW50bssWVJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hTte0DjI
Subject: Re: [Buildroot] [PATCH 2/2] package/pistache: enable on uClibc
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
Cc: Thomas Ruschival <thomas@ruschival.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-04 22:35 +0200, Thomas Petazzoni via buildroot spake thusly:
> pistache couldn't build on uClibc due to just one missing
> definition. In addition, the Config.in comment was wrong as it said
> that a glibc toolchain was needed, while in fact it could be glibc or
> musl.
> 
> Cc: Thomas Ruschival <thomas@ruschival.de>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...port.cc-fallback-value-for-RUSAGE_TH.patch | 33 +++++++++++++++++++
>  package/pistache/Config.in                    |  4 +--
>  2 files changed, 34 insertions(+), 3 deletions(-)
>  create mode 100644 package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
> 
> diff --git a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
> new file mode 100644
> index 0000000000..327933e26d
> --- /dev/null
> +++ b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
> @@ -0,0 +1,33 @@
> +From 5feed6d2f86750bfe1e7c26d6fd4e8d2195ea81f Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Thu, 4 Aug 2022 19:54:23 +0200
> +Subject: [PATCH] src/common/transport.cc: fallback value for RUSAGE_THREAD
> +
> +uClibc-ng currently does not define RUSAGE_THREAD, so let's add a
> +fallback value until it gets fixed in uClibc-ng. The value is the same
> +on all Linux systems, regardless of the CPU architecture.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Upstream bug: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MEXOUSFSH46UFS3AEMEIEPTL5U4HVEFL/
> +---
> + src/common/transport.cc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/common/transport.cc b/src/common/transport.cc
> +index 62efb8c..0f3abb0 100644
> +--- a/src/common/transport.cc
> ++++ b/src/common/transport.cc
> +@@ -515,6 +515,10 @@ namespace Pistache::Tcp
> + 
> +         rusage now;
> + 
> ++#if !defined(RUSAGE_THREAD)
> ++#define RUSAGE_THREAD 1
> ++#endif
> ++
> +         auto res = getrusage(RUSAGE_THREAD, &now);
> +         if (res == -1)
> +             loadRequest_.reject(std::runtime_error("Could not compute usage"));
> +-- 
> +2.37.1
> +
> diff --git a/package/pistache/Config.in b/package/pistache/Config.in
> index 53a4b73a58..3acf1f53f0 100644
> --- a/package/pistache/Config.in
> +++ b/package/pistache/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>  	select BR2_PACKAGE_RAPIDJSON
>  	help
> @@ -14,9 +13,8 @@ config BR2_PACKAGE_PISTACHE
>  
>  	  https://github.com/oktal/pistache
>  
> -comment "pistache needs a glibc toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
> +comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		   BR2_TOOLCHAIN_USES_UCLIBC || \
>  		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>  		   !BR2_TOOLCHAIN_HAS_THREADS || \
>  		   !BR2_USE_WCHAR || \
> -- 
> 2.37.1
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
