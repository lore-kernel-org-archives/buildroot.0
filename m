Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BAEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 17:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E9682660;
	Sat, 19 Mar 2022 17:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcUvd6kscboZ; Sat, 19 Mar 2022 17:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9BF81CA0;
	Sat, 19 Mar 2022 17:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DDF31BF834
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 17:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C4F560701
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 17:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J55q-zSZ3XG8 for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 17:55:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0D50606F2
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 17:55:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cd1:986d:e198:ceab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DE20713F88F;
 Sat, 19 Mar 2022 18:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647712500;
 bh=f2+hr8DDpFrEekXyjj+HAOTctICrW9/qMuzQ+p63IUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJ9vyx0566tRTUyNXaM5kvUOSTe79Y4baD/Z4ukclYdposEw8EW55WGcU1OuolPtP
 s5+ejAAlJR8FXGD0aP7753oVNjsIuBAvNMR8NsoczvEe+MSpJuFVysTePg1xnnUl57
 iSzwyF/ER64jrPuk4BxNUITE7RQTPCnqr7cOQzBoDK/cEX3WiZ9Iex4HKcDuEEDVkO
 ngtU3L7J5ltZQgi+dyxpZk28dqiwmpvoAz9ZoVoBahGUP6y3hGwFEfEUZjGwaJpliS
 rX9zoyheXplyIccl6IR5Z3SDl42bfzX8JYgAX8TLuMY4Lb1k17SAftT8Q/oCAY/a3L
 oRwzaP9nAIvSA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Mar 2022 18:54:56 +0100
Date: Sat, 19 Mar 2022 18:54:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220319175456.GB1566358@scaer>
References: <20220319162109.1088457-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319162109.1088457-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: add gl dependency
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-19 17:21 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure without gl raised since bump to version
> 6.03 in commit cbcbd66b0f241184288232972d9cd9d03c9f0ce1:
> 
>        Note: The OpenGL 3D library is not being used.
> 
>              Those demos which use 3D will not be built or installed.
>              That is most of them.
> 
> make: *** [package/pkg-generic.mk:282: /home/peko/autobuild/instance-0/output-1/build/xscreensaver-6.03/.stamp_configured] Error 1
> 
> A patch was sent to Jamie Zawinski to fix this failure and he replied:
> 
> "Why would you do that? I pretty much consider that an unsupported
> configuration, since that's more than half of the savers at this point."
> 
> I told him that some embedded devices don't have gl and he replied:
> 
> "Such as? Just about every modern "embedded device" I'm aware of is more
> performant than the desktop computers on which I developed many of those
> GL hacks..."
> 
> So just add a dependency on gl.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b76743a48d75b5b7539712318fa0b2937a157f88
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xscreensaver/Config.in       | 7 ++++---
>  package/xscreensaver/xscreensaver.mk | 9 ++-------
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
> index 48eefdfa70..ba259274d1 100644
> --- a/package/xscreensaver/Config.in
> +++ b/package/xscreensaver/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_XSCREENSAVER
>  	bool "xscreensaver"
>  	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_HAS_LIBGL # libglu
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf, libgtk2 -> glib2
>  	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
> @@ -9,7 +10,7 @@ config BR2_PACKAGE_XSCREENSAVER
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
>  	select BR2_PACKAGE_GDK_PIXBUF
>  	select BR2_PACKAGE_GDK_PIXBUF_XLIB
> -	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_LIBGLU
>  	select BR2_PACKAGE_LIBGTK2
>  	select BR2_PACKAGE_LIBXML2
>  	select BR2_PACKAGE_JPEG
> @@ -28,10 +29,10 @@ config BR2_PACKAGE_XSCREENSAVER
>  
>  	  http://www.jwz.org/xscreensaver/
>  
> -comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
> +comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_USE_WCHAR
> +		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
> index 0a91d22d14..0f21fc0e9f 100644
> --- a/package/xscreensaver/xscreensaver.mk
> +++ b/package/xscreensaver/xscreensaver.mk
> @@ -17,6 +17,8 @@ XSCREENSAVER_DEPENDENCIES = \
>  	gdk-pixbuf \
>  	gdk-pixbuf-xlib \
>  	jpeg \
> +	libgl \
> +	libglu \
>  	libgtk2 \
>  	libxml2 \
>  	xlib_libX11 \
> @@ -32,13 +34,6 @@ XSCREENSAVER_CONF_OPTS = \
>  	--includedir=$(STAGING_DIR)/usr/include \
>  	--libdir=$(STAGING_DIR)/usr/lib
>  
> -ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> -XSCREENSAVER_CONF_OPTS += --with-gl=yes
> -XSCREENSAVER_DEPENDENCIES += libgl libglu
> -else
> -XSCREENSAVER_CONF_OPTS += --with-gl=no
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
>  XSCREENSAVER_CONF_OPTS += --with-png=yes
>  XSCREENSAVER_DEPENDENCIES += libpng
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
