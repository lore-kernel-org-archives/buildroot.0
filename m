Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E799C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D19402D0;
	Sun,  5 Dec 2021 15:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAhfLQMsg20u; Sun,  5 Dec 2021 15:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D85C4026B;
	Sun,  5 Dec 2021 15:19:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67D9F1BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57B32605F8
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUPLfSBq8bDu for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C9F7605C2
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:19:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r11so32404799edd.9
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TRW//n2tbblrTGYPJe6fprzt+CP3E5RssQ+dimXmGJs=;
 b=Frn5x589VH0wkr9bpljA3A0bBtbt3KjP5Y7FIb+cDGdAaHwkP97/zchqSUAUBkEi9s
 pQmJc+0rSAvmJ3WxlokB3Glvdj+FNvLdvTr0JbTlLGvPRmsv7SGJcnUJVnwxTMx6Utgj
 UmldG3dAbngojACqFJoBpIJtMRy/wddZhCyIkp0R+a8+pg1DtP8D5QBqRBc2CyoJGxpL
 IG5N0xxwWt3Ubz/kwAv+8z0wcXuH5UQ/pxZ6ExIvGf3wJ5YETMC6Jv87fM9MXjcO5Nmb
 aL0lCvJ8USU+jgMaQrQzxuXXL3W5TxiGb39KkOQeIeu4zX2SNNYXLWOjVY3lMwV3Th1G
 jyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TRW//n2tbblrTGYPJe6fprzt+CP3E5RssQ+dimXmGJs=;
 b=p/10YUfWuN08gohNqj1Rof1tNJwCXB7OwGqbdDW/e9/4KTPB8N3geywRn/NPzLZnaT
 9xkC91g8axktqU87hoId9CMxDk9b8K6RclSUpzyg3A/wN7dGbfz4JS1tVNT1MntddkpO
 i1p3BGGPKloK2vBj/sTopbZb3bS2GCJ/YDYFIVj4GfTpGcqmrIjBDSJC/MvqymU4sWNY
 /R2S3CbwC4vG5+5YvJ8e7WdEhZL1aSJnaCwULXYJzyWiuRC4G8SzQox9IakcfPdxi7Gy
 dqNJCXjXJy3Qrxboj2fdkenQ2BdvZPoT3GxVIxRCbRh3HCwSvspAFWVBP8Hceu+Hh5d6
 1oIA==
X-Gm-Message-State: AOAM5309WkTza7D5v7oWUsrabz1m/OGLuid3kRQ7aLg+M/rmIDU5kSDn
 S7C4OtheqYgI5hkLCrnRwPJMog==
X-Google-Smtp-Source: ABdhPJyXh2YviLmeX2D5b/0ivhzhYraNoGwcnELUke9hGFJ3D6yKYkorbt0rJ69RH99wmWqyw/Wzsg==
X-Received: by 2002:a17:906:1396:: with SMTP id
 f22mr39409744ejc.228.1638717585337; 
 Sun, 05 Dec 2021 07:19:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m6sm6180449edc.36.2021.12.05.07.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 07:19:44 -0800 (PST)
Message-ID: <a02db675-764d-065d-2f91-7b34a22240b1@mind.be>
Date: Sun, 5 Dec 2021 16:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Grzegorz Blach <grzegorz@blach.pl>, buildroot@buildroot.org
References: <20200831201535.2630-2-grzegorz@blach.pl>
 <20211011100646.2406-1-grzegorz@blach.pl>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211011100646.2406-1-grzegorz@blach.pl>
Subject: Re: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/10/2021 12:06, Grzegorz Blach wrote:
> A library to control commonly available 64x64, 32x32 or 16x32
> RGB LED panels with the Raspberry Pi. Can support PWM up to
> 11Bit per channel, providing true 24bpp color with CIE1931
> profile.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

  Applied to master, thanks.

[snip]
> diff --git a/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch b/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
> new file mode 100644
> index 0000000000..f7a92f5fb2
> --- /dev/null
> +++ b/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
> @@ -0,0 +1,46 @@
> +From 056a189836a82b832cd8e6f886cb2090344bfa08 Mon Sep 17 00:00:00 2001
> +From: Grzegorz Blach <grzegorz@blach.pl>
> +Date: Sat, 29 Aug 2020 20:48:57 +0200
> +Subject: [PATCH] Rename LDFLAGS to RGB_LDFLAGS.
> +
> +This change allows additional flags to be added to the linker
> +from the command line.
> +
> +Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

  Please send this patch upstream.

  Preferably, that's something you do before submitting the patch to Buildroot, 
and you add something like "Upstream: <PR URL>" to the patch.

> +---
> + utils/Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/utils/Makefile b/utils/Makefile
> +index e751adc..e704442 100644
> +--- a/utils/Makefile
> ++++ b/utils/Makefile
> +@@ -12,7 +12,7 @@ RGB_INCDIR=$(RGB_LIB_DISTRIBUTION)/include
> + RGB_LIBDIR=$(RGB_LIB_DISTRIBUTION)/lib
> + RGB_LIBRARY_NAME=rgbmatrix
> + RGB_LIBRARY=$(RGB_LIBDIR)/lib$(RGB_LIBRARY_NAME).a
> +-LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread

  I've kept the patch, but is it really needed? "LDFLAGS +=" should make sure 
that variables passed in through the environment are just appended to.


> ++RGB_LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
[snip]

> +comment "rpi-rgb-led-matrix needs a toolchain w/ C++, threads, dynamic library"
> +	depends on BR2_aarch64 || BR2_arm
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS) || BR2_STATIC_LIBS

  I've rewritten this as !LIBSTDCPP || !THREADS || STATIC, which is what we 
mostly do. I've also split it into three lines.

> diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
> new file mode 100644
> index 0000000000..3b1cb5fd76
> --- /dev/null
> +++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  5efc0293bb180b958079910e968721ff2dac291c435d065ecec9ceba8589567d  rpi-rgb-led-matrix-63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> new file mode 100644
> index 0000000000..55b6b363c1
> --- /dev/null
> +++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
> @@ -0,0 +1,79 @@
> +################################################################################
> +#
> +# rpi-rgb-led-matrix
> +#
> +################################################################################
> +
> +RPI_RGB_LED_MATRIX_VERSION = 63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4
> +RPI_RGB_LED_MATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(RPI_RGB_LED_MATRIX_VERSION))
> +RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
> +RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING
> +RPI_RGB_LED_MATRIX_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_IMAGE_VIEWER),y)
> +RPI_RGB_LED_MATRIX_DEPENDENCIES += graphicsmagick
> +RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_IMAGE_VIEWER_CMDS

  We normally put the definition of the hook within the condition as well and 
put the HOOKS += part immediately after it. So I changed that for all hooks, and 
also moved all the conditions below the basic build/install commands.

> +RPI_RGB_LED_MATRIX_POST_INSTALL_TARGET_HOOKS += RPI_RGB_LED_MATRIX_INSTALL_IMAGE_VIEWER_CMDS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER),y)
> +RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_TEXT_SCROLLER_CMDS
> +RPI_RGB_LED_MATRIX_POST_INSTALL_TARGET_HOOKS += RPI_RGB_LED_MATRIX_INSTALL_TEXT_SCROLLER_CMDS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER),y)
> +RPI_RGB_LED_MATRIX_DEPENDENCIES += ffmpeg
> +RPI_RGB_LED_MATRIX_POST_BUILD_HOOKS += RPI_RGB_LED_MATRIX_BUILD_VIDEO_VIEWER_CMDS
> +RPI_RGB_LED_MATRIX_POST_INSTALL_TARGET_HOOKS += RPI_RGB_LED_MATRIX_INSTALL_VIDEO_VIEWER_CMDS
> +endif
> +
> +define RPI_RGB_LED_MATRIX_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib all

  Ah, this explains why the patch is needed. If you call it like this:

	$(TARGET_CONFIGURE_OPTS) $(MAKE) ...

then it is possible for the Makefile to use += to extend variables instead of 
overriding them. That only works if the Makefile doesn't do something stupid 
like unconditionally setting CFLAGS or CC.



  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
