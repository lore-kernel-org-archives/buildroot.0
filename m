Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8587CC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 07:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3D4F40B82;
	Sun, 11 Sep 2022 07:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D4F40B82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUt23C9r2gzq; Sun, 11 Sep 2022 07:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C504E402F4;
	Sun, 11 Sep 2022 07:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C504E402F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 260A31BF36B
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 07:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F31F7818D7
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 07:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F31F7818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeEqNEZoYecj for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 07:47:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11098818AC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11098818AC
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 07:47:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:981a:f392:e207:b56b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3E8F919F5AB;
 Sun, 11 Sep 2022 09:47:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 09:47:34 +0200
Date: Sun, 11 Sep 2022 09:47:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: jwood+buildroot@starry.com
Message-ID: <20220911074734.GF264214@scaer>
References: <20220908152330.2588951-1-jwood+buildroot@starry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908152330.2588951-1-jwood+buildroot@starry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662882458;
 bh=EjnWT0294vLcykFJ92qoNnNwL6dMG6rk1AfpgQvb8cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EA0CtvzxRU/mzD3AGW+4ZBI043HGD+cc7VsM/p1a2euQD7uoK8lZZhWQQyZbvcWOz
 8755dWIRpBIrX4paPvqDxWU8tyGbnVAn9Hi+5Ud1emOZeKO7TY1yT6NJL3JJVXTcsv
 DO4w1kgOOlDp6obouxVg4zsjhE1BVorBz7AkM18PGlhiL3k+mGmYZdBwMery3PJBiA
 QhTbeGj/nYVGtHaqglO6Gku3FFVBLfpMzOQYxKXXWskpE3wUC1zbktL+3dVYu4Xxj8
 IMhwmQcrH6D5/UwnNK+/6PjU9fyM+0sreYKCRYSrJTZSE7icQRp5FUxy5ZVX4sO3Kb
 6u5SQrPx2jM9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EA0Ctvzx
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
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
Cc: Justin Wood <jwood@starry.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Justin, All,

On 2022-09-08 11:23 -0400, jwood+buildroot@starry.com spake thusly:
> From: Justin Wood <jwood+buildroot@starry.com>
> 
> This is useful in cases where a package is added without hashes (e.g. private packages)
> and you do not want to risk MITM attacks of the package itself.  While still allowing
> download of packages that are third party with hashes, from unreliable upstreams.
> 
> This adds a new ${PKG}_DISABLE_FALLBACK_DOWNLOAD that is checked when DOWNLOAD would be
> called to not include URIs from the backup site.

I think the best solution in such a case, is to actually add hashes for
internal packages anyway, because that allows one to ensure the
reproducibility of a build (e.g. if the package comes from git, it will
detect when/if a tag has been moved).

Additionally, I think internal setups should:

  - not use a backup site at all, i.e. BR2_BACKUP_SITE=""

  - use an internal primary mirror that points to an internal machine,
    e.g. BR2_PRIMARY_SITE="https://internal.my-company/storage/buildroot/"
    and manually fill it with the sources needed by the project, like in
    running:
        $ make my_board_defconfig
        $ BR2_DL_DIR=$(pwd)/dl make source
        $ scp -r dl user@internal.my-company/storage/buildroot/
    If something a bit more fancy is needed, then one can use a bit of
    scripting around the output of "make show-info" to only handle URIs
    of interest.

  - block downloads from the internet to avoid unexpectedly downloading
    data that has not been vetoed yet, e.g. build in a container that
    does not have routes to go outside company network, or has firewall
    rules to DROP packets going outside.

This, too ensures that a build is reproducible, as all the sources are
on company servers and thus there is no log-term reliance on an external
entity that may remove/change sources arbitrarily; this is not
hypothetical at all, that already happened (hence one of the reasons for
the hashes we have to begin with).

I.e. I think this type of behaviour is best served by the environment
and the setup, rather than by adding new features in Buildroot.

Regards,
Yann E. MORIN.

> Additionally we use the new backup URIs if the new variable is unset in the json data
> URI list to ensure consistency for consumers who do not use this feature.
> 
> Signed-off-by: Justin Wood <jwood@starry.com>
> ---
>  package/pkg-download.mk | 9 +++++++--
>  package/pkg-utils.mk    | 5 +++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 0718f21aad..af5855230c 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -74,8 +74,12 @@ export BR_NO_CHECK_HASH_FOR =
>  # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
>  # 1) BR2_PRIMARY_SITE if enabled
>  # 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
> -# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
>  #
> +# BACKUP_DOWNLOAD_URIS - List the backup candidate URIs where to get packages from:
> +# 1) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
> +#    and unless ${PKG}_DISABLE_DOWNLOAD_FALLBACK is set
> +#
> +# In both vars above:
>  # Argument 1 is the source location
>  # Argument 2 is the upper-case package name
>  #
> @@ -91,7 +95,7 @@ ifeq ($(BR2_PRIMARY_SITE_ONLY),)
>  DOWNLOAD_URIS += \
>  	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
>  ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
> -DOWNLOAD_URIS += \
> +BACKUP_DOWNLOAD_URIS += \
>  	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
>  	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)),urlencode)
>  endif
> @@ -122,6 +126,7 @@ define DOWNLOAD
>  		$(if $($(2)_GIT_SUBMODULES),-r) \
>  		$(if $($(2)_GIT_LFS),-l) \
>  		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
> +		$(if( $($(PKG)_DISABLE_DOWNLOAD_FALLBACK),,$(foreach uri,$(call BACKUP_DOWNLOAD_URIS,$(1),$(2)),-u $(uri))) \
>  		$(3) \
>  		$(QUIET) \
>  		-- \
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 6ece27baa2..a279a41df8 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -167,6 +167,11 @@ define _json-info-pkg-details
>  					$(foreach uri,$(call DOWNLOAD_URIS,$(dl),$(1)), \
>  						$(call mk-json-str,$(subst \|,|,$(uri))) \
>  					) \
> +                                        $(if $($(PKG)_DISABLE_DOWNLOAD_FALLBACK),,\
> +						$(foreach uri,$(call BACKUP_DOWNLOAD_URIS,$(dl),$(1)), \
> +							$(call mk-json-str,$(subst \|,|,$(uri))) \
> +						) \
> +					) \
>  				)
>  			]
>  		},
> -- 
> 2.37.2
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
