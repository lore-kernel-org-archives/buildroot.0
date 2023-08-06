Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C6AC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C1940213;
	Sun,  6 Aug 2023 14:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C1940213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uquo4s79b4uP; Sun,  6 Aug 2023 14:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC9240216;
	Sun,  6 Aug 2023 14:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC9240216
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3481BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E7C81E7E
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E7C81E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIXEr9t5JTgL for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:17:11 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEA2781C20
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA2781C20
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c94f:8093:8f39:b163])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E6DF613F8C1;
 Sun,  6 Aug 2023 16:17:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Aug 2023 16:17:03 +0200
Date: Sun, 6 Aug 2023 16:17:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806141703.GU421096@scaer>
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230802111447.41714-3-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802111447.41714-3-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691331430;
 bh=Q9D3CwcEi4JE+McjXv2Y7a9YHiSUfFGY0moIGKdfoFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=junvXNHZ49x5U6xtk7ms8P9ljK02eiVzaSKsLa6byBcopLOtNRXC0lr8mY+wL4e5M
 Ik7Qw4G37ZpV40a4ynYKf9gUBDuOiMwPlY7rzoLulOpeMe1AbYtQIwWAQLyoJC9ZVn
 e/tg8GyJcGkFLfYaBS4QU4rvFhQMHodNfjcoHt9QA81DXqnShmpQ0rZtx4boNuDkPw
 sOgtpEGyTFzv7e/lfby0ytd23mkP2lJRCBsH0lMdby7hiYGK/ekKAheBsCe0mvilry
 vn1ImX9l9NuV2lqE6qEvWAjR5Ownvc68p1EMe6IEEq5vAEJSp1Kn06dUxkTUYV35f4
 /A+ydvUteVeJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=junvXNHZ
Subject: Re: [Buildroot] [PATCH v6 3/4] package/wpewebkit: use the
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
> commit 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd
> Author: Peter Korsgaard <peter@korsgaard.com>
> Date:   Thu Feb 9 18:07:06 2023 +0100
> 
>     package/wpewebkit: Build with ninja
> 
>     Wpewebkit needs cmake >= 3.20 when building with the make backend since
>     wpewebkit 3.8.0.
> 
>     Cmake 3.20 is above our minimal version in
>     support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
>     with cmake >= 3.18 < 3.20 - So use the ninja backend instead.
> 
>     https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
> 
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ditto the commit log and variable.

> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> v5: no change
> v6: rebase
> ---
>  package/wpewebkit/wpewebkit.mk | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index c13a7201e6..135db02b44 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -14,6 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-LGPL-2.1
>  WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
>  WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
> +WPEWEBKIT_CMAKE_NINJA = YES
>  WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
>  	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
>  	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
> @@ -104,23 +105,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
>  WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
>  endif
>  
> -# wpewebkit needs cmake >= 3.20 when building with the make backend, which is
> -# above our minimal version in
> -# support/dependencies/check-host-cmake.mk, so use the ninja backend:
> -# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
> -WPEWEBKIT_CONF_OPTS += -GNinja
> -WPEWEBKIT_DEPENDENCIES += host-ninja
> -
> -define WPEWEBKIT_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WPEWEBKIT_BUILDDIR)
> -endef
> -
> -define WPEWEBKIT_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
> -endef
> -
> -define WPEWEBKIT_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
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
