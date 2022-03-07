Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED06C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4DE4170E;
	Mon,  7 Mar 2022 22:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsMgRG04DEK4; Mon,  7 Mar 2022 22:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F343E4092C;
	Mon,  7 Mar 2022 22:54:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8581BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B18260A98
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irZGedSGsYy9 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5FBE60687
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646693659;
 bh=urXVMW9TZ9tloDvFB/xxbjLGaX24f1yDW96Gr6ZuTwo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ln1jk1pWvqKD1+yyOvzxqc/H5NB+QD71ePxI9q8d8PjP1TtH7U/FHqVsi6pk4L5JW
 5fAue/K1Ro6eKgFRO9tP1gDfeeF9Vz+PFd+rt4IoxJnxPPMi7E8Yg5Wl2noFlkQlHV
 T4J98+SsYXkM4r28HMK0wnPMZCNuuaBJly8c6zWY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.98]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7Ka-1nKEi03eF0-00BbmS; Mon, 07
 Mar 2022 23:54:18 +0100
Date: Mon, 7 Mar 2022 23:54:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220307235417.279e7751@gmx.net>
In-Reply-To: <20220307224226.1375696-1-christian@paral.in>
References: <20220307224226.1375696-1-christian@paral.in>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:anhzXzb0QR2xiBzRtRBeegKv7jaqjtm37lnkjwIRfMk3yeM1YRN
 rIrO7GbNqzN8f8ISKTtf7eKxUhu6g5p2RfKApaT4040082mL7TZvZRFLDC2d0GfVBWbhEk3
 /IxwJHBAJ5YJfUSSaudTOwRHOrtGJ8NOBCwEOsoUAuk/t+ZDbMfZXwYZUKZeB3gbSboDozW
 t0rRIhA9Dknn96i6tTJew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NbIisxK0Ww8=:KxakUxgMA3Y7eF9lUxi1v1
 QbS74FH4oWZIc+Nso4W7RnF/tpV4/DoEfTjug63ifIxjj1E1Abgxfjmjels9z40om+DGrXcuC
 v+NUIN/R4cq65drJndM3TSS3uaZv9Gw/qwNIC2bnfCKL7Hs2Q3ZFNYcQKYKuPgiWuiSScBMwP
 CfQ/mHQM/XaLUs68nhPb8hUW1f6jwrhxwzOCPYfoS3u2SVSKMywGpEtPWJgfAZRkNQo/9MG2/
 g1RnTgV7HZnggTX4sokPOOvIFAN9iHU6DmS+t6s3Q+U2iPxE7keqzVzjtmgTXN+HURJm+5jZM
 zMl8MMP+wOvf87tCCUGbZq2oxSKWt/e2AYAtEyO6RXQ6NM8tCb4zlWYEDHj7ArdXWIDg4qTTy
 bIanq610XFtocCb47KydIMMAU/7Q5TLmpb0/MkZX4UDubCyqN0CzD2F1ZxBDMbwvhY2oAYkl6
 B+1Bho4eSLLLgGkKlrurSJPe9ntsiCDrbAB55OUS9xs/BJ38LZQqWNDunjzYcv/j9EFczmeZg
 XhPHtwdXLN0+teS5xRQwsZ6/m/gh6P/BaHMdODc+crP0BmdMQBJKHPobnpnXcoYRl1u1+hsxt
 kOrGhRzY80Iv7Xe1lCHK70YhawkPZ2RMzm0a3e1w+edIEbqFx4artZ522B8Ys+mGG1LBKivJo
 hCzsh43Go1D8GS/evQH/gZSHvb4UNBU2vhUtJx3sRzhi65i1Eu+81PNc7W4AA3fQcLb5Ci6xx
 hUJBtkZAlHF0/vYTK0kzsXQZVIjStDUM/r1B3/2MQnKdUNeEhPtdk8CeIP5ltyJG/8UG1vZGw
 umEaYpmOIi2g9gL9pZlpx8zxQ6HKZLDv+c+0xUgQLLVwVBDiFujyJbYm01tpmJ9W5krHI2/00
 CFOsfqBUPLS4aC72Mtv14iJ+r9q5A99QuFOr8jUUUjuaJIQ6w8wpJRbOdhAdx1wwew4jBly0n
 +zMy/7iAqZVBTV7CQVIRBjWNCi1JZGGr1HXnXHje6nunOtLtK9A2HyQEHK1mSVxlNDfsfMUld
 iMcaoNhuT321scwwSFXpq7Z6Mde30JFkPRD6WhjbgObvB3CU5Xgm3p2NXMULFrMtdB4sAhtl4
 NlV5VpHfIdPCuGU2Mr6JS+GRMrg8h2d7LwZk2FPq0pEZfbiCorgUFiBQNQOjs6EuYkwxHK7WQ
 Qc09JgF3dv5+Ipk/Nuz75jxAIl
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rpi-userland: add support
 for aarch64 build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Mon,  7 Mar 2022 14:42:26 -0800, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Tested on Pi4 Model B (aarch64).
>
> Note: rpi-userland and upstream rpi os now support arm64.

All issues/questions solved since discussion [1], [2] about
missing libraries/features?

As far as I know rpi os graphic support is based on mesa3d v3d/vc4
instead of rpi-userland libraries?

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/587538.html
[2] http://lists.busybox.net/pipermail/buildroot/2021-October/626080.html

>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rpi-userland/Config.in       | 4 ++--
>  package/rpi-userland/rpi-userland.mk | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> index 342faf26e3..81f3588822 100644
> --- a/package/rpi-userland/Config.in
> +++ b/package/rpi-userland/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_RPI_USERLAND
>  	bool "rpi-userland"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> @@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
>  endif
>
>  comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		BR2_STATIC_LIBS
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 84050b6df3..8a05bf2b51 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -13,6 +13,10 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
>
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>
> +ifeq ($(BR2_aarch64),y)
> +RPI_USERLAND_CONF_OPTS += -DARM64=ON
> +endif
> +
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
>
>  RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
