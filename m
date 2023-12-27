Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59610C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0542483A80;
	Wed, 27 Dec 2023 21:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0542483A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O55U3GzdrzRY; Wed, 27 Dec 2023 21:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E0D2837A4;
	Wed, 27 Dec 2023 21:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E0D2837A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38F891BF2A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12309837AD
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12309837AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdtBSZpYun4B for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:40:41 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5CED8378A
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CED8378A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D9E35B0053D;
 Wed, 27 Dec 2023 22:40:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 22:40:35 +0100
Date: Wed, 27 Dec 2023 22:40:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYyZ0y4be97YCUee@landeda>
References: <20231224160831.871650-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231224160831.871650-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703713238;
 bh=2aXoA58wYgf/aQG+d91DjUyRqctY6dfrqy8Y4MgdWCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLgjSDIHwTB4E2gpCCBg9PTDmOlQsS61ApI0wMTDCkX761tdo4ygz9OZ9nx1ZjYlz
 hZ7b4GpbCJjt20htNaEifOSX23AIEfl/4QAmyyx/0gLrxzcVdy5wZNIGj0lhnkBt2v
 vEhW2AJ6gBowGknpIETpj2+gw/k42UZjGPzkhuk8Yyj7FSp6mAXFzSlj7+EGXykU0P
 HDL15Yro1zQjVFYVsGuWCleo2+D0XOXt83VCe7K8EFiXN6vRL1FbLD7M3yk+VeCsxF
 5+3Ia1vtjyQWzf0NvQbCtBdnucUg/pPdxD6GCoS4yNKpY7uM5EC8cTFapCI82SgOQW
 LtOLzH87RbRPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bLgjSDIH
Subject: Re: [Buildroot] [PATCH 1/3] package/gdb: add support for GDB 14.1
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

Thomas, All,

On 2023-12-24 17:08 +0100, Thomas Petazzoni via buildroot spake thusly:
> All patches are still relevant, and have been rebased on top of GDB
> 14.1.
> 
> GDB 14.1 now needs mpfr unconditionally, so it is added as a
> dependency of host-gdb, and of gdb when the full debugger is built.
[--SNIP--]
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index e4ab39a2bd..7251dce668 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -59,6 +59,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_sh
>  	select BR2_PACKAGE_GMP if !BR2_arc
> +	select BR2_PACKAGE_MPFR if BR2_GDB_VERSION_14

This is a bit fragile: when we add gdb 15, and drop gdb 12, gdb 14 will
become the default version. Then, if the host variant is not selected,
BR2_GDB_VERSION_14 will not be set. If the user enables the full gdb n
target, mpfr will not be selected.

I've added a litle blurb in the config.in.host, pointing to this part of
the code for an appropriate update.

Applied to master, thanks.

Alternatively, I wonder if we shouldn't jsut make mpfr unconditional for
all versions of gdb, now.

Regards,
Yann E. MORIN.

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
