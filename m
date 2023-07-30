Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E61CC001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9DBB60AD0;
	Sun, 30 Jul 2023 10:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9DBB60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLll2jraFA4d; Sun, 30 Jul 2023 10:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 333FF60774;
	Sun, 30 Jul 2023 10:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 333FF60774
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C80361BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A01434136B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A01434136B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZVT3wv9x3Ig for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:27:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F9F841365
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9F841365
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF761C0003;
 Sun, 30 Jul 2023 10:26:51 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:26:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730122650.5592af4b@windsurf>
In-Reply-To: <20230708200447.3919009-2-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690712818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykpKZcyqhkzI0hwQ13RiLZWFrFF7WOEz5uDMyZ/qtz0=;
 b=LFIyXiPC1BeQpnlTc6aduxtUqNThR31WZGdslb3DK5ypSfTxH99p8wCRVmM7+nyCDC3BEZ
 xO6WDOKSfBUsb29prFQNVp7L/ch61GI++Yn1WyS//mP5RLI8PIFQIaEGD+i2EKgQqGLiHy
 mRIG6bF7isjvhS3hkeYKQUWnHy3aegmyluow5ObMCnnVeAm1pHFpAf/tFCosAJfSFRdzZe
 weBSHzKK5fx+y5EA8CiRnhUnhUxw2/SoOuGB+B4SHBuwVcpUwGx/DLxhcEu/fssCei+s2z
 d2k82Ppei/gY+cCUtT2z3YmWei/jJyclhNKvjJZqsmziZpHL1igLF4tFlKO05A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LFIyXiPC
Subject: Re: [Buildroot] [PATCH 2/7] package/libheif: new package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

I've applied, but I have some comments below. Giuliu, there is also a
question for you.

On Sat,  8 Jul 2023 22:04:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/libheif/Config.in b/package/libheif/Config.in
> new file mode 100644
> index 0000000000..9ce507fd24
> --- /dev/null
> +++ b/package/libheif/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBHEIF
> +	bool "libheif"
> +	# avoid build error
> +	# Internal error in emit_expr_encoded at dw2gencfi.c:215
> +	depends on !BR2_m68k_cf

Giulio, do we have a BR2_TOOLCHAIN_HAS_..._BUG for this? Are other
packages affected by this? I see quite a few BR2_m68k_cf conditionals
sprinkled all over the places in Buildroot.

> +	depends on BR2_INSTALL_LIBSTDCPP

I've added a dependency on gcc >= 4.8, because this package uses C++11.
I have verified it builds fine with GCC 4.8.

Applied with this tweak.

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
