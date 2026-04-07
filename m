Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379B1FF5134
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 18:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF41240D41;
	Tue,  7 Apr 2026 18:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuA7dmPtUTft; Tue,  7 Apr 2026 18:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3FEF40D37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775588199;
	bh=NvFu/vIoVKApS4WljDN1MhfHejM476Hr9/WC+9Idfr4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NGzep9PX4ubaPXc6VtyPi7LkPVaa7XT1z3H41OSiGhWqxENZbX9oE9fiTo3zPgcJN
	 MJHR/MRtJgaJAQNaKNdPSTIrlOrPsh51I7lUXYcBaCyCX1S2/j0SQXVIUdUofKbTbs
	 Cyg8W9ZkpORKq1VhkZlUpiJhzS1VkC/irfvM7zspLewrN/hrQGSoGrOyAjiRILk64W
	 HOmcpsDmQA1vBHZcY8K9Ket3ciAHvqbSXAU7u6mK+AWKVo9gdtRI4gQqb+hmhI34xf
	 9nki2RMFBugpaDCAZxASpbghweIEPTgSZGukNCfVsfWN70/Adiw8hUN8zzjqcNODWH
	 aROc8Z6Q1AoOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3FEF40D37;
	Tue,  7 Apr 2026 18:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA0F237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 216B88148A
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Pr4GszkMfx6 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 18:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D18CA81479
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18CA81479
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D18CA81479
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:56:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26AFAB97BBAD; Tue,  7 Apr 2026 20:56:33 +0200 (CEST)
Message-ID: <27a01177-9b40-4a03-8f8d-626fd9fa81fc@rnout.be>
Date: Tue, 7 Apr 2026 20:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775588194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=jIT2vTz2oMAH0rG100A7eWfVVCp3eobuj5XdOruOwOo=;
 b=Ei/RXVnuK893G2DnYCGuigyag9BPXEQUdOttpvUVoNQ4pYuRUdl3RjODOFnfS8eNZRvu+o
 HS24MMF1ysqaqAQP9X4E1xU7fnh/Trk1thnppBRSbeaZftcF9ClMf3hj+UCLbFCOT1LYOF
 rC0OjD62i5DQRDXccNOczmtH4WxWk9Um20lJXFsrXk5L9oGaH33qNrl3PwmPYb/XMcGv1B
 xj2M2Sqn6izGp4XUrgQriJklSoQ20znW1RwABHYy40iLE2MF9jd1xNAmCn1AvBF9QIMV9U
 SSJic9Amj2S82sjwiRDpfDWyqqmomHW5AjRBKKJfHfjTkSYmno7PBLankP4l9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ei/RXVnu
Subject: Re: [Buildroot] [PATCH] linux: allow the user to respect Linux
 kernel defconfig's CONFIG_WERROR
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



On 25/03/2026 18:51, Quentin Schulz via buildroot wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Buildroot forcibly disables WERROR (and PPC_WERROR via
> PPC_DISABLE_WERROR for PowerPC) for all kernels since commit
> 6b56e0b4f09b ("linux: disable -Werror") for the former and 1713c3c344be
> ("linux: disable Werror for powerpc kernels") for the latter.
> 
> Some users (me :) ) may only build kernels within Buildroot and may be
> required by audit companies to ensure that no warnings are generated
> when building them. While we could look at the log manually and report
> that indeed no warnings are seen, better not even build if there's a
> warning and catch them as early as possible.
> 
> Thus, let's allow the user to not override the WERROR state gotten from
> the defconfig. It is left as force-disabled by default as upstream
> Buildroot likely does not want to fail builds when bumping the
> toolchains with newer warnings and no bandwidth to fix or backport fixes
> for kernels for upstream Buildroot defconfigs.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> I believe that commit 6b56e0b4f09b ("linux: disable -Werror") should
> rather have disabled WERROR from ESP_HOSTED_LINUX_CONFIG_FIXUPS in
> package/esp-hosted/esp-hosted.mk instead of disabling it for everybody.

  Yeah, I agree with that. And even so, it should only be done if it's really 
needed.

> I understand Buildroot not wanting to respect WERROR if in the kernel
> defconfig to avoid additional friction when bumping toolchains, hence
> why I made this into a Kconfig knob.

  Not really - for the defconfigs, we can easily create 
board/linux-disable-werror.fragment and include that as a Kconfig fragment for 
all problematic defconfigs. Ideally though the error should be resolved in a 
more recent kernel.

  So I'd tend to prefer to revert 6b56e0b4f09b (or perhaps move it to 
esp-hosted) rather than adding yet another weird Config.in option.

  For 1713c3c344be, it's probably not worth to bother reverting that one (and 
trying to find out which defconfigs break due to it). Unless you also need PPC 
builds to comply?

  Regards,
  Arnout

> 
> I'm assuming we do not want upstream Buildroot defconfigs to have this
> set to N. I can add this info to the Kconfig help text. I can also make
> sure defconfigs aren't setting this to N by adding a check in
> utils/checkpackagelib/lib_defconfig.py. Let me know if this is something
> you're interested in.
> ---
>   linux/Config.in | 14 ++++++++++++++
>   linux/linux.mk  | 12 +++++++++---
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 44f8b08e71..43397d52af 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -223,6 +223,20 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
>   	  A space-separated list of kernel configuration fragment files,
>   	  that will be merged to the main kernel configuration file.
>   
> +config BR2_LINUX_KERNEL_DISABLE_WERROR
> +	bool "Force-disable Werror"
> +	default y
> +	help
> +	  This allows to force disable CONFIG_WERROR (and force enable
> +	  CONFIG_PPC_DISABLE_WERROR for PPC) even if set by the kernel
> +	  defconfig. This is typically wanted for third party kernel
> +	  trees or old kernel releases when attempting to build with
> +	  newer toolchains. Since 2019.08 for PPC and since 2024.05 for
> +	  the other architectures, the default has been Y.
> +
> +	  You may want to set this to N if you want to make sure your
> +	  kernel builds without warning for your specific setup.
> +
>   config BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
>   	string "Custom boot logo file path"
>   	help
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..f7f2dfe107 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -419,6 +419,14 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
>   endef
>   endif
>   
> +ifeq ($(BR2_LINUX_KERNEL_DISABLE_WERROR),y)
> +define LINUX_FIXUP_CONFIG_DISABLE_WERROR
> +	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
> +endef
> +endif
> +
>   define LINUX_KCONFIG_FIXUP_CMDS
>   	@$(call MESSAGE,"Updating kernel config with fixups")
>   	$(if $(LINUX_NEEDS_MODULES),
> @@ -431,8 +439,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>   	$(LINUX_FIXUP_CONFIG_PAHOLE_CHECK)
>   	$(if $(BR2_arm)$(BR2_armeb),
>   		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
> -	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
> -		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
>   	$(if $(BR2_ARC_PAGE_SIZE_4K),
>   		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
>   		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
> @@ -474,7 +480,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
>   		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
>   		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
> +	$(LINUX_FIXUP_CONFIG_DISABLE_WERROR)
>   	$(PACKAGES_LINUX_CONFIG_FIXUPS)
>   endef
>   
> 
> ---
> base-commit: c8dd9e9a011f1a5755df62baceb865efc09862fe
> change-id: 20260325-linux-werror-9f6e4ad44b0f
> 
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
