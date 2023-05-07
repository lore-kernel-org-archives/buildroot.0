Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B210C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4311741755;
	Sun,  7 May 2023 21:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4311741755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZl-ZJCNrq2L; Sun,  7 May 2023 21:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 228E940A38;
	Sun,  7 May 2023 21:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228E940A38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8B681BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A214640639
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A214640639
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUZfS1qDfzQk for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:13:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A86054013B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A86054013B
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:13:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C196F2003CA;
 Sun,  7 May 2023 23:12:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:12:55 +0200
Date: Sun, 7 May 2023 23:12:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230507211255.GO252090@scaer>
References: <SN4P221MB0682AD201BF377F47DCB39D8A06B9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682AD201BF377F47DCB39D8A06B9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683493980;
 bh=v6cfIBgzVzEMEIEMjTX6nxU7NVYQIPdwBgSfqY02RSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8bAnbQHr39vt8To9W4IZHPZJ3uB99G/6R1tMmWRjyB7XWK1VjzHJUEzotdQT28aH
 /BmJKo7mtuoqOKZcblEKODjJdGGfQBrBCnv9cc27v2Eu87yOhB0Y380cDBvlO//RMh
 FhBSkNhgVkiqiXdRCQ9fVeOhA5YDrRD99NTbGdWPnCMDtOrFIWLx09vM5z//MHQsAO
 NJiisX/qvFidoND0R6XQgQ/O8dlArtTZwC7Rn/WEgqT2IrSUTlTAYqn/pslrWYlAZ9
 CetCM4uhdVK+zyW6JhpoifiaEMABS9+xNc1VOg/0s/2/0XwuDpJaJ/k9e0pVH4Zkec
 GqrXzOrpr8qQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d8bAnbQH
Subject: Re: [Buildroot] [PATCH v2] package/libxkbcommon: enable wayland
 support
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-27 21:33 -0400, James Knight spake thusly:
> Tweak the applied configuration options to flag support for Wayland if
> the wayland package is detected. This will allow the generation of the
> `interactive-wayland` utility (when `BR2_PACKAGE_LIBXKBCOMMON_TOOLS` is
> also configured).
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Ensure the selection of Wayland protocols, as well as the Wayland
>     build flags only operate within the tools configuration (as they are
>     only applicable towards the tools; suggested by Peter Seiderer)
> ---
>  package/libxkbcommon/Config.in       | 1 +
>  package/libxkbcommon/libxkbcommon.mk | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
> index e9f61227a02b55a0123318f27b296ce2c8b4ad36..c7fe188a0ed47f3e8e218c1971fec6fcfdd7505e 100644
> --- a/package/libxkbcommon/Config.in
> +++ b/package/libxkbcommon/Config.in
> @@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBXKBCOMMON
>  
>  config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
>  	bool "tools"
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
>  	help
>  	  Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
>  	  xkbcli-interactive-evdev, xkbcli-interactive-x11,
> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index 236bf4c5d94d163809056691339ed7660e545195..882791b9171377ffa90dfd588068f85105e2c4b6 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -14,7 +14,6 @@ LIBXKBCOMMON_INSTALL_STAGING = YES
>  LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
>  LIBXKBCOMMON_CONF_OPTS = \
>  	-Denable-docs=false \
> -	-Denable-wayland=false \
>  	-Denable-xkbregistry=false
>  
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> @@ -30,4 +29,11 @@ else
>  LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS)$(BR2_PACKAGE_WAYLAND),yy)
> +LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
> +LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
> +else
> +LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
> +endif
> +
>  $(eval $(meson-package))
> -- 
> 2.39.1.windows.1
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
