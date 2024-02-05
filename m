Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A62C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B042C41B48;
	Mon,  5 Feb 2024 21:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B042C41B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7MUHRN59ujq; Mon,  5 Feb 2024 21:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22F141A78;
	Mon,  5 Feb 2024 21:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22F141A78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 928CA1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7950760ED0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7950760ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvhQeI9pVBts for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:55:16 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8433D60ECE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8433D60ECE
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2C16B19F746;
 Mon,  5 Feb 2024 22:55:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 22:55:02 +0100
Date: Mon, 5 Feb 2024 22:55:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZcFZNrIWNsqFCwmx@landeda>
References: <cover.1707060159.git.yann.morin.1998@free.fr>
 <a72d15ae3beda3fbdd4fb1be78ddcdf5023219ee.1707060159.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a72d15ae3beda3fbdd4fb1be78ddcdf5023219ee.1707060159.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707170114;
 bh=rhA/xLVDdNrqUd9DnxDpIuFqq1mM4QYbujj8PeiJoGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fN2WvNSE7xxVDbia2Y9Wz+tUU8sJDlMLj7t36ICumCYj14V+AD2cB6zVujSUmIWlp
 K9mLgJREA4BrJWNw1PU/tti72T6riq6AQ9RmaSG+fm5BFXfnBGtgMrNdOJoxrQ1T+F
 0R7zsEPtM9Yxa9epwb0FRFr0d+T38eYon2mrgypTDHrw2JY6H7c24DLkRSWNmI+vH8
 icqI0Mu2rK4/Bk14PtQ9VFqoXnHaKtpyIqEK1LDq1HKLiTqhgSyABo0CEGq2NrKIcW
 5/JCpVJPRIqNFfECRfpX3k6+KFXh6QyHatpHhY0yWcRk8NoyW6+GEMet0Cf0z0Y55p
 RpBLLXHbevyMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fN2WvNSE
Subject: Re: [Buildroot] [PATCH 2/4] package/libcurl: drop
 LIBCURL_CPE_ID_PRODUCT
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-04 16:22 +0100, Yann E. MORIN spake thusly:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Commit 4b6202f721f2f5ab36153ba44de65286f7811ef9 set
> LIBCURL_CPE_ID_PRODUCT to libcurl but this is not needed as
> LIBCURL_CPE_ID_PRODUCT will be set to the package name
> (i.e. libcurl) by default
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 3ecc587a52..83845b8e87 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -13,7 +13,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
>  LIBCURL_LICENSE = curl
>  LIBCURL_LICENSE_FILES = COPYING
>  LIBCURL_CPE_ID_VENDOR = haxx
> -LIBCURL_CPE_ID_PRODUCT = libcurl
>  LIBCURL_INSTALL_STAGING = YES
>  
>  # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
> -- 
> 2.43.0
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
