Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFF3C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C458181313;
	Mon, 31 Oct 2022 10:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C458181313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6IXAWo75pVS; Mon, 31 Oct 2022 10:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E047981261;
	Mon, 31 Oct 2022 10:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E047981261
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 546E71BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DD5440185
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD5440185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDUk_xt6M5UZ for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A4D40111
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A4D40111
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:58:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 624BAB0059F;
 Mon, 31 Oct 2022 10:58:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:58:48 +0100
Date: Mon, 31 Oct 2022 10:58:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031095848.GQ1058960@scaer>
References: <20221030215201.463000-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030215201.463000-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210331;
 bh=gs3Qg7pxhEkZnGNodU5x5SzNEd5Zk8/78opDi8XXTw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYK+gwOMZ/XjlcrxChKUKh8B4tvbD/0r8y1TXPYf4fI4kCfYa3f1j4qUuyIW6l4ft
 gqRHyvvQUn2gaNh4RHsgxxmUdA8Vp2p39walXsfONxPLJHkKNtsVReRAICVw7urndQ
 awAHP7sb+HLLNyvmyX/fIPtqRPqO3q+8GbdmaT8pmCPeP8hAmfwkIJmvkddLkAk8b8
 h4Vle/ebzw48vSkAyFdM/NAJ4JsliUb2Ji/up/b1c8kPNi0/Ix81G2gBqtfC2B96cO
 HGo643ZoiwPSSu/+G5MsRRpq8avnCXCe3AGLKdCDTsWZ0YTXNMYylqDm8OwcAQnEY3
 w/w5J6dtKK/tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dYK+gwOM
Subject: Re: [Buildroot] [PATCH 1/1] package/cups-pk-helper: bump to version
 0.2.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-30 22:52 +0100, Fabrice Fontaine spake thusly:
> Switch to meson-package
> 
> https://gitlab.freedesktop.org/cups-pk-helper/cups-pk-helper/-/blob/0.2.7/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cups-pk-helper/cups-pk-helper.hash | 3 ++-
>  package/cups-pk-helper/cups-pk-helper.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cups-pk-helper/cups-pk-helper.hash b/package/cups-pk-helper/cups-pk-helper.hash
> index 18fe789389..75c5a5ffda 100644
> --- a/package/cups-pk-helper/cups-pk-helper.hash
> +++ b/package/cups-pk-helper/cups-pk-helper.hash
> @@ -1,3 +1,4 @@
> +# From https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-0.2.7.tar.xz.sha256sum
> +sha256  66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d2bfd79fbe2e831  cups-pk-helper-0.2.7.tar.xz
>  # Locally computed:
> -sha256  959af8f2f5a2761e7e498b61c9caf25ae963335031eae9972d999e9a0d97a228  cups-pk-helper-0.2.6.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
> index c688743160..2bd00c6912 100644
> --- a/package/cups-pk-helper/cups-pk-helper.mk
> +++ b/package/cups-pk-helper/cups-pk-helper.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CUPS_PK_HELPER_VERSION = 0.2.6
> +CUPS_PK_HELPER_VERSION = 0.2.7
>  CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releases
>  CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
>  CUPS_PK_HELPER_LICENSE = GPL-2.0+
> @@ -12,4 +12,4 @@ CUPS_PK_HELPER_LICENSE_FILES = COPYING
>  CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
>  CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
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
