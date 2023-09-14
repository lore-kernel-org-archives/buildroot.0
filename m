Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F89CA553C
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 13:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE6941D9F;
	Thu, 14 Sep 2023 13:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE6941D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQazoT414Dhs; Thu, 14 Sep 2023 13:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB98241DD1;
	Thu, 14 Sep 2023 13:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB98241DD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 766B71BF3C3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 13:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3792760E4E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 13:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3792760E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRDPTUgXNiJf for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 13:14:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87EA660E22
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 13:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87EA660E22
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD8DD1C0009;
 Thu, 14 Sep 2023 13:14:37 +0000 (UTC)
Date: Thu, 14 Sep 2023 15:14:36 +0200
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230914151436.4c5e8073@windsurf>
In-Reply-To: <CADYjeSs78_vitxWDHo=zDMC9MJyaW7zcaQhuJn2n3AmzkvtZjA@mail.gmail.com>
References: <CADYjeSs78_vitxWDHo=zDMC9MJyaW7zcaQhuJn2n3AmzkvtZjA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694697277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yi1xMGAV/May0Bpi1LBGruUEMEapgzphKm6sJitdw0I=;
 b=XuJeRRybGfhn4rxByUUYcXeWz9EAsHrF9JHoQySinJe7emVWK+sSoc2ckxPOkA5aF1uLg7
 vzF0YNi2hP0YWynzLzF5wXESfRUR4GIpWw5pjsFDKxo0IfaQ0XtnoPRzG8j19VwKr3aroP
 Ktr147o1xmbeUoRGQ7zYLPV2GQmH48g05+G+Sb+BWU0tLI5vPKkmjd8OyMzanZyb14Hac2
 /W8jsxIu4k5vHXOiuwRX8UkxGV7pumcZ78xQPIaERdJxQyM/f6kdoujkZgelkwT5P1WgwH
 llBholeD2MJCaXAQC6CE6qPEv+phe6XwgN+FgM+D0p/YrnJ58RjOCkoiezSZKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XuJeRRyb
Subject: Re: [Buildroot] Error linking against target architecture while
 building new package
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

On Thu, 14 Sep 2023 12:15:27 +0200
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> /usr/bin/make -j17 LDFLAGS="" -C
> /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
> SDKTARGETSYSROOT=/.../per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot
> AQROOT=/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
>   LINK    libovxlib.so.1.1.0
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so
> when searching for -lOpenVX
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so
> when searching for -lOpenVX
> /usr/bin/ld: cannot find -lOpenVX
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so
> when searching for -lOpenVXU
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so
> when searching for -lOpenVXU
> /usr/bin/ld: cannot find -lOpenVXU
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so
> when searching for -lCLC
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so
> when searching for -lCLC
> /usr/bin/ld: cannot find -lCLC
> /usr/bin/ld: skipping incompatible
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libVSC.so
> when searching for -lVSC

You're using the host linker here (/usr/bin/ld), which of course will
not work to link binaries for the target. Replace:

define IMX_NN_ACCELERATOR_BUILD_CMDS
    $(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) \
        SDKTARGETSYSROOT=$(STAGING_DIR) \
        AQROOT=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
endef

By:

define IMX_NN_ACCELERATOR_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
        SDKTARGETSYSROOT=$(STAGING_DIR) \
        AQROOT=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
endef

TARGET_CONFIGURE_OPTS contains the definitions of CC, LD, CFLAGS,
LDFLAGS, and a whole bunch of other variables.

Also, AQROOT can use $(IMX_NN_ACCELERATOR_BUILD_DIR) directly.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
