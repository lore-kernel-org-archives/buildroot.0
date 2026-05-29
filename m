Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF9CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 20:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DF142745;
	Fri, 29 May 2026 20:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6sj5d6AZKZZ; Fri, 29 May 2026 20:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCBC442746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780088314;
	bh=N+FRk19PPk24U/TpNrjdb5Gwdk+haV0ArnabJLZ4kzM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sTR0BzWUTs1hCE5R89lZjJS/mDC2+3jtQZ8YtWgOYGdp9OXCQWshNoQ4c35TpLzRm
	 q1WtTQ2WiGS2ybvAq2QK4G3jd7Zg2mu0kuODjjhzXunshhwjEN/YVgCR+cQTMz5UKo
	 oei2nKnVuak5x2lWKSNPcf2/eUeczJEbgGhXsp/cpzXpcucwt8ZItrocfn3k/v+iyK
	 aY3rO4/X8N9inppoXr40cPRX6oiaH8exnFY+VqrKMxu1q42Qg40JARPPHok4BESY6K
	 wdtpjOoqKsfXwXcv4+7MtbtpcJFUUIyJ0Tw+dgtJHykxMp90V5iLs7yT0pdmfoOgBW
	 J+uqXxwZTJJhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBC442746;
	Fri, 29 May 2026 20:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 339D4F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 220A64230B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OV5K-UgMiXYu for <buildroot@buildroot.org>;
 Fri, 29 May 2026 20:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22AAD404A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22AAD404A1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22AAD404A1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13050B97C6DE; Fri, 29 May 2026 22:58:28 +0200 (CEST)
Message-ID: <7539aa42-be40-4ed4-aac7-2de8a53b9d31@rnout.be>
Date: Fri, 29 May 2026 22:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780088309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=9uDFVbDENwnkKpwdcBn/lsbE9C2T9PuT8ys2voAvW4o=;
 b=Hxja3UpkJBv8Q8pNrzZUJa1fq7+iiGtQym4sHWfaJs2kANv3wHuhel99LpuwnHPNOb3hwf
 y1tZ0HXmiVQ9J6KxO5sdtkUcEKOOUBK+AW24d3RHdKjAmxZoUjVKaZO4MR2jCz5TW/UnZH
 UbT1GJOQ6hszCT7yHO/6neFXCpteE9Y0c+y7hpEjpRy0TZFBKNSjGuIsuWF8c55EOGMr0W
 HPH1Fd2rIj1vWAgnrJWPthoqCoiBI5v1wX7RhqhMGp8q7yjC7pGByeFHEf/eT8Dm8gWJ+U
 xawhTPMDFdGvGL6h24hQy5T5ToMurOWQbRsdQDriAuJWcQ8DTx2Ulzs58TJZVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Hxja3Upk
Subject: Re: [Buildroot] [PATCH v2] Revert "linux: disable -Werror"
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



On 13/04/2026 11:08, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> This reverts commit 6b56e0b4f09b36140e2cb9e41072d5ac6074f375.
> 
> commit 6b56e0b4f09b ("linux: disable -Werror") said we needed to disable
> CONFIG_WERROR in the kernel because it failed to build the esp-hosted
> kernel module. This was very much the hammer approach because a) it'd be
> better to fix the warnings in the kernel module or b) disable the
> kernel's CONFIG_WERROR *only* if esp-hosted is to be built, via the
> ESP_HOSTED_LINUX_CONFIG_FIXUPS variable in
> package/esp-hosted/esp-hosted.mk.
> 
> This is a simple revert without making any change to any kernel module
> (including esp-hosted) because all upstream Buildroot defconfigs with a
> kernel module enabled build fine today (albeit with warnings). The two
> defconfigs that were pointed at by the now-reverted commit all have been
> (updated for and) run on master without failing the build.
> 
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

  Applied to master, thanks.

> ---
> I've rebuilt the kernel of all 307 upstream Buildroot defconfigs which
> selects the Linux kernel with:
> 
> for defconfig in $(git grep -l LINUX_KERNEL configs/); do
>    d=$(basename "$defconfig")
>    make O=build/$d $d | tee -a log.txt
>    make O=build/$d linux | tee -a log.txt || break
>    rm -rf build/$d
> done

  That is some serious testing!

> 
> and the loop didn't exit early and log.txt didn't contain any error: (or
> even warning: or ^^^ lines, which is surprising...).

  But, the commit message says "albeit with warnings"... Or does it mean that 
most of those configs anyway don't enable CONFIG_WERROR so this revert has no 
effect on them? Perhaps it would have been a good idea to identify those 
explicitly - who knows, maybe CONFIG_WERROR isn't enabled anywhere and your test 
didn't actually prove anything...

  Anyway, it's applied :-)

  Regards,
  Arnout


> 
> I also built the kernel modules of the couple of upstream Buildroot
> defconfigs that build some modules, identified with:
> 
> for module in $(git grep -l --full-name kernel-module package/ | xargs basename -a | grep '.mk' | xargs basename -a -s .mk | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' | sed 's/\(.*\)/BR2_PACKAGE_\1/'); do
>          git grep $module configs
> done
> 
> which returns:
> configs/orangepi_lite_defconfig:BR2_PACKAGE_RTL8189FS=y
> configs/orangepi_pc_plus_defconfig:BR2_PACKAGE_RTL8189FS=y
> configs/mangopi_mq1rdw2_defconfig:BR2_PACKAGE_RTL8723DS=y
> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS=y
> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS_BT=y
> configs/orangepi_zero_defconfig:BR2_PACKAGE_XR819_XRADIO=y
> 
> and while there were warnings, they don't fail the build of the kernel
> module(s) for those defconfigs. No available updates for all kernel
> modules I built, as far as I could tell.
> ---
> Changes in v2:
> - changed implementation: simply revert commit 6b56e0b4f09b instead of
>    adding yet another Kconfig knob,
> - Link to v1: https://patch.msgid.link/20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de
> ---
>   linux/linux.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..79117275f7 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -474,7 +474,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>   		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
>   		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
