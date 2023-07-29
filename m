Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7117C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50ED1409EF;
	Sat, 29 Jul 2023 20:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50ED1409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVkyu3vgd57z; Sat, 29 Jul 2023 20:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 347D9409E6;
	Sat, 29 Jul 2023 20:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 347D9409E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58BE51BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31B6340BF7
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B6340BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XU_kHA79Kpgh for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:50:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 071BF404B9
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071BF404B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5910E0003;
 Sat, 29 Jul 2023 20:50:09 +0000 (UTC)
Date: Sat, 29 Jul 2023 22:50:08 +0200
To: Alexander Bau <dev@abau.org>
Message-ID: <20230729225008.131ad59a@windsurf>
In-Reply-To: <20230522101438.1026434-1-dev@abau.org>
References: <20230522101438.1026434-1-dev@abau.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690663810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kR2pnyfrS+J2U4ZMmL4mp81U5LHs/CRqW0IEMLJ4KUA=;
 b=TEEd2FjgmCD/Qik/EJG5pyHXcKSmwdBq3SqIGLJ0t3A6UPLRsuDfoLIQsM1FjhN3IQOOkN
 ZhTV8PYoXc/Z8y32At4k+pzEnVyxf98ZkIBsn7LvpmzrrECJcKpNznzYrsif46o12U3wu0
 NeNJvAJ9VApl/fLpBu19eC84ENAGeplXeVHHfRUJ3WDLh0x5sy9bD6cFh4DNZh73Mk6Bcg
 rDG7+ustClHw+VF1iQbSzoSItUPiBNYmJIOay4Jtjx049WzsMBfP3oVLkBlUUmvzjC6Z0V
 YuFddXt9WvM8kyRX3CwJdsq+z2sJnyejG+wGPGlAxxircqls9axfJCraTTXR0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TEEd2Fjg
Subject: Re: [Buildroot] [PATCH] package/sdl2: support building for Wayland
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexander,

Thanks for your patch, and sorry for the long delay in providing this
review. See below some comments.

On Mon, 22 May 2023 12:14:37 +0200
Alexander Bau <dev@abau.org> wrote:

Your commit log needs to have a Signed-off-by line with your name and
e-mail. And if needed some extra explanation about the change.

> ---
>  package/sdl2/Config.in | 7 +++++++
>  package/sdl2/sdl2.mk   | 7 ++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
> index 7c8258fe73..85d7c09385 100644
> --- a/package/sdl2/Config.in
> +++ b/package/sdl2/Config.in
> @@ -29,6 +29,13 @@ comment "X11 video driver needs X.org"
>  	depends on !BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU
>  
> +config BR2_PACKAGE_SDL2_WAYLAND
> +	bool "Wayland video driver"
> +	depends on BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_SDL2_OPENGLES
> +	depends on BR2_PACKAGE_LIBXKBCOMMON

I don't think we want to use "depends on" for all those dependencies. I
think we probably want something like this:

	depends on BR2_PACKAGE_WAYLAND
	depends on BR2_PACKAGE_HAS_LIBEGL
	depends on BR2_PACKAGE_HAS_LIBGLES
	select BR2_PACKAGE_SDL2_OPENGLES
	select BR2_PACKAGE_LIBXKBCOMMON

with also:

comment "wayland video driver needs Wayland, OpenGLES+EGL"
	depends on !BR2_PACKAGE_WAYLAND || !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES

> +ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
> +SDL2_CONF_OPTS += --enable-video-wayland

No build dependencies? This looks odd. I'm pretty you need to depend on
host-pkgconf (for pkg-config), on wayland, and libxkbcommon.

Could you have a look at those comments and if possible, send an
updated version that takes them into account?

See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
for some guidelines on submitting patches if needed.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
