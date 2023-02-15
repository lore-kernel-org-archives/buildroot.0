Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA387C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6689D81F9B;
	Wed, 15 Feb 2023 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6689D81F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0ION6O1KKLh; Wed, 15 Feb 2023 20:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94DE681F8E;
	Wed, 15 Feb 2023 20:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94DE681F8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D41641BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F43D6116D
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F43D6116D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmezlNQGAXv0 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:22:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C3FD60A8A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C3FD60A8A
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:22:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0338CFF803;
 Wed, 15 Feb 2023 20:22:10 +0000 (UTC)
Date: Wed, 15 Feb 2023 21:22:09 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230215212209.269cd96d@windsurf>
In-Reply-To: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
References: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676492531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8Dg2hgxEIgONJiPEbvSkKLYEDUnmm3DV561Hguy80o=;
 b=lEQ/Mhv3tF4h0/8O2zUfxwPrg/KqsC8bqI6pciAsBhOR0VVKXsDUz3NTl8/ajaKSHQrve+
 w3YD+G//5SVPHevZND9O1wBE1vLkDHwEqdsyim8slZoxagFD+63NYXqb75RjmVEOxY0IiZ
 RTn1KGoRGeIUrZ2lTHl/QHjxTJ5jpezH+Vip+HCb+hr3qmS9dtigV/l/thTHmm5UrzJIH6
 GNBbT1aZk9owQkPFJiKqXGYm3LkC3WCgL3+KtN8ig2+sflda2sWPbC48Fyobxtsbvt03tm
 E7wBZF8vhk+pilPa/+7P66FiLMhyu1AV6ubsTojCRuwSvazoHUVRyJZx75lnvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lEQ/Mhv3
Subject: Re: [Buildroot] [PATCH v1 1/1] package/x11r7/xwayland: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello 

On Wed, 15 Feb 2023 15:35:34 +0100
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> XServer to run X clients under wayland
> 
> This XServer is required to run the X clients under Wayland compositor,
> for example weston or wlroots based compositors.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Thanks for the patch! I have a few questions/suggestions below.

>  DEVELOPERS                           |  1 +
>  package/weston/Config.in             |  8 +++
>  package/weston/weston.mk             |  2 +-
>  package/wlroots/Config.in            | 12 ++++
>  package/wlroots/wlroots.mk           |  6 +-
>  package/x11r7/Config.in              |  1 +
>  package/x11r7/xwayland/Config.in     | 26 ++++++++
>  package/x11r7/xwayland/xwayland.hash |  6 ++
>  package/x11r7/xwayland/xwayland.mk   | 94 ++++++++++++++++++++++++++++
>  9 files changed, 154 insertions(+), 2 deletions(-)

This should probably be split into 3 patches: one adding the xwayland
package, one tweaking the existing weston package, and one tweaking the
wlroots package.


> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 3b4e932b7d..db12afc43a 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -111,14 +111,22 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>  	bool "XWayland support"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_PACKAGE_LIBEPOXY
> +	depends on BR2_USE_MMU # xwayland
> +	depends on !BR2_STATIC_LIBS # xwayland
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_LIBXCB
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
> +	select BR2_PACKAGE_XWAYLAND

So does that means that the current BR2_PACKAGE_WESTON_XWAYLAND option
is broken?

I am rather confused by how XWayland works. Isn't XWayland a normal
Wayland client? Why does Weston or wlroots, as Wayland compositors,
need to have some support/knowledge for XWayland?

> +config BR2_PACKAGE_WLROOTS_XWAYLAND
> +	bool "XWayland support"
> +	depends on BR2_PACKAGE_XORG7 # libxcb, xcb-util-wm, xwayland
> +	select BR2_PACKAGE_LIBXCB
> +	select BR2_PACKAGE_XCB_UTIL_WM
> +	select BR2_PACKAGE_XWAYLAND

Since you're selecting BR2_PACKAGE_XWAYLAND, you need to replicate:

	depends on BR2_USE_MMU # fork()
	depends on !BR2_STATIC_LIBS # wayland
	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland

and add the corresponding Config.in comment.

> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 4f14d20b11..5b930a51be 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -30,8 +30,12 @@ WLROOTS_BACKENDS = libinput drm
>  
>  ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
>  WLROOTS_BACKENDS += x11
> -WLROOTS_CONF_OPTS += -Dxwayland=enabled

So this is also a bug in the current package?

What is WLROOTS_X11 controlling then? Running wlroots as a X11 client?

Otherwise, the xwayland package looks fine from a pure review point of
view (I did not do any testing).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
