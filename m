Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF55C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E8483AF7;
	Sat, 17 May 2025 16:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAwDwg1alPx6; Sat, 17 May 2025 16:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3872583B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3872583B04;
	Sat, 17 May 2025 16:53:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6478204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC63B40350
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikSGiPMGyjS3 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00AF8403E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AF8403E8
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00AF8403E8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:52:59 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:ed5b:ef6c:30b9:3cf7] (unknown
 [IPv6:2a01:e0a:12:eba0:ed5b:ef6c:30b9:3cf7])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 723DEBFB32;
 Sat, 17 May 2025 18:52:56 +0200 (CEST)
Message-ID: <0ed2c252-a279-4751-820d-eb11445eca9a@grenoble.cnrs.fr>
Date: Sat, 17 May 2025 18:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <200097a3e73767c60f2633b2f46fccb22c161698.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-US, fr
In-Reply-To: <200097a3e73767c60f2633b2f46fccb22c161698.1747241900.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1747500776;
 bh=nfmI0N1JzUTYlEqfblZ5Fu5w+r0VnDwZZzSESaC87EY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=oFaWqp7PIVoElAxVpBl7gixVn152pOQdiu+3lwcXBa6R8gFl6eHbVP+i/091+F1ER
 zakiKvNX2UkshznYgU+myrFFO8WJrpIZ72BF0JLZeToUdxvbOz9DVBgrVUnjVhaOUw
 L+Iki8w16btDxl+XBX1MR3kovnOw2B7FtxLuxpU3vYxf9ajqQaJp2wwZR2HiE/3Jz6
 JmjHTmGbhrrqcoVs09u0g0MAhWAxL/jsY2gUEZ9c6PVC1Pd1KyNglV1QnmFtFTWQ2s
 PGVUhPX12eTNi/s2X4IJO8mfWeLDcOO0t8kfWD+8btKcRIfidhqk5U5YmCLHtSuEX6
 GRzw1cqQHy/JA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=oFaWqp7P
Subject: Re: [Buildroot] [PATCH 08/13] system: add support for merged
 /usr/sbin (aka merged-bin)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

On 14/05/2025 18:58, Yann E. MORIN wrote:
> Starting with version 256 [0], systemd warns when /usr/bin and /usr/sbin
> are different directories; in the future, it may even refuse to boot in
> such a situation.
> 
> Add support for merged-bin, not unlike we have support for merged-usr;
> we also make merged-bin a sub-case of merged-usr (i.e. it is not
> possible to do merged-bin without merged-usr).
> 
> [0] https://github.com/systemd/systemd/blob/v256/NEWS#L265
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Makefile                                   |  1 +
>  package/skeleton-custom/skeleton-custom.mk |  3 ++-
>  support/scripts/check-merged               |  5 ++++-
>  system/Config.in                           | 11 +++++++++++
>  system/skeleton/usr/sbin/.empty            |  0
>  system/system.mk                           | 11 +++++++++++
>  6 files changed, 29 insertions(+), 2 deletions(-)
>  delete mode 100644 system/skeleton/usr/sbin/.empty
> 
> diff --git a/Makefile b/Makefile
> index 1248dfb9e0..477179dd64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -786,6 +786,7 @@ endif
>  			support/scripts/check-merged \
>  			$(d) \
>  			$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
> +			$(if $(BR2_ROOTFS_MERGED_SBIN),merged-bin) \
>  		)"; \
>  		test -n "$$not_merged_dirs" && { \
>  			echo "ERROR: The overlay in $(d) is not" \
> diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
> index e583d2d731..7f9f10b81d 100644
> --- a/package/skeleton-custom/skeleton-custom.mk
> +++ b/package/skeleton-custom/skeleton-custom.mk
> @@ -29,12 +29,13 @@ SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
>  	$(shell support/scripts/check-merged \
>  		$(SKELETON_CUSTOM_PATH) \
>  		$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
> +		$(if $(BR2_ROOTFS_MERGED_SBIN),merged-bin) \
>  	)
>  
>  ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
>  ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
>  $(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
> -	using a merged /usr for the following directories: \
> +	using a merged structuren for the following directories: \

Small typo: s/structuren/structure/

Regards,

Edgar Bonet.

>  	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))
>  endif
>  endif
> diff --git a/support/scripts/check-merged b/support/scripts/check-merged
> index 7fea4e1dea..0e51c032c5 100755
> --- a/support/scripts/check-merged
> +++ b/support/scripts/check-merged
> @@ -11,7 +11,7 @@
>  #
>  # Input:
>  #   $1:     the root directory (skeleton, overlay) to check
> -#   $*:     the list of merged checks to perform: merged-usr
> +#   $*:     the list of merged checks to perform: merged-usr, merged-bin
>  # Output:
>  #   stdout: the list of non-compliant paths (empty if compliant).
>  #
> @@ -55,6 +55,9 @@ for what; do
>  			test_merged "${root}" "/bin" "/usr/bin"
>  			test_merged "${root}" "/sbin" "/usr/sbin"
>  		;;
> +		(merged-bin)
> +			test_merged "${root}" "/usr/sbin" "/usr/bin"
> +		;;
>  		(*)
>  			printf 'Error: unknown type of test %s\n' "${what}"
>  		;;
> diff --git a/system/Config.in b/system/Config.in
> index 2f42e5ddf9..5007f101e2 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -342,6 +342,16 @@ config BR2_ROOTFS_MERGED_USR
>  	  symlinks to their counterparts in /usr. In this case, /usr can
>  	  not be a separate filesystem.
>  
> +config BR2_ROOTFS_MERGED_SBIN
> +	bool "Merged /usr/sbin"
> +	depends on BR2_ROOTFS_MERGED_USR
> +	help
> +	  If you say 'n' here, then /usr/bin and /usr/sbin will be
> +	  separate directories; this is the historical UNIX way.
> +
> +	  If you say 'y' here, then /usr/sbin will be a relative
> +	  symlink to /usr/bin.
> +
>  if BR2_ROOTFS_SKELETON_DEFAULT
>  
>  config BR2_TARGET_ENABLE_ROOT_LOGIN
> @@ -528,6 +538,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
>  
>  config BR2_SYSTEM_DEFAULT_PATH
>  	string "Set the system's default PATH"
> +	default "/usr/bin" if BR2_ROOTFS_MERGED_SBIN
>  	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
>  	default "/bin:/sbin:/usr/bin:/usr/sbin"
>  	help
> diff --git a/system/skeleton/usr/sbin/.empty b/system/skeleton/usr/sbin/.empty
> deleted file mode 100644
> index e69de29bb2..0000000000
> diff --git a/system/system.mk b/system/system.mk
> index 8fe2c138b0..530b26c162 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -34,16 +34,27 @@
>  
>  # This function handles the merged or non-merged /usr cases
>  ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> +ifeq ($(BR2_ROOTFS_MERGED_SBIN),y)
> +define SYSTEM_SBIN_SYMLINKS_OR_DIRS
> +	ln -snf bin $(1)/usr/sbin
> +endef
> +else
> +define SYSTEM_SBIN_SYMLINKS_OR_DIRS
> +	$(INSTALL) -d -m 0755 $(1)/usr/sbin
> +endef
> +endif
>  define SYSTEM_USR_SYMLINKS_OR_DIRS
>  	ln -snf usr/bin $(1)/bin
>  	ln -snf usr/sbin $(1)/sbin
>  	ln -snf usr/lib $(1)/lib
> +	$(SYSTEM_SBIN_SYMLINKS_OR_DIRS)
>  endef
>  else
>  define SYSTEM_USR_SYMLINKS_OR_DIRS
>  	$(INSTALL) -d -m 0755 $(1)/bin
>  	$(INSTALL) -d -m 0755 $(1)/sbin
>  	$(INSTALL) -d -m 0755 $(1)/lib
> +	$(INSTALL) -d -m 0755 $(1)/usr/sbin
>  endef
>  endif
>  

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
