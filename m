Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F2CCA481
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 03:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19CC4163D;
	Sun, 17 Jul 2022 03:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F19CC4163D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fX8H4jHGvIs7; Sun, 17 Jul 2022 03:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F6E2410B0;
	Sun, 17 Jul 2022 03:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6E2410B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DBA71BF2B0
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 03:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35A23404EC
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 03:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A23404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKyJle69uuIr for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 03:23:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2894011D
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E2894011D
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 03:23:04 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 097E344044E;
 Sun, 17 Jul 2022 06:22:39 +0300 (IDT)
References: <cover.1658007000.git.yann.morin.1998@free.fr>
 <e2f23070c85c1d2fcf5ad74c88eae23723d18916.1658007000.git.yann.morin.1998@free.fr>
User-agent: mu4e 1.8.3; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2022 06:21:41 +0300
In-reply-to: <e2f23070c85c1d2fcf5ad74c88eae23723d18916.1658007000.git.yann.morin.1998@free.fr>
Message-ID: <87a698fmnf.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658028159;
 bh=jteZZcA6B7K2pFJkTvHWrQpFpDCg0kNfOhyvY+zblhY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=UnO2dQwIs7HanSicWgNORbAMHft+I1obhma2ARWPUyqg62Sb0OdRkprl8lYNWnkYy
 7bBoBCz6/zsQqDRB5Xc1FLcjFNI9JZWFXLKWmhkCIhyIEbC3mOBKBy82qYGr47x4oe
 SYAz42spD0p0y5F99ywFcNmKt2dGOcuj7sW81nz11YfaDbEZZrtfHz7UOoM63gYAUG
 JWVFVCuWWZ6438yF3Ewmn1XT4+S2m/PaPeHbe0Le+IgUEqacw891Z9pV8y/jgrgezG
 PwHjQucJuzAg+vOdIhu5JQxtXNdq0G8UyZdr/vvRQfY6XqphIZQCnQ4+JGiTAFZfIp
 dZdueMKyscnjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=UnO2dQwI
Subject: Re: [Buildroot] [PATCH 1/2] package/rustc: fix target names for
 i586 and i686
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sat, Jul 16 2022, Yann E. MORIN wrote:
> Commit d69d40c029dc (package/rustc: add support for Tier 1 and Tier 2
> platforms) misspelled the config options for i586 and i686.
>
> They are BR2_i386_i586 and BR2_i386_i686, not BR2_i586 or BR2_i686.

You mean BR2_x86_i586 and BR2_x86_i686, right? Because that's what the
patch does.

baruch

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/rustc/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 27c3a3cdeb..fec8726aee 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -25,7 +25,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
>  	# aarch64-unknown-linux-gnu
>  	default y if BR2_aarch64 && BR2_TOOLCHAIN_USES_GLIBC
>  	# i686-unknown-linux-gnu
> -	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
> +	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
>  	# x86_64-unknown-linux-gnu
>  	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_GLIBC
>  
> @@ -93,11 +93,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>  	# userspace
>  	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
>  	# i586-unknown-linux-gnu
> -	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
> +	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_GLIBC
>  	# i586-unknown-linux-musl
> -	default y if BR2_i586 && BR2_TOOLCHAIN_USES_MUSL
> +	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
>  	# i686-unknown-linux-musl
> -	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
> +	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
>  	# mips-unknown-linux-musl
>  	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
>  	# mips64-unknown-linux-muslabi64


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
