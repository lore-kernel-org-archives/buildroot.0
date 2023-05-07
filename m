Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0587BC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB20F83B3B;
	Sun,  7 May 2023 21:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB20F83B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3YgVTPc2eOs; Sun,  7 May 2023 21:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B5B83B60;
	Sun,  7 May 2023 21:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B5B83B60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E42F1BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17F7A83B3B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17F7A83B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmdC-SPz_EDJ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:55:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E9783B38
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E9783B38
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:55:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9BBFC2003D3;
 Sun,  7 May 2023 23:55:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:55:38 +0200
Date: Sun, 7 May 2023 23:55:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230507215538.GV252090@scaer>
References: <20230507202257.53475-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507202257.53475-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683496543;
 bh=O5ny7f4hHuyMbfRUL1WUfo4DyxejUa3v5NV0q96K/RY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pR1ICX0eeD4xW3xIVRD8W5i3oUOKfTJSJgNEjt3F5oHhYgbI7den8d7vU+WZyUnJj
 5csDCdOMwl7ItvzLitWc+zJY1AeEZeh48HJn3jdpQT/J8SsTyLRFyZzoih+GLgV4fP
 8TN0uf3rOtRdTXBzY+fh0SiLdGYEZngXYDO5e/Ave/bx05pZOFZhqgy6IGNydVeQsQ
 w2xFTWkXdYzkA1nFfibAViwAzUIK00qit39CJqWh9Gwa3jsnqIvAexC7WyqGn4DSKj
 3NmuIu8f2Z/mSwDGbYSUvjGWiO8Lcwj0/YxUv/hPQxoMQHiPVhYyCxP6ikGz+L4yhf
 bQWROydy1yNYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pR1ICX0e
Subject: Re: [Buildroot] [PATCH v2] package/cairomm: bump to version 1.16.2
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-07 22:22 +0200, Daniel Lang spake thusly:
> The website [1] states that the released version can be downloaded from
> the cairo release area [2], which also features a sha1 hash.
> 
> [1]: https://www.cairographics.org/cairomm/
> [2]: https://www.cairographics.org/releases/
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1 -> v2:
> - split patch from unrelated cairomm1_14 patches
> - merge version bump and website change into a sigle patch
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/cairomm/Config.in    | 2 +-
>  package/cairomm/cairomm.hash | 5 ++++-
>  package/cairomm/cairomm.mk   | 5 +++--
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
> index 75f6692b8a..174f3967ab 100644
> --- a/package/cairomm/Config.in
> +++ b/package/cairomm/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_CAIROMM
>  	help
>  	  The cairomm package is a set of C++ bindings for Cairo.
>  
> -	  http://www.gtkmm.org/
> +	  https://www.cairographics.org/cairomm/
>  
>  comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
>  	depends on BR2_USE_MMU
> diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
> index d14a65c2d6..254413af09 100644
> --- a/package/cairomm/cairomm.hash
> +++ b/package/cairomm/cairomm.hash
> @@ -1,3 +1,6 @@
> +# From https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz.sha1
> +sha1  c24339d5962e2bcbbea85b2fc66347e71fd3db8c  cairomm-1.16.2.tar.xz
> +
>  # Locally computed
> -sha256  bb86d855041bd46d31b03e43ea355d233de44034b39d4200725b1e0947e63e67  cairomm-1.16.1.tar.gz
> +sha256  6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f  cairomm-1.16.2.tar.xz
>  sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
> diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
> index 856c9d67fc..571512878e 100644
> --- a/package/cairomm/cairomm.mk
> +++ b/package/cairomm/cairomm.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> -CAIROMM_VERSION = 1.16.1
> +CAIROMM_VERSION = 1.16.2
>  CAIROMM_LICENSE = LGPL-2.0+
>  CAIROMM_LICENSE_FILES = COPYING
> -CAIROMM_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM_VERSION)
> +CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
> +CAIROMM_SITE = https://cairographics.org/releases
>  CAIROMM_INSTALL_STAGING = YES
>  CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
>  CAIROMM_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
> -- 
> 2.40.1
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
