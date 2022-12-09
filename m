Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271A5C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C70401DD;
	Fri,  9 Dec 2022 17:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C70401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6wR6viNfu1r; Fri,  9 Dec 2022 17:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E542C40FF8;
	Fri,  9 Dec 2022 17:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E542C40FF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC871BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05B1382113
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B1382113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25EE2uH6BwoE for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:02:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D617F82119
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D617F82119
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:02:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.98.184])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 60339B00571;
 Fri,  9 Dec 2022 18:02:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 09 Dec 2022 18:02:43 +0100
Date: Fri, 9 Dec 2022 18:02:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221209170243.GM2855@scaer>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
 <20221208223817.1088619-37-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208223817.1088619-37-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670605367;
 bh=KFxeuKke76xz0VuiYj+Y2nnBgfVoE0auuPy4m4GFvKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qn0uU6Xjfxq6kmC1KMWNxTM5PJ29m8EGHWsEspP2CqGsW28RFSA4auW8M58D+xnUy
 0O+lE30deLwhngl+1P9Ln2kisCHR5WGknETuJ14szgu+W7ASX5NELw9yimsY1itFVz
 6FYyj8sl/I4osrT95C+3M2z3iZX/Ew0lHuOgjPxJVSc4TkwPZoC1uOzOgLJmVQeWFI
 lvyIIWHgLk2rC/+9CFQNOF+rJLmcjkerSElf/dB73soL8OGcgo/5nA+KfIBYC/ATXs
 Ak0lNY2G6IvuG9iQxvUEjkdryvDuZUvZb0Prru76e6iJyb8s0yUfphQfwdrUzzJVEf
 d7XmsLS9Mvb+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qn0uU6Xj
Subject: Re: [Buildroot] [PATCH 36/70] package/x11r7/xapp_rgb: bump version
 to 1.1.0
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

On 2022-12-08 23:37 +0100, Bernd Kuhls spake thusly:
> https://lists.x.org/archives/xorg-announce/2022-October/003245.html
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_rgb/xapp_rgb.hash | 5 +++--
>  package/x11r7/xapp_rgb/xapp_rgb.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x11r7/xapp_rgb/xapp_rgb.hash b/package/x11r7/xapp_rgb/xapp_rgb.hash
> index ce05454ce9..586dc2a7f0 100644
> --- a/package/x11r7/xapp_rgb/xapp_rgb.hash
> +++ b/package/x11r7/xapp_rgb/xapp_rgb.hash
> @@ -1,4 +1,5 @@
> -# From http://lists.x.org/archives/xorg-announce/2014-November/002494.html
> -sha256  bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0  rgb-1.0.6.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2022-October/003245.html
> +sha256  fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b  rgb-1.1.0.tar.xz
> +sha512640888d64b2d328fff4a1652ba1299436e348bc3cbc90710d79c635acfa7f2fce0018adb818123b41ca008197ff1cbf87aab60501de36c163bed2d80d8556008  rgb-1.1.0.tar.xz

    $ make check-package
    package/x11r7/xapp_rgb/xapp_rgb.hash:3: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
    package/x11r7/xapp_rgb/xapp_rgb.hash:3: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)

Applied to master after fixing this, thanks.

Regards,
Yann E. MORIN.

>  # Locally computed
>  sha256  1d08eb3384f5dedc7735bcfae1aa58cb64643ca9389edce3312b1c3cefbfdaa7  COPYING
> diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
> index b2d5d77744..4b6399fc76 100644
> --- a/package/x11r7/xapp_rgb/xapp_rgb.mk
> +++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XAPP_RGB_VERSION = 1.0.6
> -XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
> -XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
> +XAPP_RGB_VERSION = 1.1.0
> +XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.xz
> +XAPP_RGB_SITE = https://xorg.freedesktop.org/archive/individual/app
>  XAPP_RGB_LICENSE = MIT
>  XAPP_RGB_LICENSE_FILES = COPYING
>  XAPP_RGB_DEPENDENCIES = xorgproto host-pkgconf
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
