Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5795C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 07:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40326826F5;
	Sun,  2 Oct 2022 07:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40326826F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOgauzxlk-bL; Sun,  2 Oct 2022 07:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8797C82690;
	Sun,  2 Oct 2022 07:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8797C82690
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E27B51BF403
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 07:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD24460B12
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 07:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD24460B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wa4Krxy2gwpx for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 07:11:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F15060AF8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F15060AF8
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 07:11:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 63934780333;
 Sun,  2 Oct 2022 09:11:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Oct 2022 09:11:16 +0200
Date: Sun, 2 Oct 2022 09:11:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221002071116.GA30794@scaer>
References: <20221001222254.142279-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221001222254.142279-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664694679;
 bh=EuUn5XL8fLTkBPG2AcoxPcn6wP+SPZl36109fU5Kcxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PSpqcUcAo3J7TEYLVEG5Jrh9sWP+t7UmvD3e1oQ6tPyHBj8UtTofdPj7hf0FffV4t
 /sJkty8wUslMCFAwgBQvOuqyMUmdCT1AWIfQ2+4bJ+sw6AFdu6BruCl8tWJcYSE32j
 fATLyJDSf5jJzKd4UBYngARAw2En0ULT8rRPfELJCf9V7P4ZYQSBN0cS+7AN9wTV/Z
 FOnClL3H7vCPn6bQkpcAmOQVLqhCzTxl545HsubgNUTsSqV7LsF3ibBQm4klwNFxLa
 ffAERjbBt4sjGuxzomcCbUaLHgjyg1mAaTfUSlgpN193vK0T/m/t6pONcyxBHSiYgo
 2NbGTX4lvm5IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PSpqcUcA
Subject: Re: [Buildroot] [PATCH 1/1] package/volk: fix Config.in syntax error
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-01 16:22 -0600, James Hilliard spake thusly:
> Fixes:
> package/volk/Config.in:4: syntax error
> package/volk/Config.in:3: invalid option
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks for fixing my mess!

Regards,
Yann E. MORIN.

> ---
>  package/volk/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/volk/Config.in b/package/volk/Config.in
> index 83d58d64ab..6a343e0751 100644
> --- a/package/volk/Config.in
> +++ b/package/volk/Config.in
> @@ -1,6 +1,6 @@
>  comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_VOLK
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
