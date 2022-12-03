Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE42C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D72340157;
	Sat,  3 Dec 2022 21:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D72340157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHw8N-qN-Qfq; Sat,  3 Dec 2022 21:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F5D040145;
	Sat,  3 Dec 2022 21:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5D040145
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7ED1BF5DC
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC2B80C40
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC2B80C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYHHvso576Vg for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 21:33:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4CA180C3D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4CA180C3D
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 21:33:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 18E8019F57B;
 Sat,  3 Dec 2022 22:33:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 03 Dec 2022 22:33:49 +0100
Date: Sat, 3 Dec 2022 22:33:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221203213349.GI3302@scaer>
References: <20221203211939.853298-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221203211939.853298-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670103232;
 bh=BJnYOo/tlUTIDrDxW/XS+GRGTOdFXbziyiBE6GUq7Y8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOxoI9v3/EgNSBsg1dJdQQTO1DzvVG9B7VUNn1G1zqxj0a53ylx5lOtyYhAcEnmOH
 SD39M7XOJaA1j4qyeSFQ9YN6U5PDRCh2t0jSYY6WX51yRMpZvQaYqBllXLdsOYTMfZ
 av18LvhaTpZF0FBnaWXsAyGwLewPD47OhjwK2B6ziI6i96iuBZ8gyrr0Crc60u9q5f
 Tg+eACubv/90ullbwjVWGwz9yxEKcnV3OtTxqppCIqW8VOBGOHbsGGirj2YcTNXUm9
 A8Cs7voPeofkjx7uKgNyHYaUzHhgAf1S8G1fXapBZVjSfXVxfxBYk8J0h4yaeeS1na
 1oEHyagJl1naQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DOxoI9v3
Subject: Re: [Buildroot] [PATCH 1/1] package/matchbox-keyboard: add libpng
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

On 2022-12-03 22:19 +0100, Fabrice Fontaine spake thusly:
> libpng is a mandatory dependency since bump to version 0.1.1 in commit
> e2511d88e83acae4144be89ce5e258b724067bd5 and
> https://git.yoctoproject.org/matchbox-keyboard/commit/?id=1d7c5f1e0ad736205151c0df5aa738f942bd3e97:
> 
> checking for PNG... no
> configure: error: Package requirements (libpng) were not met:
> 
> Package 'libpng', required by 'virtual:world', not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4495f0720d7053a52ff8fef82d18a70a6f20c66b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/matchbox-keyboard/Config.in            | 1 +
>  package/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
> index 260a57c6a4..3d7a9d203c 100644
> --- a/package/matchbox-keyboard/Config.in
> +++ b/package/matchbox-keyboard/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_MATCHBOX_KEYBOARD
>  	bool "matchbox-keyboard"
> +	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_XLIB_LIBXTST
>  	select BR2_PACKAGE_XLIB_LIBXRENDER
>  	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
> diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
> index 242c4831d1..a1e3c61543 100644
> --- a/package/matchbox-keyboard/matchbox-keyboard.mk
> +++ b/package/matchbox-keyboard/matchbox-keyboard.mk
> @@ -11,7 +11,7 @@ MATCHBOX_KEYBOARD_SITE = \
>  MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
>  MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING applet/applet.c
>  MATCHBOX_KEYBOARD_DEPENDENCIES = \
> -	host-pkgconf matchbox-lib matchbox-fakekey expat xlib_libXrender
> +	host-pkgconf matchbox-lib matchbox-fakekey expat libpng xlib_libXrender
>  # From git
>  MATCHBOX_KEYBOARD_AUTORECONF = YES
>  
> -- 
> 2.35.1
> 

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
