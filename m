Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9BC04AB8
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE8661399;
	Wed, 20 Sep 2023 17:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FE8661399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4BAOOLQr1Td; Wed, 20 Sep 2023 17:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D493B6138F;
	Wed, 20 Sep 2023 17:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D493B6138F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A94861BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ED0D41FAA
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED0D41FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMlW_cmGjjKt for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:37:34 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 717D841FA5
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 717D841FA5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BD96460155;
 Wed, 20 Sep 2023 19:37:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:37:30 +0200
Date: Wed, 20 Sep 2023 19:37:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230920173730.GH512384@scaer>
References: <20230920043658.37553-2-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920043658.37553-2-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231452;
 bh=7dj0KFPN6lAWbIV+MYe0iVC02FC9hrGVm1C5D6R26zM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSFrFecMMssNr52vN36TYDzP1/BouU3dXRNqC+iI69AMgg7QOth/5hrUXtHt8lA0Z
 tHAFG7VYp8ejj+kG3Xmgn+bmJrGHZ9y2zsdKpwRrY9wD2uRqVw1V4zcyUM77PYUgbO
 wv+IrftMWk5QMqa63fVdcxC/KeWwW69gisLoPSzja6Lr1WIrwZA4D0zaMkRFrDjAlJ
 ngx/AsdMmQ/B0fRweocEnPnuBhECw18Q7sQ9oX9jBFNvSEjZwTfdj6CipvzP5dPkDm
 4ne/1wGzZ3hOs9eKComfona6f1BBlWXR4jktKvNeAiKVLstxbIucRGeXX+rrDp61cY
 iMYClokQR7aQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mSFrFecM
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: drop CVE-2022-1304
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

Daniel, All,

On 2023-09-20 06:36 +0200, Daniel Lang spake thusly:
> CVE-2022-1304 only affects e2fsprogs 1.46.5.
> The mentioned patch was removed in 6a21733f when bumping to 1.47.0.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/e2fsprogs/e2fsprogs.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 80090621bf..7491f4c067 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -12,9 +12,6 @@ E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
>  E2FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
>  E2FSPROGS_INSTALL_STAGING = YES
>  
> -# 0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
> -E2FSPROGS_IGNORE_CVES += CVE-2022-1304
> -
>  # Use libblkid and libuuid from util-linux for host and target packages.
>  # This prevents overriding them with e2fsprogs' ones, which may cause
>  # problems for other packages.
> -- 
> 2.42.0
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
