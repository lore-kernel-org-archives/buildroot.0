Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ACCC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2549960760;
	Sun,  5 Feb 2023 14:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2549960760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gy66EKfieAR; Sun,  5 Feb 2023 14:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DCF8606C0;
	Sun,  5 Feb 2023 14:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DCF8606C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F00471BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70F7813B9
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70F7813B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEc9u2gY104w for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:42:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F39813B8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7F39813B8
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:42:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B30C13F87F;
 Sun,  5 Feb 2023 15:42:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:42:42 +0100
Date: Sun, 5 Feb 2023 15:42:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230205144242.GO2960@scaer>
References: <20230205132307.41753-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205132307.41753-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675608165;
 bh=8d5DKLe1ifWSHzeg1TbX1Sq34Mz9VMQ0UvH5PP1T+Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cO9GocAYxabIvIZNeBNQLnUFt5342lFjWx8F5N0xkfoe+VTZukzVSNmlNqroS/UAV
 NXnNAwE3CGw6BcOnJJQb2hyWLEUX52DYTj8Xo9ianpCr4lJSOGlNc5yYpPa9Hiq/Ml
 x8hdAiPQ3Z3UXxX2X+QadvFhdPFex9yDPu/BAdJkClsz7gY1wm8m2tnZPS/MR8pnyJ
 wpLXnbXOuYVOiTEY1KxdcJENut0uX64WyLHMkfYVtO3GUTY63qyFbVn7xvhK3Xllpj
 2rELG8DD2A2rMlevRbwD+Y+oF24SmCvDQRz8RfADdjq16ZlOGfAth53wMWzSZFplC/
 RONJD8Vuiw6Nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cO9GocAY
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: add utf8proc optional
 dependency
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

Fabrice, All,

On 2023-02-05 14:23 +0100, Fabrice Fontaine spake thusly:
> utf8proc is an optional dependency since version 2.3 and
> https://github.com/tmux/tmux/commit/6c94774b70f72952c4c512e4aa59a207ca1c34f2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tmux/tmux.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 281b7d8ee6..b1c0af1a83 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -11,6 +11,13 @@ TMUX_LICENSE_FILES = COPYING
>  TMUX_CPE_ID_VENDOR = tmux_project
>  TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
>  
> +ifeq ($(BR2_PACKAGE_UTF8PROC),y)
> +TMUX_DEPENDENCIES += utf8proc
> +TMUX_CONF_OPTS += --enable-utf8proc
> +else
> +TMUX_CONF_OPTS += --disable-utf8proc
> +endif
> +
>  # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
>  # can reject the user connection. See man shells.
>  define TMUX_ADD_TMUX_TO_SHELLS
> -- 
> 2.39.0
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
