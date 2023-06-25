Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161B7EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B589D81FDC;
	Sun, 25 Jun 2023 13:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B589D81FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INk_yiXE1avZ; Sun, 25 Jun 2023 13:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC14A81E92;
	Sun, 25 Jun 2023 13:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC14A81E92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4CB01BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F1344013C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F1344013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxmh5vKFlaZw for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:56:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8972540102
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8972540102
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:56:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4EFC5B00576;
 Sun, 25 Jun 2023 15:56:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 15:56:00 +0200
Date: Sun, 25 Jun 2023 15:56:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Oleg Lyovin <ovlevin@sberdevices.ru>
Message-ID: <20230625135600.GD589277@scaer>
References: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687701365;
 bh=tIrFFsiQ45GHyAN4FEV/UaIStuVGYdK9vJIiRoA0Lm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YK1j3DR/de5RtHWMCJRPjeS+fFl5lkWvD3+bQDKq8xFvV1gYLGcXHZvrOtIR4Jv6t
 /r6Mu/STsTVh0JOsRDitbCe4fh5hxCSGB/pNOCDyWe3XjBzxb2nXibL6FgXWynE41g
 epjyM2egIyGEfWPfYruP+gPTw7DDN2tz/VtV49uranoX5N2d7iNfy/DdAHlpziQmHd
 OqF4H65XFctH0YT6PVhJ8XkCm/eAbOIvBIJvhqj8nYnOfqiiTKukkCibeczYBPw7+L
 NnT+SfkW7tCGtlsMeOx4UDJyAr4Mo9nigr16/hiQ6s3ficnB+Z3/5GN/CKMMu/R9zu
 OCDs1QUc477Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YK1j3DR/
Subject: Re: [Buildroot] [PATCH 1/2] package/libcgroup: bump to version 2.0.3
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
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oleg, All,

On 2023-06-25 15:48 +0300, Oleg Lyovin via buildroot spake thusly:
> https://github.com/libcgroup/libcgroup/releases/tag/v2.0.3
> 
> Also remove redundant LIBCGROUP_SOURCE definition.

it is not redundant: it downloads the bz2-compressed archive instead of
the default gz-compressed one.

I'm OK for switching (the package is small), but the commit log is
incorrect.

Regards,
Yann E. MORIN.

> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
> ---
>  package/libcgroup/libcgroup.hash | 4 ++--
>  package/libcgroup/libcgroup.mk   | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
> index 70671212ef..65b98d94e2 100644
> --- a/package/libcgroup/libcgroup.hash
> +++ b/package/libcgroup/libcgroup.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/libcgroup/libcgroup/releases/download/v0.42.2/libcgroup-0.42.2.tar.bz2.sha256
> -sha256  18939381324d418e11be4f5fdca37b01652c18917bfaf1f6b0c505f157e18d07  libcgroup-0.42.2.tar.bz2
> +# From https://github.com/libcgroup/libcgroup/releases/download/v2.0.3/libcgroup-2.0.3.tar.gz.sha256
> +sha256  b29b5704de3d0fadf199fe4e17eeeaecba7f0dd1b85569c96eec37c7672e3026  libcgroup-2.0.3.tar.gz
>  
>  # Hash for license file
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index 156b066162..fb0b646c51 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -4,8 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCGROUP_VERSION = 0.42.2
> -LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
> +LIBCGROUP_VERSION = 2.0.3
>  LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
>  LIBCGROUP_LICENSE = LGPL-2.1
>  LIBCGROUP_LICENSE_FILES = COPYING
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
