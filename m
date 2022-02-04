Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04488C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 10:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 932C541773;
	Fri,  4 Feb 2022 10:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtPl-2Ooca-9; Fri,  4 Feb 2022 10:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AA841771;
	Fri,  4 Feb 2022 10:40:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D34181BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFCB060B4F
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6d2tam7gEH67 for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 10:40:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E64460B4B
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 10:40:52 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fw1JnOO9V4NL9Fw1KnVYd9; Fri, 04 Feb 2022 11:40:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643971251; bh=eimwuhoWRCTHDiWt+jsdD+B0xP4LDo1E7rza0gi7qs4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=g8M0RsDPo5eiXka1Qq+lcRUH7vEJmSmIg80XkSr4uFWyyC9Kjb+bUVZH4m4hx+mtl
 u4EKqQ206Lmc1H1aSLVYK1BuNtb9KfmHVw8SR4mEWtkCim2GCq6Uj0s8Jt6WroVVE5
 ukiBtTPO6ap/3kHeB37N4cKIjaDQH+fWpSUEMH6ZNQukY8yPjICj+3oBixGZifK5JF
 kb3mWSCCBoRaM2nOdIto1PhO7Zx1K/fvVm7vHv1ISYVQf2RHE/4ER7UbN+BKmUbI0U
 rBpYZpliIOV7sBEsbAoS9s3mgyWwG08t+S+XbyURi6BhaCaelVw1ioj0SRgxqXBInU
 fZvzvAhSR7S0g==
Message-ID: <76c64971-4c4a-41a3-89d7-f1e837961d6e@benettiengineering.com>
Date: Fri, 4 Feb 2022 11:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1643665029.git.yann.morin.1998@free.fr>
 <79dd83642a7b1964ed69d74c4b0f93eada940a4e.1643665029.git.yann.morin.1998@free.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <79dd83642a7b1964ed69d74c4b0f93eada940a4e.1643665029.git.yann.morin.1998@free.fr>
X-CMAE-Envelope: MS4wfKDAKO4WyPPCoUWoiC5JtZOCloEpzmT94/3vMsJ/x6J11DF+kv/zq2LPTQWcKbN9hceDSma8O8cp0DUhFoCNTl3Sc/q1HHrUKjEg+9ZWVc4roCNxRRZW
 qtKy/b4Ph8pbHmR7cD/AN7fmnPxDmp6VnEF8CWq5QEgpmp4m5Eidz2xyRKNVKOsnCVlsj43gIijxdBSqDkqS71s1NHcoZ873r62QNrbYWDIC6sr2ZZr1CG5n
 +EN1mEQTw45wtOUKWOF2jp5rpNzejbjKYrR1OoOmjMY10KyR9vS3ndaojr1Z2C5D
Subject: Re: [Buildroot] [PATCH 1/2 v2] boot/uboot: fix build with host-gcc
 10+
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
> Some older versions of U-Boot, or custom versions (like forks for some
> boards), fail to build with host-gcc 10+, because of redefined symbols:
> 
>        HOSTLD  scripts/dtc/dtc
>      /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
>      of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
>      collect2: error: ld returned 1 exit status
>      make[4]: *** [scripts/Makefile.host:106: scripts/dtc/dtc] E
> 
> Since this has been fixed in recent-ish versions, we can't use an
> unconditionaly patch, so we must have a conditional patch. However, a
> patch may not always apply to arbitrary U-Boot versions or forks.
> 
> Upstream just dropped that line altogether:
>      https://source.denx.de/u-boot/u-boot/-/commit/018921ee79d3f30893614b3b2b63b588d8544f73
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

> 
> ---
> Changes v1 -> v2:
>    - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
> ---
>   boot/uboot/uboot.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..21db1d9d60 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -244,6 +244,13 @@ endef
>   UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
>   UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
>   
> +# Older versions break on gcc 10+ because of redefined symbols
> +define UBOOT_DROP_YYLLOC
> +	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
> +	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
> +endef
> +UBOOT_POST_PATCH_HOOKS += UBOOT_DROP_YYLLOC
> +
>   ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
>   define UBOOT_XTENSA_OVERLAY_EXTRACT
>   	$(call arch-xtensa-overlay-extract,$(@D),u-boot)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
