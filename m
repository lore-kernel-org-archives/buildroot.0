Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF387C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6397960C0F;
	Mon, 21 Feb 2022 20:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TRa1KlEsTd2; Mon, 21 Feb 2022 20:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8807960B87;
	Mon, 21 Feb 2022 20:12:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 506AE1BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D633401AD
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J13e4vsFohbX for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:12:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03847400A8
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:12:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i11so30000317eda.9
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 12:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyMS4r9a/W6qLT3iioT0PhgMx8Gu35B75k9n/Ozhdvk=;
 b=D1X3YZFNazoI6DUrdGchEYl1n4x/0DW1WmqFEgSZvRbxxH0mieXUdVE/r8+iN2O3fW
 wOIWU1KD08Oys0DsE3LZ+ODztAsuhAWNIUh6mM8072TcxOPbt8EQIxFrpiZr72r3PO1t
 Z+j1qdf9vPvsBzWwaO1Ij4DkhyuA2o7dN/EO7w5xIFsa3oYInaqgbAZxDF8a6Xa7I0yf
 9dS7mLZpUsRcNIj3hX8cSbM3XDHcz6R0SVure9FozHH43GiPWNFii8gcicaeL/E8JEqo
 XD87ppeqU+2tBDxUC4+/Bpw/Nm/zlC++mTjnwTXK7e2kgeqfGJnY9jxwC/28sDsdKPPr
 n4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyMS4r9a/W6qLT3iioT0PhgMx8Gu35B75k9n/Ozhdvk=;
 b=byWP2VywB4zt9rB3FQOHT4jUg3ndzhgC165CSR+piFZxvOkCLuI26dR99wZsJPZSnT
 tfVZTiSxRhGhjVdmbEPvyfClv1EfwLy7+t1JA2+u9Qsyf6o788e2memaWvcIqj8v1+UH
 fb2Xf812Xw6oIzFysj/CxAuyD0gnKnieBp4Awav/YxM8ThZrAopu+U/QIY6eggc7z6Uq
 zXFhxBWGZdqSFqr+h0Em+pR4PYob5No5vejJQbMqnraM0nQOXP1ArcsEriss8ERb5WbC
 NxM49LYQUzEB2Z7k9ZETjOrfZZcnLXWOMrKzYU/cx0LGIPEz4Wxz9DvbSkurWwG/m4fn
 Kg3Q==
X-Gm-Message-State: AOAM532+1uRJX7boPzn9ZyDh1264pO8U2cdMs+C7we09HkT3/K0ML/bs
 6bq5ku2RKzCv8iwnYfs8wxNK9heTqZtJhe6of7n9OuajX8E=
X-Google-Smtp-Source: ABdhPJzGLMhjE2H/6Gns8AUwEBdRp3vB44JPp8xFxAgqFyfOA0WQQgi02LisNwegR4+H5jKQg640XMKR0FT1hS7SQoo=
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id
 g11-20020a056402090b00b00412a7ccf5f9mr21937423edz.136.1645474330913; Mon, 21
 Feb 2022 12:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20220221192302.20698-1-petr.vorel@gmail.com>
In-Reply-To: <20220221192302.20698-1-petr.vorel@gmail.com>
Date: Mon, 21 Feb 2022 21:11:59 +0100
Message-ID: <CAGm1_kt2LGV11DEOZdYEyKDijRY6TL7SezpsnMNQ3hHUaB-YsA@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.10
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

On Mon, Feb 21, 2022 at 8:23 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Tested:
>
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
>
>                              andes-nds32 [ 1/45]: FAILED # not related to this change
>                              arm-aarch64 [ 2/45]: OK
>                    bootlin-aarch64-glibc [ 3/45]: OK
>                bootlin-arcle-hs38-uclibc [ 4/45]: OK
>                     bootlin-armv5-uclibc [ 5/45]: OK
>                      bootlin-armv7-glibc [ 6/45]: OK
>                    bootlin-armv7m-uclibc [ 7/45]: SKIPPED
>                       bootlin-armv7-musl [ 8/45]: OK
>              bootlin-microblazeel-uclibc [ 9/45]: OK
>                    bootlin-mipsel-uclibc [10/45]: OK
>                 bootlin-mipsel32r6-glibc [11/45]: OK
>                 bootlin-m68k-5208-uclibc [12/45]: SKIPPED
>                bootlin-m68k-68040-uclibc [13/45]: OK
>
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 14597215df..ea91f42fe0 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
> +sha256  d4f804b31cf504239c5f1d4973c62095c00cba1ee9abb503718dac6d146a470a  ModemManager-1.18.6.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index a881edc272..d7e2c55bf8 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -MODEM_MANAGER_VERSION = 1.16.10
> +MODEM_MANAGER_VERSION = 1.18.6
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
> --
> 2.35.1

The patch title should be about version 1.18.6 and not 1.16.10.

Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
