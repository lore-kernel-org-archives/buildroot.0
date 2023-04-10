Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBCCC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A457540A05;
	Mon, 10 Apr 2023 19:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A457540A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbtKKuqiDrMV; Mon, 10 Apr 2023 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51789410A0;
	Mon, 10 Apr 2023 19:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51789410A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 526F41BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B42460BCA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B42460BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GCisGmXKUKX for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:56:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E38160AB0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E38160AB0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:56:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1C2AF5FF9D;
 Mon, 10 Apr 2023 21:56:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 21:56:26 +0200
Date: Mon, 10 Apr 2023 21:56:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230410195626.GN2819@scaer>
References: <20230410194955.104709-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410194955.104709-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681156590;
 bh=Or4UXmL9z/zgPGnZXCM8qisVZo6xGmHOAsIa14xqi+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XM/gEV5F9bM5KLhLgW4RjtIwpTnmSbLzZaerwBeFPOQKvppczZO71keTvR36PVFQN
 gEvYR2dQHvcbHqnwFCFG8cdS0bbMU6euj2gQsWexQCOkbPn0DlSvWWCgWw7OWsv/wR
 t1IWveeCn/EFvJbyMXE2uk8kRRVuZX+gTqKp15g7Hmm3Ys2k4Z+tG/016a4Ytzkbw6
 dYJevsl0vUUImPtBBGcpHN1wnEPFIlvQAKP5Jeru8qlUovU6+HzoM28scrMDyCFgD7
 7nlyOKzufm2tqA7aebWD2W6F9vuqR9Bx8pp+xHY6HZy4yxAWEJVGK59IcI2vM03Pv8
 AuLgRC6qynNwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XM/gEV5F
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to version
 2023-04-10
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-04-10 21:49 +0200, Giulio Benetti spake thusly:
> This version fixes stack parameters issues:
> https://github.com/fifteenhex/xradio/commit/a835c4747be088978a055b9645e3c523d0c54fe1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

This bump is already part of:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=350228

so I marked your patch as not-applicable. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
> index 60185db736..8676f065f8 100644
> --- a/package/xr819-xradio/xr819-xradio.hash
> +++ b/package/xr819-xradio/xr819-xradio.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  2b297fbcc9b5ed190bcfff9f6f808c170632ac3d69dbd92156a7f4f57142dec9  xr819-xradio-005f28cfe9e20b7f2dfd9d32d38ee97060dc707f.tar.gz
> +sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
>  # Locally computed
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
> index e5daaa6051..66c08e7921 100644
> --- a/package/xr819-xradio/xr819-xradio.mk
> +++ b/package/xr819-xradio/xr819-xradio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XR819_XRADIO_VERSION = 005f28cfe9e20b7f2dfd9d32d38ee97060dc707f
> +XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
>  XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>  XR819_XRADIO_LICENSE = GPL-2.0
>  XR819_XRADIO_LICENSE_FILES = LICENSE
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
