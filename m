Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EE8C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7972A404CA;
	Sat, 31 Dec 2022 16:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7972A404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkRSuEMpj_vS; Sat, 31 Dec 2022 16:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A1D40895;
	Sat, 31 Dec 2022 16:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A1D40895
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DACCE1BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B45874033A
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45874033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpmXzqbUUMkM for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:35:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C46402A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47C46402A6
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:35:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A956A13F88D;
 Sat, 31 Dec 2022 17:35:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 17:35:00 +0100
Date: Sat, 31 Dec 2022 17:35:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221231163500.GQ2498764@scaer>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672504513;
 bh=t61/datRhd45nQEm3q/jnl7A4kSf+V5ABgh6Hu5Rk4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJnyq0Cq9RCD2VdL451h3shNtobJKbWk5mySH9r8DXW62kRYvi5D14URYhVcekTuH
 m9BonZQi7EItlf6KcXOZ6rUWkMRZOG/AW1aApSYLdg0dsNGJ/Nj0ivGGM164WoGR6h
 KFO6F1usEQWCUwlpnu7nK1LtbjlyNpqBTe1ruxDkcABXOcCn8DKKhWhyb9C/8NjLMD
 B4RBM+X7wz8DBCSKrfTTlX1pHKratTjIj1qYUK8MOm+6eBzb3DFRe1XGIwxZiIZuB3
 J3x0P4aF7eyBGjs5IpVKCmXt4PawzZtnkqYJMtsGh9pRyCfaVyG7blmGcyg/cIC9YT
 NeW0XRjRVM1IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jJnyq0Cq
Subject: Re: [Buildroot] [PATCH 01/27] package/imx-mkimage: update
 codeaurora URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-12-29 20:47 +0100, Julien Olivain spake thusly:
> NXP moved all its open source code repositories from Code Aurora Forum
> to github. See for example:
> https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097
> 
> Software packages are now grouped in several NXP github
> projects/organizations (nxp-imx, nxp-qoriq, ...). See:
> https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB
> 
> The NXP code published on Code Aurora is still present (at the time of
> this commit) but is no longer receiving updates. It is also expected
> to be shut down on 2023-03-31. The Code Aurora website
> https://source.codeaurora.org/ currently show the following message:
> """
> Note: Qualcomm Innovation Center Inc. maintained repositories have
> migrated to git.codelinaro.org. QUIC repositories on this site will
> not receive any updates after March 31, 2022, and will be deleted on
> March 31, 2023. If your project depends on these repositories, please
> adjust your tooling configuration to use the new, up-to-date project
> location.
> """
> 
> For this reason, the NXP recipes using codeaurora.org urls need to be
> updated to the correct github.com replacement.
> 
> Note: this commit does not change the component version. Only the
> download URL is updated. The archive content is expected to be the
> same.
> 
> Note 2: the _SITE_METHOD is also changed from "git" to the default
> "wget", for faster downloads. This is why the package hash has
> changed.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Whole series of 27 patches applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/imx-mkimage/Config.in.host   | 2 +-
>  package/imx-mkimage/imx-mkimage.hash | 2 +-
>  package/imx-mkimage/imx-mkimage.mk   | 3 +--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/imx-mkimage/Config.in.host b/package/imx-mkimage/Config.in.host
> index 8d273557a1..09df2a3c29 100644
> --- a/package/imx-mkimage/Config.in.host
> +++ b/package/imx-mkimage/Config.in.host
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_HOST_IMX_MKIMAGE
>  	  imx-mkimage is used to combine input images and generate
>  	  final boot image with appropriate IVT set.
>  
> -	  https://source.codeaurora.org/external/imx/imx-mkimage
> +	  https://github.com/nxp-imx/imx-mkimage
> diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
> index 81d99a5d1c..8346fd64b1 100644
> --- a/package/imx-mkimage/imx-mkimage.hash
> +++ b/package/imx-mkimage/imx-mkimage.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  769b3d7376a1f7107ce2958a1babe361bfd29e2cbfbe47eeb2911acc460058e5  imx-mkimage-lf-5.10.72_2.2.0-br1.tar.gz
> +sha256  593bd94aac027844bc58c62aae55557c14e1f8a99e68ba235a46f083759df3d4  imx-mkimage-lf-5.10.72_2.2.0.tar.gz
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
> index 0bfca72504..54c948e0d3 100644
> --- a/package/imx-mkimage/imx-mkimage.mk
> +++ b/package/imx-mkimage/imx-mkimage.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  IMX_MKIMAGE_VERSION = lf-5.10.72_2.2.0
> -IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
> -IMX_MKIMAGE_SITE_METHOD = git
> +IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
>  IMX_MKIMAGE_LICENSE = GPL-2.0+
>  IMX_MKIMAGE_LICENSE_FILES = COPYING
>  HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
> -- 
> 2.39.0
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
