Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF05C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0B64026D;
	Sun,  6 Aug 2023 14:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0B64026D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3iyDVe3NCUvO; Sun,  6 Aug 2023 14:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAC71402E5;
	Sun,  6 Aug 2023 14:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC71402E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 392261BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB29F607CE
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB29F607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWdujQ7wW7Ja for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:16:34 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EDC360ACE
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EDC360ACE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c94f:8093:8f39:b163])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 13D3513F8C9;
 Sun,  6 Aug 2023 16:16:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Aug 2023 16:16:25 +0200
Date: Sun, 6 Aug 2023 16:16:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806141625.GT421096@scaer>
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230802111447.41714-2-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802111447.41714-2-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691331392;
 bh=Ba5YyNzDzSzPWhizhvxEvJJbvf0SLZPvohbidaW71kA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kbmYnT4bAKkELXM4WhqLy7GOuekda8dcA6CGMJyIPx2ndNysr7+itBHPYfEEinhHB
 s7OuWt0mpKdwTkOh8ST1eqE0V+FV41jy9YKC4paPwQfSyvfuG1s5DPh48ZSZUTmSSZ
 9qqqzATQfJoiDPyEAdu0KUdSM7kXl1tGwolXdS/yLoOO7gtfhofXuQCB/KLpoUEypf
 aSZYgNUMpcD5vM1sx0lOGkth5jsyrARlKEdFQ2uwcI1u6XOqH+0USx5Z0j3maHzY06
 hOI6nqRpJwLE2VJvKwxldmKtk60k00SkhRXuwi3kUWBNGmAot5oVFRrT59nrfmeh3Q
 ULiFpKF+L68Sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kbmYnT4b
Subject: Re: [Buildroot] [PATCH v6 2/4] package/webkitgtk: use the
 CMAKE_NINJA flag
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-02 13:14 +0200, Thomas Devoogdt spake thusly:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Replaces:
> 
> commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213
> Author: Peter Korsgaard <peter@korsgaard.com>
> Date:   Thu Feb 9 18:07:05 2023 +0100
> 
>     package/webkitgtk: Build with ninja
> 
>     Webkitgtk needs cmake >= 3.20 when building with the make backend since
>     webkitgtk 3.8.0.
> 
>     Cmake 3.20 is above our minimal version in
>     support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
>     with cmake >= 3.18 < 3.20 - So use the ninja backend instead.
> 
>     https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
> 
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

It was weird to read a commit log in a commit log (it really took me a
moment to realise what I was looking at), so I simplified it a bit.

Also, I changed over to the new _CMAKE_BACKEND variable.

> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> v5: no change
> v6: rebase
> ---
>  package/webkitgtk/webkitgtk.mk | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 56277a0a0a..aa1c11f7cd 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -13,6 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-APPLE \
>  	Source/WebCore/LICENSE-LGPL-2.1
>  WEBKITGTK_CPE_ID_VENDOR = webkitgtk
> +WEBKITGTK_CMAKE_NINJA = YES
>  WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
>  	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
>  	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
> @@ -140,23 +141,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
>  WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
>  endif
>  
> -# webkitgtk needs cmake >= 3.20 when not building with ninja, which is
> -# above our minimal version in
> -# support/dependencies/check-host-cmake.mk, so use the ninja backend:
> -# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
> -WEBKITGTK_CONF_OPTS += -GNinja
> -WEBKITGTK_DEPENDENCIES += host-ninja
> -
> -define WEBKITGTK_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
> -endef
> -
> -define WEBKITGTK_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
> -endef
> -
> -define WEBKITGTK_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
> -endef
> -
>  $(eval $(cmake-package))
> -- 
> 2.34.1
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
