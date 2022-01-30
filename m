Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AA1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98E5540004;
	Sun, 30 Jan 2022 21:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7kOOHgDxieE; Sun, 30 Jan 2022 21:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD0D40102;
	Sun, 30 Jan 2022 21:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73B091BF3E3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F6D83ECA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnSrqapFal5p for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC67183EC4
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:52:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 548001C0002;
 Sun, 30 Jan 2022 21:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643579528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRQFON5kr4riraBJXPuKwhQKcB0Wx7iPCxMnsHCcSzI=;
 b=SdcEEnGVPicYH3usHnYERJCJi7vqK6e9hE8seTQ0zO6B6QdbQfgnBzg4AqoOMkHv7rtI9x
 echguCg95rFz85YRQXiiT2LQ2A0iVD6l3ERruRwrc4xz4QCfvlAMEnWSHDQ85FC1SgiG8S
 YfmZ+0AqKSuFLSxJ7pA0IEgW2ZFJeyauzJv49ld3EDwdZ0YkZkEx7ieB9/WV61n9AwUYYa
 WZi1nhZNZW4RZZXpa4p87UQVTMNX8He+NK7Elkackojm7fuV5932QRueGs3I0gs5QttBLH
 JMXTh8V9DPnU154OEVa9lMTqAnAqzGx1aDYw3XnGPwa/3nwk7zJysmFaIdO8eQ==
Date: Sun, 30 Jan 2022 22:52:07 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130225207.04efc439@windsurf>
In-Reply-To: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
References: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/glslsandbox: kms needs gbm
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Fri, 28 Jan 2022 21:52:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
> index 3aa6049dfb..e36e8d74c8 100644
> --- a/package/glslsandbox-player/Config.in
> +++ b/package/glslsandbox-player/Config.in
> @@ -70,6 +70,7 @@ choice
>  config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
>  	bool "KMS/DRM/GBM"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +	depends on BR2_PACKAGE_HAS_LIBGBM
>  	select BR2_PACKAGE_LIBDRM

So, yes, this is needed, but isn't sufficient. Indeed, now you can
potentially enable glslsandbox-player even if you don't meet the
dependency for at least one of the "Native windowing system" (see the
choice...endchoice in the package Config.in).

The top-level BR2_PACKAGE_GLSLSANDBOX_PLAYER option is even carrying a
"bogus" depends on BR2_TOOLCHAIN_HAS_THREADS to make sure that at least
the BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS option is available.

But with your change, this is no longer true, and adding depends on
BR2_PACKAGE_HAS_LIBGBM to the package top-level option doesn't make
sense.

So I've tried to make sure that glslsandbox-player is only available
when one of the windowing systems dependencies is met, by doing this:

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 2d15a7e270..35fe7b3c6a 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -1,10 +1,20 @@
+config BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM
+       bool
+       default y if BR2_PACKAGE_SUNXI_MALI_UTGARD
+       default y if BR2_PACKAGE_MALI_T76X
+       default y if BR2_PACKAGE_RPI_USERLAND
+       default y if BR2_PACKAGE_SDL2_OPENGLES
+       default y if BR2_PACKAGE_TI_SGX_UM
+       default y if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
+       default y if BR2_PACKAGE_WAYLAND
+       default y if BR2_PACKAGE_XORG7
+       default y if BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER
        bool "glslsandbox-player"
        depends on BR2_PACKAGE_HAS_LIBEGL
        depends on BR2_PACKAGE_HAS_LIBGLES
-       # Doesn't really depend on threads, but this makes sure we have at least
-       # one native windowing system available, and is good enough in practice.
-       depends on BR2_TOOLCHAIN_HAS_THREADS
+       depends on BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM
        help
          GLSL Sandbox standalone player allow one to run and render
          (most of) nice shaders available online on the

(this would have been the change *before* your patch). But
unfortunately, this causes Kconfig to goes nuts with a silly recursive
dependency:

package/python3/Config.in:5:error: recursive dependency detected!
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
package/glslsandbox-player/Config.in:44:	symbol BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS depends on BR2_PACKAGE_GLSLSANDBOX_PLAYER
package/glslsandbox-player/Config.in:13:	symbol BR2_PACKAGE_GLSLSANDBOX_PLAYER depends on BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM
package/glslsandbox-player/Config.in:6:	symbol BR2_PACKAGE_GLSLSANDBOX_SUPPORTS_WINDOWING_SYSTEM depends on BR2_PACKAGE_SDL2_OPENGLES
package/sdl2/Config.in:54:	symbol BR2_PACKAGE_SDL2_OPENGLES depends on BR2_PACKAGE_SDL2
package/sdl2/Config.in:1:	symbol BR2_PACKAGE_SDL2 is selected by BR2_PACKAGE_FFMPEG_FFPLAY
package/ffmpeg/Config.in:51:	symbol BR2_PACKAGE_FFMPEG_FFPLAY depends on BR2_PACKAGE_FFMPEG
package/ffmpeg/Config.in:18:	symbol BR2_PACKAGE_FFMPEG is selected by BR2_PACKAGE_KODI
package/kodi/Config.in:51:	symbol BR2_PACKAGE_KODI depends on BR2_PACKAGE_PYTHON3

which I have no idea how to resolve :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
