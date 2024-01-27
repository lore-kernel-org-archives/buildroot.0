Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5926C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7698440A4D;
	Sat, 27 Jan 2024 16:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7698440A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WmUpgklnpTq; Sat, 27 Jan 2024 16:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 356DE40AE1;
	Sat, 27 Jan 2024 16:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 356DE40AE1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61FB41BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48695417E6
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48695417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3zUHj1Kyg4v for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:35:11 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E874417E5
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E874417E5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2082913F8BA;
 Sat, 27 Jan 2024 17:35:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 17:35:04 +0100
Date: Sat, 27 Jan 2024 17:35:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZbUwuCcPe2f06d9-@landeda>
References: <20231110164617.569602-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231110164617.569602-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706373309;
 bh=lI4UVYAbHp5Bi4GGN24Xn2AHN81da8CiZQsaeJlTGYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L/QK3fFdNRlbSP2cOlpc+QlTBWLGFFqQskgWyHtzOxXKrJHSpwvPpOyEqdSRj/Z0f
 wSAjLu3RcLc1DEwkgcRQT44lTPuk2XeJP08frpy4JATDj50yzLhTUfMMTxYU+YIMxr
 RywVVUEEyz5LY8PfElZtpaBvoGWOe+cJcieC1/VE63jl/OzWGqOIocSRMvwwD/pRfU
 xfy5xqDHPJ/L7pPUNZy1Cv0EXRMVJ6DNUxOv7RDjSRLKtKKpwvJBpW6xYUkUbNDuJQ
 ULcePgnBFrowmFXwgq7tTM8iAC8Ff3lCpdb1kjHLuJYdgBTCGgbGcFvTgOzWGQC5Na
 SXNkIHs1CuRzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L/QK3fFd
Subject: Re: [Buildroot] [PATCH v5 1/3] package/webkitgtk: make gbm support
 optional
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-11-10 17:46 +0100, Thomas Devoogdt spake thusly:
> This was added upstream in commit:
> 
> https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498
> 
> The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
> so ensure that we unset 'USE_GBM' if we don't have libgbm.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2,3,4,5: no change
> ---
>  package/webkitgtk/webkitgtk.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index bb6df3d592..88bdfae27b 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -88,6 +88,13 @@ else
>  WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
> +WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
> +WEBKITGTK_DEPENDENCIES += libgbm
> +else
> +WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>  WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
>  WEBKITGTK_DEPENDENCIES += libgl \
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
