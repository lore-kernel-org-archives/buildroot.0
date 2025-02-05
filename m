Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC96C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C93441717;
	Wed,  5 Feb 2025 13:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2awPoGQroYP; Wed,  5 Feb 2025 13:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0210D4176F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0210D4176F;
	Wed,  5 Feb 2025 13:53:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D87D612F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB214176F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGxwD50qsJFH for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0000B41717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0000B41717
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0000B41717
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:53:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1F7443F5;
 Wed,  5 Feb 2025 13:53:18 +0000 (UTC)
Date: Wed, 5 Feb 2025 14:53:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Julien Olivain <ju.o@free.fr>
Message-ID: <20250205145317.404532e0@windsurf>
In-Reply-To: <20250119151037.23295-1-roykollensvendsen@gmail.com>
References: <20250119151037.23295-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggrgihitghhvgesghhmrghilhdrtghomhdprhgtphhtthhopehjvghsshgvvghvghesghhmrghilhdrtghomhdprhgtphhtt
 hhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738763598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T/uosG2fEVeHMoMouv/kGwqB/P0ZKSnXk2Qot7uxyE=;
 b=Icc93UpkGXSWdnCSPaFnV9zvSBqfFAbf6xvFdMvUzUdaxEtDy1NYw63JQa/AyBPXn1pXo3
 cEZD9ZHvEBJqH4yJR11LFkGaPmByweXXTReMvovd+GGY1CqQ+Sb9F3hO4HvwjMQtEDRnLQ
 eBNmaQE7AyAGKji0pNjdAstoSRChR7uyO49I7fhVYPAfc9UyW6bx3tfwN0N3/QJJ1AwckM
 urhcJ6XL6+4gWGPW1dKtNgHXOzbwglZFY1XlpTWxOuggFKGf7ffh81ntevFQIruiQQIdVa
 yyELwEyMfFJstiWMZas+XbEL7hSUcSLcoipS8YozEzt/3aYg1pUKFqyHTKZLnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Icc93Upk
Subject: Re: [Buildroot] [PATCH v5] package/qt6/qt6multimedia: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy, Hello Baxiche,

On Sun, 19 Jan 2025 16:10:36 +0100
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> From: baxiche su <baxiche@gmail.com>
> 
> Signed-off-by: baxiche su <baxiche@gmail.com>

I have applied the patch, but after doing a good number of changes. See
below.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2d8ae8289b..a047fdfc19 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -329,6 +329,9 @@ F:	package/tcpdump/
>  F:	package/ti-uim/
>  F:	package/uhubctl/
>  
> +N:	Baxiche Su <baxiche@gmail.com>
> +F:	package/qt6/qt6multimedia

Missing final slash.


> +config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
> +	bool "ffmpeg plugin"

Added:

+       depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+       depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC

> +if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
> +
> +comment "VAAPI support needs Linux DMA buffer feature"
> +	depends on !BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI
> +	bool "vaapi support"
> +	depends on BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
> +	select BR2_PACKAGE_LIBVA
> +	# ffmpeg-vaapi support needs qt6base-opengl
> +	select BR2_PACKAGE_QT6BASE_OPENGL
> +	help
> +	  This option enables the vaapi support.

Changed to:

+comment "VAAPI support needs OpenGL, EGL, libgbm with dma-buf"
+       depends on !BR2_PACKAGE_QT6_GL_SUPPORTS || \
+               !BR2_PACKAGE_HAS_LIBEGL || \
+               !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+
+config BR2_PACKAGE_QT6MULTIMEDIA_VAAPI
+       bool "vaapi support"
+       depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+       depends on BR2_PACKAGE_HAS_LIBEGL
+       depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+       select BR2_PACKAGE_LIBVA
+       # ffmpeg-vaapi support needs qt6base-opengl
+       select BR2_PACKAGE_QT6BASE_OPENGL
+       select BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
+       help
+         This option enables the vaapi support.

> +config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL

I dropped this option, it wasn't used anywhere in the .mk file.

> +comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
> +	depends on !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +
> +config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
> +	bool "linux dma buffer support"
> +	# qt6 configure script needs EGL to check
> +	# for linux dma buffer support
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	help
> +	  This option enables the linux dma buffer support.

Changed to:

+comment "dma-buf support needs EGM, libgbm with dma-buf"
+       depends on !BR2_PACKAGE_HAS_LIBEGL || \
+               !BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+
+config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
+       bool "linux dma buffer support"
+       # qt6 configure script needs EGL to check for linux dma buffer
+       # support
+       depends on BR2_PACKAGE_HAS_LIBEGL
+       depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+       help
+         This option enables the linux dma buffer support.

> +config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
> +	bool "pulseaudio support"

Added:

+       depends on BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC


> +QT6MULTIMEDIA_CONF_OPTS = \
> +	-DBUILD_WITH_PCH=OFF \
> +	-DQT_BUILD_TESTS=OFF \
> +	-DQT_HOST_PATH=$(HOST_DIR) \
> +	-DFEATURE_gstreamer_gl=OFF

See here, GStreamer GL support is always disabled.

> +
> +QT6MULTIMEDIA_DEPENDENCIES = \
> +	qt6base \
> +	qt6shadertools
> +
> +# for multimedia quick module
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_ALSA),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=ON
> +QT6MULTIMEDIA_DEPENDENCIES += alsa-lib
> +else
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_alsa=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DQT_BUILD_EXAMPLES=ON
> +QT6MULTIMEDIA_DEPENDENCIES += qt6svg
> +else
> +QT6MULTIMEDIA_CONF_OPTS += -DQT_BUILD_EXAMPLES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
> +QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
> +else
> +QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
> +QT6MULTIMEDIA_CONF_OPTS += \
> +	-DFEATURE_gstreamer=ON \
> +	-DFEATURE_gstreamer_1_0=ON \
> +	-DFEATURE_gstreamer_app=ON
> +QT6MULTIMEDIA_DEPENDENCIES += \
> +	gst1-plugins-base \
> +	gstreamer1
> +else
> +QT6MULTIMEDIA_CONF_OPTS += \
> +	-DFEATURE_gstreamer=OFF \
> +	-DFEATURE_gstreamer_1_0=OFF \
> +	-DFEATURE_gstreamer_app=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GST_PLUGINS_PHOTOGRAPHY),y)

                                      ^^^^ GST1 here

Applied with those fixes. Thanks for the contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
