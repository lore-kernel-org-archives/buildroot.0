Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05301C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92EA260F99;
	Mon, 15 Aug 2022 13:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92EA260F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0CME4nM-_xX; Mon, 15 Aug 2022 13:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D080B60FA4;
	Mon, 15 Aug 2022 13:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D080B60FA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2111BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56D4A409FF
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D4A409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzNOEuJ5SQzE for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:47:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24C05410A7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24C05410A7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:47:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B48826012A;
 Mon, 15 Aug 2022 15:47:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 15:47:49 +0200
Date: Mon, 15 Aug 2022 15:47:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815134749.GZ2854108@scaer>
References: <20220815125941.565072-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815125941.565072-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660571272;
 bh=KvjvHsxxeO3tvJnCuRL+erdxnGNxLoG4DfO+pqM0wgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSPotLiJJzrCnohQr0gBH5PDwQR4SZLcJD4vto+BC4+XW1Q0vYpt2hGzs/SbhBP0Q
 mHm3i3sE8zb56zYate84p4VdyiVeWWMGjsHQ9SoeB8PWPbf28aKQ+1/V/D1bGXf7Io
 RY0plm1t81RgxyMvQpqQEkp6RR3YsudPVrCS8euunSGucFLccnpUP25aF1ainoVil1
 P2maR6aYJCx1jZy15ObymRm6VPRhccwFQ6+cIuzrQvCCFd7vxAnr7qvLZxJEt4bvkm
 QTNFWFQvz5B/c7MpBSXavcZrYWhd3m5Q96JezVbm7JyR9GkslVOVJQXvlf78dtzGOQ
 uTyqwK9thT+lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZSPotLiJ
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: needs NPTL
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-15 14:59 +0200, Fabrice Fontaine spake thusly:
> netsniff-ng unconditionally uses pthread_spin_lock since its addition in
> commit 500d287b07190c9c1a1284bc91b37d07e1a835a3 and
> https://github.com/netsniff-ng/netsniff-ng/commit/1a9fbac03c684f29cff9ac44875bd9504a89f54e
> resulting in the following build failure:
> 
> /home/autobuild/autobuild/instance-1/output-1/per-package/netsniff-ng/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: netsniff-ng/tprintf.o: in function `tprintf_flush':
> tprintf.c:(.text+0x42c): undefined reference to `pthread_spin_lock'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ceadbdea8cc35bfd7d601a6d4b18137f81f61406
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/netsniff-ng/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> index bbb4172cd3..9ad3628f14 100644
> --- a/package/netsniff-ng/Config.in
> +++ b/package/netsniff-ng/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_NETSNIFF_NG
>  	bool "netsniff-ng"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_spin_lock
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	select BR2_PACKAGE_LIBPCAP
>  	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
> @@ -28,7 +28,7 @@ comment "mausezahn needs glibc or musl toolchain"
>  
>  endif
>  
> -comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
> +comment "netsniff-ng needs a toolchain w/ NPTL, headers >= 3.0"
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
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
