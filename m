Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956E8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 12:56:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D628561057
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 12:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D628561057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75FD281B70;
	Fri, 12 Nov 2021 12:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrlRvRFcuNKI; Fri, 12 Nov 2021 12:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D670B80F87;
	Fri, 12 Nov 2021 12:56:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D66C61BF29D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 12:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C55E76064E
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 12:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zze6kKclOz70 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 12:56:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E62716063F
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 12:56:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6392B19F576;
 Fri, 12 Nov 2021 13:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636721772;
 bh=1Z5xn9gA4MOjR2TMbJQaUQ4T3NIhNPmnonAe0r4BR1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FGISD59EwzFKtxdOirYx5fkpUD9U+IBdUwtTgBnv8LqTjfUPvHbmt1TwruuJ18YPP
 6v0XqLD/cuIlMEnMoY5uSGGO+TLh1tLvbxFE9gmJPqUHLk9E8M+Ooqr/gabxEDr37H
 FirwjRWjJ1J8ErBlkUwaISrRgtZ7oyzH9TpMH0znIeAcf4HMPKu3kjxo4HFx2v+ruT
 9nJbkQgof+BltnSCZrLsWpLGXBXbbnUbJFCenoOHjbenfGxnx+dQQCnsJpjSortqtY
 RWXAC63vkNuf8zubTi2MWg5JOi1cvVka7gjkDNSj1XT2vMmWw+8PLmG+NBi+3f0Y1l
 ws1UfJsSrf9xQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 13:56:08 +0100
Date: Fri, 12 Nov 2021 13:56:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211112125608.GJ2609@scaer>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-5-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112110007.787836-5-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 4/6] package/luajit: building for 64-bit
 target requires a 64-bit host for all platform
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

Romain, All,

On 2021-11-12 12:00 +0100, Romain Naour spake thusly:
> Currently only x86_64 target requires a 64-bit host but building
> aarch64 target with a 32-bit host is allowed.
> 
> This constraint is for all architectures [1].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-November/628301.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/luajit/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index f6d01ed09a..bf98260c31 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,13 +1,15 @@
>  config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_arm || BR2_armeb || BR2_aarch64
> -	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
                                           ,^^^^^^^^^^^^
You removed that _________________________/

> +	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc
>  	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
>  		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
>  	# -m32 flag is used for 32bit builds and host-luajit has
>  	# limited architecture support
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	# Building for 64-bit target requires a 64-bit host
> +	depends on !BR2_ARCH_IS_64 || BR_HOST_ARCH="x86_64"
                                  ^^^^^^^^^^^^._____
                                                    \
... but you borked it when adding it back here _____/

You should not have blindly copy-pasted my poor code snippet from the
previous review! ;-]

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_LUAJIT
>  	bool "luajit"
> -- 
> 2.31.1
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
