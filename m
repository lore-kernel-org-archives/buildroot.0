Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9514CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89A0D41518;
	Mon, 16 Oct 2023 10:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A0D41518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMoUX3yPBsHa; Mon, 16 Oct 2023 10:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC018415C3;
	Mon, 16 Oct 2023 10:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC018415C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 052F91BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B14064151A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14064151A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmnvBuwch-9V for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:11:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38EEE41554
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38EEE41554
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7AE51C0004;
 Mon, 16 Oct 2023 10:11:26 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:11:25 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121125.4fd68d67@booty>
In-Reply-To: <20230924151205.2099293-2-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAUADskYgKFGLbx4QAFsrLW3b6c4KXQYxMajiigTYH0=;
 b=iDmoCus64TTr/lLpdrI672+l5A8o+OoR/gAfbEr285E2OkhyFLgmM4p2sUTxp7UOoJ7QOx
 kU9ALKH/8MEZyR9cgqHUskxCsFec4oM6q0beGBUc+ELusmRlyWMGRtOCI75DXuAtUmJzfY
 Tb180TMdhgWXxVKFpCLg4GllaF39S2YvzzUNnDpzYP8DLqVM8Z6GexIRWBEYtxYehT+Lcg
 SSD6BKRiSiuiSwuKlPEnTiw1hqP3wv6lJFV+XXKBzlnAB5eD4ZVaDhbgxU+KxTddE5o4aN
 gvY+nAuI5t5jkfxqlUDMx5Hz04mD4ESrjQVmzNlJEDB28KP4plfqT80ZmlQZMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iDmoCus6
Subject: Re: [Buildroot] [PATCH v4 02/10] package/gcc-bare-metal: new package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal, Ibai,

On Sun, 24 Sep 2023 16:11:57 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new package for building gcc for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.
> 
> When configured for the Xilinx microblaze architecture, all of the gcc
> patches that are applied to the Xilinx distributed toolchain will be applied
> in order to generate a toolchain that is equivalent to what Xilinx distributes.
> 
> Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

...

> --- /dev/null
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +# gcc-bare-metal
> +#
> +################################################################################
> +
> +HOST_GCC_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_GCC_BARE_METAL_VERSION))
> +ifeq ($(HOST_GCC_BARE_METAL_VERSION),)
> +HOST_GCC_BARE_METAL_VERSION = 12.2.0
> +endif
> +
> +HOST_GCC_BARE_METAL_SITE = https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
> +HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
> +
> +HOST_GCC_BARE_METAL_DEPENDENCIES = host-binutils-bare-metal host-gmp host-mpc host-mpfr host-isl

Missing _LICENSE.

Otherwise LGTM.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
