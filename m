Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F41FC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21807400CB;
	Tue,  2 Jan 2024 20:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21807400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dR6ngtUIpado; Tue,  2 Jan 2024 20:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C28D408C0;
	Tue,  2 Jan 2024 20:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C28D408C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59E331BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F0E360FAD
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F0E360FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Geaw4R4FPjyO for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:46:34 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 229C560F7F
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229C560F7F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D530EB0053E;
 Tue,  2 Jan 2024 21:46:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Jan 2024 21:46:27 +0100
Date: Tue, 2 Jan 2024 21:46:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZR2I87QpH7JFOpp@landeda>
References: <20240102155552.1902447-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102155552.1902447-1-abrodkin@synopsys.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704228391;
 bh=o9oQfuDyT7ZEgrB3DZ4D+OTwP83gW8v7y6pyDkijJsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiFXXMEFQVCuUvEDmt+hcA8EfYnyMGr0mUpwV72pxWB18UGGw9EKU/KNHmcuPqGmd
 /4GXgtCgKOWqaoAcTwH4xa6JJM6FlbjCvA+xW26SUNb3A82rL3Tn0yGZ4O0KjxPVxU
 SGAW2pVy9W81k1Vrmjpb6h4QACcdk40POsUt8zS/cnE2GBxFFUAuwnbEMY33yUCWKC
 XMaPiwY7NIeB5KvRrt//mGfgwHQvZUjCDJufXUluD+OTO29O3rAsInBtofo8UoeThx
 iJWrF4p/OcvuzRhgbQO1y6w03NBEEWoDNPU/5qd0CNEuVNJyVcKzch6RUb5KDyxhWP
 +lL6M64tOsOQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fiFXXMEF
Subject: Re: [Buildroot] [PATCH] package/gdb: Remove special handling of
 libstdc++ for ARC
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

On 2024-01-02 07:55 -0800, Alexey Brodkin via buildroot spake thusly:
> Effectively that's a revert of a very old fix [1]
> which is no longer needed.

It would have been nice to get a better indication of how much time it
has not been needed anymore, so that we know wehther we should backport
that to maintenance beranches. ca99d0ea925e5a8 mentions that it would be
fixed in 2017.03, so we can certainly assume that it has been fixed for
quite some time now, and thus we can backport this to all our
maintenance branches (2023.02 LTS and 2023.11).

I forgot to add that information befoe pushing, sorry.

> [1] https://git.buildroot.net/buildroot/commit/?id=ca99d0ea925e5a8e42bd270402b0171a39d1d955
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/gdb.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index d677c6bdb1..f96086eed2 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -180,13 +180,6 @@ else
>  GDB_CONF_OPTS += --disable-gdbserver
>  endif
>  
> -# When gdb is built as C++ application for ARC it segfaults at runtime
> -# So we pass --disable-build-with-cxx config option to force gdb not to
> -# be built as C++ app.
> -ifeq ($(BR2_arc),y)
> -GDB_CONF_OPTS += --disable-build-with-cxx
> -endif
> -
>  # gdb 7.12+ by default builds with a C++ compiler, which doesn't work
>  # when we don't have C++ support in the toolchain
>  ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
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
