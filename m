Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4005EC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 06:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B0E409B4;
	Tue,  9 Aug 2022 06:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B0E409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvqO44zp2Qvw; Tue,  9 Aug 2022 06:45:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B6E409A3;
	Tue,  9 Aug 2022 06:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57B6E409A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B66EB1BF289
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 06:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9116860B72
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 06:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9116860B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqp0y1PR8sLq for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 06:45:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA9260B63
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAA9260B63
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 06:45:22 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id p18so10528704plr.8
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 23:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=VkZQiASi/oIVVryCttnIio69IMA7GLb/yxNllEfQ1jA=;
 b=5qHV8s5jl8nRTV8EnGGrqVGJcu+aYouTjmyYI/2UJhiD1XlEZIVs6OxC7xhBzvFY5m
 jeWlzZH8H6eBiVwZIsCvrO2i1WVCbxYHdsS9Zgrf52AB6nhwSbGIhtEfLOb9qof7xL8B
 PiTC11PjkR0cJgegaba5Y81X2ZJ92BDFzuvGu6HpDCXJyezHPNBuhvER+qVdvGRUJa+l
 rq3Tft6FKs070nR43HTbR/YTaOSe42Ob3SGydvwA23bR4gmwO/hMjsPAvjoCooz1ewx9
 De56FMZ8UL5ll+I8fz9jUohRAD9OrfXe0X5IG1PNkY4PWeJ7kV2a3LYhIE2sE1AVN175
 8Qxw==
X-Gm-Message-State: ACgBeo0MM8CPyChAnfATsb+dbplGYnBKDkSa23WlfeQge1NVzL2si6qR
 LTpfZFaBpc/W7WH88BF5wPvKNtMj7f6tJwECdMvKT1lP4MY=
X-Google-Smtp-Source: AA6agR7WQ6rykLmAPn+w2HOWOLN75tHZA/+wyb2Cb8qxtYT+NTUpH68rrgT4ccijjB/JgpFPKWPf7bWHkgKo8w534FI=
X-Received: by 2002:a17:902:e749:b0:171:2480:4320 with SMTP id
 p9-20020a170902e74900b0017124804320mr1592458plf.153.1660027522060; Mon, 08
 Aug 2022 23:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220807210317.9415-1-heiko.thiery@gmail.com>
 <20220808104133.6479c0a5@windsurf>
In-Reply-To: <20220808104133.6479c0a5@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 9 Aug 2022 08:45:09 +0200
Message-ID: <CAEyMn7Y+2=+2ruq-4+kvHqX2YXVNoGYLskYrYpjKfAxPfY2XOw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=VkZQiASi/oIVVryCttnIio69IMA7GLb/yxNllEfQ1jA=;
 b=Rz0Zh61D7tkKNGRC1HL7ah6nHM0S/y5lmbj3R7HEY7SKBTAVHkQfg7TLKZfW6SB2Id
 1BKjnQlEMetaynPcNGrVLBV1Qs0Q+nkkdITlI1aixbHCSDrG/rNHkRXoqX0DiXPtwDR6
 wZsKt3S1HPgHp0XZ5Hk33xYhHYp5HynVgYaqaXopj/lDIJugIkwImdt2Svhe0TBCeIBl
 ApYRGd1Fl9/CJyax5spNbVAX/8YK+79eW5CxhRHAfZd1EoZvbxaD0wuyZiufi4nkv6CU
 6qDK7yGxRod2ys4cui1sqxnhy07i2pzd8sJzVZdQg540iR8Qqgbbsv2dcZXzGgUP3SuJ
 CJsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rz0Zh61D
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: fix
 build failure with u-boot 2022.04
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Mo., 8. Aug. 2022 um 10:41 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> Thanks for the patch!
>
> On Sun,  7 Aug 2022 23:03:18 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > +-HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
> > ++HOSTLDLIBS_mkeficapsule += \
> > ++    $(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")
>
> Do you understand why this is needed?
>
> In the build failure reported by Gitlab CI, it fails to find libgnutls,
> even though host-gnutls has been built before. So the -lgnutls that was
> in HOSTLDLIBS_mkeficapsule should have been sufficient, provided
> $(HOST_LDFLAGS) are properly used.

Without the patch:
--- 8< ---
  /usr/bin/gcc -O2 -isystem
/home/hthiery/sources/mainline/buildroot/output/host/include
-Wp,-MD,tools/.mkeficapsule.d -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer   -std=gnu11   -DCONFIG_FIT_SIGNATURE
-DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff -DCONFIG_FIT_CIPHER
-include ./include/compiler.h -idirafterinclude
-idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools
-DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -o
tools/mkeficapsule tools/mkeficapsule.c   -lgnutls -luuid
--- 8< ---

With the patch:
--- 8< ---
  /usr/bin/gcc -O2 -isystem
/home/hthiery/sources/mainline/buildroot/output/host/include
-Wp,-MD,tools/.mkeficapsule.d -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer   -std=gnu11   -DCONFIG_FIT_SIGNATURE
-DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff -DCONFIG_FIT_CIPHER
-include ./include/compiler.h -idirafterinclude
-idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools
-DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -o
tools/mkeficapsule tools/mkeficapsule.c
-L/home/hthiery/sources/mainline/buildroot/output/host/lib -lgnutls
-luuid
--- 8< ---

The -lgnuts and -luuid seems not to be sufficient. Using pkg-config
will also add the -L<PATH-TO-LIBS>.


>
> Of course, I have nothing against using pkg-config, but I was just
> wondering if we have an explanation on what was going on. And is
> pkg-config fixing it because it's return a full path to the library?
>
> Obviously, one issue with your patch is that it's going to fix the
> problem only for the kontron defconfig, which is why I was interested
> to see if there wasn't a better solution.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
