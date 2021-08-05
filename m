Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_NOVOWEL,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D719C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:36:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B644960EC0
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B644960EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763E683A4C;
	Thu,  5 Aug 2021 21:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BRjQYZoPt_l; Thu,  5 Aug 2021 21:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD5D83A0C;
	Thu,  5 Aug 2021 21:36:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2AD1BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AD99401CA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkFIQ_FHcq0R for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C37DB400C9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:36:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BC32E240005;
 Thu,  5 Aug 2021 21:36:16 +0000 (UTC)
Date: Thu, 5 Aug 2021 23:36:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Refik Tuzakli <tuzakli.refik@gmail.com>
Message-ID: <20210805233615.4e69d63d@windsurf>
In-Reply-To: <20200209134408.10534-3-tuzakli.refik@gmail.com>
References: <20200209134408.10534-1-tuzakli.refik@gmail.com>
 <20200209134408.10534-3-tuzakli.refik@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 3/3] package/freescale-imx/imx-gpu-viv:
 add options for new feture
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Refik,

On Sun,  9 Feb 2020 16:44:08 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> NXP supply new fetures with new gpu driver. This patch adds options to select
> the library needed and saves space on target.
> 
> Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>

Thanks a lot for this patch. I started looking into it, and realized
that now due to the massive amount of libraries installed by
imx-gpu-viv, the TARGET_DIR/usr/lib folder weights a total of 190 MB!
This is really huge, and we definitely want to make this more
conditional as not everybody needs OpenVX, Vulkan, or the neural
network stuff.

However, I think we would need to do that step by step, in multiple
patches. First we should make conditional what the package already
supports. The package currently provides:

IMX_GPU_VIV_PROVIDES = libegl libgles libopencl libopenvg

I think libegl and libgles should remain unconditional. However, we
should make libopencl and libopenvg optional. When they are not
enabled, then the libraries and headers should not be installed to
STAGING_DIR. Indeed, we really want a hard build/link failure if
somebody tries to build an OpenCL or OpenVG application and the
corresponding options are not enabled. We cannot install "the whole
imx-gpu-viv" to STAGING_DIR and only conditionally install to
TARGET_DIR, because it means someone not enabling OpenCL would be able
to build/link the application and it would only fail at runtime which
is not great.

Then once we have this imx-gpu-viv package that has options for
libopencl and libopenvg, you can create additional patches adding
options for libvulkan, for libopenvx, for the neural network stuff.

Would you be willing to work on something like this ?

Also, one question is: are all these features available for all i.MX
platforms? Vulkan, neural network stuff is available even on the older
i.MX6 platforms that also use imx-gpu-viv ?


> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_LIBNN),y)
> +IMX_GPU_VIV_PROVIDES += libnn
> +define IMX_GPU_VIV_INSTALL_TARGET_LIBNN
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libnnrt.so $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libneuralnetworks.so $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libNNGPUBinary-lite.so $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libNNGPUBinary-xsvx.so $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libNNVXCBinary-evis.so $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libNNGPUBinary-ulite.so $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/gpu-core/usr/lib/libNNVXCBinary-evis2.so $(TARGET_DIR)/usr/lib

Do we need *all* those libraries in the target? Several of them have
very similar names, they somehow look like alternatives of each other.

>  endef
> +define IMX_GPU_VIV_INSTALL_STAGING_LIBVULKAN

Should have been LIBNN I guess.

> +	cp -dpfr $(@D)/gpu-core/usr/include/nnrt $(STAGING_DIR)/usr/include/
> +endef
> +endif
>  
>  ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
>  define IMX_GPU_VIV_FIXUP_FB_HEADERS
> @@ -88,7 +143,10 @@ endef
>  endif
>  
>  define IMX_GPU_VIV_INSTALL_STAGING_CMDS
> -	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
> +	cp -dpfr $(@D)/gpu-core/usr/lib $(STAGING_DIR)/usr

See here? You are installing all libraries to $(STAGING_DIR), even the
ones that are not in TARGET_DIR. It means you won't get link failures,
but runtime failures (as I explained above).

Are you interested in improving your patch series along those lines ?

Also, Peter Seiderer comment on your patch in December, but you never
replied.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
