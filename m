Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99AC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39DDA81FD3;
	Sat, 13 May 2023 08:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39DDA81FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubRXBJGomTdZ; Sat, 13 May 2023 08:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFF481E69;
	Sat, 13 May 2023 08:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BFF481E69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 682481BF5E0
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48762429F9
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48762429F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sd5-Gh91EcXi for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:03:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD31429F8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AD31429F8
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:03:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 494AF19F742;
 Sat, 13 May 2023 10:03:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 10:03:36 +0200
Date: Sat, 13 May 2023 10:03:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230513080336.GA2582048@scaer>
References: <20230422090625.25006-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422090625.25006-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683965019;
 bh=QHOU0MaU/M35huOZRvC5G28Hb1JNVSzDPX1rvkvN1qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7mWi7eXco8+MbAb68n5k6nFPQ7Hl4vPp8uWeCHVL4n3LeYe4k6CqmVSh5ZKNQnU4
 anyjYTsBcUBTuqbfMyMBHJOF8GOv7Jb+NrMoxlThcVWP1JsnaMFcDVkdF6muVSDW9T
 wyqTl6S0WDgz/sNQl/pZXnNAs6Noir5PqqHwh2e8uCYXh43hEeO5z3IwDZpunuP2VL
 /I5//66AJ03ePUFdy9l0NIej+Ym+lD8y3m/N/BzQbnE0NpGzlOBOwC37MnHaLbjrQt
 qZeifzVR/cioLnnQcsSM0LIag65u0NyKTPk5Sz+QErJ+U5hpBGKvSXmWAeaPkazc71
 4BywNXUu7wn8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B7mWi7eX
Subject: Re: [Buildroot] [PATCH v1 1/3] package/qemu: change project and
 download URL to https
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-04-22 11:06 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/Config.in | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index a446c0cf68..235fdb9ce6 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -43,7 +43,7 @@ menuconfig BR2_PACKAGE_QEMU
>  	  Linux. When using KVM, QEMU can virtualize x86, server and
>  	  embedded PowerPC, and S390 guests.
>  
> -	  http://qemu.org/
> +	  https://www.qemu.org/
>  
>  if BR2_PACKAGE_QEMU
>  
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 3cbeffe213..3f51cb572b 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -8,7 +8,7 @@
>  # needs to be updated.
>  QEMU_VERSION = 7.2.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
> -QEMU_SITE = http://download.qemu.org
> +QEMU_SITE = https://download.qemu.org
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
>  QEMU_LICENSE_FILES = COPYING COPYING.LIB
>  # NOTE: there is no top-level license file for non-(L)GPL licenses;
> -- 
> 2.40.0
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
