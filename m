Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9EEC001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FCC81A29;
	Mon,  3 Jul 2023 19:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42FCC81A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-GRTlrKsVTU; Mon,  3 Jul 2023 19:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E62A81854;
	Mon,  3 Jul 2023 19:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E62A81854
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB771BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79971405BE
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79971405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxjPmj01a56L for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:37:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9628740420
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9628740420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:37:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EA4332003C3;
 Mon,  3 Jul 2023 21:37:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 21:37:39 +0200
Date: Mon, 3 Jul 2023 21:37:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703193739.GH2510@scaer>
References: <20230702115651.2430264-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702115651.2430264-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688413062;
 bh=2eNZacyrkJDYF7D0YHwDR2DbLPjkkQza0HLKbEDlXrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YAgL7pGpRr618U7gGnjU6eR1wgdNt7j+G5+rKU0IHY80/f+tgNnqZ32y8t7g4eRr7
 o1LIpmZ6/xB8BRWrKRB0GJguyVf+tVUNyaFvhafqV+DobY8jTvmdXBCStRPFwUSBF5
 UDxes8GfFU5QXrPlMKVARlylaW7Ztbr5X01iX/kacdxEWLQSW/ChqvupWuabwl1LYO
 Sw3aY/z0ujNULtNsCyZ5SbqeQfy/HrnMk7//Gr208LSupBEynKiTDrNcLq0CnkPRWS
 RQRgnwmAzfxvknn6OsaYJk+ATelgh3KgK6hLds0PO0sgjad+d70i/NirPEZd0wRQ0n
 9kSVOhsq5Jrug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YAgL7pGp
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh2: disable rpath
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

Bernd, All,

On 2023-07-02 13:56 +0200, Bernd Kuhls spake thusly:
> Bumping libssh2 to 1.11.0 with buildroot commit
> af87ad197caf434936fe239f2718fd17b60fcb8b
> causes build errors with libcurl due to "-R" being added to libssh2.pc.
> 
> Quoting autobuilder build-end.log
> 
> checking for recv... no
> configure: error: Unable to link function recv
> 
> Quoting autobuilder libcurl-8.1.2/config.log
> 
> arc-buildroot-linux-uclibc-gcc.br_real: error: unrecognized command-line option '-R'
> 
> Fixes:
> http://autobuild.buildroot.net/results/78f/78ffda92d51f8abdbcef93f968ace432d0d44979/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libssh2/libssh2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 8bedbdffba..a42be46a7a 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -11,7 +11,7 @@ LIBSSH2_LICENSE = BSD
>  LIBSSH2_LICENSE_FILES = COPYING
>  LIBSSH2_CPE_ID_VENDOR = libssh2
>  LIBSSH2_INSTALL_STAGING = YES
> -LIBSSH2_CONF_OPTS = --disable-examples-build
> +LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
>  
>  ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>  LIBSSH2_DEPENDENCIES += mbedtls
> -- 
> 2.39.2
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
