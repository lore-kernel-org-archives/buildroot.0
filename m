Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2570C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 11:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43AA283216;
	Sun, 14 Jan 2024 11:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43AA283216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19h6cpT_xc2p; Sun, 14 Jan 2024 11:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 754C2828A9;
	Sun, 14 Jan 2024 11:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 754C2828A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 965B31BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D83341694
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D83341694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IoTXp5VWdhk for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 11:40:39 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4689A41690
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 11:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4689A41690
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4519313F88F;
 Sun, 14 Jan 2024 12:40:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 12:40:33 +0100
Date: Sun, 14 Jan 2024 12:40:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaPIMQ5aXJs7XaPa@landeda>
References: <20240114112840.432251-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240114112840.432251-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705232436;
 bh=cMj0vIDEbGOSBhos641lXuQVgLQ6ifD93rW30z7CRUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBBmuFPXqy7MpACJVaaXjYXK+4WlT019sJ0tUt4acF+WiRcUy0dM9tDm3ARPihjLu
 jK+TQE615RmnG7U1b4g9Vl368J1jCtEvE1oyWqDWIV0CoBLLOL1CqyV3PRPp45pTpP
 vlNrvJqYLt2ojALsUPHsKh4kGz0UAU45VC/7SSidgtW0qlitz2NxUA6SaH5CFxBNct
 je62L9f8XqnJ+XMSXr3OwAwX18RraiUHLl1i1Y+SaE3RtiKo/I+CFc0RhPtRh8w5k4
 GmRZRjIPbV1ZKRqCUxEAfpG2gXrh37IOEXiiRUV1BM5RzeaU6UYaKORVx7nW2bKVLC
 9cCDyrWDc/WVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LBBmuFPX
Subject: Re: [Buildroot] [PATCH 1/1] package/criu: add C++ comment
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-14 12:28 +0100, Fabrice Fontaine spake thusly:
> Commit 3e4b479f39c15ffdf307ec8395d856680c727204 forgot to add C++
> comment
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/criu/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> index fc0da823b3..4c295acf4f 100644
> --- a/package/criu/Config.in
> +++ b/package/criu/Config.in
> @@ -43,9 +43,9 @@ config BR2_PACKAGE_CRIU
>  
>  	  https://criu.org/Main_Page
>  
> -comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, dynamic library, wchar"
> +comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
>  	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
> -		|| BR2_TOOLCHAIN_USES_UCLIBC \
> +		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
>  		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
> -- 
> 2.43.0
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
