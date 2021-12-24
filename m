Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B1FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 10:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F09416AB;
	Fri, 24 Dec 2021 10:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHloCpDsUHgT; Fri, 24 Dec 2021 10:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A5A4165F;
	Fri, 24 Dec 2021 10:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 066201BF369
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 10:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E966083495
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 10:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwPgXjEZJmzt for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 10:23:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A078348C
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 10:23:31 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 0hjUnMjocR1a10hjUnDwLZ; Fri, 24 Dec 2021 11:23:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640341408; bh=GqH6lm6ycJYFDCvmN7ykkPuoXQIWWUw92WiRcmSt/Js=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ChWIOS3xMK7DDO24JAtjlRaTuCTaHrjtGd3p9F9RuGlaG1E390iLfTZDfmKmUIkbD
 YBIleMHQb9hsUOdS4xoekzO6MuDfBsUh3q7Y/MTCidb4U/uoAKTwQ9vZofJC+MLlQK
 ix/j3eymckllbkVm2CtiHEe0A4+EPjsI4V4Yq9f/ibz7ZRMAuKsPGrCgj9GJzo1Pwe
 zgjihQ0eD+52I2U4A0lO+v7Gcb41++opxNjt/oW/mrn8gASkOpFFuO4F87/Z+o8YMS
 Jmgx6L1bkO4j8TSMgWMwHFwRrZRq+tBqcrSUVcfJCrY40PmQRyB2ttuMy/a98h756X
 Cx4Q9vvLpKcMw==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20211224095257.2909635-1-yann.morin.1998@free.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f924c981-473d-305c-9428-776063d6bdca@benettiengineering.com>
Date: Fri, 24 Dec 2021 11:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224095257.2909635-1-yann.morin.1998@free.fr>
Content-Language: en-US
X-CMAE-Envelope: MS4wfL+8TutdCHicvPI49yuR5Utp+/O53XqtM/P7Sdo1BDE7HHrsvJIzvm8EADwd6Gu4GLN+3ZbtTFE/jO4JM6vL3ciHtNsThC1bHnG/E8orhomlxxamMsWF
 Zf3TR2QTHrnAXvYKALzmGbjJOi6I+7++GO6kEeMZLh6L9lA6amBmyQBmS4H55q1ZKTRaH+1me8b1kFHLJjvfi8jgna5r8cEtqvx/uF1LZDxSHm69Bi5+R789
 eJYwyZnESsPDFr5DkD1MiaMa4U48fIdcJtCbft9HTPLpQ43Njt1cutXsgSJgl65D
Subject: Re: [Buildroot] [PATCH] package/gcc: fix xtensa overlay for gcc
 ccache hash
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 24/12/21 10:52, Yann E. MORIN wrote:
> Commit b3b60706221d (arch/xtensa: allow specifying path to tarball file)
> m issed a place where the xtensa overlay was refrenced, thus breaking

typo on 'missed' and 'referenced' that maybe can be reworded while applying.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> the calculation for the ccache hash.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   package/gcc/gcc.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index fcc352aa25..3adc1d4e16 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -283,7 +283,7 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
>   		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
>   		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
>   ifeq ($(BR2_xtensa),y)
> -HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_FILE)
>   endif
>   
>   # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
