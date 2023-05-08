Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC9DC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C0140BD3;
	Mon,  8 May 2023 19:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C0140BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xi0VXQr8ihVG; Mon,  8 May 2023 19:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB33842A90;
	Mon,  8 May 2023 19:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB33842A90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82BE11BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6888841D81
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6888841D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P85k6Ry8dABH for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:18:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3ED441D7E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3ED441D7E
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:18:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F05BE2003C1;
 Mon,  8 May 2023 21:18:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:18:48 +0200
Date: Mon, 8 May 2023 21:18:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230508191848.GB252090@scaer>
References: <20230508170826.1353566-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508170826.1353566-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573532;
 bh=vT3jD9wvUkEzktMMM2kqBZOR/IlV7/FyPvNeNBLWuMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A7QH0RgFaafQzDrgw24O4XQ77jVDi+h36r0lXeHZFSOIkJIVfgrSsqT66yvZaj0b0
 sia0IokXmPDckGJx//Q+YnygEOlcMSMGbEqT8I/twO5pr50c3hAN8UMunuXDLGQxNY
 SmQLeqBZWaH9sT2fTLHNIVS3f5h9s7XSVbOc1onGeQV/tGH853LOegpbZTTZap2zpK
 WBlXQShyxe/s3+69sxarQyZL+F7txztpdkJSJsb57lrJwziNOZwDehE+Zs9nyk+jFe
 j4DjYkGesENDc1Q14mWGZLt6StGCOfKnvofOWMvBV9Y3CDa8vHj4DKwRUjn7g8CNuP
 ItROG8mGaonSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A7QH0RgF
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.13.0
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-08 19:08 +0200, Bernd Kuhls spake thusly:
> Changelog: https://github.com/webmproject/libvpx/blob/main/CHANGELOG
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvpx/libvpx.hash | 2 +-
>  package/libvpx/libvpx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
> index 828718e713..c88e6840cf 100644
> --- a/package/libvpx/libvpx.hash
> +++ b/package/libvpx/libvpx.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  f1acc15d0fd0cb431f4bf6eac32d5e932e40ea1186fe78e074254d6d003957bb  libvpx-1.12.0.tar.gz
> +sha256  cb2a393c9c1fae7aba76b950bb0ad393ba105409fe1a147ccd61b0aaa1501066  libvpx-1.13.0.tar.gz
>  sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
>  sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
> diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
> index c8a22b9ab2..67b25c9100 100644
> --- a/package/libvpx/libvpx.mk
> +++ b/package/libvpx/libvpx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBVPX_VERSION = 1.12.0
> +LIBVPX_VERSION = 1.13.0
>  LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
>  LIBVPX_LICENSE = BSD-3-Clause
>  LIBVPX_LICENSE_FILES = LICENSE PATENTS
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
