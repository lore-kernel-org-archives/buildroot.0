Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE73C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97165405C2;
	Sun, 24 Jul 2022 10:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97165405C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5seN7qh7TiY; Sun, 24 Jul 2022 10:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B25403B8;
	Sun, 24 Jul 2022 10:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B25403B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC681BF85D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D82F440025
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D82F440025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j87j0tgv5pqu for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:17:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D8A405C2
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83D8A405C2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:17:36 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 33101440061;
 Sun, 24 Jul 2022 13:17:03 +0300 (IDT)
References: <20220724095505.6CAA485B23@busybox.osuosl.org>
User-agent: mu4e 1.8.6; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 24 Jul 2022 13:15:59 +0300
In-reply-to: <20220724095505.6CAA485B23@busybox.osuosl.org>
Message-ID: <87y1wihl1f.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658657823;
 bh=/UHNCQpfPr00rZNfE0Qo9hTrbDYDtPAtYg+ALvpxmlQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Z4WwqrFXuVvQ2AskYDxvg5zSXhcYfwI221NijR7opKJINFShKe3ZdSIFFmw6xNH5s
 TYtaDXZXIl5n8pbSrVYMQqJCjF8+gmcdlVX0QE8Gq4f7qQ0FY6b6sSaxrKeBMRPsYJ
 qawngbyvVcZQPY4FAGkqeFicxkd1uaQA3lpQfQhKhgCftz+Ae/bhUlhfCNdRNUHOGT
 VTYVXXVKMVkqNYqGgpS44khG2palIhz/1Zf2Rlj4jqsq0q/ANG6LpX2WxhWpIqQVl8
 RFQG79N3VggDkoz4SlDD1tQ2eBB/7BuRHHuF5b8IGj5UGDzQmoNKX6dumwbVDa46OJ
 3st+cIoExdOxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Z4WwqrFX
Subject: Re: [Buildroot] [git commit] package/rustc: fix target names for
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Jul 24 2022, Yann E. MORIN wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=b4e706a6e320d5035cf05e8af3c6d9b8bb74fc33
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Commit d69d40c029dc (package/rustc: add support for Tier 1 and Tier 2
> platforms) misspelled the config options for i586 and i686.
>
> They are BR2_x86_i586 and BR2_x86_i686, not BR2_i586 or BR2_i686.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
>
> ---
> Changes v1 -> v2:
>   - in commit log: s/BR2_i386_/BR2_x86_/g  (Baruch)

Did you mean to push this commit to master with the changelog?

baruch

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
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
