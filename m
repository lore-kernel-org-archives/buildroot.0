Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28EDC00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 19:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B7E6705AB;
	Tue, 24 Oct 2023 19:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B7E6705AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBD0Rr2QtzNI; Tue, 24 Oct 2023 19:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA70D705A4;
	Tue, 24 Oct 2023 19:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA70D705A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 495F61BF286
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219FD4EF50
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219FD4EF50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qi1Q7JRIxujk for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 19:23:15 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EE0A4EF4A
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 19:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE0A4EF4A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:b634:9dd0:c5f5:6564])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3F58FB00593;
 Tue, 24 Oct 2023 21:23:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 24 Oct 2023 21:23:06 +0200
Date: Tue, 24 Oct 2023 21:23:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Bobrenok <sibobrenok@salutedevices.com>
Message-ID: <20231024192306.GC2607@scaer>
References: <20231024153023.19173-1-sibobrenok@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024153023.19173-1-sibobrenok@salutedevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698175391;
 bh=hawYQUtmm/Yqb6LHaClMOuKh7JwggTGun7PIq5p8WbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j6CIRcmNAjHGY9674WlgmrXXk8rj1T1Jo5HW4Hw01obGDodcExr6DDP7xgM1gkAO8
 BXPRDhfr5tu7uWs2ypuHFtN+h9Ftr5KUzS+cSf6/wwXCncuV/DHDmhv6Hqx3XZBDM4
 gTHprtYBqLlSpkpPUjwd+QrCFx84Oop6ZlijVLtK91zO7a55BLulTrqFFOt2C8OylY
 LSAqPRO50Q2d4MCB/Kc4KEIfy1LRmGVmoL7Nsj2/+Uw6/qsfM/8xiXyjxluKbLh9xw
 +pj2+3YslzPD+qVvZ5PowwI5Bu3fqRtPNJFNd1qnWA12n3jhrir8/E+CKkuvbdBvzS
 wzhjiKclEeOjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j6CIRcmN
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-kernel-module: add
 BR2_MAKE_HOST_DEPENDENCY
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
Cc: Sergey Bobrenok <SIBobrenok@sberdevices.ru>,
 Alexey Romanov <avromanov@sberdevices.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sergey, All,

On 2023-10-24 18:30 +0300, Sergey Bobrenok via buildroot spake thusly:
> From: Alexey Romanov <avromanov@sberdevices.ru>
> 
> Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
> $(BR2_MAKE) to avoid build issue with kernel version >= 6.2 and GNU
> Make version < 3.82. However, the same issue is actual for kernel
> modules as well.
> 
> Using $(BR2_MAKE) should guarantee a consistent behavior between
> kernel and kernel-modules builds.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
> ---
>  package/pkg-kernel-module.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> index fcd6b8bc29..ae7a09114e 100644
> --- a/package/pkg-kernel-module.mk
> +++ b/package/pkg-kernel-module.mk
> @@ -50,11 +50,12 @@ LINUX_NEEDS_MODULES = y
>  endif
>  
>  # The kernel must be built first.
> -$(2)_DEPENDENCIES += linux
> +$(2)_DEPENDENCIES += linux \
> +    $$(BR2_MAKE_HOST_DEPENDENCY)

With multi-line assignments, each value should be on its own line. Also,
indentation should be with TAB, not spaces.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  # This is only defined in some infrastructures (e.g. autotools, cmake),
>  # but not in others (e.g. generic). So define it here as well.
> -$(2)_MAKE ?= $$(MAKE)
> +$(2)_MAKE ?= $$(BR2_MAKE)
>  
>  # If not specified, consider the source of the kernel module to be at
>  # the root of the package.
> -- 
> 2.24.3 (Apple Git-128)
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
