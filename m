Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CDEC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:05:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A0F60E76
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07A0F60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06828303C;
	Sat, 28 Aug 2021 10:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWypSvxZyBK9; Sat, 28 Aug 2021 10:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D2B83046;
	Sat, 28 Aug 2021 10:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 989791BF4E7
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8270783046
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gw9LfHtYow8x for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 10:04:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 825D48303C
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:04:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp3-g21.free.fr (Postfix) with ESMTP id 6C43213F8A7;
 Sat, 28 Aug 2021 12:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630145092;
 bh=enu3zHtxaTPvzPv/Bbym9CRbxsrEU3x834+NG6S0NZ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rmNwrsmRMSd9ijSFHzcuD/WzMveEkfSURizCQiBBkqugnMXoaSSP6P0w4cWoInHLY
 rPY4Ep2XKX2OI27M5bxUyhM/Ree+OAYDSqX6qD4P8QLLf7B98D0BfPv0KgRr+L1dXx
 33LQYH0ACGpDrH1n++MFfNpTiBLZvst+uOT+U1efHGu+fLLMWLOlRQIKs9J6Nst5iP
 wxMNuCAi7ONp6PSYibRxtILUHzsSWq2UwNH2hZaatUg/J4AnnZzd3BZguO/c7er5Jo
 Nm2Emfj6LS9rnK6IakLDsKm0nprH1eH9PBCkEU6gQ5h26BYDV+kAQW0kjnoFSNoIvS
 GIsZzd/zlNYOg==
Received: from [37.165.218.199]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 28 Aug 2021 12:04:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20210827221930.286234-1-fontaine.fabrice@gmail.com>
References: <20210827221930.286234-1-fontaine.fabrice@gmail.com>
Message-ID: <7dc6c3e3562fa2e8d1ddd3adf3cc8923@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
Subject: Re: [Buildroot] [PATCH 1/1] package/glslsandbox: kms needs gbm
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

On 28/08/2021 00:19, Fabrice Fontaine wrote:
> Obviously, KMS/DRM/GBM needs gbm (and so mesa3d which is the only gbm
> provider since commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03):

To my knowledge, imx-gpu-viv also provides a working gbm.

> checking for gbm... no
> configure: error: Package requirements (gbm) were not met:
> 
> Package 'gbm', required by 'virtual:world', not found
> 
> Fixes:
>  -
> http://autobuild.buildroot.org/results/31b3fff9748300e293b4efb5615176ccce48dd15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glslsandbox-player/Config.in             | 4 ++++
>  package/glslsandbox-player/glslsandbox-player.mk | 4 +---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glslsandbox-player/Config.in
> b/package/glslsandbox-player/Config.in
> index dc0d2c07f1..b85dff6a2f 100644
> --- a/package/glslsandbox-player/Config.in
> +++ b/package/glslsandbox-player/Config.in
> @@ -67,8 +67,12 @@ choice
>  config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
>  	bool "KMS/DRM/GBM"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +	depends on BR2_PACKAGE_MESA3D_GBM

There was already few discussions to have a gbm virtual package, which 
was not
accepted.  See [1].  I believe this is the kind of thing that would help 
in
that case.  It is a valid case (but maybe not really common) to do 
OpenGL ES
accelerated graphics, on top of KMS/GBM, without being a Wayland 
compositor.

The next best candidate I see would be a dependency on
BR2_PACKAGE_HAS_LIBEGL_WAYLAND, introduced in commit
1e3dfef19d8ae3804671a03b30003fa2d8115fc6.

Since gbm is usually in those dependencies, that should fix this build 
failure,
even if the dependency is not accurate (we depend on what a wayland 
compositor
would need, and this package is not a compositor).

See also commit fed835768aac18f2457544ff40f3b59b387117ed

Finally, we could eventually introduce here a
BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS_SUPPORTS
which lists the dependencies known to work in that case:
I see at least: BR2_PACKAGE_MESA3D_GBM and
BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL

>  	select BR2_PACKAGE_LIBDRM
> 
> +comment "KMS/DRM/GBM backend needs mesa3d w/ GBM"
> +	depends on !BR2_PACKAGE_MESA3D_GBM
> +
>  config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
>  	bool "Allwinner ARM/Mali Frame Buffer"
>  	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
> diff --git a/package/glslsandbox-player/glslsandbox-player.mk
> b/package/glslsandbox-player/glslsandbox-player.mk
> index 5ace69d7dd..4f058772df 100644
> --- a/package/glslsandbox-player/glslsandbox-player.mk
> +++ b/package/glslsandbox-player/glslsandbox-player.mk
> @@ -37,9 +37,7 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += 
> --disable-install-scripts
>  endif
> 
>  ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
> -# gbm dependency is not needed, as it is normally packaged with
> -# libegl/libgles drivers.
> -GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
> +GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm mesa3d

Same comment: mesa3d is not the only gbm provider.

>  GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
>  else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
>  GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline

What do you think?

Best regards,

Julien.

[1]. 
https://patchwork.ozlabs.org/project/buildroot/patch/20180913194410.24077-1-bernd.kuhls@t-online.de/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
