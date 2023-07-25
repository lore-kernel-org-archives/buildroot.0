Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA91AC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D2AC60AC9;
	Tue, 25 Jul 2023 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D2AC60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fy_IzEEKTvRh; Tue, 25 Jul 2023 19:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B7460864;
	Tue, 25 Jul 2023 19:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B7460864
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2641D1BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2855418BE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2855418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lX8SiutSkd86 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:44:15 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA3F0418B4
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA3F0418B4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D11A1780310;
 Tue, 25 Jul 2023 21:44:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:44:10 +0200
Date: Tue, 25 Jul 2023 21:44:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pieterjan Camerlynck <pieterjanca@gmail.com>
Message-ID: <20230725194410.GK3544423@scaer>
References: <20230725184847.3936-1-pieterjanca@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725184847.3936-1-pieterjanca@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690314252;
 bh=QI1RivoZdT2xkg9l+4Sz+5VGnOTGC63wu+s3Y9hmGhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ak57Tp4UhY6kML427r65V1JRQb9dRripYQkgAazAhkn03JJ+0PxFcG3D0eCASqhvd
 xy2oSU+Vujk5xJHe62hqGfv9okqB7GiR+a4QbxtOlLy73jvXM+VF+97WAS+JnKrl7F
 iK96dld404VDhKHRw7tckMAo3lrT20fBEByJevnxfIKUvzjS7IZcNMG5qg+QrHZKFn
 yr0LYtATC+AxN4ti3pUpvMcyPToveS1TjCNkMyMA/V21eXPfwGGo/bQZs4Czmrm9B3
 WzIYwiuIkmaSSujGj+Z6znnkaPNqphNjxLKeRkee9K4FReb1plHwAPy/TMIcK57it/
 jNBDR84Q2h/4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ak57Tp4U
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: update email address for
 Pieterjan Camerlynck
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

Pieterjan, All,

On 2023-07-25 20:48 +0200, Pieterjan Camerlynck spake thusly:
> Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c690f1dac7..6d8b43c31e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2428,7 +2428,7 @@ F:	package/tree/
>  N:	Pieter De Gendt <pieter.degendt@gmail.com>
>  F:	package/libvips/
>  
> -N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> +N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
>  F:	package/libdvbpsi/
>  F:	package/mraa/
>  F:	package/synergy/
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
