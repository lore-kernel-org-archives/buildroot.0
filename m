Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEB9EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BE860DF4;
	Fri, 28 Jul 2023 20:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BE860DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWPJ7X3UzU8q; Fri, 28 Jul 2023 20:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 049AC60FB8;
	Fri, 28 Jul 2023 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 049AC60FB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01CDD1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E2D684584
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2D684584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HI8m0VQcsqgV for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:42:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E713B84581
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E713B84581
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2882120002;
 Fri, 28 Jul 2023 20:42:39 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:42:38 +0200
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Message-ID: <20230728224238.2a49c5e0@windsurf>
In-Reply-To: <20230724080409.29778-1-eagle.alexander923@gmail.com>
References: <20230724080409.29778-1-eagle.alexander923@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690576959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJDB0fpm0g3bSujWWWehgJxIg+1AMDqAYixysK8eciM=;
 b=eOiPbn8iQA2y84BKTGJtt2K1Y7DrgRrcQWWow/0szvhYdBFgYiNee4alwcEu0plfKKMNfw
 ivXs2pjF53voWYIEG7ufG2CwzyE6lsFwhHyMrdkGRo49ZU1/6+KIWeIm4nWLrUIufuiucv
 WpoPxk0GFNIqzb+Ub50NPG0x3e+JqdbCrhtnCiLmeL9inAH2J4UKZ3dng1jaT2l+DtqwIP
 TIM8jamJtF70bRuq78xEdxATyvjVEfzk9xA7KdA19TtiOifQ6tmvgk4/1hBaRVmfnjsrS4
 KV9FO+3ReLeUmQehHAxsXlwzmh1zzvRiqKpWEgrVTbyi0Z1Cb1rAvsfzk0JfVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eOiPbn8i
Subject: Re: [Buildroot] [PATCH v2] boot/barebox: Fix building of internal
 scripts
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexander,

On Mon, 24 Jul 2023 11:04:09 +0300
Alexander Shiyan <eagle.alexander923@gmail.com> wrote:

> Some barebox targets need to use internal scripts, for example rockchip64
> uses scripts/rkimage which requires the pkg-config package to look up the
> openssl options. Because buildroot hides the host pkg-config tool, the
> scripts cannot be built correctly.
> To solve this problem, let's use the pkg-config host environment and add
> BR2_TARGET_BAREBOX_NEEDS_OPENSSL and BR2_TARGET_BAREBOX_NEEDS_LIBUSB options
> if barebox scripts should use the openssl or libusb host libraries.

I've reworded this because it was a bit unclear. You're insisting on
pkg-config in the explanation, while really what matters is
host-openssl and host-libusb.

New commit message looks like this:

commit 624d50b20cf4bf4a67ad6274263f85927660f8c4 (HEAD -> master, official/master)
Author: Alexander Shiyan <eagle.alexander923@gmail.com>
Date:   Mon Jul 24 11:04:09 2023 +0300

    boot/barebox: add optional dependencies on host-openssl and host-libusb
    
    Some barebox targets need to build host tools (for example rockchip64
    uses scripts/rkimage) that require some host libraries, such as
    host-openssl or host-libusb. These are detected by the Barebox build
    system using pkg-config.
    
    In order to allow supporting such Barebox configurations, we add two
    new options: BR2_TARGET_BAREBOX_NEEDS_OPENSSL and
    BR2_TARGET_BAREBOX_NEEDS_LIBUSB that respectively allow to ensure that
    host-openssl and/or host-libusb are built before Barebox.
    
    Additionally, $(1)_MAKE_ENV is adjusted to ensure that when pkg-config
    is run by the Barebox build system, it finds host libraries. This is
    similar to what is done in U-Boot.
    
> +ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
> +BAREBOX_DEPENDENCIES += host-openssl
> +endif
> +
> +ifeq ($(BR2_TARGET_BAREBOX_NEEDS_LIBUSB),y)
> +BAREBOX_DEPENDENCIES += host-libusb
> +endif

You forgot host-pkgconf in both cases. Without this, you have
host-openssl and/or host-libusb installed but pkg-config is not there
to allow detecting them. I fixed that up when applying.

Thanks for your work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
