Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5D1C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 10:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CEC840D8;
	Fri,  4 Feb 2022 10:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIU0M5eUOqKj; Fri,  4 Feb 2022 10:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5209984082;
	Fri,  4 Feb 2022 10:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9119E1BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EDE784082
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cisinaGm7GVM for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 10:41:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA8784044
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 10:41:12 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fw1dnOP534NL9Fw1enVYwE; Fri, 04 Feb 2022 11:41:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643971271; bh=q/2LCwMw7XLzz6BPsObgxlK3ikpZ3sf4RMCNbleU9eI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ISyyh0UxVus3tnEYzomllpH6CUYJB41NliJ0CGm7H+EI/vZDp1fYxaKhSi7kWSj7f
 JZ2jVcSu22lYV1fisd1s4vBHPJTh+FEAr5e9eNOBM9Sg41WJTOMFPSbu/h7FPlq29Q
 M0CKVPghnGxqhXbQJjGYl3l/aO74na2eN/7w8ROl4wUrOnRxVoFG/zgfm7r366+uv3
 Mqimz3mZSiVdX8K2slPeLKBLRhyj7LUE+/iEMcxfksw375S/VToAief1LD/zKYVGh+
 +C1AywdR5ROCsv/pni8nRknK69HYJZvHo4z/yT32Fg1M3figRXalmY0ziAMh4ot55k
 8Ft5obIRAVobg==
Message-ID: <4fc954ba-48d7-388f-39e4-56f83db14297@benettiengineering.com>
Date: Fri, 4 Feb 2022 11:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1643665029.git.yann.morin.1998@free.fr>
 <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
X-CMAE-Envelope: MS4wfH3Oik2AvnQ1uaWycpWtQSc39noBoGCtyO0rirFV3u9ThKeg0smCSoAVq+81OZD5kUDM/VAy0PocUdGPqdXQVbxl/WVVS6PcszQsVdn/LCfF8l099aPl
 wQzYyvKNJkp+eGDJ541iAqws2w9oE74/uHz40ZR53kHdMW305/cxq6lkygCpm57kHcyUjwc5jxT7ypHzzAp1sv9086KX+KN/Z+K/T3B5lA+BkuKaWsVRd9hn
 y3n4AqI+r5GHLxpPqcZPI+Ia70OpOndVRbCBm9cs9FHGLk7lQdJKghWH5SDAzQ+f
Subject: Re: [Buildroot] [PATCH 2/2 v2] linux: fix build with host-gcc 10+
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

On 31/01/22 22:38, Yann E. MORIN wrote:
> Some older versions of linux, or custom versions (like forks for some
> boards), fail to build with host-gcc 10+, because of redefined symbols:
> 
>        HOSTLD  scripts/dtc/dtc
>      /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
>      of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
>      collect2: error: ld returned 1 exit status
> 
> Since this has been fixed in recent-ish versions, we can't use an
> unconditionaly patch, so we must have a conditional patch. However, a
> patch may not always apply to arbitrary U-Boot versions or forks.
> 
> Upstream just dropped that line altogether:
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639
> 
> So, we use a little sed-grep combo to do the exact same change.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I've extensively tested this patch while fixing Gitlab-CI build failures 
and here there is the actual situation:
https://paste.debian.net/1229530/
I've built successfully circa 20-25 cases where the problem didn't arise 
and also a couple where the problem arised.

So:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
> Changes v1 -> v2:
>    - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
> ---
>   linux/linux.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index dd2eebd446..410b714360 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -268,6 +268,13 @@ endef
>   
>   LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
>   
> +# Older versions break on gcc 10+ because of redefined symbols
> +define LINUX_DROP_YYLLOC
> +	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
> +	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
> +
>   # Older linux kernels use deprecated perl constructs in timeconst.pl
>   # that were removed for perl 5.22+ so it breaks on newer distributions
>   # Try a dry-run patch to see if this applies, if it does go ahead

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
