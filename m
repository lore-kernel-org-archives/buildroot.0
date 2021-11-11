Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B78BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5B861269
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F5B861269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1642E60B83;
	Thu, 11 Nov 2021 20:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8X9SD-z1zvuq; Thu, 11 Nov 2021 20:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65DCA60B74;
	Thu, 11 Nov 2021 20:56:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3FC1BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A5E481D02
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHRLaMuUmQ8Z for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:56:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E86281CA0
 for <buildroot@busybox.net>; Thu, 11 Nov 2021 20:56:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 21D9119F4F3;
 Thu, 11 Nov 2021 21:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636664169;
 bh=bOxtdjIAjg2A4aaQMmwu82wZxM0HOiwc1ZgLQJIIj/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rROEfNMDyYQKMrgyugbDwOemuONJ+7iwGkKvaPQLuHUmGdG7YV7QdJ/W7T+DnR4wV
 CO4lYCBADW7Hz3VIKzLzU7G7NkIcc4KgpvwVlOdvUS45hXNtT3RKOBOwal4c56N4pK
 9b9Dt0pWyKsUvOjqegx+Rm8rB2OS22tuLaeEqOYU5+uldeB2z6hp8MC90Nys1iptgv
 07JGzVWLnYnnjGKSyHrTcZR53nscF2W/Hql0Ld7mSw2CFgsm9znYKOQ4dxajZVw2te
 WAutQcVotp+StHriqCdwbKPWFpKCQkaZruQyWSHYQX8A0tUNhTLnTCB9CKvbcSzOUc
 76vVLhi9wgaAQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 21:56:04 +0100
Date: Thu, 11 Nov 2021 21:56:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211111205604.GC2609@scaer>
References: <20211110103107.421623-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110103107.421623-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/luajit: fix luvi
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021-11-10 11:31 +0100, Francois Perrad spake thusly:
> luvi uses the cross bytecode generation of host-luajit
> the bytecode format has 2 flavors, depending of GC64 option.
> 
> since the commit https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6b78ed25
> GC64 mode is enable by default on all 64bits platform.
> 
> with this patch, luajit and host-luajit are built with the same option,
> so the bytecode generated by host-luajit is valid on luajit.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index fbbd8ebc7..e93361ba3 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -26,8 +26,10 @@ endif
>  # libraries are installed.
>  ifeq ($(BR2_ARCH_IS_64),y)
>  LUAJIT_HOST_CC = $(HOSTCC)
> +LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_GC64

As I explained in a previous review, this is not sufficient, because we
currently still are allowed to create a configuration where the build
machine is a 32-bit system. but the target is 64-bit. This is not
supported by the luajit buildsystem, and is explictly documented.

This is partially covered but only for x86_64 where the condition in
BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS conditions it to HOSTARCH=x86_64.
But for Aarch64, this is not accounted for.

However, the BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS symbol is very unpleasant
to read. We usually write it in a way that is much easier to read and to
maintain; e.g. with the proper 64-bit condition added:

    config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
        bool
        default y if BR2_arm || BR2_armeb || BR2_aarch64
        default y if BR2_i386 || BR2_x86_64
        default y if BR2_powerpc
        default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
                && !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
        # -m32 flag is used for 32bit builds and host-luajit has
        # limited architecture support
        depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
        # Building for 64-bit target requires a 64-bit host
        depends on !BR2_ARCH_IS_64 || BR_HOST_ARCH="x86_64"

Can you please fix that?

Regards,
Yann E. MORIN.

>  else
>  LUAJIT_HOST_CC = $(HOSTCC) -m32
> +LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
>  endif
>  
>  # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
> -- 
> 2.32.0
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
