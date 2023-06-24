Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2402CEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 21:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8949940A94;
	Sat, 24 Jun 2023 21:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8949940A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzmnYbmLzOU3; Sat, 24 Jun 2023 21:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9766D4095D;
	Sat, 24 Jun 2023 21:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9766D4095D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DBAD1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56FD44095D
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 21:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56FD44095D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZIMLSLjOdH3 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 21:23:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421D6401F3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 421D6401F3
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 21:23:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 25F6CB004FF;
 Sat, 24 Jun 2023 23:23:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 23:23:31 +0200
Date: Sat, 24 Jun 2023 23:23:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230624212331.GE24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-2-dannenberg@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622160212.2063472-2-dannenberg@ti.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687641814;
 bh=/TyKXRiRHqz4Oea8oi93Zf6YT2DQwGhmNdVFl1XHI9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kIhA65OgLNPAG0GDLtAo/eU0zXd5WizANuE9uh7X82vVT5GtSD6DrTVw4gEJNpns8
 zBNgmCt9UFRJ/QkdVfvHMSDUyuNnzX3Bq0L9zKtzQ6NXGaxf9LP8JbK12Vlp7WB6m5
 NQGNGt097J2nGXe5OttFqVQWpY6WrZKAuAJnikRPGEIGC35n679FFYYii+PqBohObG
 jn11PmIRNXEfuh+hSp9Fef9bZEuOcv0XFxA/ESNQFBxea5UFIlIXYEC/OhpLCk/Iao
 c4Qz7WSDBhkiI5EMcLQ/KYl2AwTqNpzgvWPvkn9ZDzMyyBM7L9s1786YLQLgOhDeH5
 6AL7Ed4sSOC4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kIhA65Og
Subject: Re: [Buildroot] [PATCH v9 01/11] boot/ti-k3-r5-loader: allow for
 full build source customization
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

Andreas, All,

On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> The TI K3 R5 loader package essentially is a wrapper to build a special
> version of U-boot SPL used as part of a multi-stage boot flow on TI K3
> devices, and as such needs full flexibility as to specifying the U-Boot
> sources used for the build. To accomodate this, add the same options as
> already available in the regular U-Boot package. For most use cases, the
> same source settings (repo URL, versions, etc.) should be used for both
> ti-k3-r5-loader and uboot packages.

Currently, there is no dependency ("depends on" or "select") between
uboot and ti-k3-r5-loader; yet, your phrasing seems to imply that it
does not make sense to build ti-k3-r5-loader without building uboot.

Then, in the comment below, you add a note about "Falcon boot (which
would skip the uboot package completely)".

So, I'm a bit curious here: what should the user do when uboot is not
enabled, if we instruct it to use the same version?

> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  boot/ti-k3-r5-loader/Config.in          | 65 +++++++++++++++++++++++--
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 32 +++++++++++-
>  2 files changed, 93 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index 10602c8df3..2419babe70 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -1,14 +1,73 @@
>  config BR2_TARGET_TI_K3_R5_LOADER
> -	bool "ti-k3-r5-loader"
> +	bool "TI K3 R5 Loader"

Our prompts always match the package name in Buildroot, i.e. the
directory name. In this case, ti-k3-r5-loader is exactly that and we
want to keep that.

>  	depends on BR2_aarch64
>  	help
> -	  Separate U-Boot build for R5 cores on TI's k3 boards.
> +	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
>  	  Usually used to build tiboot3.bin with k3-image-gen.
>  
>  if BR2_TARGET_TI_K3_R5_LOADER
>  
>  choice
> -	prompt "Configuration"
> +	prompt "U-Boot Version"

It is a bit confusing tho see "U-Boot version" in the "ti-k3-r5-loader"
package. I know it is really just a uboot being compiled, but still this
is confusing. I'd keep ti-k3-r5-loader in the prompts. I could be
convinced for the middle ground "ti-k3-r5-loader U-Boot version" if you
really want to have U-Boot there.

Since you want the defaults to be the same as uboot, you can do that:

    choice
        bool "U-Boot version"
        default BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION if BR2_TARGET_UBOOT_LATEST_VERSION
        default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION if BR2_TARGET_UBOOT_CUSTOM_VERSION
        default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL if BR2_TARGET_UBOOT_CUSTOM_TARBALL
        default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT if BR2_TARGET_UBOOT_CUSTOM_GIT
        default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG if BR2_TARGET_UBOOT_CUSTOM_HG
        default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN if BR2_TARGET_UBOOT_CUSTOM_SVN
        default BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION  # Fallback if uboot not enabled

    ...
    endchoice

    config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE
        string "U-Boot version"
        default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
        depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION

    config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION
        string "URL of custom U-Boot tarball"
        default BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
        depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL

... and so on, you get the gist.

[--SNIP--]
> +	prompt "U-Boot Configuration"

Same comment as for the version prompt.

[--SNIP--]
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index afa309aa98..341888623e 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -2,11 +2,41 @@
>  #
>  # ti-k3-r5-loader
>  #
> +# The ti-k3-r5 loader package should really be built from the same U-Boot
> +# sources as the uboot package itself, so for most users so all LOADER_SITE /
> +# LOADER_SOURCE type definitions should be set the same for both packages.
> +# However it still makes sense to keep the ti-k3-r5-loader package somewhat
> +# separated and independent from the uboot package to allow for special use
> +# cases such as Falcon boot (which would skip the uboot package completely).

Do you mean that uboot would not be built at all, or that the uboot
binary would not be loaded at runtime?

Regards,
Yann E. MORIN.

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
