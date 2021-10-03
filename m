Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA27C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 21:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7C86134F
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 21:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD7C86134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44D524056D;
	Sun,  3 Oct 2021 21:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCM8apbsC4AK; Sun,  3 Oct 2021 21:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E33040663;
	Sun,  3 Oct 2021 21:06:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6331BF392
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 21:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3901460B48
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiGjIuIWLZln for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 21:06:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 479F760B45
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 21:06:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5B58C13F81D;
 Sun,  3 Oct 2021 23:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633295159;
 bh=bueqqQxRsEBpL5etBmIVyFeNRtNVgQAKXRRgkZz0rqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CHP271O+9bsN+9yOyyUb2ljAS98p63RIOwZYJcVwXQNsMzdjPcLX8CVaxmwyZ01NZ
 qS1EpbOz6HtbrKyofrzlHhKkOoqaE//ecI2gVmXPn36q4ejepRnevkgMo3Xl61uX8k
 cKr1XnA8ln6258QAIGB7lbNxj2/nGgqfbUuUGh6UduLoF/XPHXpJmeJ2wX5buyFpoQ
 faX39bIOHiUVJGRHnxXNCd2asfulpkJh5Yp+8J42sO/I5cTazEHuk3kWqQRQzaWiOK
 PNcjRFYY2exQoAd02y4YCtLv+MuiikAN8WPc/IS3H1Xjj1Cp2FY7zn/G1gDIDuhQQ0
 TzC96aNUsemJQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 23:05:17 +0200
Date: Sun, 3 Oct 2021 23:05:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20211003210517.GA1504958@scaer>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/7] package/opengl/libgbm: new virtual
 package
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kamel, All,

Your series has had a few comments. Most are minor, but one or two need
a bit more insights and can't be fixed while applying. As such, I've
marked it as Changes Requested in Patchwork.

Also, could you write a cover-letter that exlpains the goal behind that
series and how it is organised? A cover letter usually helps reviewers
udnerstand the bigger picture of a series, while the individual patches
describe more localised changes.

Regards,
Yann E. MORIN.

On 2021-09-29 00:37 +0200, Kamel Bouhara spake thusly:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
> wayland.  To enable building libgbm in mesa3d without x11 & wayland we
> need to create a virtual package for libgbm.
> 
> Also other packages besides mesa3d may provide libgbm.so, see
> http://patchwork.ozlabs.org/patch/647235/
> http://patchwork.ozlabs.org/patch/939703/
> 
> We also introduce two feature that shall help user choosing the version
> implemented by a libgbm provider. This foresightly avoid building package
> without having the required libgbm version (e.g. kmscube, qt5, sdl2
> etc.)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> [ Kamel : introduce gbm api features ]
> ---
> Changes v1 -> v2:
>  - Squashed patch 1/2
>  - Added more relevant comment for each features added
> 
>  package/opengl/Config.in        |  1 +
>  package/opengl/libgbm/Config.in | 24 ++++++++++++++++++++++++
>  package/opengl/libgbm/libgbm.mk |  9 +++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 package/opengl/libgbm/Config.in
>  create mode 100644 package/opengl/libgbm/libgbm.mk
> 
> diff --git a/package/opengl/Config.in b/package/opengl/Config.in
> index cbc001427d..cfa51def45 100644
> --- a/package/opengl/Config.in
> +++ b/package/opengl/Config.in
> @@ -1,5 +1,6 @@
>  source "package/opengl/libgl/Config.in"
>  source "package/opengl/libegl/Config.in"
> +source "package/opengl/libgbm/Config.in"
>  source "package/opengl/libgles/Config.in"
>  source "package/opengl/libopencl/Config.in"
>  source "package/opengl/libopenvg/Config.in"
> diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
> new file mode 100644
> index 0000000000..7aa3efb97a
> --- /dev/null
> +++ b/package/opengl/libgbm/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_HAS_LIBGBM
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_LIBGBM
> +	string
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	bool
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +# gbm implementations should select this option if they provide the
> +# format modifier plane count feature. This API was initially introduced
> +# in mesa3d version 17. A gbm implementation provides this feature if it
> +# is implement function gbm_device_get_format_modifier_plane_count.
> +
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	bool
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +# gbm implementations should select this option if they provide the
> +# dma buffer feature. This API was initially introduced in mesa3d
> +# version 10. A gbm implementation provides this feature if it
> +# is implement function gbm_bo_get_fd.
> diff --git a/package/opengl/libgbm/libgbm.mk b/package/opengl/libgbm/libgbm.mk
> new file mode 100644
> index 0000000000..ecab234720
> --- /dev/null
> +++ b/package/opengl/libgbm/libgbm.mk
> @@ -0,0 +1,9 @@
> +################################################################################
> +#
> +# libgbm
> +#
> +################################################################################
> +
> +# This package requires to install a gbm.pc which needs
> +# to be provided by GBM providers.
> +$(eval $(virtual-package))
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
