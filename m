Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D2C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B114194C;
	Tue, 19 Jul 2022 21:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B114194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOk-9xrkDqge; Tue, 19 Jul 2022 21:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737CD41947;
	Tue, 19 Jul 2022 21:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737CD41947
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A94D1BF37C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53C9C61019
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C9C61019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TehUr3WWS3Q for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7CF560E13
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7CF560E13
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:15:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7136:88c4:7807:8cd3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AB96E60130;
 Tue, 19 Jul 2022 23:15:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 23:15:13 +0200
Date: Tue, 19 Jul 2022 23:15:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220719211513.GP2249625@scaer>
References: <20220719190051.555180-1-heiko.thiery@gmail.com>
 <20220719190051.555180-3-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719190051.555180-3-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658265316;
 bh=Whwfb0vsSETaKddA4awvs3PujXKdXnGP1wKbgSOckZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qq47IdTQLhI75mLIiKI1wWy4e+bsp3xMxaMKmcy7aR+9ZNxRsjadj/BGtJj/vKfob
 M1ktugcZ9HFnjp92dquJmiaS+fkIeClEGukN+syxCqIA33NIatu2UMiOuHxFDIV+Gm
 L4Sj1jbmE9imOiaQdDaVKUjIl05So9G+yW2EDPR5s9xHE71ctdh1G5pw4qnMLMLGO3
 K+Un6IkbvTjOLmpSuYoZz4W0lSEgZM5CfDx53H451mHRsAEo5rf1JnWGMzAYJOKeoD
 qza0WytHqxgWzNwdtyCtKDtOMK4lxIkJSLnV0X9ORJ62MptXKiRwWGRLA3KjoiB1vu
 oT/Bbm8gXrhfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qq47IdTQ
Subject: Re: [Buildroot] [PATCH 3/3] board/kontron/pitx-imx8m: add U-Boot
 2022.04 patch
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

Heiko, All,

On 2022-07-19 21:00 +0200, Heiko Thiery spake thusly:
> The patch is required to fix an issue in U-Boot for linking
> the mkeficapsule tool against -luuid and -lgnutls.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001065
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...le-use-pkg-config-to-get-luuid-and-l.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch

So, you added that patch just for your one board that needs
mkeficapsule. At first, I was thinking that it should be a
generic (but still version-specific) patch, because the
corresponding options, BR2_TARGET_UBOOT_NEEDS_GNUTLS and
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX, are generic. So I was
about to move to boot/uboot/2022.04/

But then I just noticed I forgot to do so before I pushed,
and I will not try to retroactively justify not doing so.

So, instead, I'll sleepily wait for your justification that
this indeed should not be made generic, or a follow-up patch
that moves it. ;-)

Sorry for the mishap...

Regards,
Yann E. MORIN.

> diff --git a/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
> new file mode 100644
> index 0000000000..9530a45efe
> --- /dev/null
> +++ b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
> @@ -0,0 +1,33 @@
> +From f3523977e8f5f6b2173708777001332431ebc609 Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Tue, 19 Jul 2022 16:17:09 +0200
> +Subject: [PATCH 1/2] tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls
> +
> +Instead of hardcoding -luuid -lgnutls as the flags needed to build
> +mkeficapsule, use pkg-config when available.
> +
> +We gracefully fallback on the previous behavior of hardcoding -luuid
> +-lgnutls if pkg-config is not available or fails with an error.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + tools/Makefile | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/tools/Makefile b/tools/Makefile
> +index 9f2339666a..9f6b282ad8 100644
> +--- a/tools/Makefile
> ++++ b/tools/Makefile
> +@@ -242,7 +242,8 @@ hostprogs-$(CONFIG_MIPS) += mips-relocs
> + hostprogs-$(CONFIG_ASN1_COMPILER)	+= asn1_compiler
> + HOSTCFLAGS_asn1_compiler.o = -idirafter $(srctree)/include
> + 
> +-HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
> ++HOSTLDLIBS_mkeficapsule += \
> ++	$(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")
> + hostprogs-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
> + 
> + # We build some files with extra pedantic flags to try to minimize things
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
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
