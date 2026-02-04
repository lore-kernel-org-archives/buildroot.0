Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42161E9D407
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0155D60AE1;
	Wed,  4 Feb 2026 16:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7IkoSegKk7j; Wed,  4 Feb 2026 16:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E575760DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770221381;
	bh=u1VqFI3R5KzgVYvbetVsv0hWj72ESURVWRc0G4PX+RY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j+eGTOTW1sjSYO8Avw6NMS7By8uZ0GOmWaxy6WYnUO21t4HPwUolV848g3qeWlzuP
	 JPRIAUdAOSIBJs+8JdUhlnAr+zVDUtLiT0Bt3ThlU55IMyjQWBwiEp5xgEYUjJZ4vu
	 jhDbEB7uBjJcFuJK2nNlBO8GNZj5CLu4YFFi7X46NW0t0rZDWTK8RZ9w20tabQwKfk
	 eJYznw8EUoUS3oCXskPwPrnER6GbS1YphzZ51enref92YsPpSsT43aTaqrtQEoPc0D
	 J9r8ph+Nl5tkZreUU+lqPieQjciUfqNLyfkJvc2iLSWexEV8DCFth6qlM2DgBrqs8E
	 p0CAGahS1E3eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E575760DC5;
	Wed,  4 Feb 2026 16:09:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6370B17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5054E60DC5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PelYmDdTI2GZ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83D1060AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D1060AE1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83D1060AE1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC8CDB97ADDF; Wed,  4 Feb 2026 17:09:35 +0100 (CET)
Message-ID: <62b6f9ca-59a5-41ff-85c5-3df0ed715521@rnout.be>
Date: Wed, 4 Feb 2026 17:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20250224-systemd-ukify-v1-1-e42872af25f6@openpixelsystems.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250224-systemd-ukify-v1-1-e42872af25f6@openpixelsystems.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770221376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Xl1NzbI4zNaPSFbmNBG/DPsPp+ZE/Ziwdc7LxTmxKv4=;
 b=EEosXNlRwIz/KwZFysvPEvkzQF04HJIeSU0fNk5Kr9zUn/lvr5i+cCeqHsBjjxafoEJhNE
 /3khQJcH8RG4hyTwj27dN1kB1W44cEUeKhJxSEfz3lUtDHCke2MV84/l0z4EuQ/mvznLd8
 OcBt+aVsDaVRlds3GAkRqTuoD8xYcqVfHYh8W5TY/C8XW1Fnbn8QnwW115L1auan3rEXwO
 j9iJBdrV45zxJFs+FyVTqrDlNtgDY/6QD2bSAUaqAIowNbeei73wJRlO0y4UfJDd3ji2UN
 fmksIvpqXa75/vWAfCVYLDyV2twwNQ+jZ4SaBiAuTrpNXcjRrppHmGpxZx+OGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=EEosXNlR
Subject: Re: [Buildroot] [PATCH] package/systemd: add
 BR2_PACKAGE_SYSTEMD_UKIFY option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Bram,

  Thank you for your contribution!

On 24/02/2025 17:27, Bram Vlerick wrote:
> Add option to enable or disable the build of systemd's ukify tool to
> create unified kernel images.
> 
> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

  I applied to master, but with so many changes that nothing of your original 
patch remains :-)

> ---
>   package/systemd/Config.in  |  7 +++++++
>   package/systemd/systemd.mk | 14 ++++++++++++--
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 851b91aeba70d0726cdc1ea411d7aca017f8fe68..eaeb245bb51f8ae6276273ef546115b1c1ae0f08 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -164,6 +164,13 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>   config BR2_PACKAGE_SYSTEMD_EFI
>   	bool "enable EFI support"
>   
> +config BR2_PACKAGE_SYSTEMD_UKIFY

  I'm not sure if this is actually useful on the target. You'd normally build 
the UKI on some machine and then copy it to the target. You probably shouldn't 
run ukify on the target itself, it's kind of pointless.

> +	bool "systemd-ukify"
> +	select BR2_PACKAGE_SYSTEMD_EFI

  It actually requires python3 and python3-pefile, so you need to select those. 
Note that we don't have pefile for the target at the moment. ukify on the target 
can't have worked for you!

  So this confirms my conclusion that ukify on the target is not needed. I 
removed the target option entirely.

> +	select BR2_PACKAGE_SYSTEMD_BOOT

  Does it actually need systemd-boot? You can load an UKI with grub, uboot, ... 
so there's no reason to select systemd-boot, right?

> +	help
> +	  systemd-ukify is a tool to generate a Unified Kernel Image
> +
>   config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
>   	bool "enable journal remote tools"
>   	select BR2_PACKAGE_LIBCURL
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 28091a72a6d1d7d91fa18d4fe16c637c2112571b..50c466a105b808d0cf15207cf53e9fc4c48bde17 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -100,7 +100,6 @@ SYSTEMD_CONF_OPTS += \
>   	-Dinstall-tests=false \
>   	-Dlog-message-verification=disabled \
>   	-Dtmpfiles=true \
> -	-Dukify=disabled \
>   	-Dbpf-framework=disabled \
>   	-Dvmlinux-h=disabled \
>   	-Dumount-path=/usr/bin/umount \
> @@ -664,6 +663,12 @@ else
>   SYSTEMD_CONF_OPTS += -Defi=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_SYSTEMD_UKIFY),y)
> +SYSTEMD_CONF_OPTS += -Dukify=true

  true/false are deprecated, it's enabled/disabled.

> +else
> +SYSTEMD_CONF_OPTS += -Dukify=false
> +endif
> +
>   SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
>   ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
>   SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
> @@ -978,7 +983,6 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dinitrd=false \
>   	-Dxdg-autostart=false \
>   	-Dkernel-install=false \
> -	-Dukify=disabled \
>   	-Danalyze=false \
>   	-Dbpf-framework=disabled \
>   	-Dvmlinux-h=disabled \
> @@ -1012,6 +1016,12 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dlibfido2=disabled \
>   	-Dpcre2=disabled
>   
> +ifeq ($(BR2_PACKAGE_SYSTEMD_UKIFY),y)
> +HOST_SYSTEMD_CONF_OPTS += -Dukify=true

  The host systemd configuration should usually not depend on target options. In 
this particular case, there's really no reason to make it conditional. I enabled 
it unconditionally.

  As mentioned earlier, it depends on host-python-pefile, so I added that 
dependency. host-systemd already depends on host-python3, so adding 
host-python-pefile doesn't have much impact.


  Can you check if what is on master now satisfies your needs?

  Regards,
  Arnout

> +else
> +HOST_SYSTEMD_CONF_OPTS += -Dukify=false
> +endif
> +
>   HOST_SYSTEMD_DEPENDENCIES = \
>   	$(BR2_COREUTILS_HOST_DEPENDENCY) \
>   	host-util-linux \
> 
> ---
> base-commit: 544249ff7761db2df61783c8731e834574df957a
> change-id: 20250224-systemd-ukify-3bcbb08507e4
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
