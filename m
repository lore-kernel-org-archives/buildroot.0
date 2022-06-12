Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9362C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D42D40B9D;
	Sun, 12 Jun 2022 15:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSyj2_GJ_6qx; Sun, 12 Jun 2022 15:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE6A140B0C;
	Sun, 12 Jun 2022 15:13:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BD8A1BF3D0
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA4682553
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKAsZQe9c0wB for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:13:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67F0A824DD
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:13:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8CA4C78035E;
 Sun, 12 Jun 2022 17:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655046817;
 bh=MSw6UffmQzAqNQBAG5FXOccohb66h+3MbVvKHSJDB0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UlAnEPs2X5OUlmWiUMXHaBAM1KRTaEYKnhzhIWB248jjim8iENzfwcItBB7o4wvJD
 d6gXhnQjqLHVF6a6+yZXmmLC9h3cPqjB/82lOMY+SslqHSnCVdECFknki8LSFVgCRl
 gkSsuoibnuUMcoPCTD/GlpXpizRZZUyYsAa8uUpgGNwZ2bFPEGJas4yAsLD/hNoe9Y
 4E7yDZsrnGUNuw80irLroCUQxoOrmOT99eMnqXM2CsKytfMNiapDxu9yg2k+6FHCy5
 fQgI6soRvo+PtjTkdZwJ41C+uxbTkNK8KT/1CGCMw9zmoFSxwtuV0unfKjpM8/4N3W
 sZVo2Xl7wg0fA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 17:13:35 +0200
Date: Sun, 12 Jun 2022 17:13:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612151335.GE427639@scaer>
References: <20220612084912.1874307-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220612084912.1874307-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/libabseil-cpp: update
 BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-12 10:49 +0200, Fabrice Fontaine spake thusly:
> m68k is supported since version 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/f3697b4fedc2d8f2311eaaebed051f6a44182bb2
> 
> s390x is supported since at least version 20180600 and
> https://github.com/abseil/abseil-cpp/commit/a7e522daf1ec9cda69b356472f662142dd0c1215
> 
> sh is supported since version 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/a2d7f453c635e90b356017dd47049b89407c2d88
> 
> sparc and sparc64 are supported since version 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/3fcd00d7dddafe65ced638acca560105a414cba5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Drop spurious space
> 
>  package/libabseil-cpp/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> index 222e3a092a..45f339ff26 100644
> --- a/package/libabseil-cpp/Config.in
> +++ b/package/libabseil-cpp/Config.in
> @@ -5,9 +5,13 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	default y if BR2_aarch64 || BR2_aarch64_be
>  	default y if BR2_arm || BR2_armeb
>  	default y if BR2_i386
> +	default y if BR2_m68k
>  	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>  	default y if BR2_riscv
> +	default y if BR2_s390x
> +	default y if BR2_sh
> +	default y if BR2_sparc || BR2_sparc64
>  	default y if BR2_x86_64
>  	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
>  
> -- 
> 2.35.1
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
