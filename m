Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AADC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 19:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C22B0825C7;
	Fri, 14 Oct 2022 19:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C22B0825C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-pHMhuxdfvQ; Fri, 14 Oct 2022 19:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE23C81BC6;
	Fri, 14 Oct 2022 19:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE23C81BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4CB1BF352
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D1B418CF
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D1B418CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uL_CE3-3NvR6 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 19:18:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B227418B7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B227418B7
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 19:18:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:24db:412f:58ba:c302])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A7827780340;
 Fri, 14 Oct 2022 21:18:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 21:18:46 +0200
Date: Fri, 14 Oct 2022 21:18:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20221014191846.GC2503@scaer>
References: <20221014172013.758628-1-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014172013.758628-1-mmayer@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665775130;
 bh=VGbzLbYRVFqzONvUtQXF3X5zJGfNOUilUC2rFsht82c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l+ASIB4cR+S3dnnHgZJLIZEM+YLPaOzUM5ZlXfGjrxo9gqmCLXOXDPMMe2KEqc02e
 XLXVC4oLEwgBYbQCFgqu915OeU7soz5E27x2Cb4o510JN7sNZm+m9A7U441EguTuZB
 9sVYwRco8APRz1vKqwlWYD/sBiktovlO5yL5RrEFp0yQgT7tGp/10iMPRZfmkAg1FG
 pFEBl6myHE/r4qPelC2UgDUwFilOzVVuUz6eqhZ/xRnWO5jOUe6Nn9PW/mleNQfjo/
 oQxjJynzeFQAT2c+T7XDjQDF04RYkYXSIWi8F/U1ra8bIyix25vyST4otQopMKIVU0
 87criZPaHPxoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l+ASIB4c
Subject: Re: [Buildroot] [PATCH v2] mmc-utils: allow enabling of "dangerous
 commands"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2022-10-14 10:20 -0700, Markus Mayer via buildroot spake thusly:
> Provide a config option that allows the user to enable mmc's "dangerous
> commands" if so desired. mmc-utils considers turning on permanent write
> protection on a device a "dangerous command" and doesn't offer it by
> default.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/mmc-utils/Config.in    |  8 ++++++++
>  package/mmc-utils/mmc-utils.mk | 10 +++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
> index 850aeac44571..0283658a7a57 100644
> --- a/package/mmc-utils/Config.in
> +++ b/package/mmc-utils/Config.in
> @@ -8,3 +8,11 @@ config BR2_PACKAGE_MMC_UTILS
>  
>  comment "mmc-utils needs a toolchain w/ headers >= 3.0"
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +
> +config BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS
> +	bool "Enable dangerous commands"
> +	depends on BR2_PACKAGE_MMC_UTILS
> +	help
> +	   Enable support for dangerous commands in mmc-utils. mmc-utils
> +	   considers turning on permanent write protection on a device a
> +	   "dangerous command" and doesn't offer it by default.

Sub-options must immediately follow the main option, or the indentation
is not correct.

We also prefer if-endif blocks when introducing new sub-options, for
consistency across the code base.

Applied to master with the above two changes, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index c84737869264..14e2bee58736 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -10,12 +10,20 @@ MMC_UTILS_SITE_METHOD = git
>  MMC_UTILS_LICENSE = GPL-2.0
>  MMC_UTILS_LICENSE_FILES = mmc.h
>  
> +MMC_UTILS_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS),y)
> +MMC_UTILS_CFLAGS += -DDANGEROUS_COMMANDS_ENABLED
> +endif
> +
>  # override AM_CFLAGS as the project Makefile uses it to pass
>  # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
>  # with the _FORTIFY_SOURCE that we pass when hardening options are
>  # enabled.
>  define MMC_UTILS_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) AM_CFLAGS=
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(MMC_UTILS_CFLAGS)" \
> +		AM_CFLAGS=
>  endef
>  
>  define MMC_UTILS_INSTALL_TARGET_CMDS
> -- 
> 2.34.1
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
