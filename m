Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4161CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 17:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A05BF60E97;
	Tue, 11 Jan 2022 17:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUij6HLs1g03; Tue, 11 Jan 2022 17:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDAF360E8F;
	Tue, 11 Jan 2022 17:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3EBE1BF368
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 17:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C246F60E8F
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 17:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7A_cn4B-Aiy8 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 17:09:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87FD960D71
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 17:09:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4de3:3dd8:1079:d363])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8798578038E;
 Tue, 11 Jan 2022 18:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641920960;
 bh=kuFtkv/x8GbnvAkwoj26vMfIjVIqnhmJSKLUsma+cSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRlI9qz5klw38DdCPkO+/l42elL9LunwzEvsVGhpVPFZg9bk61prI6v7ZQIcbFnAk
 rKaoWXUTyixVuEOz5iPNELah8aor8rs6V1YiJkK3FfwcXKJKuG4uylTFkpsLXNssTI
 KBVC27kWx0rYXORAVBDILSpdhXRSSqH1/d/v15QMOWSyDBmaTLOdtKV6KbgTqIg9j9
 w3QL7IDwy8j2fkoMjGZJES/vZ5plEGdvDyqFyvWyDJtOA7vmfXbrUielkUoWiOoesu
 zDqehV6ti98rsEoj/iF5sohDgKt0zhpB3V2seE8MDasneo/13eg7PLHJjhWJksOPBE
 vhkSBSLHh5vBw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Jan 2022 18:09:18 +0100
Date: Tue, 11 Jan 2022 18:09:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220111170918.GV1477939@scaer>
References: <20220111145527.3422053-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220111145527.3422053-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH RFC 1/1] package/wpewebkit: use ninja for
 faster builds
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

Adrian, All,

On 2022-01-11 16:55 +0200, Adrian Perez de Castro spake thusly:
> Instruct CMake to use the Ninja generator, and override build/install
> commands to use Ninja instead, which results in faster builds. The
> host-ninja package is required to build some of the dependencies used
> by wpewebkit (e.g. libepoxy) so in practice this is not introducing
> a new host dependency that would slow down the build.

As discussed on IRC, we concluded that a better option is to make the
cmake-package infrastructure in Buildroot ninja-aware, and that you were
going to have a look at it. Thanks! :-)

So, I've marked this patch as rejected in patchwork.

Regards,
Yann E. MORIN.

> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.mk | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 64c179534f..2cbed60cb3 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -14,11 +14,12 @@ WPEWEBKIT_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-LGPL-2.1
>  WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
>  WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
> -WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
> +WPEWEBKIT_DEPENDENCIES = host-gperf host-ninja host-python3 host-ruby \
>  	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
>  	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
>  
>  WPEWEBKIT_CONF_OPTS = \
> +	-GNinja \
>  	-DPORT=WPE \
>  	-DENABLE_ACCESSIBILITY=OFF \
>  	-DENABLE_API_TESTS=OFF \
> @@ -101,4 +102,24 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
>  WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
>  endif
>  
> +define WPEWEBKIT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(WPEWEBKIT_NINJA_ENV) \
> +		$(BR2_CMAKE) --build $(WPEWEBKIT_BUILDDIR) -- $(NINJA_OPTS) $(WPEWEBKIT_NINJA_OPTS)
> +endef
> +
> +define WPEWEBKIT_INSTALL_CMDS
> +	$(TARGET_MAKE_ENV) $(WPEWEBKIT_NINJA_ENV) \
> +		$(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
> +endef
> +
> +define WPEWEBKIT_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(WPEWEBKIT_NINJA_ENV) DESTDIR=$(STAGING_DIR) \
> +		$(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
> +endef
> +
> +define WPEWEBKIT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(WPEWEBKIT_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
> +		$(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
> +endef
> +
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
